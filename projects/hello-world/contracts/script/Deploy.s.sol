// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {SaysGM} from "../src/SaysGM.sol";

contract Deploy is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = uint256(0xaf2dcbaff01b3ccf783c873276731d560c040bbcc82a4872352038b231840968);
        vm.startBroadcast(deployerPrivateKey);

        // Log address
        address deployerAddress = vm.addr(deployerPrivateKey);
        console2.log("Loaded deployer: ", deployerAddress);

        address registry = 0x3B1554f346DFe5c482Bb4BA31b880c1C18412170;

        // Create consumer
        SaysGM saysGm = new SaysGM(registry);
        console2.log("Deployed SaysGM: ", address(saysGm));

        // Stop broadcasting
        vm.stopBroadcast();
    }
}
