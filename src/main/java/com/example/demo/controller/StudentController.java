//package com.example.demo.controller;
//
//import com.example.demo.model.Student;
//import com.example.demo.repository.StudentRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.Optional;
//
//@RestController
//@RequestMapping("/students")
//@CrossOrigin(origins = "*")  // Allow Postman to access API
//public class StudentController {
//
//    @Autowired
//    private StudentRepository studentRepository;
//
//    // Get all students
//    @GetMapping
//    public List<Student> getAllStudents() {
//        return studentRepository.findAll();
//    }
//
//    // Get a student by ID
//    @GetMapping("/{id}")
//    public Optional<Student> getStudentById(@PathVariable Long id) {
//        return studentRepository.findById(id);
//    }
//
//    // Create a new student
//    @PostMapping
//    public Student createStudent(@RequestBody Student student) {
//        return studentRepository.save(student);
//    }
//
//    // Delete a student by ID
//    @DeleteMapping("/{id}")
//    public String deleteStudent(@PathVariable Long id) {
//        studentRepository.deleteById(id);
//        return "Deleted student with ID: " + id;
//    }
//}
//package com.example.demo.controller;
//
//import com.example.demo.model.Student;
//import com.example.demo.repository.StudentRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//@Controller
//public class StudentController {
//
//    @GetMapping("/home")
//    public String homePage() {
//        return "index";  // Refers to index.jsp inside WEB-INF/views
//    }
//}


//@Controller
//public class StudentController {
//
//    @Autowired
//    private StudentRepository studentRepository;
//
//    // Display the form
//    @GetMapping("/student-form")
//    public String showForm() {
//        return "studentForm";
//    }
//
//    // Handle form submission
//    @PostMapping("/students/save")
//    public String saveStudent(@RequestParam String name,
//                              @RequestParam String department,
//                              @RequestParam String email) {
//
//        Student student = new Student();
//        student.setName(name);
//        student.setDepartment(department);
//        student.setEmail(email);
//
//        studentRepository.save(student);
//
//        return "redirect:/student-form";  // Redirect to form after saving
//    }
//}
package com.example.demo.controller;

import com.example.demo.model.Student;
import com.example.demo.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentRepository studentRepository;

    @GetMapping("/login")
    public String showloginForm() {
        return "signin"; 
    }

//    @PostMapping("/login")
//    public String loginStudent(@RequestParam String username, @RequestParam String password, Model model) {
//        if ("ranjith".equals(username) && "123".equals(password)) {
//            return "index";  
//        } else {
//            model.addAttribute("error", "Invalid credentials");
//            return "signin";
//        }
//    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
        Student student = studentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid student ID: " + id));
        
        model.addAttribute("student", student);
        return "updatestudent"; // Your JSP page name
    }

    @PostMapping("/update")
    public String updateStudent(@ModelAttribute Student student) {
        
        // Validate ID is not null
        if (student.getId() == null) {
            throw new IllegalArgumentException("Student ID is missing for update!");
        }
        
        // Fetch existing student from DB
        Student existingStudent = studentRepository.findById(student.getId())
            .orElseThrow(() -> new IllegalArgumentException("Invalid student ID: " + student.getId()));
        
        // Update fields
        existingStudent.setName(student.getName());
        existingStudent.setDepartment(student.getDepartment());
        existingStudent.setEmail(student.getEmail());
        
        // Save updated record
        studentRepository.save(existingStudent);
        
        // Redirect to list
        return "redirect:/students/list";
    }
    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {

        studentRepository.findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Invalid student ID: " + id));

        studentRepository.deleteById(id);

        studentRepository.resetSnoSequence(); // Rearranges sno in DB

        return "redirect:/students/list";
    }




    @GetMapping("/register")
    public String showRegistrationForm() {
        return "index"; 
    }

    @PostMapping("/save")
    public String saveStudent(@ModelAttribute Student student) {
        studentRepository.save(student);
        return "redirect:/students/list";
    }

    @GetMapping("/list")
    public String listStudents(Model model) {
        List<Student> students = studentRepository.findAll();
        model.addAttribute("students", students);
        return "list";  
    }
   


}
