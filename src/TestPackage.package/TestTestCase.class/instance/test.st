tests
test

	| subprocess1 |
	
	(subprocess1 := OSSUnixSubprocess new)
		shell: '/bin/bash'
		command: 'for ((n=1; n<=200; n++)) do sleep 5; echo "Did sleep (n: $n)"; ps -o pid,stat,time,comm --forest --pid $PPID --ppid $PPID; done';
		run.

	(1 to: 10000) do: [ :m |
		| subprocess2 |

		(subprocess2 := OSSUnixSubprocess new)
			command: 'curl';
			arguments: #('--silent' '--show-error' '--max-time' '1' '--include' 'http://localhost:8080/test');
			run.
		Stdio stdout nextPutAll: ('Did #run (m: {1}, pid: {2})' format: { m. subprocess2 pid }); lf; flush.
		subprocess2 waitForExit.
		Stdio stdout nextPutAll: ('Did #waitForExit (m: {1})' format: { m }); lf; flush.
		self assert: subprocess2 isSuccess ].

	subprocess1 terminate.
