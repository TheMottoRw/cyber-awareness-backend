import db from "../db"
import {resolve} from "@babel/core/lib/vendor/import-meta-resolve";

const save = (obj) => {
    let query = `INSERT INTO contents SET module='${obj.module}',eng_word='${obj.eng_word}',kiny_word='${obj.kiny_word}',explanation='${obj.explanation}'`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status:true,message:"Module content created successfully"});
        })
    })
}
const upload = (module,arr) => {
    let query = ""
    if(arr.length==2){
        query = `INSERT INTO contents SET module='${module}',eng_word='${arr[0]}',kiny_word='${arr[1]}',explanation=''`;
    }else if(arr.length===3){
        query = `INSERT INTO contents SET module='${module}',eng_word='${arr[0]}',kiny_word='${arr[1]}',explanation='${arr[2]}'`;

    }else{
        return resolve({status:false,message:"Invalid csv format"});
    }
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status:true,message:"Module content created successfully"});
        })
    })
}

const load = (id = 0) => {
    let query = "select * from contents";
    let queryId = `select * from contents where id=${id}`;
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
    let queryModule = `select * from contents where module=${module}`;
    return new Promise((resolve, reject) => {
        db.query(queryModule, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}

const loadByUser = (obj) => {
    let queryLevel = `select c.*,(case when cc.id!=0 then "done" else "not_done" end) as is_done,c.module, cc.learner from contents c left join content_completed cc on cc.content = c.id and cc.learner='${obj.learner}' where c.module='${obj.moduleId}'`;
    return new Promise((resolve, reject) => {
        db.query(queryLevel, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}
const update = (id,obj) => {
    let queryId = `SELECT * FROM contents WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        db.query(queryId, (errId, resId) => {
            console.log(errId)
            if (errId) reject(errId);
            if(resId.length>0){
                let query = `UPDATE contents SET module='${obj.module}',eng_word='${obj.eng_word}',kiny_word='${obj.kiny_word}',explanation='${obj.explanation}' WHERE id='${id}'`;
                db.query(query, (err, res) => {
                    if(err) reject(res)
                    resolve({status:true,message:"Module content updated successfully"});
                })
            }else
                resolve({status:false,message:"Can not find module content"});
        })
    })
}

export default {
    save,
    load,
    loadByModule,
    loadByUser,
    update,
    upload
}