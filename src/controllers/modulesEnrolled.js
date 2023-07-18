import db from "../db"

const save = (obj) => {
    let query = `INSERT INTO module_enrolled SET learner='${obj.learner}',module='${obj.module}'`;
    let queryExist = `SELECT * FROM module_enrolled WHERE learner='${obj.learner}' AND module='${obj.module}'`;
    return new Promise((resolve, reject) => {
        db.query(queryExist, (err, res) => {
            if (err) reject(err);
            console.log(res.length===0);
            if(res.length===0){
                db.query(query,(err,res)=>{
                    console.log(err)
                    if(err) reject(err)
                    resolve({status:true,message:"Enrolled in module"});
                })
            }else{
            resolve({status:true,messsage:"Already enrolled"})
            }
        })
    })
}
const load = (id = 0) => {
    let query = "select * from module_enrolled";
    let queryId = `select * from module_enrolled where id=${id}`;
    return new Promise((resolve, reject) => {
        if (id === 0) {
            db.query(query, (err, res) => {
                if (err) reject(err);
                resolve(res);
            })
        } else {
            db.query(queryId, (err, res) => {
                if (err) reject(err);
                resolve(res);
            })
        }
    })
}

const loadByModule = (module = 0) => {
    let queryLevel = `select * from module_enrolled where module=${module}`;
    return new Promise((resolve, reject) => {
        db.query(queryLevel, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}

export default {
    save,
    load,
    loadByModule
}