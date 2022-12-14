import javascript

// WebAssembly.instantiateStreaming(..), new WebAssembly.Instance(..), etc
class WasmRelevantCreateCall extends InvokeExpr {
	WasmRelevantCreateCall() {
		this.(MethodCallExpr).getReceiver().toString() = "WebAssembly" and 
		this.(MethodCallExpr).getMethodName() in ["instantiateStreaming", "instantiate"]
		or 
		this.(NewExpr).getCallee().toString() in ["WebAssembly.Instance", "WebAssembly.Module"]
	}
}

// reassignment of Module.onRuntimeInitialized, etc
class WasmPropReassignment extends Assignment {
	WasmPropReassignment() {
		this.getLhs().(PropAccess).getBase().toString() = "Module" and  
		this.getLhs().(PropAccess).getPropertyName() in ["wasmBinary", "onRuntimeInitialized"]		
	}
}

class WasmUseExpr extends Expr {
	WasmUseExpr() {
		this instanceof WasmPropReassignment or
		this instanceof WasmRelevantCreateCall
	}
}

from WasmUseExpr waaaaaa
select waaaaaa, waaaaaa.getLocation()

