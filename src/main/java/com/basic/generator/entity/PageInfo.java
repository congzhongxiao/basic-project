package com.basic.generator.entity;

import lombok.Data;

@Data
public class PageInfo {
    String entityPage="entity";
    String mapperPage="mapper";
    String servicePage="service";
    String serviceImplPage="service.impl";
    String controllerPage = "controller";
    String parentPage = "";
}
