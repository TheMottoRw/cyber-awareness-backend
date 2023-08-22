import db from "../db"

const validateInput = (obj, resolve) => {
    console.log(obj)
    let isValid = true;
    if (obj.hasOwnProperty("icon") === undefined || obj.hasOwnProperty("level")===undefined || obj.hasOwnProperty("name") === undefined) {
        resolve({status: false, message: "Amakuru yose yuzuzwa ntabwo yuzuye"});
        isValid = false;
    }
    if (obj.name === "") {
        resolve({status: false, message: "Izina ry'isomo ntabwo ryatanzwe"});
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
                    resolve({status: true, message: "Ibyo kwiga bishya birabitswe neza"});
                })
            } else {
                resolve({status: false, message: "Ishusho yibyo kwiga ntiyatanzwe"});
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
                    resolve({status: true, message: "Ibyo kwiga birahinduwe neza"});
                })
            } else
                resolve({status: false, message: "Ntibikunze kubona ibyo kwiga"});
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