// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import { BaseScript } from "./BaseScript.sol";
import { Vault } from "v4-core/Vault.sol";

/**
 * forge script script/01_DeployVault.s.sol:DeployVaultScript -vvv \
 *     --rpc-url $RPC_URL \
 *     --broadcast \
 *     --slow \
 *     --verify
 */
contract DeployVaultScript is BaseScript {
  function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);

    Vault vault = new Vault();
    console.log("Vault contract deployed at ", address(vault));

    address vault = getAddressFromConfig("vault");
    console.log("vault address: ", address(vault));

    CLPoolManager clPoolManager = new CLPoolManager(IVault(address(vault)), 500000);
    console.log("CLPoolManager contract deployed at ", address(clPoolManager));

    console.log("Registering CLPoolManager");
    IVault(address(vault)).registerApp(address(clPoolManager));

    vm.stopBroadcast();
  }
}
