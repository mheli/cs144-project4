package edu.ucla.cs.cs144;

public class Bid {
    private String bidderUID;
    private String time;
    private String amount;
    private String rating;
    private String location;
    private String country;

    public Bid(String b, String t, String a, String r, String l, String c){
        bidderUID = b;
        time = t;
        amount = a;
        rating = r;
        location = l;
        country = c;
    }

    public String getBidderUID(){
        return bidderUID;
    }

    public String getTime(){
        return time;
    }

    public String getAmount(){
        return amount;
    }

    public String getRating(){
        return rating;
    }

    public String getLocation(){
        return location;
    }

    public String getCountry(){
        return country;
    }
}