Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/assflip.coffee')

describe 'assflip', ->
  beforeEach ->
    @room = helper.createRoom(httpd: false)

  it 'should flip when there\'s a hyphen', ->
    @room.user.say('alice', 'that\'s a sweet-ass car!').then =>
      expect(@room.messages).to.eql [
        ['alice', 'that\'s a sweet-ass car!']
        ['hubot', 'Eww, sweet ASS-car?!']
      ]

  it 'should flip when there\'s nothing', ->
    @room.user.say('alice', 'I love your dopeass pants gurl').then =>
      expect(@room.messages).to.eql [
        ['alice', 'I love your dopeass pants gurl']
        ['hubot', 'Eww, dope ASS-pants?!']
      ]
	  
  it 'should flip when there\'s a space', ->
    @room.user.say('alice', 'these are some bad ass fighters').then =>
      expect(@room.messages).to.eql [
        ['alice', 'these are some bad ass fighters']
        ['hubot', 'Eww, bad ASS-fighters?!']
      ]
	  
  it 'should leave it alone if there\'s no other word', ->
    @room.user.say('alice', 'what a bad ass').then =>
      expect(@room.messages).to.eql [
        ['alice', 'what a bad ass']
      ]
	  
  it 'should leave it alone if it\'s the start of a word', ->
    @room.user.say('alice', 'what a bad assignment dang').then =>
      expect(@room.messages).to.eql [
        ['alice', 'what a bad assignment dang']
      ]

  it 'should leave it alone if it\'s followed by a common non-noun', ->
    @room.user.say('alice', 'what a dumb ass to deal with').then =>
      expect(@room.messages).to.eql [
        ['alice', 'what a dumb ass to deal with']
      ]

  it 'should leave it alone if it\'s ass hole', ->
    @room.user.say('alice', 'what a dumb ass hole').then =>
      expect(@room.messages).to.eql [
        ['alice', 'what a dumb ass hole']
      ]