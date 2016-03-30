package com.mvc.base.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.component.file.service.FilePathUtil;
import com.mvc.config.ApplicationConfig;

@Service("fileManagerExpand")
public class FileManager {

    private static final Logger LOGGER = Logger.getLogger(FileManager.class);
    private static final int RANDOM_BEGIN = 5;
    private static final int DERAULT_FILE_ID_LENGTH = 18;
    private static volatile int count = 0;

    private static synchronized String getRandomStr() {
        count++;
        if(count>=100000){
            count = 0;
        }
        return String.format("%0" + RANDOM_BEGIN +"d",count);
    }

    private Long getNewFileId() {
        StringBuilder result = new StringBuilder(DERAULT_FILE_ID_LENGTH);
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        result.append(dateFormat.format(new Date()));
        result.append(getRandomStr());
        return Long.parseLong(result.toString());
    }

    private boolean handleDisk(byte[] fileData, String filePath) throws Exception{
        // Make folder automatically
        File file = new File(filePath);
        if (!file.exists()) {
            File folder = new File(file.getParent());
            folder.mkdirs();
        }
        FileOutputStream fileOutputStream = null;
        try {
            fileOutputStream = new FileOutputStream(file);
            BufferedOutputStream buffOutputStream = new BufferedOutputStream(fileOutputStream);
            buffOutputStream.write(fileData, 0, fileData.length);
            buffOutputStream.close();
            return true;
        } catch (FileNotFoundException e) {
            LOGGER.error("write", e);
        } finally {
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
        }
        return false;
    }


    public String saveImageFile(byte[] fileData, String fileName) {
        return doSave(fileData, fileName, ApplicationConfig.getImageFile());
    }
    public String saveProductImage(byte[] fileData, String fileName) {
        return doSave(fileData, fileName, ApplicationConfig.getProductFile());
    }

    private String doSave(byte[] fileData, String fileName,String relativePath){
        Long fileId = getNewFileId();
        String fullRelativePath = File.separator + HYConstants.FILE_HOME+getFileRelativePath(relativePath, fileId, fileName.substring(fileName.lastIndexOf(".")));
        boolean result = false;
        try{
            result = handleDisk(fileData, ApplicationConfig.getBasePath() + fullRelativePath );
        }catch(Exception e){
            LOGGER.error("saveContractFile",e);
        }
        if(result){
            return fullRelativePath.replaceAll("\\\\", "/");
        }
        return null;
    }


    public byte[] getFile(String relativePath) {
        File file = new File(ApplicationConfig.getBasePath() + File.separator + relativePath);
        if(file.exists()){
            try{
                return getFileContent(file);
            }catch(Exception e){
                LOGGER.error("getFile",e);
            }
        }
        return null;
    }


    public static byte[] getFileContent(File file) throws Exception {
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
        ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
        byte[] temp = new byte[1024];
        int size = 0;
        while ((size = in.read(temp)) != -1) {
            out.write(temp, 0, size);
        }
        in.close();
        return out.toByteArray();
    }

    public boolean deleteFile(String relativePath) {
        File file = new File(ApplicationConfig.getBasePath() + relativePath);
        if(file.exists()){
            file.delete();
            return true;
        }
        return false;
    }

    private String getFileRelativePath(String relaticePath,Long fileId, String fileExtention) {
        return File.separator + relaticePath + File.separator + getDailyDatalog(fileId) + fileId + fileExtention;
    }

    private String getDailyDatalog(Long fileId) {
        return FilePathUtil.getDayPath(fileId) + File.separator;
    }
}
