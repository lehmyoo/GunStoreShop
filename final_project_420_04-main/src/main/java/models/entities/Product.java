package models.entities;

public class Product {
    private int id;

    private String name;

    private String category;

    private String description;

    private String origin;

    private float price;

    public Product(int id, String name, String category, String description, String origin, float price) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.origin = origin;
        this.price = price;
    }

    public Product(String name, String category, String description, String origin, float price) {
        this.name = name;
        this.category = category;
        this.description = description;
        this.origin = origin;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}


