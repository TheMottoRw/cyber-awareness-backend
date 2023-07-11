import multer from "multer";
async function uploadFiles(req, res) {
    // console.log(req.body);
    console.log(req.headers)
    res.json({ message: "Successfully uploaded files",data:"xsd "+req.files});
}

const upload = multer({dest:"src/uploads"})




export default {
    upload,
    uploadFiles,
}