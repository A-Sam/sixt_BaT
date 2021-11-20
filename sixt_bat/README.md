# sixt_bat

A new Flutter project.

1. App Architecture(Simulation design)
   1. [x] Create a demo on flutter android
   2. [x] make sure you can deploy on the phone and on dev env(linux/mac)
   3. [x] Make a helloworld app that prints hello world on main screen
   4. [ ] make tabs for each functionality -> handle signals and clicks on tabs #flutter -> save tab states
      1. [ ] Tab for navigation #high
         1. [ ] In Navigation tab, load google maps module into the app and visualize and have live update about the care location #navigation #frontend
         2. [ ] Car tracking via app to user while waiting for the vehicle to arrive #high
            1. [ ] Add an overlay object (robtaxi) and utilize setters and getters:
               1. [ ] g/set position(long/lat)
               2. [ ] g/set properties? -> precompiled?
               3. [ ] control robotaxi motion on map and assure realistic motion (no car on parks, flying or on the sea)
         3. [ ] Push notifications for updates in realtime #high
      2. [ ] Tab for user profile (Personal Profile System - PPS)
         1. [ ] Personal details (name,email, age(to identify as liable or non-liable user ), ... etc)
         2. [ ] Customer registration
         3. [ ] Trust system(Bidirectional Customer <-> Sixt):
            1. [ ] Build trust with Sixt
            2. [ ] Feedback after trips
            3. [ ] History of driver with Sixt
            4. [ ] Possible problems during the trip
            5. [ ] Slow navigation(to pickup location) of the car can lead to late arrival to appointments -> lowers trust (car delays)
            6. [ ] Customer should "trust" the Sixt robotaxi service that it will come on time and get him/her to the destination on time
            7. [ ] End of trip feedback to evaluate driver's satisfaction
      3. [ ] Tab for booking management (Booking Management system - BMS)
         1. How user going to place orders/bookings?
            1. Identify in the order:
               1. Car according to: #high
                  1. Type
                  2. Capacity
                  3. Distance from nearest pickup
               2. Payment method #low
         2. Which vehicle fits best for serving a booking (car size based on demand)?
         3. Queuing system of the booking orders
         4. spawn vehicles commands from the server
         5. move the vehicles and track/monitor on the app for the user #trust #frontend #backend
         6. Give booking -> return vehicle (scheduling)
         7. Vehicle should come on time + defined tolerance(late arrival has penalty on Sixt -> refund to user)
      4. [ ] Fleet Management System (FMS)
         1. [ ] Refueling:
            1. [ ] vehicles to fuel station mapping
            2. [ ] finding the closest fuel station to current robotaxi
            3. [ ] tanks station data (simulation):
               1. [ ] something unique! (which Automated-car is nearer to the target/ which is full of charge or fuel/Parking space before
   5. Unit Tests
      1. signals/calls events diagram -> sequence diagram #med

---


c) reaching the customer and when reaching them/ the taxi can have the option of several stops or direct to target/ option to

d) make the car go to a target wait then continue/ confirmation being on and off the car for the booking )

e) where does the car go after target location of passenger reached NOT just wait on a busy street

1. Safety requirements
   1. car damage or theft.
   2. missing stuff. (Push notification)
   3. Events Confirmations
      1. 12+(non-liable users) -> supervisor needed -> no checkup/claims against them IFF(subscription based members = prime members = frequent riders) -> #trust #todo
      2. classical user (in/out of the car before car move.)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
