package org.example.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Paths;

public class HandleImages {
    public static String downloadImages(String imageUrl, String DownloadDirectory) throws IOException {
        URL url = new URL(imageUrl);
        String fileName = Paths.get(url.getPath()).getFileName().toString();
        String localPath = DownloadDirectory + File.separator + fileName; // directory to save the images
        // Check if the file already exists
        if (Files.exists(Paths.get(localPath))) {
            return localPath;
        }
        URLConnection connection = url.openConnection();
        try (InputStream inputStream = connection.getInputStream()) {
            try (FileOutputStream outputStream = new FileOutputStream(localPath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }
            return localPath;
        }
    }
}
