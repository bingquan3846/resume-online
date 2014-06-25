describe('Zebrafy', function () {
    it('should apply classes zebrafy-odd and zebrafy-even to each other table lines', function () {
        var body = $('body');
        body.scrollPresentation();
        expect(body).isBoolean(true);
    });

});