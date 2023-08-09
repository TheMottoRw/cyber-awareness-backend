import express from "express";
import quizes from "../controllers/quizes";
import utils from "../helper/utils";
import fs from "fs";
import modules from "../controllers/modules";
import moduleRouter from "./modulesRoutes";
import levelRouter from "./levelsRoutes";
import multer from "multer";
import {parse} from "csv"
import contents from "../controllers/contents";
import contentRouter from "./contentsRoute";
const quizRouter = express.Router();

quizRouter.post("/quiz",async (req,res)=>{
    const response = await quizes.save(req.body);
    res.send(response);
})
quizRouter.get("/quizes",async (req,res)=>{
    const response = await quizes.load();
    res.send(response);
})
quizRouter.get("/quiz/:id",async (req,res)=>{
    const response = await quizes.load(req.params.id);
    res.send(response);
})
quizRouter.get("/quiz/module/:module",async (req,res)=>{
    const response = await quizes.loadByModule(req.params.module);
    res.send(response);
})
quizRouter.post("/quiz/:id",async (req,res)=>{
    console.log(req.params.id)
    const response = await quizes.update(req.params.id,req.body);
    res.send(response);
})
quizRouter.post("/submit/quiz",async (req,res)=>{
    const response = await quizes.submission(req.body);
    console.log(response);
    res.send(response);
})
quizRouter.post("/upload/quiz/:module", async (req, res) => {
    console.log("Request sent");
    const fileName = utils.generateRandomChars();
    const filePath = `src/uploads/${fileName}`;
    const moduleId = req.params.module;
    console.log(fileName);
    fs.writeFileSync(filePath, req.body['data'])
    fs.createReadStream(filePath)
        .pipe(parse({delimiter: ",", from_line: 2}))
        .on("data", function (row) {
            console.log(row);
            if (row.length == 3) {
                quizes.upload(moduleId, row);
            } else {
                console.log("Invalid csv format::")
                console.log(row)
                res.send({status:false,message:"Invalid csv format"})
            }
        })
    // const response = await modules.save({icon:fileName,level:req.body.level,name:req.body.name});
    res.send({status: true, name: fileName, message: "Data saved successfully"});
})


export default quizRouter;