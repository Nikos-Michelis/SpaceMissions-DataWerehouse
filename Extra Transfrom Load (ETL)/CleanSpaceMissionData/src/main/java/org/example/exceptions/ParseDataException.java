package org.example.exceptions;

public class ParseDataException extends RuntimeException {
    public ParseDataException(String message) throws RuntimeException {
        super(message);
    }

}
