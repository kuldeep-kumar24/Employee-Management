package com.employee.service;

import com.employee.model.Employee;
import com.employee.repositry.EmployeeRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    private final EmployeeRepositry repository;

    @Autowired
    public EmployeeService(EmployeeRepositry repository){
        this.repository=repository;
    }

    public void addEmployee(Employee employee){
        repository.save(employee);
    }

    public List<Employee> getListOfEmployee() {
        return repository.getList();
    }

    public Employee getEmployee(int empId) {
        return repository.getEmployeeData(empId);
    }

    public void deleteEmployee(int id) {
        Employee employee=repository.getEmployeeData(id);
        repository.delete(employee);
    }

    public void updateEmployee(Employee employee) {
        Employee curEmployee=repository.getEmployeeData(employee.getEmpId());
        repository.updateData(employee,curEmployee);
        employee=null;
    }
}
