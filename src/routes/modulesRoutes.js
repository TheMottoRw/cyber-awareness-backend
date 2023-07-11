import express from "express";
import modules from "../controllers/modules";
const moduleRouter = express.Router();

moduleRouter.post("/module",async (req,res)=>{
    const response = await modules.save(req.body);
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
moduleRouter.post("/module/:id",async (req,res)=>{
    console.log(req.params.id)
    const response = await modules.update(req.params.id,req.body);
    res.send(response);
})
export default moduleRouter;