package Models;

public class Menu {

    private int id;
    private String name;
    private String image;
    private String description;
    private String ingredients;
    private Double smallSizePrice;
    private Double mediumSizePrice;
    private Double largeSizePrice;
    private Double price;
    private int quantity;
    private String size;

    public Menu() {
    }

    public Menu(String name, String image, String description, String ingredients, Double smallSizePrice, Double mediumSizePrice, Double largeSizePrice) {
        this.name = name;
        this.image = image;
        this.description = description;
        this.ingredients = ingredients;
        this.smallSizePrice = smallSizePrice;
        this.mediumSizePrice = mediumSizePrice;
        this.largeSizePrice = largeSizePrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public Double getSmallSizePrice() {
        return smallSizePrice;
    }

    public void setSmallSizePrice(Double smallSizePrice) {
        this.smallSizePrice = smallSizePrice;
    }

    public Double getMediumSizePrice() {
        return mediumSizePrice;
    }

    public void setMediumSizePrice(Double mediumSizePrice) {
        this.mediumSizePrice = mediumSizePrice;
    }

    public Double getLargeSizePrice() {
        return largeSizePrice;
    }

    public void setLargeSizePrice(Double largeSizePrice) {
        this.largeSizePrice = largeSizePrice;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    
    
}
