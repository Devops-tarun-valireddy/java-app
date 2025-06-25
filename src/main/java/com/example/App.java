package com.example;

public class App {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("Hello from Jenkins!");
        while (true) {
            Thread.sleep(10000); // Sleep for 10 seconds in an infinite loop
        }
    }
}
