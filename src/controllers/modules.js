import db from "../db"

const validateInput = (obj, resolve) => {
    console.log(obj)
    let isValid = true;
    if (obj.hasOwnProperty("icon") === undefined || obj.hasOwnProperty("level")===undefined || obj.hasOwnProperty("name") === undefined) {
        resolve({status: false, message: "All field are required"});
        isValid = false;
    }
    if (obj.name === "") {
        resolve({status: false, message: "Module name is required"});
        isValid = false;
    }
    return isValid;
}

const save = (obj) => {
    let query = `INSERT INTO modules SET icon=?,level=?,name=?`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            if (obj.icon !== "") {
                db.query(query, [obj.icon, obj.level, obj.name], (err, res) => {
                    if (err) reject(err);
                    resolve({status: true, message: "Module added successfully"});
                })
            } else {
                resolve({status: false, message: "Failed to create a new module"});
            }
        }
    })
}

const load = (id = 0) => {
    let query = 'select *,false as is_completed,"not_enrolled" as is_enrolled from modules';
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

const loadByUser = (learner = 0) => {
    let queryLevel = `select m.*,me.marks,me.marks_total,me.is_completed,(case when me.id!=0 then "enrolled" else "not_enrolled" end) as is_enrolled,me.learner from modules m left join module_enrolled me on me.module = m.id and me.learner='${learner}'`;
    return new Promise((resolve, reject) => {
        db.query(queryLevel, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}
const update = (id, obj) => {
    let queryId = `SELECT * FROM modules WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        if(validateInput(obj,resolve)){
        db.query(queryId, (errId, resId) => {
            console.log(errId)
            if (errId) reject(errId);
            if (resId.length > 0) {
                let query = `UPDATE modules SET icon=?,level=?,name=? WHERE id=?`;
                db.query(query,[obj.icon, obj.level, obj.name,id], (err, res) => {
                    if (err) reject(res)
                    resolve({status: true, message: "Module updated successfully"});
                })
            } else
                resolve({status: false, message: "Failed to update module"});
        })
        }
    })
}

export default {
    save,
    load,
    loadByLevel,
    loadByUser,
    update
}