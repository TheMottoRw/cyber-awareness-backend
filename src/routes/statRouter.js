import fs from "fs";
import {parse} from "csv";
import express from "express";
import stats from "../controllers/stats";
const statRouter = express.Router();

statRouter.get("/stats/progress",async (req,res)=>{
    res.send(await stats.contentProgress(req.query.module,req.query.learner));
    // res.send(req.query);
})
statRouter.get("/stats/enrolled",async (req,res)=>{
    res.send(await stats.moduleEnrolled(req.query.learner));
    // res.send(req.query);
})
statRouter.get("/stats/completed",async (req,res)=>{
    res.send(await stats.moduleCompleted(req.query.learner));
    // res.send(req.query);
})
statRouter.get("/stats/notcompleted",async (req,res)=>{
    res.send(await stats.moduleEnrolledNotCompleted(req.query.learner));
    // res.send(req.query);
})
statRouter.get("/stats/hascompleted",async (req,res)=>{
    res.send(await stats.hasDoneModule(req.query.module,req.query.learner));
})

statRouter.get("/stats/user/report",async (req,res)=>{
    res.send(await stats.userReport(req.query.learner));
})
statRouter.get("/stats/report",async (req,res)=>{
    res.send(await stats.report());
})

statRouter.get("/stats/filtered/report",async (req,res)=>{
    res.send(await stats.filteredReport(req.query));
})


export default statRouter;