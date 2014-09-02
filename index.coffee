module.exports = (
	sinon=require('sinon')
) ->
	return: ( result, callbackPosition=0 ) ->
		sinon.stub().callsArgWith callbackPosition, null, result
	error: ( error, callbackPosition=0 ) ->
		sinon.stub().callsArgWith callbackPosition, error, null
