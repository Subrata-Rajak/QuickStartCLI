import multer from "multer";
import { ApiError } from "../utils/ApiError.js";

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, "./public/temp")
    },
    filename: function (rq, file, cb) {
        cb(null, file.originalname)
    },
})

const fileFilter = (req, file, cb) => {
    if (file.mimetype != 'text/csv') {
        return cb(new ApiError(400, "Only CSV files are allowed"))
    }

    cb(null, true)
}

export const upload = multer({ storage, fileFilter })