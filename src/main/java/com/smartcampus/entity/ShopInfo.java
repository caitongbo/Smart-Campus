package com.smartcampus.entity;

public class ShopInfo extends User{
    private String uuid;

    private String shopName;

    private String showAddr;

    private String state;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getShowAddr() {
        return showAddr;
    }

    public void setShowAddr(String showAddr) {
        this.showAddr = showAddr;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}