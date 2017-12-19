(ns word-count-clj.core
  (:gen-class))

(use 'clojure.java.io)

(def data-file "../data/t8.shakespeare.txt")

(defn readfile [filepath linefn lines]
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

(defn format-pair [k v]
  (format
    "%d: %s"
    v
    (name k)))

(defn -main [& args]
  (let 
    [words (readfile data-file extract-words [])
    word-map (reduce insert-to-map {} words)
    sorted (sort-map word-map)]
    (doseq [keyval (take 100 sorted)]
      (println
        (format-pair 
          (key keyval) 
          (val keyval))))))