/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


import "content"
import "content/logic.js" as Logic


Page {
    id: page2
    property TextField page2input1: page2input1
    property TextField page2input2: page2input2

    Text {
        id: page2text1
        x: page2.width/20
        y: page2.height*(2/8)
        text: "K: "
        color: "white"
    }

    TextField {
        id: page2input1
        x: page2.width/20+page2text1.width
        y: page2.height*(2/8)
        width: page2.width*(2/3)
        color: "white"
        validator: RegExpValidator { regExp: /[0-9]+/ }
        text: Logic.getAppState().k
    }

    Text {
        id: page2text2
        x: page2.width/20
        y: page2.height*(4/8)
        text: "M: "
        color: "white"
    }

    TextField {
        id: page2input2
        x: page2.width/20+page2text2.width
        y: page2.height*(4/8)
        width: page2.width*(2/3)
        color: "white"
        validator: RegExpValidator { regExp: /[0-9]+/ }
        text: Logic.getAppState().m
    }

    Button {
        x: page2.width*(1/2) - width/2
        y: page2.height*(6/8)
        text: "Create"
        onClicked: localCreateBloomFilter()
    }

    function localCreateBloomFilter() {
       Logic.getAppState().k = page2.page2input1.text
       Logic.getAppState().m = page2.page2input2.text
       Logic.createBloomFilter()
       pageStack.pop()
    }

}





