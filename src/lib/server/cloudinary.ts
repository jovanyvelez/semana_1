import {v2 as cloudinary} from 'cloudinary'
import { CLOUDINARY_CLOUD_NAME,
         CLOUDINARY_API_KEY,
         CLOUDINARY_API_SECRET
         } from '$lib/server/secrets'

cloudinary.config({ 
  cloud_name: CLOUDINARY_CLOUD_NAME, 
  api_key: CLOUDINARY_API_KEY, 
  api_secret: CLOUDINARY_API_SECRET,
  secure: true
});

export async function uploadImage(filePath: string){
  return await cloudinary.uploader.upload(filePath,{folder:"tienda"});
}

export async function deleteImage(publicId: string) {
  return await cloudinary.uploader.destroy(publicId);
}