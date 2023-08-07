import db from "../db"

const save = (obj) => {
    let query = `INSERT INTO content_completed SET learner='${obj.learner}',module='${obj.module}',content='${obj.content}'`;
    let queryExist = `SELECT * FROM content_completed WHERE learner='${obj.learner}' AND content='${obj.content}'`;
    return new Promise((resolve, reject) => {
        db.query(queryExist, (err, res) => {
            if (err) reject(err);
            if (res.length === 0) {
                db.query(query, (err, res) => {
                    if (err) reject(err)
                    resolve({status: true, message: "Content read successfully"});
                })
            } else {
                resolve({status: true, messsage: "Already read content", data:res.length})
            }
        })
    })
}

const load = (id = 0) => {
    let query = "select * from content_completed";
    let queryId = `select * from content_completed where id=${id}`;
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
    let queryLevel = `select * from content_completed where module=${module}`;
    return new Promise((resolve, reject) => {
        db.query(queryLevel, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}

const loadByModuleAndLearner = (module = 0,learner=0) => {
    let queryLevel = `select * from content_completed where module='${module}' AND learner='${learner}'`;
    return new Promise((resolve, reject) => {
        db.query(queryLevel, (err, res) => {
            if (err) resolve(err);
            resolve(res);
        })
    })
}

const loadByContent = (content = 0) => {
    let queryLevel = `select * from content_completed where content=${content}`;
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
    loadByModule,
    loadByContent,
    loadByModuleAndLearner
}