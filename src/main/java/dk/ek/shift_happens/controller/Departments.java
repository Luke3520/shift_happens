package dk.ek.shift_happens.controller;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Getter
@Setter
@NoArgsConstructor
@RestController
@RequestMapping( "/departments")
public class Departments {

    private String department_name;
    private Boolean is_active;
    public Departments(String department_name, Boolean is_active) {
        this.department_name = department_name;
        this.is_active = is_active;
    }
    @GetMapping
    public String getDepartments() {
        return "Departments";
    }
}
