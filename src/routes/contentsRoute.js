import express from "express";
import contents from "../controllers/contents";
const contentRouter = express.Router();

contentRouter.post("/content",async (req,res)=>{
    const response = await contents.save(req.body);
    res.send(response);
})

contentRouter.get("/contents",async (req,res)=>{
    const response = await contents.load();
    res.send(response);
})
contentRouter.get("/content/:id",async (req,res)=>{
    const response = await contents.load(req.params.id);
    res.send(response);
})
    contentRouter.get("/content/module/:module",async (req,res)=>{
    const response = await contents.loadByModule(req.params.module);
    res.send(response);
})
contentRouter.post("/content/:id",async (req,res)=>{
    console.log(req.params.id)
    const response = await contents.update(req.params.id,req.body);
    res.send(response);
})
export default contentRouter;