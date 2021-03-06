TodosRouter = Backbone.Router.extend {
  routes:
    "": "todos",
    "todos/:list_id": "todos",
    "map": "map",
    "graphite": "graphite"

  todos: (list_id) ->
    console.log "todos route :", list_id
    Session.set "list_id", list_id
    Session.set "tag_filter", null
    subscribeToList()
    frag = Meteor.render Template.todoslayout
    $(document.body).empty()
    document.body.appendChild frag

  setList: (list_id) ->
    this.navigate "todos/"+list_id, true

  map: ->
    console.log "route map"
    frag = Meteor.render Template.map
    Session.set "list_id", null
    $(document.body).empty()
    document.body.appendChild frag
    
  graphite: ->
    console.log "displaying graphite cubism.."
    frag = Meteor.render Template.cubism
    Session.set "list_id", null
    $(document.body).empty()
    document.body.appendChild frag
}

@Router = new TodosRouter

# activate backbone router push state, need browser support.
Meteor.startup ->
  Backbone.history.start {pushState: true}
