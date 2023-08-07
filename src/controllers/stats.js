import db from "../db";
import contents from "./contents";
import contentCompleted from "./contentCompleted";
import modulesEnrolled from "./modulesEnrolled";
const contentProgress = async (module = 0,learner=0) => {
    const completed = await contentCompleted.loadByModuleAndLearner(module,learner);
    const totalContent = await contents.loadByModule(module);
    console.log(totalContent.length)
    return {percentage:Math.round(completed.length * 100/totalContent.length)};
}
const moduleCompleted = async (learner=0) => {
    const completed = await modulesEnrolled.loadByModuleCompleted(learner);
    const enrolled = await modulesEnrolled.loadByModuleEnrolled(learner);
    return {enrolled_len:enrolled.length,completed_len:completed.length,completed:completed};
}

const hasDoneModule = async (module=0,learner=0) => {
    const enrolled = await modulesEnrolled.hasDoneModule(module,learner);
    return {has_done_module:enrolled.length>0};
}

export default {
    contentProgress,
    moduleCompleted,
    hasDoneModule
}