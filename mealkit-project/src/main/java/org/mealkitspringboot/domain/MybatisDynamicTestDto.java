package org.mealkitspringboot.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Map;

@Setter
@Getter
public class MybatisDynamicTestDto {
    private Map<String, String> map;
}
