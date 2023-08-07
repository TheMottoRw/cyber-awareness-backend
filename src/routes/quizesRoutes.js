import express from "express";
import quizes from "../controllers/quizes";
import utils from "../helper/utils";
import fs from "fs";
import modules from "../controllers/modules";
import moduleRouter from "./modulesRoutes";
import levelRouter from "./levelsRoutes";
import multer from "multer";
import {parse} from "csv"
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
    res.send(response);
})


export default quizRouter;