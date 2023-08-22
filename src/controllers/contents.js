import db from "../db"
const validateInput = (obj, resolve) => {
    console.log(obj)
    let isValid = true;
    if (obj.hasOwnProperty("eng_word") === undefined || obj.hasOwnProperty("kiny_word") || obj.hasOwnProperty("explanation") === undefined) {
        resolve({status: false, message: "Amakuru yose yuzuzwa ntabwo yuzuye"});
        isValid = false;
    }
    if (obj.eng_word === "" || obj.kiny_word === "") {
        resolve({status: false, message: "Amakuru yose yuzuzwa ntabwo yuzuye neza"});
        isValid = false;
    }
    return isValid;
}
const save = (obj) => {
    let query = `INSERT INTO contents SET module='${obj.module}',eng_word=?,kiny_word=?,explanation=?`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            db.query(query, [obj.eng_word, obj.kiny_word, obj.explanation], (err, res) => {
                if (err) reject(err);
                resolve({status: true, message: "Kubika ibyo kwiga bigenze neza"});
            })
        }
    })
}
const upload = (module,arr) => {
    let query = ""
    if(arr.length==2){
        query = `INSERT INTO contents SET module='${module}',eng_word='${arr[0]}',kiny_word='${arr[1]}',explanation=''`;
    }else if(arr.length===3){
        query = `INSERT INTO contents SET module='${module}',eng_word='${arr[0]}',kiny_word='${arr[1]}',explanation='${arr[2]}'`;

    }else{
        return {status:false,message:"Invalid csv format"};
    }
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status:true,message:"Kubika ibyo kwiga bishya bigenze neza"});
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
    console.log(id);
    let queryId = `SELECT * FROM contents WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            db.query(queryId, (errId, resId) => {
                if (errId) reject(errId);
                if (resId.length > 0) {
                    let query = `UPDATE contents SET module=?,eng_word=?,kiny_word=?,explanation=? WHERE id=?`;
                    db.query(query, [obj.module, obj.eng_word, obj.kiny_word, obj.explanation, id], (err, res) => {
                        console.log(err);
                        if (err) reject(res)
                        resolve({status: true, message: "Guhindura ibyo kwiga bigenze neza"});
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
    loadByModule,
    loadByUser,
    update,
    upload
}