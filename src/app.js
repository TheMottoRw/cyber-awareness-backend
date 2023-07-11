import express, { json } from 'express';
import userRouter from "./routes/usersRoutes";
import levelRouter from "./routes/levelsRoutes";
import moduleRouter from "./routes/modulesRoutes";
import contentRouter from "./routes/contentsRoute";
import bodyParser from "body-parser";
const app = express();

app.use(json())
app.use(bodyParser.urlencoded({
    parameterLimit: 100000,
    limit: '150mb',
    extended: true
}));

app.use(userRouter)
app.use(levelRouter)
app.use(moduleRouter)
app.use(contentRouter)
app.use("/images",express.static("src/uploads"))

const PORT = process.env.PORT || 3000;

app.get('/', async (req, res) => {
    res.json({ status: true, message: "Our node.js app works" })
});
app.get('/form', function(req, res){
    res.send(
        '<form action="/upload" method="post" enctype="multipart/form-data">'+
        '<input type="text" name="category">'+
        '<input type="file" name="icon">'+
        '<input type="submit" value="Upload">'+
        '</form>'
    );
});

app.listen(PORT, () => console.log(`App listening at port ${PORT}`));