package dk.ek.shift_happens.department;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "department")
@Getter
@Setter
@NoArgsConstructor
public class DepartmentMongo {
    @Id
    private String id;
    @Field("department_name")
    private String departmentName;
    @Field("is_active")
    private Boolean isActive;
}
