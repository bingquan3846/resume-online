/*global jasmine, describe, it, $, expect*/

'use strict';

var fixtures  = jasmine.getFixtures();

// given relative path test/fixtures/ to karma


describe('<Unit Test>', function () {
    describe('Example', function () {
        it('should add `success` class', function () {
            $('body').append("<div class='example'> </div>");
            var $example = $('.example');
            $example.defaultPluginName();
            expect($example.hasClass('success')).toBe(true);
        });
    });
});