class AppDelegate

  def applicationDidFinishLaunching(notification)

    start_leap

  end

  def start_leap

    @controller = LeapController.alloc.init
    @controller.policyFlags = LEAP_POLICY_BACKGROUND_FRAMES   # continue tracking while in background
    @controller.addListener(self)

  end

  def onFrame(notification)

    leap_controller = notification.object

    frame = leap_controller.frame(0)
    # puts frame.id
    # puts frame.timestamp

    frame.hands.each do |hand|
    end

    frame.fingers.each do |finger|
      puts "Finger #{finger.type}: #{finger.tipPosition.x}, #{finger.tipPosition.y}, #{finger.tipPosition.z}"
    end

    frame.tools.each do |tool|
      puts "Tool: #{tool.tipPosition.x}, #{tool.tipPosition.y}, #{tool.tipPosition.z}"
    end

  end

end
