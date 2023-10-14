import express from "express";
import levels from "../controllers/levels";
import utils from "../helper/utils";
import fs from "fs";

const levelRouter = express.Router();

levelRouter.post("/level", async (req, res) => {
    let response = {}
    if (req.body['icon'] !== '') {
        const fileName = utils.generateRandomChars();
        const filePath = `src/uploads/${fileName}`;
        fs.writeFileSync(filePath, atob(req.body['icon']), 'binary')
        response = await levels.save({icon: fileName, name: req.body['name']});
    } else {
        response = {status: false, message:"Levels icon is required"};
    }

    res.send(response);
})

levelRouter.get("/levels", async (req, res) => {
    const response = await levels.load();
    res.send(response);
})
levelRouter.get("/level/:id", async (req, res) => {
    const response = await levels.load(req.params.id);
    res.send(response);
})
levelRouter.get("/level/type", async (req, res) => {
    const response = await levels.loadByType(req.query.type);
    res.send(response);
})
levelRouter.post("/level/:id", async (req, res) => {
    const fileName = utils.generateRandomChars();
    let filePath = "";
    let response = "";
    console.log(req.body.prev_icon)
    console.log(fileName)
    if (req.body['icon'] !== '') {
        if (req.body.prev_icon.substring(0, 4) !== "http") {
            filePath = `src/uploads/${req.body.prev_icon}`;
            fs.writeFileSync(filePath, atob(req.body['icon']), 'binary')
            fs.renameSync(filePath, `src/uploads/${fileName}`);
        } else {
            filePath = `src/uploads/${fileName}`;
            fs.writeFileSync(filePath, atob(req.body['icon']), 'binary')

        }
        response = await levels.update(req.params.id, {icon: fileName, name: req.body['name']});
    } else {
        response = await levels.update(req.params.id, {icon: req.body.prev_icon, name: req.body['name']});
    }
    res.send(response);
})
export default levelRouter;