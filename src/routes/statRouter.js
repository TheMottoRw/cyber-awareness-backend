import fs from "fs";
import {parse} from "csv";
import express from "express";
import stats from "../controllers/stats";
const statRouter = express.Router();

statRouter.get("/stats/progress",async (req,res)=>{
    res.send(await stats.contentProgress(req.query.module,req.query.learner));
    // res.send(req.query);
})
statRouter.get("/stats/completed",async (req,res)=>{
    res.send(await stats.moduleCompleted(req.query.learner));
    // res.send(req.query);
})
statRouter.get("/stats/hascompleted",async (req,res)=>{
    res.send(await stats.hasDoneModule(req.query.module,req.query.learner));
})

statRouter.get("/stats/report",async (req,res)=>{
    res.send(await stats.report());
})


export default statRouter;