package com.basic.generator.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DBInfo {
    String url ;
    String username;
    String password;
    String driverName;
}
