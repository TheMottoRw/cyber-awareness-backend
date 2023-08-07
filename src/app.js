import express, { json } from 'express';
import userRouter from "./routes/usersRoutes";
import levelRouter from "./routes/levelsRoutes";
import moduleRouter from "./routes/modulesRoutes";
import contentRouter from "./routes/contentsRoute";
import moduleEnrolledRouter from "./routes/modulesEnrolledRoutes";
import contentCompletedRouter from "./routes/contentCompletedRoutes";
import bodyParser from "body-parser";
import utils from "./helper/utils";
import fs from "fs";
import modules from "./controllers/modules";
import filesManagementMiddleware from "./middleware/filesManagementMiddleware";
import multer from "multer";
import quizRouter from "./routes/quizesRoutes";
import statRouter from "./routes/statRouter";
const app = express();

app.use(json())
app.use(bodyParser.urlencoded({
    parameterLimit: 100000,
    limit: '150mb',
    extended: true
}));

app.use(userRouter)
app.use(levelRouter)
app.use(moduleRouter)
app.use(contentRouter)
app.use(moduleEnrolledRouter)
app.use(contentCompletedRouter)
app.use(quizRouter)
app.use(statRouter)
app.use("/images",express.static("src/uploads"))

const PORT = process.env.PORT || 3000;

app.get('/', async (req, res) => {
    res.json({ status: true, message: "Our node.js app works" })
});
const csvUpload = multer({dest:'src/uploads/files'})
moduleRouter.post("/csv",csvUpload.single ("file"),(req,res)=>{
    const fileName = utils.generateRandomChars();
    // const filePath = `src/uploads/files/${fileName}`;
    // fs.writeFileSync(filePath,atob(req.body['file']),'binary')
    // fs.writeFileSync(filePath,req.body['file'])
    // filesManagementMiddleware.upload
    res.send({status:true,file:req.file,body:req.body});
})


app.listen(PORT, () => console.log(`App listening at port ${PORT}`));