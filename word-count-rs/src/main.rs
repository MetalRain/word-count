use std::fs::File;
use std::io::prelude::*;
use std::collections::HashMap;
use std::vec::Vec;

fn main() {
  let filename = "../data/t8.shakespeare.txt";

  let mut f = File::open(filename).expect("file not found");
  let mut contents = String::new();
  f.read_to_string(&mut contents)
   .expect("something went wrong reading the file");

  let mut word_map: HashMap<&str, u64> = HashMap::new();

  for word in contents.split_whitespace() {
    let count = word_map.entry(word)
                        .or_insert(0);
    *count += 1;
  }

  let mut counts: Vec<(&&str, &u64)> = word_map.iter()
                                   .collect();
  counts.sort_by(|&(_, a_val), &(_, b_val)| b_val.cmp(a_val));

  println!("{:?}", counts[0..100].to_vec());
}