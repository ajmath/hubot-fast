# Description:
#   For things that are good about bad sonic fan art
#
#   This script will display random images from https://badsonicfanart.tumblr.com
#   at any mention of the words fast, sonic, or hedgehog.

#   You can optionally use the environment variable HUBOT_SLOW to turn it down
#   a notch and only show bad fan art when explicitly asked via
#     `hubot sonic me`
#     `hubot hedgehog me`
#     `hubot fast me`
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_TUMBLR_API_KEY=<your tumblr api key>
#   HUBOT_SLOW=<anything>
#
# Commands:
#
#   hubot sonic me
#   hubot hedgehog me
#   hubot fast me
#

module.exports = (robot) ->

  if !process.env.HUBOT_TUMBLR_API_KEY?
    robot.logger.warning 'No bad sonic fan art is possible without setting TUMBLR_API_KEY'
    return

  fast = (msg) ->
    console.log("Fast")
    offset = Math.floor(Math.random() * 190)
    apiKey = process.env.HUBOT_TUMBLR_API_KEY
    url = "http://api.tumblr.com/v2/blog/badsonicfanart.tumblr.com/posts?offset=#{offset}&api_key=#{apiKey}"
    msg.http(url)
      .get() (err, res, body) ->
        data = JSON.parse body
        photoPosts =  data.response.posts.filter (p) -> p.photos
        postIdx = Math.floor(Math.random() * (photoPosts.length))
        post = photoPosts[postIdx]
        photoIdx = Math.floor(Math.random() * (post.photos.length))
        msg.send post.photos[photoIdx].original_size.url

  if process.env.HUBOT_SLOW?
    robot.respond /(fast|sonic|hedgehog){1} me/i, fast
  else
    robot.hear /(fast|sonic|hedgehog+s?)\b/i, fast
