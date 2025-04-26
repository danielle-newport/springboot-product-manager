// service/KafkaStreamService.java
package main.java.gasville.daniellenewport.demo.service;

import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.kstream.Consumed;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.kstream.Produced;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class KafkaStreamService {

    @Value("${kafka.topic.input}")
    private String inputTopic;

    @Value("${kafka.topic.output}")
    private String outputTopic;

    @Autowired
    public void buildPipeline(StreamsBuilder streamsBuilder) {
        KStream<String, String> messageStream = streamsBuilder
                .stream(inputTopic, Consumed.with(Serdes.String(), Serdes.String()));

        // Process the stream - here we just convert messages to uppercase as an example
        messageStream.mapValues(value -> value.toUpperCase())
                .to(outputTopic, Produced.with(Serdes.String(), Serdes.String()));
    }
}