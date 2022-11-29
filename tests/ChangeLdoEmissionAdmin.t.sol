// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from 'forge-std/Test.sol';
import {AaveV3Polygon} from 'aave-address-book/AaveV3Polygon.sol';

import {IEmissionManager} from '../src/interfaces/IEmissionManager.sol';
import {BaseTest} from './utils/BaseTest.sol';

import {ChangeLdoEmissionAdminPayload} from '../src/contracts/ChangeLdoEmissionAdminPayload.sol';

contract ChangeLdoEmissionAdminTest is BaseTest {
  ChangeLdoEmissionAdminPayload public payload;
  address constant GUARDIAN = 0xE50c8C619d05ff98b22Adf991F17602C774F785c;
  IEmissionManager constant EMISSION_MANAGER =
    IEmissionManager(0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73);

  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('polygon'), 35462470);
    payload = new ChangeLdoEmissionAdminPayload();
    _setUp(AaveV3Polygon.ACL_ADMIN);
    _execute(address(payload));
  }

  function testActivation() public {
    assertEq(EMISSION_MANAGER.getEmissionAdmin(payload.LDO()), payload.NEW_EMISSION_ADMIN());
    emit log_named_address('new emission admin for LDO rewards',EMISSION_MANAGER.getEmissionAdmin(payload.LDO()));
    /// verify admin can make changes
    vm.startPrank(payload.NEW_EMISSION_ADMIN());
    EMISSION_MANAGER.setDistributionEnd(payload.LDO(), payload.LDO(), 0);
    vm.stopPrank();
  }

  function _toUint88(uint256 value) internal pure returns (uint88) {
    require(value <= type(uint88).max, "SafeCast: value doesn't fit in 88 bits");
    return uint88(value);
  }
}
