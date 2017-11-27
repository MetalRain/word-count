(ns word-count-clj.core
  (:gen-class))

(use 'clojure.java.io)

(defn readfile
  "Reads file to lines"
  [filepath linefn lines]
    (with-open [rdr (reader filepath)]
      (reduce linefn lines (line-seq rdr))))

(defn extract-words [lines line]
  (into lines (re-seq #"[^\s]+" line)))

(defn insert-to-map [word-map word]
  (assoc 
    word-map
    (keyword word)
    (+ 1 (get word-map (keyword word) 0))))

(defn sort-map [word-map]
  (into 
    (sorted-map-by 
      (fn [a b]
        (compare 
          [(get word-map b) b]
          [(get word-map a) a])))
    word-map))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (let 
    [words (readfile "../data/t8.shakespeare.txt" extract-words [])
    word-map (reduce insert-to-map {} words)
    sorted (sort-map word-map)]
    (println (take 100 sorted))))