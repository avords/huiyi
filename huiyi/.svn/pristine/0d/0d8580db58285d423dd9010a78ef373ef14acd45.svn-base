package com.mvc.base.web;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.service.FileManager;
import com.mvc.config.ApplicationConfig;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.UploadFile;
import com.mvc.util.ImageUtils;

@Controller
@RequestMapping("/screenshot")
public class ScreenshotController {
	protected static final String TMP_DIR = ApplicationConfig.getTempDir();
	@Resource(name="fileManagerExpand")
	private FileManager fileManager;
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
		//int angle = (int) Double.parseDouble(request.getParameter("imageRotate"));
		//String imageSource = request.getParameter("imageSource");
		// 图片选择框的座标和高宽
		int selectorH = (int) Double.parseDouble(request.getParameter("selectorH"));
		int selectorW = (int) Double.parseDouble(request.getParameter("selectorW"));
		int selectorX = (int) Double.parseDouble(request.getParameter("selectorX"));
		int selectorY = (int) Double.parseDouble(request.getParameter("selectorY"));
		// 编辑窗口的大小
		//int viewPortH = Integer.parseInt(request.getParameter("viewPortH"));
		//int viewPortW = Integer.parseInt(request.getParameter("viewPortW"));
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

	@RequestMapping("/uploadImage")
	public String uploadImage(HttpServletRequest request, HttpServletResponse response,ModelMap map) throws Exception {
		String result = "false";
		UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "uploadFile");
		String fileName = uploadFile.getFileName();
		if (StringUtils.isNotBlank(fileName)){
		if (fileName.endsWith(".jpg")||fileName.endsWith(".bmp")||fileName.endsWith(".gif")||fileName.endsWith(".png")||fileName.endsWith(".JPG")||fileName.endsWith(".BMP")||fileName.endsWith(".GIF")||fileName.endsWith(".PNG")) {
			byte[] fileData = FileUpDownUtils.getFileContent(uploadFile.getFile());
			String filePath = fileManager.saveImageFile(fileData, uploadFile.getFileName());
			BufferedImage image = ImageUtils.readImage(uploadFile.getFile().getAbsolutePath());
			result = "true";
			map.addAttribute("filePath", filePath.trim());
			if (image != null) {
				map.put("width", image.getWidth() + "");
				map.put("height", image.getHeight() + "");
			}
		} else {
			map.put("message", "图片格式必须为jpg/bmp/gif/png");
		}
		}
		map.put("result", result);
		return "jsonView";
	}

	@RequestMapping("/imageCrop")
	public String imageCrop(HttpServletRequest request, HttpServletResponse response) {
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
		request.setAttribute("cropWidth", request.getParameter("cropWidth"));
        request.setAttribute("cropHeight", request.getParameter("cropHeight"));
		request.setAttribute("scale", height * 1.0 / width);
		return "image/imageCrop";
	}
	@RequestMapping("/deleteImage")
    public String deleteImage(HttpServletRequest request, HttpServletResponse response, ModelMap map) throws Exception {
        String filePath = request.getParameter("filePath");
        boolean result = fileManager.deleteFile(filePath);
        map.addAttribute("result", result);
        return "jsonView";
    }
}
