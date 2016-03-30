package com.mvc.member.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.base.service.FileManager;
import com.mvc.config.ApplicationConfig;
import com.mvc.framework.util.AjaxUtils;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.UploadFile;
import com.mvc.util.ImageUtils;

@Controller
@RequestMapping("/admin/companyScreenshot")
public class CompanyScreenshotController {

    @Resource(name="fileManagerExpand")
    private FileManager fileManager;
    protected static final String TMP_DIR = ApplicationConfig.getTempDir();

    @RequestMapping("/saveCrop")
    public String saveCrop(HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception {
        String srcFilePath = request.getParameter("srcFilePath");
        byte[] fileData = fileManager.getFile(srcFilePath);
        String oldPath = TMP_DIR + srcFilePath.substring(srcFilePath.lastIndexOf("/") + 1);
        String newPath = TMP_DIR + "cut" + srcFilePath.substring(srcFilePath.lastIndexOf("/") + 1);
        FileUtils.writeByteArrayToFile(new File(oldPath), fileData);
        // 图片在页面上的宽高
        int imageH = (int) Double.parseDouble(request.getParameter("imageH"));
        int imageW = (int) Double.parseDouble(request.getParameter("imageW"));
        // 图片距离编辑窗口的距离
        int imageX = (int) Double.parseDouble(request.getParameter("imageX"));
        int imageY = (int) Double.parseDouble(request.getParameter("imageY"));
        // 图片旋转的角度
        int angle = (int) Double.parseDouble(request.getParameter("imageRotate"));
        String imageSource = request.getParameter("imageSource");
        // 图片选择框的座标和高宽
        int selectorH = (int) Double.parseDouble(request.getParameter("selectorH"));
        int selectorW = (int) Double.parseDouble(request.getParameter("selectorW"));
        int selectorX = (int) Double.parseDouble(request.getParameter("selectorX"));
        int selectorY = (int) Double.parseDouble(request.getParameter("selectorY"));
        // 编辑窗口的大小
//        int viewPortH = Integer.parseInt(request.getParameter("viewPortH"));
//        int viewPortW = Integer.parseInt(request.getParameter("viewPortW"));
        // Resize
        ImageUtils.scaleImage(oldPath, newPath, imageW, imageH);
        // BufferedImage image = ImageUtils.readImage(oldpath);
        // ImageUtils.rotateImage(image, (int)angle);
        int x = selectorX - imageX;
        if (x < 0) {
            x = 0;
        }
        int y = selectorY - imageY;
        if (y < 0) {
            y = 0;
        }
        ImageUtils.cutImage(x, y, selectorW, selectorH, newPath, newPath);
        fileData = FileUpDownUtils.getFileContent(new File(newPath));
        String filePath = fileManager.saveImageFile(fileData, srcFilePath.substring(srcFilePath.lastIndexOf("/") + 1));
        // 删除原上传文件
        fileManager.deleteFile(srcFilePath);
        // 情况临时文件
        request.setAttribute("filePath", filePath);
        map.addAttribute("filePath", filePath);
        return "jsonView";
    }

    @RequestMapping("/uploadCompany")
    @ResponseBody
    public String uploadCompany(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String result = "false";
        Map<String, Object> map = new HashMap<String, Object>();
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "uploadFile");
        String fileName = uploadFile.getFileName();
        if (StringUtils.isNotBlank(fileName) && fileName.endsWith(".jpg")) {
            byte[] fileData = FileUpDownUtils.getFileContent(uploadFile.getFile());
            String filePath = fileManager.saveImageFile(fileData, uploadFile.getFileName());
            BufferedImage image = ImageUtils.readImage(uploadFile.getFile().getAbsolutePath());
            result = "true";
            map.put("filePath", filePath.trim());
            if (image != null) {
                map.put("width", image.getWidth() + "");
                map.put("height", image.getHeight() + "");
            }
        } else {
            map.put("message", "图片格式必须为.jpg");
        }
        map.put("result", result);
        AjaxUtils.doAjaxResponseOfMap(response, map);
        return null;
    }

    @RequestMapping("/uploadBrand")
    @ResponseBody
    public String uploadBrand(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "uploadFile");
        File file = uploadFile.getFile();
        if ((file.length() / 1024) > 500) {
            map.put("result", "false");
        } else {
            byte[] fileData = FileUpDownUtils.getFileContent(file);
            String filePath = fileManager.saveImageFile(fileData, uploadFile.getFileName());
            map.put("result", "true");
            map.put("filePath", filePath.trim());
        }
        AjaxUtils.doAjaxResponseOfMap(response, map);
        return null;
    }

    @RequestMapping("/companyCrop")
    public String companyCrop(HttpServletRequest request, HttpServletResponse response) {
        String filePath = request.getParameter("filePath");
        int width = 300;
        try {
            width = Integer.parseInt(request.getParameter("width"));
        } catch (Exception e) {
        }
        int height = 300;
        try {
            height = Integer.parseInt(request.getParameter("height"));
        } catch (Exception e) {
        }
        request.setAttribute("filePath", filePath.trim());
        request.setAttribute("width", request.getParameter("width"));
        request.setAttribute("height", request.getParameter("height"));
        request.setAttribute("type", request.getParameter("type"));
        request.setAttribute("scale", height * 1.0 / width);
        return "member/crop/companyCrop";
    }

    @RequestMapping("/deleteCompany")
    public String deleteCompany(HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception {
        String filePath = request.getParameter("filePath");
        boolean result = fileManager.deleteFile(filePath);
        map.addAttribute("result", result);
        return "jsonView";
    }

    @RequestMapping("/downloadFile")
    public String downloadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String filePath = request.getParameter("filePath");
        String fileName = request.getParameter("fileName");
        if(StringUtils.isBlank(fileName)){
            fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
        }
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        byte[] fileData = fileManager.getFile(filePath);
        OutputStream out = response.getOutputStream();
        out.write(fileData);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping("/companySpecCrop")
    public String companySpecCrop(HttpServletRequest request, HttpServletResponse response) {
        String filePath = request.getParameter("filePath");
        int width = 300;
        try {
            width = Integer.parseInt(request.getParameter("width"));
        } catch (Exception e) {
        }
        int height = 300;
        try {
            height = Integer.parseInt(request.getParameter("height"));
        } catch (Exception e) {
        }
        request.setAttribute("filePath", filePath.trim());
        request.setAttribute("width", request.getParameter("width"));
        request.setAttribute("height", request.getParameter("height"));
        request.setAttribute("type", request.getParameter("type"));
        request.setAttribute("scale", height * 1.0 / width);
        return "member/crop/companySpecCrop";
    }
}
