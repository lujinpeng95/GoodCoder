package com.zhss.oa.organ.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhss.oa.organ.mapper.EmployeeMapper;
import com.zhss.oa.organ.model.Employee;
import com.zhss.oa.organ.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	public void addEmployee(Employee employee) {
		employeeMapper.addEmployee(employee); 
	}

	public Employee findEmployeeById(Long id) {
		return employeeMapper.findEmployeeById(id);
	}

}
