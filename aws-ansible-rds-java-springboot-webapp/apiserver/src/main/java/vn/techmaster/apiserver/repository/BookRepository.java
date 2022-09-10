package vn.techmaster.apiserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vn.techmaster.apiserver.model.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {
}
