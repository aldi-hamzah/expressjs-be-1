import { Router } from 'express';
import productController from '../controllers/ProductController';
import middleware from '../middleware/upload';

const router = Router();

router.post('/add', middleware.upload, productController.create);
router.get('/all', productController.findAll);

export default router;
