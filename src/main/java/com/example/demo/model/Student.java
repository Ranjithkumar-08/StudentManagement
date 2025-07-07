package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer sno; 

    private String name;
    private String department;
    private String email;


    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getSno() { return sno; }
    public void setSno(Integer sno) { this.sno = sno; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
