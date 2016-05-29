$ ->
  if $('#publisher').length
    # Initialize an OpenTok Session object
    session = TB.initSession(gon.opentok.sessionId);

    videoOptions = {width: 640, height: 480}
  
    # Initialize a Publisher, and place it into the element with id="publisher"
    publisher = TB.initPublisher(gon.opentok.apiKey, 'publisher', videoOptions);
  
  
    # Attach event handlers
    session.on
      # This function runs when session.connect() asynchronously completes
      sessionConnected: (event) ->
        # Publish the publisher we initialzed earlier (this will trigger 'streamCreated' on other clients)
        if session.capabilities.publish == 1
          session.publish(publisher)
        else
          return
  
    # Connect to the Session using the 'apiKey' of the application and a 'token' for permission
    session.connect(gon.opentok.apiKey, gon.opentok.token);
