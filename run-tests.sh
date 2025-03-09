#!/bin/bash
docker run -it --rm -v "$(pwd)":/src -w /src -v "$HOME/.m2":/root/.m2 maven:3-amazoncorretto-17 mvn clean test -Dkarate.env=$karate.env