" A function to test the ':Pyclewn' command in a script.
function PyclewnScripting()
	" This function can be called while the previous netbeans session is
	" still open.
	if has("netbeans_enabled")
		echo "Error: netbeans is already connected."
		call input("Press the <Enter> key to continue.")
		return
	endif

	"let g:pyclewn_args="--gdb=async"
	let g:pyclewn_args="--pgm=/usr/local/gcc-arm-none-eabi-4_9-2015q1/bin/arm-none-eabi-gdb"
	Pyclewn gdb
    Cmapkeys
    Cfile _build/nrf51422_xxac_s110.out 
    "Cproject /home/zhouyu/projs/ns_sdk_10/projs/ble_peripheral/neo_smart/makefiles/s110/armgcc
    Ctarget remote localhost:2331
	"Cfile foobar
	"Cstart
endfunc
