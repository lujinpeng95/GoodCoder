package com.zhss.oa.organ.service;

import com.zhss.oa.organ.model.Employee;

public interface EmployeeService {

	public void addEmployee(Employee employee);
	
	public Employee findEmployeeById(Long id);
	
}
