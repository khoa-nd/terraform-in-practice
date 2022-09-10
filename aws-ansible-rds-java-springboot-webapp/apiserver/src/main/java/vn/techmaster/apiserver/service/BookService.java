package vn.techmaster.apiserver.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.techmaster.apiserver.model.Book;
import vn.techmaster.apiserver.repository.BookRepository;

@Service
public class BookService {

  @Autowired
  private BookRepository bookRepository;

  public List<Book> listBooks() {
    return bookRepository.findAll();
  }
}
