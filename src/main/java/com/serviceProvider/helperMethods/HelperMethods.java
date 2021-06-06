package com.serviceProvider.helperMethods;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Component;

@Component
public class HelperMethods {

	
	// save profile pics
	public boolean saveProfilePic(String path, byte[] pic) {

		boolean f = false;
		try {
			FileOutputStream fos = new FileOutputStream(path);
			System.out.println(path);
			fos.write(pic);
			fos.close();
			fos.flush();

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// save aadhar pics
	public boolean saveAadharPic(String path, byte[] pic) {

		boolean f = false;
		try {
			FileOutputStream fos = new FileOutputStream(path);
			System.out.println(path);
			fos.write(pic);
			fos.close();
			fos.flush();

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	//method for updating worker pic
		public boolean updateWorkerPic(String path, String oldPath, byte[] pic) {

			boolean f = false;

			try {

				File oldFile = new File(oldPath);
				boolean f1 = oldFile.delete();

				if (f1 == true) {

					FileOutputStream fos = new FileOutputStream(path);
					System.out.println(path);
					fos.write(pic);
					fos.close();
					fos.flush();

					f = true;

				}

			} catch (Exception e) {

				e.printStackTrace();
			}
			return f;
		}
		
		
		public void deletePics(String aadharPic, String profilePic) {

			try {

				File aadharFile = new File(aadharPic);
				File profileFile = new File(aadharPic);
				boolean f1 = aadharFile.delete();
				boolean f2 = profileFile.delete();

			} catch (Exception e) {
				e.printStackTrace();

			}

		}

		public void delete(String path) {

			try {

				File file = new File(path);

				boolean f1 = file.delete();

			} catch (Exception e) {
				e.printStackTrace();

			}

		}
	
}
