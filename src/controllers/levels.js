import db from "../db"

const validateInput = (obj, resolve) => {
    console.log(obj)
    let isValid = true;
    if (obj.hasOwnProperty("icon") === undefined || obj.hasOwnProperty("name") === undefined) {
        resolve({status: false, message: "All field are required"});
        isValid = false;
    }
    if (obj.name === "") {
        resolve({status: false, message: "Level name is required"});
        isValid = false;
    }
    return isValid;
}
const save = (obj) => {
    let query = `INSERT INTO levels SET icon=?,name=?`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            if (obj.icon !== "") {
                db.query(query, [obj.icon, obj.name], (err, res) => {
                    if (err) reject(err);
                    resolve({status: true, message: "Level created successfully"});
                })
            } else {
                resolve({status: false, message: "Failed to create a new level"});
            }
        }
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
const update = (id, obj) => {
    let queryId = `SELECT * FROM levels WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            db.query(queryId, (errId, resId) => {
                console.log(errId)
                if (errId) reject(errId);
                if (resId.length > 0) {
                    let query = `UPDATE levels SET icon=?,name=? WHERE id=?`;
                    db.query(query, [obj.icon,obj.name,id],(err, res) => {
                        if (err) reject(res)
                        resolve({status: true, message: "Level updated successfully"});
                    })
                } else
                    resolve({status: false, message: "Failed to update level"});
            })
        }
    })
}

export default {
    save,
    load,
    update,
}