(function() {

  // Import wasm stuff
  import * as wasm from 'something-wasm';
  
  const importObject = { imports: { imported_func: (arg) => console.log(arg) } };
  
  // wasm loaded asynchronously as a js file
  Module.onRuntimeInitialized = function() {
    // doSomeStuff();
  }

  // wasm loaded synchronously
  var wasmXHR = new XMLHttpRequest();
  wasmXHR.open('GET', wasmURL, true);
  wasmXHR.responseType = 'arraybuffer';
  wasmXHR.onload = function () {
      Module.wasmBinary = wasmXHR.response;
  }

  // Instantiating from a wasm
  WebAssembly.instantiate(bytes, importObject)
    .then(result => {
      // doMoreStuff();
    });
  
  // Instantiate from a wasm stream

  WebAssembly.instantiateStreaming(fetch("simple.wasm"), importObject).then((obj) => 
    // doOtherStuff();
  );
  
  // webassemblyModule
  const module = new WebAssembly.Module(new Uint8Array([]));
  
  // webassembly instance
  const instance = new WebAssembly.Instance(module);

}());
