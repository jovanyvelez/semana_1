import {v2 as cloudinary} from 'cloudinary'
import { env } from '$env/dynamic/private';


cloudinary.config({ 
  cloud_name: env.CLOUDINARY_CLOUD_NAME, 
  api_key: env.CLOUDINARY_API_KEY, 
  api_secret: env.CLOUDINARY_API_SECRET,
  secure: true
});

export async function uploadImage(filePath: string){
  return await cloudinary.uploader.upload(filePath,{folder:"tienda"});
}

export async function deleteImage(publicId: string) {
  return await cloudinary.uploader.destroy(publicId);
}