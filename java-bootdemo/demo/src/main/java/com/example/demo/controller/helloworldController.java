package  com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloworldController {

    @RequestMapping("/test")
    public String test(){
        return "Hello, welcome to the java spring boot project!";
    }
    
}
