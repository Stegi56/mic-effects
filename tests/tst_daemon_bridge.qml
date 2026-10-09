import QtQuick 2.15
import QtTest 1.3
import "../plugin" as Plugin

TestCase {
  name: "DaemonBridge"

  Component {
    id: bridgeComponent
    Plugin.DaemonBridge { bridgeActive: false }
  }

  function test_inactiveBridgeExposesServiceApiWithoutConnecting() {
    const bridge = createTemporaryObject(bridgeComponent, this)

    verify(bridge)
    compare(bridge.connected, false)
    verify(bridge.setMic !== undefined)
    verify(bridge.setSettings !== undefined)
    verify(bridge.setMeter !== undefined)
  }
}
