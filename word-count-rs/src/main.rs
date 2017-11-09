use std::fs::File;
use std::io::prelude::*;
use std::collections::HashMap;

fn main() {
  let filename = "../data/t8.shakespeare.txt";

  let mut f = File::open(filename).expect("file not found");
  let mut contents = String::new();
  f.read_to_string(&mut contents)
    .expect("something went wrong reading the file");

  let mut word_map = HashMap::new();

  for word in contents.split_whitespace() {
    let count = word_map.entry(word).or_insert(0);
    *count += 1;
  }

  println!("{:?}", word_map);
}
