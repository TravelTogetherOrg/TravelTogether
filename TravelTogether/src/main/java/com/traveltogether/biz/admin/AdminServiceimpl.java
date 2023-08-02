package com.traveltogether.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceimpl implements AdminService {
	
	@Autowired
	private AdminDAO_mybatis adminDAO;
	
	
	public void AdminDeleteMember(AdminVO vo) {
		adminDAO.AdminDeleteMember(vo);
	}
	

	public void AdminDeleteFestival(AdminVO vo) {
		adminDAO.AdminDeleteFestival(vo);
	}
	
	
	public void AdminDeleteBoard(AdminVO vo) {
		adminDAO.AdminDeleteBoard(vo);
	}
	
	
	public List<AdminVO> AdminGetMemberList(AdminVO vo) {
		return adminDAO.AdminGetMemberList(vo);
	}
	
	
	public List<AdminVO> AdminMemberBoardList(AdminVO vo) {
		return adminDAO.AdminMemberBoardList(vo);
	}
	
	
	public List<AdminVO> AdminFestivalList(AdminVO vo){
		return adminDAO.AdminFestivalList(vo);
	}
	
	public AdminVO getMember(AdminVO vo) {
		return adminDAO.getMember(vo);
	}
	
	
	    public boolean adminLogin(AdminVO vo) {
	        AdminVO admin = adminDAO.getMember(vo);
	        return admin != null && "admin@test.com".equals(admin.getMember_id());
	    }

		
}
