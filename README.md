# hubot-fast
[![Build Status](https://travis-ci.org/ajmath/hubot-fast.svg)](https://travis-ci.org/ajmath/hubot-fast)

Delivering healthy doses of bad sonic fan art

See [`src/fast.coffee`](src/fast.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-fast --save`

Then add **hubot-fast** to your `external-scripts.json`:

```json
[
  "hubot-fast"
]
```

## Sample Interaction

default
```
user1>> Man that deployment was fast
hubot>> http://41.media.tumblr.com/878d3259fa8375721ac33d64be88994d/tumblr_mww3arHsLc1spc5n6o1_1280.jpg
```

with HUBOT_SLOW set to something
```
user1>> hubot fast me
hubot>> http://41.media.tumblr.com/878d3259fa8375721ac33d64be88994d/tumblr_mww3arHsLc1spc5n6o1_1280.jpg
```
