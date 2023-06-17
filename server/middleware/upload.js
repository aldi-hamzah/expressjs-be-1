import multer from 'multer';

const upload = multer({
  dest: './upload',
  fileFilter: (req, file, cb) => {
    if (file.mimetype.match(/\/(jpg|png|jpeg)$/)) {
      cb(null, true);
    } else {
      cb(null, false);
      return cb(new Error('Please upload a file with image extensions'));
    }
  },
  limits: { fileSize: 1024 * (1024 * 5) },
}).single('image');

export default {
  upload,
};
