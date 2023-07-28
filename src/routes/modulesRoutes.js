import express from "express";
import modules from "../controllers/modules";
import * as fs from "fs";
import utils from "../helper/utils";
import filesManagement from "../middleware/filesManagementMiddleware.js";
import {parse} from "csv";
import userRouter from "./usersRoutes";
import modulesEnrolled from "../controllers/modulesEnrolled";
import moduleEnrolledRouter from "./modulesEnrolledRoutes";
const moduleRouter = express.Router();

moduleRouter.post("/module",async (req,res)=>{
    const fileName = utils.generateRandomChars();
    const filePath = `src/uploads/${fileName}`;
    fs.writeFileSync(filePath,atob(req.body['icon']),'binary')
    const response = await modules.save({icon:fileName,level:req.body.level,name:req.body.name});
    res.send(response);
})

moduleRouter.get("/modules",async (req,res)=>{
    const response = await modules.load();
    res.send(response);
})
moduleRouter.get("/module/:id",async (req,res)=>{
    const response = await modules.load(req.params.id);
    res.send(response);
})
moduleRouter.get("/module/level/:level",async (req,res)=>{
    const response = await modules.loadByLevel(req.params.level);
    res.send(response);
})
moduleRouter.get("/modules/user/stats",async (req,res)=>{
    console.log(req.query)
    const response = await modules.loadByUser(req.query.learner);
    res.send(response);
})
moduleRouter.post("/module/:id",async (req,res)=>{
    console.log(req.params.id)
    const response = await modules.update(req.params.id,req.body);
    res.send(response);
})
export default moduleRouter;