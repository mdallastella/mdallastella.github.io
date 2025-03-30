---
date: '2025-01-26T21:44:58+01:00'
title: 'Test'
---

A brief description of what the function does, using simple present tense in the third person singular form. For example:

`someFunction` returns the string `s` repeated `n` times.

## Signature

```python
func someFunction(s string, n int) string
```

## Examples

One or more practical examples, each within a fenced code block.

## Notes

Additional information to clarify as needed.

I :heart: Hugo

## Code

``` clojure
;; Parse each draw, splitting by space the single elements and turn them into a map:
(defn parse-draws
  [set]
  (reduce
   (fn [acc el]
     (let [[n color] (s/split el #"\s")
           n (parse-long n)]
       (assoc acc (keyword color) n)))
   {}
   set))
```
