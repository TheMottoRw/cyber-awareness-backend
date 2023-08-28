import contents from "./contents";
import contentCompleted from "./contentCompleted";
import modulesEnrolled from "./modulesEnrolled";
import users from "./users";

const contentProgress = async (module = 0, learner = 0) => {
    const completed = await contentCompleted.loadByModuleAndLearner(module, learner);
    const totalContent = await contents.loadByModule(module);
    const hasCompletedModule = await modulesEnrolled.hasDoneModule(module, learner);
    console.log(totalContent.length)
    return {
        percentage: totalContent.length !== 0 ? Math.round(completed.length * 100 / totalContent.length) : 0,
        is_completed: hasCompletedModule.length > 0
    };
}
const moduleEnrolled = async (learner = 0) => {
    return await modulesEnrolled.loadByModuleEnrolled(learner);
}
const moduleCompleted = async (learner = 0) => {
    return await modulesEnrolled.loadByModuleCompleted(learner);
}
const moduleEnrolledNotCompleted = async (learner = 0) => {
    return await modulesEnrolled.loadByModuleEnrolledNotCompleted(learner);
}

const hasDoneModule = async (module = 0, learner = 0) => {
    const enrolled = await modulesEnrolled.hasDoneModule(module, learner);
    return {has_done_module: enrolled.length > 0};
}
const userReport = async (learner = 0) => {
    const completed = await modulesEnrolled.loadByModuleCompleted(learner);
    const enrolled = await modulesEnrolled.loadByModuleEnrolled(learner);
    const enrolled_not_completed = await modulesEnrolled.loadByModuleEnrolledNotCompleted(learner);
    return {enrolled:enrolled,enrolled_len:enrolled.length,completed:completed,completed_len:completed.length,enrolled_not_completed:enrolled_not_completed,enrolled_not_completed_len:enrolled_not_completed.length};
}
const report = async () => {
    let learners = await users.loadByType("Learner");
    for (let i = 0; i < learners.length; i++) {
        const completed = await modulesEnrolled.loadByModuleCompleted(learners[i].id);
        const enrolled = await modulesEnrolled.loadByModuleEnrolled(learners[i].id);
        const enrolled_not_completed = await modulesEnrolled.loadByModuleEnrolledNotCompleted(learners[i].id);
        learners[i].enrolled = enrolled;
        learners[i].enrolled_length = enrolled.length;
        learners[i].completed = completed;
        learners[i].completed_length = completed.length;
        learners[i].enrolled_not_completed = enrolled_not_completed;
        learners[i].enrolled_not_completed_length = enrolled_not_completed.length;
    }
    return learners;
}
const filteredReport = async (obj) => {
    const response = await modulesEnrolled.filteredReport(obj.filterType,obj.start,obj.end);
    return response;
}
export default {
    contentProgress,
    moduleEnrolled,
    moduleEnrolledNotCompleted,
    moduleCompleted,
    hasDoneModule,
    userReport,
    report,
    filteredReport
}