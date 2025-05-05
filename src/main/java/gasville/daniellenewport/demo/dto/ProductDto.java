// dto/ProductDto.java
package gasville.daniellenewport.demo.dto;

public class ProductDto {
    private String name;
    private double price;
    private int quantity;

    // Constructors, getters, and setters
    public ProductDto() {
    }

    public ProductDto(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters and setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}