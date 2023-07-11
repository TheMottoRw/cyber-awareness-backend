import express from "express";
import levels from "../controllers/levels";
const levelRouter = express.Router();

levelRouter.post("/level",async (req,res)=>{
    const response = await levels.save(req.body);
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