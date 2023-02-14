package models.entities;

import java.util.HashMap;

public class Cart {

    private HashMap<Product, Integer> cartList = new HashMap<>();

    public Cart() {

    }

    public void empty()
    {
        this.cartList.clear();
    }

    public void add(Product product)
    {
        cartList.merge(product, 1, Integer::sum);
    }

    public void remove(int id)
    {

    }

}
