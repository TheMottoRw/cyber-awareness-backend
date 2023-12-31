import db from "../db"

const save = (obj) => {
    let query = `INSERT INTO module_enrolled SET learner='${obj.learner}',module='${obj.module}'`;
    let queryExist = `SELECT * FROM module_enrolled WHERE learner='${obj.learner}' AND module='${obj.module}'`;
    return new Promise((resolve, reject) => {
        db.query(queryExist, (err, res) => {
            if (err) reject(err);
            console.log(res.length === 0);
            if (res.length === 0) {
                db.query(query, (err, res) => {
                    console.log(err)
                    if (err) reject(err)
                    resolve({status: true, message: "Enrolled in module"});
                })
            } else {
                resolve({status: true, messsage: "Already enrolled"})
            }
        })
    })
}
const load = (id = 0) => {
    let query = "select * from module_enrolled";
    let queryId = `select * from module_enrolled where id=${id}`;
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
    let query = `select * from module_enrolled where module=${module}`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}
const loadByModuleCompleted = (learner = 0) => {
    let query = `select me.marks,me.marks_total,me.is_completed,m.*,"enrolled" as is_enrolled from module_enrolled me INNER JOIN modules m ON m.id=me.module where learner=${learner} AND is_completed=true`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}

const loadByModuleEnrolled = (learner = 0) => {
    let query = `select me.marks,me.marks_total,m.*,me.is_completed,"enrolled" as is_enrolled from module_enrolled me INNER JOIN modules m ON m.id=me.module where learner=${learner}`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}

const loadByModuleEnrolledNotCompleted = (learner = 0) => {
    let query = `select me.marks,me.marks_total,me.is_completed,m.*,"enrolled" as is_enrolled from module_enrolled me INNER JOIN modules m ON m.id=me.module where learner=${learner} AND is_completed=false`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}
const hasDoneModule = (module, learner = 0) => {
    let query = `select * from module_enrolled me where me.is_completed=true and me.module=${module} and me.learner=${learner}`;
    return new Promise((resolve, reject) => {
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}

const filteredReport = (filterType = "", start, end) => {
    let query = "";// `select me.marks,me.marks_total,me.is_completed,m.*,"enrolled" as is_enrolled from module_enrolled me INNER JOIN modules m ON m.id=me.module where learner=${learner} AND created_at BETWEEN '${start} 00:01' AND '${end} 23:59'`;
    return new Promise((resolve, reject) => {
        switch (filterType) {
            case "passed":
                if (start === "" && end === "")
                    query = `SELECT me.*,count(me.learner) as module_completed,sum(me.marks) as sum_marks,sum(me.marks_total) as sum_marks_total,sum(me.marks)*100/sum(me.marks_total) as pass_percentage,u.name,u.email FROM module_enrolled me INNER JOIN users u ON me.learner = u.id where me.is_completed=true GROUP BY me.learner;`
                else{
                    query = `SELECT me.*,count(me.learner) as module_completed,sum(me.marks) as sum_marks,sum(me.marks_total) as sum_marks_total,sum(me.marks)*100/sum(me.marks_total) as pass_percentage,u.name,u.email FROM module_enrolled me INNER JOIN users u ON me.learner = u.id where me.is_completed=true and me.updated_at BETWEEN '${start} 00:01' and '${end} 23:59' GROUP BY me.learner;`
                }
                break;
            case "notpassed":// enrollment only and haven't passed any module
                if (start === "" && end === "")
                    query = `SELECT me.*,count(me.learner) as enrolled_modules,u.name,u.email FROM module_enrolled me INNER JOIN users u ON me.learner = u.id where me.is_completed=false and me.learner not in (select learner from module_enrolled where is_completed=true group by learner) GROUP BY me.learner;`
                else{
                    query = `SELECT me.*,count(me.learner) as enrolled_modules,u.name,u.email FROM module_enrolled me INNER JOIN users u ON me.learner = u.id where me.is_completed=false and me.created_at BETWEEN '${start} 00:01' and '${end} 23:59' and me.learner not in (select learner from module_enrolled where is_completed=true group by learner) GROUP BY me.learner;`
                }
                break;
            case "login_history":
                if (start === "" && end === "")
                    query = `SELECT la.*,count(la.email) as login_counts,u.name FROM login_attempts la INNER JOIN users u ON u.email=la.email GROUP BY la.email;`
                else{
                    query = `SELECT la.*,count(la.email) as login_counts,u.name FROM login_attempts la INNER JOIN users u ON u.email=la.email where la.created_at BETWEEN '${start} 00:01' and '${end} 23:59' GROUP BY la.email;`
                }
                break;
            default:
                query=null;
        }
        if(query!==null){
        db.query(query, (err, res) => {
            if (err) reject(err);
            resolve({status:true,data:res});
        })
        }else{
            resolve({status:false,message:"Invalid request"})
        }
    })
}
export default {
    save,
    load,
    loadByModule,
    loadByModuleCompleted,
    loadByModuleEnrolled,
    loadByModuleEnrolledNotCompleted,
    hasDoneModule,
    filteredReport
}