postload actions
postLoad

	ZnZincServerAdaptor startOn: 8080.
	TestRequestHandler register.

	OSSVMProcess compile: ((OSSVMProcess sourceCodeAt: #checkFinishedChildren)
		copyReplaceAll: 'checkFinishedChildren' with: 'basicCheckFinishedChildren').
	OSSVMProcess compile: 'checkFinishedChildren
		Stdio stdout nextPutAll: ''Will #checkFinishedChildren''; lf; flush.
		self basicCheckFinishedChildren.
		Stdio stdout nextPutAll: ''Did #checkFinishedChildren''; lf; flush.'.
