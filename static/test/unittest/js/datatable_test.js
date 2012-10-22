(function() {

  test('test_interactive', function() {
    var data_source1, tablemodel;
    expect(0);
    data_source1 = Bokeh.Collections['ObjectArrayDataSource'].create({
      data: [
        {
          x: 1,
          y: -2
        }, {
          x: 2,
          y: -3
        }, {
          x: 3,
          y: -4
        }, {
          x: 4,
          y: -5
        }, {
          x: 5,
          y: -6
        }
      ]
    }, {
      'local': true
    });
    tablemodel = Continuum.Collections['DataTable'].create({
      'data_source': data_source1.ref(),
      'columns': ['x', 'y']
    }, {
      'local': true
    });
    window.myrender = function() {
      var view;
      view = new tablemodel.default_view({
        'model': tablemodel
      });
      $('body').append(view.$el);
      window.view = view;
      return tablemodel.set('columns', ['x', 'y']);
    };
    return _.defer(window.myrender);
  });

}).call(this);
