import { ApiError } from "../utils/ApiError.js";
import { asyncHandler } from "../utils/asyncHandler.js";

export const verifyAdmin = asyncHandler(async (req, _, next) => {
    try {
        const token = req.cookies?.accessToken || req.header("Authorization")?.replace("Bearer ", "")
        const role = req.cookies?.pmRole || req.header("X-Role")?.replace(" ", "")

        if (!token || !role) {
            throw new ApiError(401, "Unauthorized request")
        }

        if (token != process.env.ADMIN_BEARER_TOKEN || role != "Admin") {
            throw new ApiError(401, "Authentication Invalid")
        }

        next()
    } catch (error) {
        throw new ApiError(401, error?.message || "Invalid access token")
    }
})

export default verifyAdmin