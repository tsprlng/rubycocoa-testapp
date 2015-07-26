#!/usr/bin/ruby

require 'osx/cocoa'
include OSX

AppName = 'TestApp'

class AppDelegate < NSObject
  def post_init
    @window = NSWindow.alloc.initWithContentRect_styleMask_backing_defer(NSMakeRect(0, 0, 200, 200), NSTitledWindowMask, NSBackingStoreBuffered, false)
    @window.cascadeTopLeftFromPoint NSMakePoint(20,20)
    @window.setTitle AppName
    self
  end

  def applicationWillFinishLaunching(notification)
    @window.makeKeyAndOrderFront(self)
  end

  # def applicationDidFinishLaunching(notification)
  #   notification.object.activateIgnoringOtherApps true
  #     # needed to force activation only if running from outside an .app bundle
  #     # can't be done earlier than launch did finish, as menu won't be ready
  # end
end

if $0 == __FILE__
  NSApplication.sharedApplication
  NSApp.setActivationPolicy NSApplicationActivationPolicyRegular

  menubar = NSMenu.new
  appMenuItem = NSMenuItem.new  # Title comes from Info.plist in finished .app bundle, or is 'ruby' if script is run by itself
  menubar.addItem appMenuItem
  NSApp.setMainMenu menubar

  appMenu = NSMenu.new
  quitMenuItem = NSMenuItem.alloc.initWithTitle_action_keyEquivalent("Quit #{AppName}", 'terminate:', 'q')
  appMenu.addItem quitMenuItem
  appMenuItem.setSubmenu appMenu

  NSApp.setDelegate(AppDelegate.alloc.init.post_init)
  NSApp.run
end
