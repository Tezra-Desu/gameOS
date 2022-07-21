// gameOS theme
// Copyright (C) 2018-2020 Seth Powell 
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.

import QtQuick 2.0
import QtQuick.Layouts 1.11
import "qrc:/qmlutils" as PegasusUtils
import "../utils.js" as Utils

Item {
id: infocontainer

    property var gameData: currentGame

    // Game title
    Text {
    id: gametitle
        
        text: gameData ? gameData.title : ""
        
        anchors {
            top:    parent.top;
            left:   parent.left;
            right:  parent.right
        }
        
        color: theme.text
        font.family: titleFont.name
        font.pixelSize: vpx(28)
        font.bold: true
        horizontalAlignment: Text.AlignHLeft
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // Meta data
    Item {
    id: metarow

        height: vpx(50)
        anchors {
            top: gametitle.bottom; 
            left: parent.left
            right: parent.right
        }

        // Release Date box
        Text {
        id: releasetitle

            width: contentWidth
            height: parent.height
            anchors { left: parent.left; }
            verticalAlignment: Text.AlignVCenter
            text: "Released: "
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            font.bold: true
            color: theme.accent  
        }

        Text {
        id: releasetext

            width: contentWidth
            height: parent.height
            anchors { left: releasetitle.right; leftMargin: vpx(5) }
            verticalAlignment: Text.AlignVCenter
            text: currentGame.releaseYear
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            color: theme.text
        }

        Rectangle {
        id: divider1
            width: vpx(2)
            anchors {
                left: releasetext.right; leftMargin: (20)
                top: parent.top; topMargin: vpx(10)
                bottom: parent.bottom; bottomMargin: vpx(10)
            }
            opacity: 0.2
        }

        // Developer Box
        Text {
        id: devtitle

            width: contentWidth
            height: parent.height
            anchors { left: divider1.right; leftMargin: vpx(20) }
            verticalAlignment: Text.AlignVCenter
            text: "Developer: "
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            font.bold: true
            color: theme.accent
        }

        Text {
        id: devtext

            width: contentWidth
            height: parent.height
            anchors { left: devtitle.right; leftMargin: vpx(5) }
            verticalAlignment: Text.AlignVCenter
            text: gameData ? gameData.developer : ""
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            color: theme.text
        }

        Rectangle {
        id: divider2
            width: vpx(2)
            anchors {
                left: devtext.right; leftMargin: (20)
                top: parent.top; topMargin: vpx(10)
                bottom: parent.bottom; bottomMargin: vpx(10)
            }
            opacity: 0.2
        }

        // Publisher Box
        Text {
        id: pubtitle

            width: contentWidth
            height: parent.height
            anchors { left: divider2.right; leftMargin: vpx(20) }
            verticalAlignment: Text.AlignVCenter
            text: "Publisher: "
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            font.bold: true
            color: theme.accent
        }

        Text {
        id: pubtext

            width: contentWidth
            height: parent.height
            anchors { left: pubtitle.right; leftMargin: vpx(5) }
            verticalAlignment: Text.AlignVCenter
            text: gameData ? gameData.publisher : ""
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            color: theme.text
        }

        Rectangle {
        id: divider3
            width: vpx(2)
            anchors {
                left: pubtext.right; leftMargin: (20)
                top: parent.top; topMargin: vpx(10)
                bottom: parent.bottom; bottomMargin: vpx(10)
            }
            opacity: 0.2
        }

        // Playtime box
        Text {
        id: playtimetitle

            width: contentWidth
            height: parent.height
            anchors { left: divider3.right; leftMargin: vpx(20) }
            verticalAlignment: Text.AlignVCenter
            text: "Playtime: "
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            font.bold: true
            color: theme.accent
        }

        Text {
        id: playtimetext

            anchors { 
                left: playtimetitle.right; leftMargin: vpx(5)
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            verticalAlignment: Text.AlignVCenter
            text: Utils.formatPlayTime(gameData.playTime)
            font.pixelSize: vpx(16)
            font.family: subtitleFont.name
            elide: Text.ElideRight
            color: theme.text
            wrapMode: Text.WordWrap
            visible: (gameData.playTime > 0)
        }
    }
 
    // Description
    PegasusUtils.AutoScroll
    {
    id: gameDescription
    
        anchors {
            left: parent.left; 
            right: parent.right;
            top: metarow.bottom
            bottom: parent.bottom;
        }

        Text {
            width: parent.width
            text: gameData && (gameData.summary || gameData.description) ? gameData.description || gameData.summary : "No description available"
            font.pixelSize: vpx(16)
            font.family: bodyFont.name
            color: theme.textgreylight
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
        }
    }
    
}
