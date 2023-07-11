import db from "../db"

const save = (obj) => {
    let query = `INSERT INTO modules SET icon='${obj.icon}',level='${obj.level}',name='${obj.name}'`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status:true,message:"Module created successfully"});
        })
    })
}

const load = (id = 0) => {
    let query = "select * from modules";
    let queryId = `select * from modules where id=${id}`;
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

const loadByLevel = (level = 0) => {
    let queryLevel = `select * from modules where level=${level}`;
    return new Promise((resolve, reject) => {
        db.query(queryLevel, (err, res) => {
                if (err) reject(err);
                resolve(res);
            })
    })
}
const update = (id,obj) => {
    let queryId = `SELECT * FROM modules WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        db.query(queryId, (errId, resId) => {
            console.log(errId)
            if (errId) reject(errId);
            if(resId.length>0){
                let query = `UPDATE modules SET icon='${obj.icon}',level='${obj.level}',name='${obj.name}' WHERE id='${id}'`;
                db.query(query, (err, res) => {
                    if(err) reject(res)
                    resolve({status:true,message:"Module updated successfully"});
                })
            }else
                resolve({status:false,message:"Can not find level"});
        })
    })
}

export default {
    save,
    load,
    loadByLevel,
    update
}