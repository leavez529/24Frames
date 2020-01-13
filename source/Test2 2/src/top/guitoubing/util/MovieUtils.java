package top.guitoubing.util;

import top.guitoubing.pojo.Movie;
import top.guitoubing.pojo.MovieData;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Collectors.*;

public class MovieUtils {

    public static ArrayList<String> keySplit(String key){
        ArrayList<String> strings = new ArrayList<>();
        String[] keys = key.split("");
        for (String k : keys){
            if (!k.equals("") && !k.equals(" ")){
                strings.add(k.trim());
            }
        }
        return strings;
    }

    public static List<MovieData> removeDuplicate(List<MovieData> movieData){
        return movieData.stream().collect(
                Collectors.collectingAndThen(
                        Collectors.toCollection(() -> new TreeSet<>(Comparator.comparingLong(MovieData::getId))), ArrayList::new)
                );
    }

    public static List<Movie> removeDuplicateMovie(List<Movie> movie){
        return movie.stream().collect(
                Collectors.collectingAndThen(
                        Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(Movie::getId))), ArrayList::new)
        );
    }

}
