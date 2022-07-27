var app = require("../src/index");
var request = require('supertest');

describe('GET /', function() {
    it('responds 200 and Hello World!', function(done) {
        request(app).get('/')
            .expect(200)
            .expect('Hello World!')
            .end(done)
    })
})