registration
register
	
	(WAAdmin register: self at: '/test')
		addFilter: WAExceptionFilter new;
		serverProtocol: 'http';
		serverHostname: nil;
		serverPort: 8080;
		exceptionHandler: WAErrorHandler
