import express from "express";
import contents from "../controllers/contents";
import utils from "../helper/utils";
import fs from "fs";
import {parse} from "csv";
import moduleRouter from "./modulesRoutes";

const contentRouter = express.Router();

contentRouter.post("/content", async (req, res) => {
    const response = await contents.save(req.body);
    res.send(response);
})

contentRouter.get("/contents", async (req, res) => {
    const response = await contents.load();
    res.send(response);
})
contentRouter.get("/content/:id", async (req, res) => {
    const response = await contents.load(req.params.id);
    res.send(response);
})
contentRouter.get("/content/module/:module", async (req, res) => {
    const response = await contents.loadByModule(req.params.module);
    res.send(response);
})
contentRouter.get("/content/user/stats", async (req, res) => {
    const response = await contents.loadByUser(req.query);
    res.send(response);
})
contentRouter.post("/content/:id", async (req, res) => {
    console.log(req.params.id)
    const response = await contents.update(req.params.id, req.body);
    res.send(response);
})
contentRouter.post("/upload/content/:id", async (req, res) => {
    console.log("Request sent");
    const fileName = utils.generateRandomChars();
    const filePath = `src/uploads/${fileName}`;
    const moduleId = req.params.id;
    console.log(fileName);
    fs.writeFileSync(filePath, req.body['data'])
    fs.createReadStream(filePath)
        .pipe(parse({delimiter: ",", from_line: 2}))
        .on("data", function (row) {
            console.log(row);
            if (row.length == 3 || row.length == 2) {
                contents.upload(moduleId, row);
            } else {
                console.log("Invalid csv format::")
                console.log(row)
                // res.send({status:false,message:"Invalid csv format"})
            }
        })
    // const response = await modules.save({icon:fileName,level:req.body.level,name:req.body.name});
    res.send({status: true, name: fileName, message: "Data saved successfully"});
})
export default contentRouter;