package com.board.userClass;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ProfileUpload {
	//파일 업로드 메소드	
	//String fullPath="D:/Work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SpringMVC-Board/resources/upload";
	
	public Map<String,String> fileUp(MultipartHttpServletRequest multi){
		System.out.println("fileUp");
		//1.이클립스의 물리적 저장경로 찾기
		String root=multi.getSession().getServletContext().getRealPath("/");
		String path=root+"resources/profile/";
		//2.폴더 생성을 꼭 할것...
		File dir=new File(path);
		
		if(!dir.isDirectory()){  //upload폴더 없다면
			dir.mkdir();  //upload폴더 생성
		}
		
		//3.파일을 가져오기-일태그 이름들 반환
		Iterator<String> files=multi.getFileNames(); //파일업로드 2개이상일때
		Map<String,String> fMap=new HashMap<String, String>();
		while(files.hasNext()){
			String fileTagName=files.next(); //name = "b_file"
			//파일 메모리에 저장
			MultipartFile mf=multi.getFile(fileTagName); //실제파일
			String oriName=mf.getOriginalFilename();  //a.txt
			fMap.put("oriName", oriName);
			//4.시스템파일이름 생성  a.txt  ==>112323242424.txt
			String sysName=System.currentTimeMillis()+"."
					+oriName.substring(oriName.lastIndexOf(".")+1);
			fMap.put("sysName", sysName);
			//5.메모리->실제 파일 업로드
			try {
				mf.transferTo(new File(path+sysName));//서버 경로에 저장 시켜주는 메소드
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fMap;
	}	
}

