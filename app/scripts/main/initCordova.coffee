'use scrict';

CordovaInit = ()->
	
	onDeviceReady = ()->
		receivedEvent('deviceready');


	receivedEvent= (event)->
		#console.log('Start event received, booststrapping application setup.');
		angular.bootstrap($('html'), ['WissenSystem']);


	this.bindEvents = ()->
		document.addEventListener('deviceready', onDeviceReady, false);


	#If cordova is present, wait for it to initialize, otherwise just try to 
	#booststrap the application
	if (window.cordova != undefined)
		console.log('Cordova found, wating for device.');
		this.bindEvents();	
	else
	#console.log('cordovanot found, booting application')
	receivedEvent('manual')



$(()->
	new CordovaInit()
)