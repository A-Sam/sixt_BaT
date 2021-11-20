5. App Architecture(Simulation design)
   1. Create a demo on flutter android
      1. make sure you can deploy on the phone and on dev env(linux/mac)
      2. Make a helloworld app that prints hello world on main screen
      3. make tabs for each functionality -> handle signals and clicks on tabs -> save tab states
         1. Tab for navigation
         2. tab for user profile
         3. tab for booking management
      4. In Navigation tab, load google maps module into the app and have live update
         1. add an overlay object (robtaxi) and utilize setters and getters:
            1. g/set position(long/lat)
            2. g/set properties? -> precompiled?
            3. control robotaxi motion on map and assure realistic motion (no car on parks, flying or on the sea)
      5. In Profile tab, add metainfo about the user:
         1. Personal details (name,email, age(to identify as liable or non-liable user NOTE ), ... etc)
         2. ema



a) Backend(Server) -> Firebase
	i. Handles back end of signals/calls
b) Frontend(Webapp / Mobile app)
	i. Car tracking via app to user while waiting for the vehicle to arrive
	ii. Push notifications for updates in realtime
	iii. Vehicle types(size, )
	iv. Payment methods
c) Visualization of cars on map (hard) 

1. Vehicle requirements
a) Which vehicle fits best for serving a booking (car size based on demand)? 

7. Booking management system(Booking simulation included):
a) Give booking -> return vehicle (scheduling) 
b) Customer registration

8. Trust system(Bidirectional Customer <-> Sixt):
a) Build trust with Sixt
b) Feedback after trips
c) History of driver with Sixt
d) Possible problems during the trip:
	i. Slow navigation(to pickup location) of the car can lead to late arrival to appointments -> lowers trust (car delays)
	ii. Customer should "trust" the Sixt robotaxi service that it will come on time and get him/her to the destination on time
	iii. End of trip feedback to evaluate driver's satisfaction

9. Testing
a) Vehicle should come on time + defined tolerance(late arrival has penalty on Sixt -> refund to user)



4. Refueling:
a) vehicles to fuel station mapping
b) finding the closest fuel station to current robotaxi
c) tanks station data (simulation):

2. Map localization - fleet management
a) Localization of closest robotaxi (SIXT:Which vehicle fits best for serving a booking?) coordinates comunicated via Long,Lat -> refer to  gmaps API (TC0: clamped to the range [-90, 90]) (TC1: double precision handling)
b) something unique! (which Automated-car is nearer to the target/ which is full of charge or fuel/Parking space before 
c) reaching the customer and when reaching them/ the taxi can have the option of several stops or direct to target/ option to 
d) make the car go to a target wait then continue/ confirmation being on and off the car for the booking ) 
e) where does the car go after target location of passenger reached NOT just wait on a busy street


1. Safety requirements
a) car damage or theft.
b) missing stuff. (Push notification)
c) Events Confirmations
	i. 12+(non-liable users) -> supervisor needed -> no checkup/claims 		against them IFF(subscription based members = prime members = frequent riders) -> #trust related?
	ii. classical user (in/out of the car before car move.)