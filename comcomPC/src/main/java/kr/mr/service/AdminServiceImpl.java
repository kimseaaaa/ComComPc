package kr.mr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.AdminMapper;
import kr.mr.model.AdminDTO;
import kr.mr.model.ClientDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public AdminDTO adminlogin(AdminDTO adto) {
		return mapper.adminlogin(adto);
	}
	
	
	
}
