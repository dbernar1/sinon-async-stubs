sinon = require 'sinon'

stubbedSinon = require 'sinon'

asyncStubs = require('../index')(stubbedSinon)

describe 'Async stubs', ->
	beforeEach ->
		@callsArgWithSpy = sinon.spy()
		sinon.stub( stubbedSinon, 'stub' ).returns
			callsArgWith: @callsArgWithSpy
	afterEach ->
		stubbedSinon.stub.restore()

	describe 'return', ->
		result =
			blue: 'red'

		it 'creates a stub that calls callback with no error and provided result', ->
			callbackPosition = 3
			asyncStubs.return result, callbackPosition

			sinon.assert.calledWith @callsArgWithSpy, callbackPosition, null, result

		it 'uses 0 as the default callback argument position', ->
			asyncStubs.return result

			sinon.assert.calledWith @callsArgWithSpy, 0, null, result

	describe 'error', ->
		error = 'error'

		it 'creates a stub that calls callback with provided error', ->
			callbackPosition = 2
			asyncStubs.error error, callbackPosition

			sinon.assert.calledWith @callsArgWithSpy, callbackPosition, error, null

		it 'uses 0 as the default callback argument position', ->
			asyncStubs.error error

			sinon.assert.calledWith @callsArgWithSpy, 0, error, null
