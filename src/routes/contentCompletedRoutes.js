import express from "express";
import contentCompleted from "../controllers/contentCompleted";
const contentCompletedRouter = express.Router();

contentCompletedRouter.post("/completed/content",async (req,res)=>{
    const response = await contentCompleted.save(req.body);
    res.send(response);
})

contentCompletedRouter.get("/completed/content",async (req,res)=>{
    const response = await contentCompleted.load();
    res.send(response);
})
contentCompletedRouter.get("/completed/content/:id",async (req,res)=>{
    const response = await contentCompleted.load(req.params.id);
    res.send(response);
})
contentCompletedRouter.get("/completed/content/module/:module",async (req,res)=>{
    const response = await contentCompleted.loadByModule(req.params.module);
    res.send(response);
})
contentCompletedRouter.get("/completed/content/content/:content",async (req,res)=>{
    const response = await contentCompleted.loadByModule(req.params.content);
    res.send(response);
})
export default contentCompletedRouter;