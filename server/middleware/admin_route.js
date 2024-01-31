const jwt = require("jsonwebtoken");
const User = require("../model/user")

const admin = async (req,res, next) => {
    try{
        const token = req.header("x-auth-token");
        if(!token)
        res.status(401).json({message: 'no auth token, access denied'})
        const verified = jwt.verify(token,'passwordKey')
        if(!verified)
        res.status(401).json({message: 'token is not verified'})
        const user = User.findById(verified.id);
        if((user.type == 'user') || (user.type == 'admin')) {
        res.status(401).json({message: 'you are not an admin'})
        }
        req.user = verified.id;
        req.token = token;
        next();
    }catch(e){
     res.status(500).json({message: e.message()})
    }
}
module.exports = admin;