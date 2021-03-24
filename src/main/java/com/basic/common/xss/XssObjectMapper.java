package com.basic.common.xss;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import org.springframework.web.util.HtmlUtils;

import java.io.IOException;

public class XssObjectMapper extends ObjectMapper {
    private static final long serialVersionUID = -3448961813323784217L;

    public XssObjectMapper() {
        SimpleModule module = new SimpleModule("XssStringJsonSerializer");
        module.addDeserializer(String.class,new JsonHtmlXssDeserializer(String.class));
        this.registerModule(module);
    }

    /**
     * 对入参的json进行转义
     */
    class JsonHtmlXssDeserializer extends JsonDeserializer<String> {

        public JsonHtmlXssDeserializer(Class<String> string) {
            super();
        }

        @Override
        public Class<String> handledType() {
            return String.class;
        }

        @Override
        public String deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
            String value = jsonParser.getValueAsString();
            if (value != null) {
                return HtmlUtils.htmlEscape(value);
            }
            return value;
        }
    }
}
