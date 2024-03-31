import { User } from "../models/user.model.js"
import { ApiError } from "./ApiError.js"

const generateRefreshAndAccessToken = async (userId) => {
    try {
        const user = await User.findOne({ userId })
        const accessToken = user.generateAccessToken()
        const refreshToken = user.generateRefreshToken()

        user.refreshToken = refreshToken
        await user.save({ validateBeforeSave: false })

        return { accessToken, refreshToken }
    } catch (error) {
        throw new ApiError(500, "Something went wrong while generating refresh and access token")
    }
}

export { generateRefreshAndAccessToken }