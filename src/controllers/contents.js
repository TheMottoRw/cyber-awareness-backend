import db from "../db"

const validateInput = (obj, resolve) => {
    let isValid = true;
    if (obj.hasOwnProperty("title") === undefined || obj.hasOwnProperty("content") === undefined || obj.hasOwnProperty("explanation") === undefined) {
        resolve({status: false, message: "All field are required"});
        isValid = false;
    }
    if (obj.title === "" || obj.content === "") {
        resolve({status: false, message: "All field are required"});
        isValid = false;
    }
    console.log(isValid);
    return isValid;
}
const save = (obj) => {
    let query = `INSERT INTO contents SET module='${obj.module}',title=?,content=?,explanation=?`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            db.query(query, [obj.title, obj.content, obj.explanation], (err, res) => {
                if (err) reject(err);
                resolve({status: true, message: "Content saved successful"});
            })
        }
    })
}
const upload = (module, arr) => {
    let query = ""
    let queryPars = []
    if (arr.length == 2) {
        query = `INSERT INTO contents SET module=?,title=?,content=?,explanation=?`;
        queryPars = [module,arr[0],arr[1],''];
    } else if (arr.length === 3) {
        query = `INSERT INTO contents SET module=?,title=?,content=?,explanation=?`;
        queryPars = [module,arr[0],arr[1],arr[2]];

    } else {
        return {status: false, message: "Invalid csv format"};
    }
    return new Promise((resolve, reject) => {
        db.query(query,queryPars, (err, res) => {
            if (err) reject(err);
            resolve({status: true, message: "Content saved successful"});
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
const update = (id, obj) => {
    console.log(id);
    let queryId = `SELECT * FROM contents WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            db.query(queryId, (errId, resId) => {
                if (errId) reject(errId);
                if (resId.length > 0) {
                    let query = `UPDATE contents SET module=?,title=?,content=?,explanation=? WHERE id=?`;
                    db.query(query, [obj.module, obj.title, obj.content, obj.explanation, id], (err, res) => {
                        console.log(err);
                        if (err) reject(res)
                        resolve({status: true, message: "Updating content done successful"});
                    })
                } else
                    resolve({status: false, message: "Failed to update content"});
            })
        }
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