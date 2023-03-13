
const express = require("express")
const app = express()

const PORT = process.env.PORT || 8080

app.get("/",(req,res)=>{
    res.send("Root path...")
})

app.get("/test",(req,res)=>{
    res.send("test endpoint...")
})

app.listen(PORT,()=>{`Started server...listening on port : ${PORT}`})