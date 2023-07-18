import db from "../db"

const save = (obj) => {
    let query = `INSERT INTO levels SET icon='${obj.icon}',name='${obj.name}'`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status:true,message:"Level created successfully"});
        })
    })
}

const load = (id = 0) => {
    let query = "select * from levels";
    let queryId = `select * from levels where id=${id}`;
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
const update = (id,obj) => {
    let queryId = `SELECT * FROM levels WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        db.query(queryId, (errId, resId) => {
            console.log(errId)
            if (errId) reject(errId);
            if(resId.length>0){
                let query = `UPDATE levels SET name='${obj.name}' WHERE id='${id}'`;
                db.query(query, (err, res) => {
                    if(err) reject(res)
                    resolve({status:true,message:"Level updated successfully"});
                })
            }else
                resolve({status:false,message:"Can not find level"});
        })
    })
}

export default {
    save,
    load,
    update,
}