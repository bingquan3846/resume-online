describe('scroll presentation', function () {
    it('append items then fetch them', function () {
        var body = $('body');
        body.append("<ul id='target'><li data-href='hello'>hello</li></ul>");
        //alert(body.html());
        expect(body).toExist();
    });

});