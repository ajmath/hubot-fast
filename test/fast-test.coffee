chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'fast default', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      logger:
        warning: sinon.spy()

    process.env.HUBOT_TUMBLR_API_KEY="1234"
    require('../src/fast')(@robot)

  it 'does not register a respond listener', ->
    expect(@robot.respond).to.not.have.been.called

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/(fast|sonic|hedgehog+s?)\b/i)

describe 'fast slow', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()
      logger:
        warning: sinon.spy()

    process.env.HUBOT_TUMBLR_API_KEY="1234"
    process.env.HUBOT_SLOW="plz"
    require('../src/fast')(@robot)

  it 'does not register a hear listener', ->
    expect(@robot.hear).to.not.have.been.called

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(fast|sonic|hedgehog){1} me/i)
