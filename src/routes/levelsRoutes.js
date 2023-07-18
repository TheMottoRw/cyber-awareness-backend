import express from "express";
import levels from "../controllers/levels";
import utils from "../helper/utils";
import fs from "fs";
const levelRouter = express.Router();

levelRouter.post("/level",async (req,res)=>{
    const fileName = utils.generateRandomChars();
    const filePath = `src/uploads/${fileName}`;
    fs.writeFileSync(filePath,atob(req.body['icon']),'binary')
    const response = await levels.save({icon:fileName,name:req.body['name']});
    res.send(response);
})

levelRouter.get("/levels",async (req,res)=>{
    const response = await levels.load();
    res.send(response);
})
levelRouter.get("/level/:id",async (req,res)=>{
    const response = await levels.load(req.params.id);
    res.send(response);
})
levelRouter.get("/level/type",async (req,res)=>{
    const response = await levels.loadByType(req.query.type);
    res.send(response);
})
levelRouter.post("/level/:id",async (req,res)=>{
    console.log(req.params.id)
    const response = await levels.update(req.params.id,req.body);
    res.send(response);
})
export default levelRouter;