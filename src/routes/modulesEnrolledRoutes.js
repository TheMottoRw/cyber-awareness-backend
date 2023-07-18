import express from "express";
import modulesEnrolled from "../controllers/modulesEnrolled";
const moduleEnrolledRouter = express.Router();

moduleEnrolledRouter.post("/enroll",async (req,res)=>{
    const response = await modulesEnrolled.save(req.body);
    res.send(response);
})

moduleEnrolledRouter.get("/enrolled",async (req,res)=>{
    const response = await modulesEnrolled.load();
    res.send(response);
})
moduleEnrolledRouter.get("/enrolled/:id",async (req,res)=>{
    const response = await modulesEnrolled.load(req.params.id);
    res.send(response);
})
moduleEnrolledRouter.get("/enrolled/module/:module",async (req,res)=>{
    const response = await modulesEnrolled.loadByModule(req.params.module);
    res.send(response);
})
export default moduleEnrolledRouter;