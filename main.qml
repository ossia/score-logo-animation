import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.3

Window {
    id: window
    visible: true
    width: 1920
    height: 1080
    color: "#1F1F20"

    visibility: Window.FullScreen
    flags: Window.FramelessWindowHint

    Text
    {
        id: label
        text: "ossia score"
        color: "#03C3DD"
        anchors {
            left: image.right
            leftMargin: -20
            top: image.top
            topMargin: 100
        }
        font.family: "qrc://Montserrat-Regular.ttf"
        font.weight: Font.DemiBold
        font.pointSize: 90
        opacity: 0
    }
    Text
    {
        id: sublabel1
        text: "Open Source Sequencer"
        color: "#007AAD"
        anchors {
            top: label.bottom
            topMargin: 10
            left: label.left
            leftMargin: 10
        }
        font.family: "qrc://Catamaran-Regular.ttf"
        font.weight: Font.DemiBold
        font.pointSize: 30
        opacity: 0
    }
    Text
    {
        id: sublabel2
        text: "for the Interactive/Intermedia Arts"
        color: "#007AAD"
        anchors {
            top: sublabel1.bottom
            topMargin: 10
            left: label.left
            leftMargin: 10
        }
        font.family: "qrc://Catamaran-Regular.ttf"
        font.weight: Font.DemiBold
        font.pointSize: 30
        opacity: sublabel1.opacity
    }

    Image {
        id: image
        x: 922
        y: 241
        scale: 0
        opacity: 0

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 0
        fillMode: Image.PreserveAspectFit
        source: "ossia-score.png"
    }

    SequentialAnimation{
        id: animMovement
        PauseAnimation {
            duration: 1000
        }
        ParallelAnimation{
            NumberAnimation {
                target: image
                property: "scale"
                from: 0
                to: 0.7
                duration: 800
                easing.type: Easing.OutQuad
            }
            NumberAnimation {
                target: image
                property: "opacity"
                from: 0
                to: 1
                duration: 200
                easing.type: Easing.InOutExpo
            }

            SequentialAnimation{

                PauseAnimation {
                    duration: 600
                }

                ParallelAnimation{

                    NumberAnimation {
                        target: image
                        property: "rotation"
                        from: 0
                        to: 360 * 2
                        duration: 1000
                        easing.type: Easing.InOutCubic
                    }
                    NumberAnimation {
                        target: image
                        property: "anchors.horizontalCenterOffset"
                        from: 0
                        to: -500
                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }
                    SequentialAnimation{

                        PauseAnimation {
                            duration: 800
                        }
                        ParallelAnimation{
                            NumberAnimation {
                                target: label
                                property: "opacity"
                                from: 0
                                to: 1
                                duration: 500
                                easing.type: Easing.InOutQuad
                            }
                        }
                        NumberAnimation {
                            target: sublabel1
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 500
                            easing.type: Easing.InOutSine
                        }
                    }
                }
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: animMovement.start();
    }
}
