const express = require('express');
const adminRoute = express.Router();
const { Product } = require("../model/product");
const admin = require("../middleware/admin_route");



adminRoute.post("/api/post-product",admin, async (req,res) => {
   try{
    const {name, description, price, quantity,images,category} = req.body;
    let product = new Product({
        name,
        description,
        price,
        quantity,
        images,
        category
    })
    product = await product.save();
    res.json(product);
   }catch(e){
    res.status(500).json({message: e.message})
   }})

   adminRoute.get("/api/get-product", admin, async(req,res) => {
    try{
     let product = await Product.find({});
     res.json(product);
    }catch(e){
        res.status(500).json({message: e.message})
    }
   })

   adminRoute.delete("/api/delete-product", admin, async (req,res) => {
     try{
     const {id}  = req.body;
     let deleteById = await Product.findByIdAndDelete(id);
     res.json(deleteById);
     }catch(e) {
        res.status(500).json({message: e.message})
     }
   })

   module.exports = adminRoute;