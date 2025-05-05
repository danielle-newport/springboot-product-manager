// repository/ProductRepository.java
package main.java.gasville.daniellenewport.demo.repository;

import main.java.gasville.daniellenewport.demo.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}