/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.utils;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author LuongHoang
 */
public class UploadFile {
    public static boolean save(HttpServletRequest request){
        boolean result = false;
         String path = request.getRealPath("/images");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload uploader = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = uploader.parseRequest(request);
            for (FileItem fileItem : lst) {
                if (fileItem.isFormField() == false) {
                    //upload to folder
                    fileItem.write(new File(path + "/" + fileItem.getName()));
                }
            }
            result = true;
        } catch (Exception ex) {
           result = false;
        }
       return result;
    }
}
