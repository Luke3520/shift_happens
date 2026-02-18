package dk.ek.shift_happens.department;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "Department", schema = "shift_happens") // use exact table name and schema
public class Department {

    @Id
    @Column(name = "department_id")
    private Long department_id;
    @Column(name = "department_name")
    private String department_name;
    @Column(name = "is_active")
    private Boolean is_active;
}
