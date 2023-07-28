import express from "express";
import users from "../controllers/users";
import utils from "../helper/utils";
import fs from "fs";
import modules from "../controllers/modules";
import moduleRouter from "./modulesRoutes";
import levelRouter from "./levelsRoutes";
import multer from "multer";
import {parse} from "csv"
const userRouter = express.Router();

userRouter.post("/user",async (req,res)=>{
    const response = await users.save(req.body);
    res.send(response);
})
userRouter.post("/login",async (req,res)=>{
    const response = await users.login(req.body);
    res.send(response);
})
userRouter.get("/users",async (req,res)=>{
    const response = await users.load();
    res.send(response);
})
userRouter.get("/user/:id",async (req,res)=>{
    const response = await users.load(req.params.id);
    res.send(response);
})
userRouter.get("/user/type",async (req,res)=>{
    const response = await users.loadByType(req.query.type);
    res.send(response);
})
userRouter.post("/user/:id",async (req,res)=>{
    console.log(req.params.id)
    const response = await users.update(req.params.id,req.body);
    res.send({status:true,message:"User updated successfully"});
})

const upload = multer({ dest: "src/uploads/" });

userRouter.post("/upload",async (req,res)=>{
    console.log("Request sent");
    const fileName = utils.generateRandomChars();
    const filePath = `src/uploads/${fileName}`;
    console.log(fileName);
    fs.writeFileSync(filePath,req.body['data'])
    fs.createReadStream(filePath)
        .pipe(parse({ delimiter: ",", from_line: 2 }))
        .on("data", function (row) {
            console.log(row);
            if(row.length==3){

            }else if(row.length==2){

            }else{
                res.send({status:false,message:"Invalid csv format"})
            }
        })
    // const response = await modules.save({icon:fileName,level:req.body.level,name:req.body.name});
    res.send({status:true,name:fileName,message:"Data saved successfully"});
})
userRouter.get("/read",async (req,res)=>{
    console.log("Request sent");
    const filePath = `src/uploads/iGo1AypDNJweJtueDhuvVbEaQfUgiFYC`;
    fs.createReadStream(filePath)
        .pipe(parse({ delimiter: ",", from_line: 2 }))
        .on("data", function (row) {
            console.log(row);
        })
})


export default userRouter;