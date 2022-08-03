baselines
baseline: spec 

	<baseline>

	spec
		baseline: 'Seaside30' with: [
			spec
				className: 'BaselineOfSeaside3';
				loads: #('Core' 'Zinc');
				repository: 'github://SeasideSt/Seaside:master/repository' ];
		baseline: 'OSSubprocess' with: [
			 spec
				className: 'BaselineOfOSSubprocess';
				loads: 'OSSubprocess';
				repository: 'github://pharo-contributions/OSSubprocess:master/repository' ];
		package: 'TestPackage' with: [
			spec requires: #('Seaside30' 'OSSubprocess') ];
		postLoadDoIt: #postLoad.
