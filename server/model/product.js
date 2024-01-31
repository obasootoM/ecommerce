const mongoose = require("mongoose");
const ratingSchema = require("./rating");
const productSchema = mongoose.Schema({
    name: {
        required:true, 
        type: String,
        trim:true
    },
    description : {
    required: true,
    type:String,
    trim: true
    },
    category: {
    required: true,
    type: String,
    trim: true,
    },
    price : {
    required:true,
    type: Number,
    },
    quantity : {
    required: true,
    type: Number,
    },
    images : [
        {
            required: true,
            type: String
        }
    ],
    rating : [ratingSchema]
});

const Product  = mongoose.model("Product", productSchema);
module.exports = {Product,productSchema};