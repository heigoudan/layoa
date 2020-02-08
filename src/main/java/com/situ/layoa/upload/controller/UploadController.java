package com.situ.layoa.upload.controller;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.layoa.layResult.domain.LayResult;
import com.situ.layoa.uploadFile.domain.UploadFile;

@Controller
public class UploadController implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	@ResponseBody
	@RequestMapping("/upload")
	public LayResult doUploadFile(UploadFile uploadFile) {
		System.out.println(uploadFile.getUploadFile());
		//将上传的文件写出到磁盘后得到一个文件路径
		String src = "xxxx/xxx.png";
		
		return new LayResult(0,"",src);
	}

}
