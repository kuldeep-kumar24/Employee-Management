package com.employee.controller;

import com.employee.model.Employee;
import com.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class EmployeeController {
    private final EmployeeService service;

    @Autowired
    public EmployeeController(EmployeeService service){
        this.service=service;
    }

    @GetMapping
    public String homePage(){
        return "home";
    }

    @GetMapping("/add")
    public ModelAndView getEmployee(){
        return new ModelAndView("add_employee");
    }

    @PostMapping("addSuccessfully")
    public ModelAndView addEmployee(Employee employee){
        service.addEmployee(employee);
        return new ModelAndView("addEmployeeSuccessfully");
    }

    @GetMapping("/list")
    public ModelAndView getEmployeeList(){
        List<Employee> employees=service.getListOfEmployee();
        ModelAndView modelAndView=new ModelAndView("listOfEmployee");
        modelAndView.addObject("employeeList",employees);
        return modelAndView;
    }

    @GetMapping("delete")
    public String deleteEmployee(){
        return "delete_employee";
    }

    @GetMapping("deleteEmployee")
    public String getDeleteEmployeeData(@RequestParam("empId") int empId, Model model){
        Employee employee=service.getEmployee(empId);
        if(employee!=null) {
            model.addAttribute("employee", employee);
        }
        else {
            model.addAttribute("errorMessage","Employee not found for "+empId);
        }
        return "delete_employee";
    }

    @PostMapping("deleteEmployeeDo")
    public String delete(@RequestParam("empId") int empId,Model model){
        service.deleteEmployee(empId);
        model.addAttribute("message","Employee deleted successfully "+empId);
        return "delete_employee";
    }

    @GetMapping("searchEmployee")
    public String searchEmployee(){
        return "searchEmployee";
    }

    @PostMapping("searchEmployeeDo")
    public String  getSearchEmployee(@RequestParam("empId") int empId,Model model){
        Employee employee=service.getEmployee(empId);
        model.addAttribute("employee",employee);
        return "searchEmployee";
    }

    @GetMapping("editEmployee")
    public String editEmployee(){
        return "editEmployee";
    }

    @PostMapping("updateEmployee")
    public String getEditEmployee(@RequestParam("empId") int empId,Model model){
        Employee employee=service.getEmployee(empId);
        if(employee!=null)
        model.addAttribute("employee",employee);
        else
            model.addAttribute("errorMessage","Employee not found for "+empId);
        return "editEmployee";
    }

    @PostMapping("updateEmployeeDo")
    public String editEmployeeDo(Employee employee,Model model){
        service.updateEmployee(employee);
        model.addAttribute("successMessage","Edit Employee Details Successfully");
        return "editEmployee";
    }
}