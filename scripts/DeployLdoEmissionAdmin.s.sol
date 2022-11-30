// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'forge-std/console.sol';
import {Script} from 'forge-std/Script.sol';
import {ChangeLdoEmissionAdminPayload} from '../src/contracts/ChangeLdoEmissionAdminPayload.sol';

contract DeployLdoEmissionAdmin is Script {
  function run() external {
    vm.startBroadcast();
    ChangeLdoEmissionAdminPayload payload = new ChangeLdoEmissionAdminPayload();
    console.log('LDO Emission Admin Payload address', address(payload));
    vm.stopBroadcast();
  }
}