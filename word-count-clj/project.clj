(defproject word-count-clj "0.1.0-SNAPSHOT"
  :description "Word count with clojure"
  :url "https://github.com/MetalRain/word-count"
  :license {:name "MIT"
            :url "https://opensource.org/licenses/MIT"}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :main ^:skip-aot word-count-clj.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
