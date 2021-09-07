let express = require('express');
let router = express.Router();
let { producto, 
    listarProductos, 
    addProducts, 
    uploadNewProduct, 
    index,
    editarProductoID,
    editarProducto,
    deleteProduct } = require('../controllers/adminController');
let adminUser = require('../middlewares/adminCheck');
let session = require('../middlewares/userSession');
    let upload = require('../middlewares/uploadFiles');

/* GET Index / Index del admin */
router.get('/',session,adminUser, index)
router.get ('/productos',session,adminUser,listarProductos)

/* GET- FORMULARIO DE AGREGAR PRODUCTO*/
router.get('/agregarProducto',session,adminUser, addProducts)

/* POST- FORMULARIO DE PRODUCTO  */
router.post('/agregarProducto', upload.array('image'), uploadNewProduct)

/*ELIMINAR producto */
router.delete('/eliminarProducto/:id', deleteProduct)

//EDITAR PRODUCTO
router.get('/productos/editar/:id',session,adminUser, editarProducto); //traigo de bd el item que requiere por :id
router.put('/productos/editar/:id', upload.array('image'), editarProductoID); //de tocar boton editar se activa PUT ojo con eso!



module.exports = router;