package com.example.demo.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import com.example.demo.model.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {

    @Modifying
    @Transactional
    @Query(value = "SET @count = 0", nativeQuery = true)
    void initializeCount();

    @Modifying
    @Transactional
    @Query(value = "UPDATE student SET sno = (@count := @count + 1)", nativeQuery = true)
    void resetSnoSequence();
}
