$ ->
  if $('#stream').length
    # Initialize an OpenTok Session object
    session = TB.initSession(gon.opentok.sessionId);

    videoOptions = {width: 640, height: 480}

    # Attach event handlers
    session.on
      streamCreated: (event)->
        # Subscribe to the stream that caused this event, put it inside the container we just made
        session.subscribe(event.stream, $('#stream')[0], videoOptions);

    # Connect to the Session using the 'apiKey' of the application and a 'token' for permission
    session.connect(gon.opentok.apiKey, gon.opentok.token);
