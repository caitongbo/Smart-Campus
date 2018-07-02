package com.smartcampus.entity;

public class Authority {
    private Integer id;

    private String auName;

    private String auDetails;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuName() {
        return auName;
    }

    public void setAuName(String auName) {
        this.auName = auName;
    }

    public String getAuDetails() {
        return auDetails;
    }

    public void setAuDetails(String auDetails) {
        this.auDetails = auDetails;
    }
}