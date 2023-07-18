import db from "../db"

const save = (obj) => {
    let query = `INSERT INTO contents SET module='${obj.module}',eng_word='${obj.eng_word}',kiny_word='${obj.kiny_word}',explanation='${obj.explanation}'`;
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
    update
}