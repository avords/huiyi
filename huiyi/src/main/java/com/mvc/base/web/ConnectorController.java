package com.mvc.base.web;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.component.file.BaseFileManager;
import com.mvc.config.ApplicationConfig;
import com.mvc.framework.util.DomainUtils;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.FrameworkFactory;

@Controller
@RequestMapping("/connector")
public class ConnectorController {

    @RequestMapping("upload")
    public  String upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "upload");
        BaseFileManager baseFileManager = FrameworkFactory.getBaseFileManager();
        String fileExtention = uploadFile.getFileName().substring(uploadFile.getFileName().lastIndexOf("."));
        String fileName = baseFileManager.getNewFileId() + fileExtention;
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String path = ApplicationConfig.getImageUploadFolder() + File.separator + dateFormat.format(new Date()) + File.separator + fileName;
        FileUtils.copyFile(uploadFile.getFile(), new File(path));
        path = path.replaceAll("\\\\", "/");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        String callback = request.getParameter("CKEditorFuncNum");
        out.println("<script type=\"text/javascript\">");
        String url = DomainUtils.getDynamicDomain()+"/picture/" + dateFormat.format(new Date()) + "/" + fileName;
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + url + "','')");
        out.println("</script>");
        out.flush();
        out.close();
        return null;
    }


    @RequestMapping("upload1")
    public  String upload1(HttpServletRequest request, HttpServletResponse response) throws Exception {
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "upload");
        BaseFileManager baseFileManager = FrameworkFactory.getBaseFileManager();
        String fileExtention = uploadFile.getFileName().substring(uploadFile.getFileName().lastIndexOf("."));
        String fileName = baseFileManager.getNewFileId() + fileExtention;
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String path = ApplicationConfig.getImageUploadFolder() + File.separator + dateFormat.format(new Date()) + File.separator + fileName;
        FileUtils.copyFile(uploadFile.getFile(), new File(path));
        path = path.replaceAll("\\\\", "/");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.flush();
        out.close();
        return null;
    }
    @RequestMapping("kindUpload")
    public  String kindUpload(HttpServletRequest request, HttpServletResponse response,ModelMap map) throws Exception {
        try{
            UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "imgFile");
            //String fileType = request.getParameter("dir");//image、flash、media、file
            BaseFileManager baseFileManager = FrameworkFactory.getBaseFileManager();
            String fileExtention = uploadFile.getFileName().substring(uploadFile.getFileName().lastIndexOf("."));
            String fileName = baseFileManager.getNewFileId() + fileExtention;
            DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
            String path = ApplicationConfig.getImageUploadFolder() + File.separator + dateFormat.format(new Date()) + File.separator + fileName;
            FileUtils.copyFile(uploadFile.getFile(), new File(path));
            uploadFile.getFile().delete();//删除零时文件
            path = path.replaceAll("\\\\", "/");
            String url = DomainUtils.getDynamicDomain()+"/picture/" + dateFormat.format(new Date()) + "/" + fileName;
            map.addAttribute("error",0);
            map.addAttribute("url",url);
        }catch(Exception e){
            map.addAttribute("error",1);
            map.addAttribute("message","上传错误");
        }
        return "jsonView";
    }
}
