handling
handleFiltered: requestContext

	self requestContext respond: [ :response | 
		response
			contentType: WAMimeType textPlain;
			nextPutAll: 'Test' , String lf ].
