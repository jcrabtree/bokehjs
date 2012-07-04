test('test_interactive', ()->
  expect(0)
  data_source1 = Bokeh.Collections['ObjectArrayDataSource'].create({
    data : [{x : 1, y : -2},
      {x : 2, y : -3},
      {x : 3, y : -4},
      {x : 4, y : -5},
      {x : 5, y : -6}]
  }, {'local' : true})
  data_source2 = Bokeh.Collections['ObjectArrayDataSource'].create({
    data : [{x : 1, y : 2},
      {x : 2, y : 3},
      {x : 3, y : 1},
      {x : 4, y : 5},
      {x : 5, y : 6}]
    }, {'local' : true})
  container = Bokeh.Collections['CDXPlotContext'].create(
    {}, {'local' : true});
  plot1 = Bokeh.scatter_plot(container, data_source1, 'x', 'y', 'x', 'circle')
  plot2 = Bokeh.scatter_plot(container, data_source2, 'x', 'y', 'x', 'circle')
  plot3 = Bokeh.scatter_plot(container, data_source2, 'x', 'y', 'x', 'circle')
  plot4 = Bokeh.line_plot(container, data_source1, 'x', 'y')
  container.set({'children' : [plot1.ref(), plot2.ref(), plot3.ref(), plot4.ref()]})
  $('body').append("<div id='mychart'></div>")

  window.myrender = () ->
    view = new container.default_view({'model' : container, 'el':$('#mychart')})
    view.render()
    plot3.set({'height' : 300})
    window.plot3 = plot3
    window.view = view
  _.defer(window.myrender)
)
  