import db from "../db"
import {resolve} from "@babel/core/lib/vendor/import-meta-resolve";

const validateInput = (obj, resolve) => {
    console.log(obj)
    let isValid = true;
    if (obj.hasOwnProperty("question") === undefined || obj.hasOwnProperty("options") === undefined || obj.hasOwnProperty("answer") === undefined) {
        resolve({status: false, message: "All fields are required"});
        isValid = false;
    }
    if (obj.question === "" || obj.answer === "") {
        resolve({status: false, message: "All fields are required"});
        isValid = false;
    }
    if (obj.options.split(",").length < 2) {
        resolve({status: false, message: "Choices should be more than one"});
        isValid = false;
    }
    return isValid;
}
const save = (obj) => {
    let query = `INSERT INTO quizes SET module='${obj.module}',question='${obj.question}',options='${obj.options}',answer='${obj.answer}'`;
    return new Promise((resolve, reject) => {
        if (validateInput(obj, resolve)) {
            db.query(query, (err, res) => {
                if (err) reject(err);
                resolve({status: true, message: "Quiz question successfully"});
            })
        }
    })
}


const load = (id = 0) => {
    let query = "select * from quizes";
    let queryId = `select * from quizes where id=${id}`;
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
const loadByModule = (module = "") => {
    let queryType = `select * from quizes where module=${module}`;
    return new Promise((resolve, reject) => {
        db.query(queryType, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}
const update = (id, obj) => {
    let queryId = `SELECT * FROM quizes WHERE id='${id}'`;
    return new Promise((resolve, reject) => {
        if(validateInput(obj, resolve)) {
            db.query(queryId, (errId, resId) => {
                console.log(errId)
                if (errId) reject(errId);
                if (resId.length > 0) {
                    let query = `UPDATE quizes SET module='${obj.module}',question='${obj.question}',options='${obj.options}',answer='${obj.answer}' WHERE id='${id}'`;
                    db.query(query, (err, res) => {
                        if (err) reject(res)
                        resolve({status: true, message: "Quiz question updated successfully"});
                    })
                } else
                    resolve({status: false, message: "Can not find quiz question"});
            })
        }
    })
}

const submission = async (obj) => {
    let totalMarks = 0;
    let isCompleted = true;
    let quizMarks = await calculateMarks(obj.data);
    console.log(`Right answers marks:${quizMarks}`)
    let queryTotalMarksCalculation = `select (count(id)*10) as total_marks from quizes where module=${obj.module} group by module`;
    return new Promise((resolve, reject) => {
        db.query(queryTotalMarksCalculation, (err, res) => {
            if (err) console.log(err);
            if (res.length > 0)
                totalMarks = res[0].total_marks
            console.log(`Total Marks: ${totalMarks}`)
            //update module enrolled with quiz marks
            if (parseInt(quizMarks) <= (totalMarks / 2)) {
                isCompleted = false;
            }
            let queryMe = `update module_enrolled set marks='${quizMarks}',marks_total='${totalMarks}',is_completed=${isCompleted} where learner='${obj.learner}' and module='${obj.module}'`;
            db.query(queryMe, (err_me, res_me) => {
                console.log(queryMe);
                if (err_me) resolve({status: false, message: "Something went wrong", error: err_me});
                resolve({status: true, message: "Successfully saved", marks: quizMarks, total_marks: totalMarks});
            })
        })
    })
}


const upload = (module, arr) => {
    let query = ""
    if (arr.length == 3) {
        query = `INSERT INTO quizes SET module='${module}',question='${arr[0]}',answer='${arr[1]}',options='${arr[2]}'`;
    } else {
        return resolve({status: false, message: "Invalid csv format"});
    }
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status: true, message: "Quiz created successfully"});
        })
    })
}
const calculateMarks = async (obj) => {
    let answersKeyValArr = Object.entries(obj);
    let qy = "select * from quizes where ";
    for (let i = 0; i < answersKeyValArr.length; i++) {
        let fieldValue = answersKeyValArr[i];
        if (i === 0)
            qy += `id='${fieldValue[0]}' AND answer='${fieldValue[1]}'`
        else
            qy += ` OR id='${fieldValue[0]}' AND answer='${fieldValue[1]}'`
    }
    console.log(qy);
    return new Promise((resolve, reject) => {
        db.query(qy, (err, res) => {
            if (err) console.log(err);
            console.log(res.length);
            resolve(res.length * 10);
        })
    })
}
export default {
    save,
    load,
    loadByModule,
    update,
    submission,
    upload
}