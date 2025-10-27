package com.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employees")
public class Employee {

    @Id
    private int empId;
    private String empName;
    private  String empDepartment;
    private int empSalary;

    public Employee() {
    }

    public Employee(int empId, String empName, String empDepartment, int empSalary) {
        this.empId = empId;
        this.empName = empName;
        this.empDepartment = empDepartment;
        this.empSalary = empSalary;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getEmpDepartment() {
        return empDepartment;
    }

    public void setEmpDepartment(String empDepartment) {
        this.empDepartment = empDepartment;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public int getEmpSalary() {
        return empSalary;
    }

    public void setEmpSalary(int empSalary) {
        this.empSalary = empSalary;
    }
}
