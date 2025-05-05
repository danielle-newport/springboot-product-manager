// repository/ProductRepository.java
package gasville.daniellenewport.demo.repository;

import gasville.daniellenewport.demo.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}