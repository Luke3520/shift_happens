package dk.ek.shift_happens.shift.mongo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShiftMongoService {

    private final ShiftMongoRepository shiftMongoRepository;

    public List<ShiftDocument> findAll() {
        return shiftMongoRepository.findAll();
    }

    public Optional<ShiftDocument> findById(Integer id) {
        return shiftMongoRepository.findById(id);
    }

    public ShiftDocument create(ShiftDocument document) {
        return shiftMongoRepository.save(document);
    }

    public Optional<ShiftDocument> update(Integer id, ShiftDocument document) {
        if (!shiftMongoRepository.existsById(id)) {
            return Optional.empty();
        }
        document.setShiftId(id);
        return Optional.of(shiftMongoRepository.save(document));
    }

    public boolean delete(Integer id) {
        if (!shiftMongoRepository.existsById(id)) {
            return false;
        }
        shiftMongoRepository.deleteById(id);
        return true;
    }
}
