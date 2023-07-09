package com.zhss.oa.organ.mapper;

import com.zhss.oa.organ.model.Employee;

public interface EmployeeMapper {
	
	public void addEmployee(Employee employee);
	
	public Employee findEmployeeById(Long id);
	
}
