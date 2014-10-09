.pragma library
.import QtQuick 2.0 as QQ

var appState;

function getAppState() { return appState; }


function newAppState(page)
{
    appState = page;
    getAppState().k=1;
    getAppState().m=2;

    return appState;
}

// Funciones especificas

function createBloomFilter() {
    appState.bloomfilters.filterCharged = true;
    console.log("Voy a ejecutar donde da fallo")
    console.log("getAppState().k: "+parseInt(getAppState().k))
    console.log("getAppState().m: "+parseInt(getAppState().k))
    getAppState.bloomfilters.k = "2"
    console.log("Voy a llamar a generate filter")
//    appState.bloomfilters.generateFilter()
}

function deleteBloomFilter() {
    getAppState().k=1;
    getAppState().m=2;
    appState.bloomfilters.filterCharged = false
}
