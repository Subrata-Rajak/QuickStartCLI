import { ApiError } from "../utils/ApiError.js";
import { asyncHandler } from "../utils/asyncHandler.js";
import jwt from "jsonwebtoken"
import { generateRefreshAndAccessToken } from "../utils/generateRefreshAndAccessToken.js"
import { User } from "../models/user.model.js";

export const verifyJWT = asyncHandler(async (req, res, next) => {
    const oldAccessToken = req.cookies?.accessToken || req.header("Authorization")?.replace("Bearer ", "")
    const oldRefreshToken = req.cookies?.refreshToken || req.header("X-RefreshToken")?.replace(" ", "")

    try {
        if (!oldAccessToken) {
            throw new ApiError(401, "Unauthorized request")
        }

        const decodedToken = jwt.verify(oldAccessToken, process.env.ACCESS_TOKEN_SECRET)

        const user = await User.findOne({ userId: decodedToken?.userId }).select("-password -refreshToken")

        if (!user) {
            throw new ApiError(401, "Invalid Access Token")
        }

        req.user = user;
        next()
    } catch (error) {
        // If the access token is expired or invalid, try refreshing the token using the refresh token
        try {
            const decodedRefreshToken = jwt.verify(oldRefreshToken, process.env.REFRESH_TOKEN_SECRET);

            const user = await User.findOne({ userId: decodedRefreshToken.userId }).select("-password -refreshToken");

            if (!user) {
                console.log("User not found")
                throw new ApiError(401, "Invalid Refresh Token");
            }

            // If the refresh token is valid, generate a new access token and send it along with the user data
            const { accessToken, refreshToken } = await generateRefreshAndAccessToken(user.userId)

            // Set the new access token in the response headers
            res.setHeader('X-NewAccessToken', accessToken)
            res.setHeader('X-NewRefreshToken', refreshToken)

            // Attach the user data to the request
            req.user = user

            next();
        } catch (refreshError) {
            // If there's an error during token refreshing, or if the refresh token is invalid, throw an error
            throw new ApiError(401, "Invalid Refresh Token or Access Token. Please log in again.");
        }
        // throw new ApiError(401, error?.message || "Invalid access token")
    }
})

export default verifyJWT