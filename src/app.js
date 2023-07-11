import express, { json } from 'express';
import userRouter from "./routes/usersRoutes";
import levelRouter from "./routes/levelsRoutes";
import moduleRouter from "./routes/modulesRoutes";
import contentRouter from "./routes/contentsRoute";
const app = express();

app.use(json())
app.use(userRouter)
app.use(levelRouter)
app.use(moduleRouter)
app.use(contentRouter)

const PORT = process.env.PORT || 3000;

app.get('/', async (req, res) => {
    res.json({ status: true, message: "Our node.js app works" })
});

app.listen(PORT, () => console.log(`App listening at port ${PORT}`));