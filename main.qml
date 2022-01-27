import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Window 2.3

Item {
    id: window
    //visible: true
    width: 3840
    height: 2160
    //color: "#1F1F20"
    readonly property real time_ratio: 1
    readonly property string pwd: "file:///home/jcelerier/ossia/score-logo-animation"
    readonly property string ppwd: "/home/jcelerier/ossia/score-logo-animation"


    //flags: Qt.ToolTip  | Qt.FramelessWindowHint  | Qt.WA_TranslucentBackground

    //flags: Qt.FramelessWindowHint  | Qt.WA_TranslucentBackground
    //color: "#00000000"

    // visibility: Window.FullScreen
    // flags: Window.FramelessWindowHint

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
        font.family: "Montserrat-Regular.ttf"
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
        font.family: "Catamaran-Regular.ttf"
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
        font.family: "Catamaran-Regular.ttf"
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
                duration: time_ratio *  800
                easing.type: Easing.OutQuad
            }
            NumberAnimation {
                target: image
                property: "opacity"
                from: 0
                to: 1
                duration: time_ratio *  200
                easing.type: Easing.InOutExpo
            }

            SequentialAnimation{

                PauseAnimation {
                    duration: time_ratio *  600
                }

                ParallelAnimation{

                    NumberAnimation {
                        target: image
                        property: "rotation"
                        from: 0
                        to: 360 * 2
                        duration: time_ratio *  1000
                        easing.type: Easing.InOutCubic
                    }
                    NumberAnimation {
                        target: image
                        property: "anchors.horizontalCenterOffset"
                        from: 0
                        to: -500
                        duration: time_ratio *  1000
                        easing.type: Easing.InOutQuint
                    }
                    SequentialAnimation{

                        PauseAnimation {
                            duration: time_ratio *  800
                        }
                        ParallelAnimation{
                            NumberAnimation {
                                target: label
                                property: "opacity"
                                from: 0
                                to: 1
                                duration: time_ratio *  500
                                easing.type: Easing.InOutQuad
                            }
                        }
                        NumberAnimation {
                            target: sublabel1
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: time_ratio *  500
                            easing.type: Easing.InOutSine
                        }
                    }
                }
            }
        }
    }

    // MouseArea{
    //     anchors.fill: parent
// 
    //     cursorShape: Qt.BlankCursor
    //     onClicked: animMovement.start();
    // }

    Component.onCompleted: animMovement.start();
}
