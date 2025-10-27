package com.employee.repositry;

import com.employee.model.Employee;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeRepositry {
    private final Session session;
    private final Transaction transaction;

    @Autowired
    public EmployeeRepositry(SessionFactory sessionFactory){
        session=sessionFactory.openSession();
        transaction=session.getTransaction();
    }

    public void save(Employee employee){
        transaction.begin();
        session.persist(employee);
        transaction.commit();
    }

    public List<Employee> getList() {
        Query<Employee> query=session.createQuery("from Employee", Employee.class);
        return query.list();
    }

    public Employee getEmployeeData(int empId) {
        return session.get(Employee.class,empId);
    }

    public void delete(Employee employee) {
        transaction.begin();
        session.delete(employee);
        transaction.commit();
    }

    public void updateData(Employee employee, Employee curEmployee) {
        transaction.begin();
        curEmployee.setEmpName(employee.getEmpName());
        curEmployee.setEmpDepartment(employee.getEmpDepartment());
        curEmployee.setEmpSalary(employee.getEmpSalary());
        transaction.commit();
    }
}
