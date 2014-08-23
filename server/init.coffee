
Meteor.startup ->
  Cameras.remove {}
  Cameras.insert
    position: [0, 1, 6]
    lookAt: [0, 0, 0]

  Objects.remove {}
  Objects.insert
    type: 'AmbientLight'
    color: 0x555555
  Objects.insert
    type: 'DirectionalLight'
    color: 0xaaaaaa
    position: [0, 0, 0]

  itemId = Random.id()
  Objects.insert
    _id: itemId
    type: 'BoxGeometry'
    width: 1
    height: 1
    depth: 1
    position: [0, 0, 0]

  rotateItem = ->
    pos = Math.sin Date.now()/500
    Objects.update {_id: itemId}, {$set: {position: [pos, 0, 0]}}
  Meteor.setInterval rotateItem, 16
