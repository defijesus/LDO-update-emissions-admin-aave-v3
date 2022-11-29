// SPDX-License-Identifier: MIT

/*
   _      ΞΞΞΞ      _
  /_;-.__ / _\  _.-;_\
     `-._`'`_/'`.-'
         `\   /`
          |  /
         /-.(
         \_._\
          \ \`;
           > |/
          / //
          |//
          \(\
           ``
     defijesus.eth
*/

pragma solidity ^0.8.0;

import {IEmissionManager} from '../interfaces/IEmissionManager.sol';
import {IProposalGenericExecutor} from '../interfaces/IProposalGenericExecutor.sol';

/**
 * @title ChangeLdoEmissionAdminPayload
 * @author Llama
 * @dev Setting new Emssion Admin for LDO token in Aave V3 Polygon Liquidity Pool
 * Governance Forum Post: https://governance.aave.com/t/arc-ldo-emission-admin-for-polygon-v3-liquidity-pool/10575
 * Snapshot: https://snapshot.org/#/aave.eth/proposal/0xf4a0e440e08d44f45aa691d038fd40cf3e3306247610c061e633ebd6eb63df04
 */
contract ChangeLdoEmissionAdminPayload is IProposalGenericExecutor {
  address public constant EMISSION_MANAGER = 0x048f2228D7Bf6776f99aB50cB1b1eaB4D1d4cA73;

  address public constant LDO = 0xC3C7d422809852031b44ab29EEC9F1EfF2A58756;

  address public constant NEW_EMISSION_ADMIN = 0x87D93d9B2C672bf9c9642d853a8682546a5012B5;

  function execute() public {
    IEmissionManager(EMISSION_MANAGER).setEmissionAdmin(LDO, NEW_EMISSION_ADMIN);
  }
}
