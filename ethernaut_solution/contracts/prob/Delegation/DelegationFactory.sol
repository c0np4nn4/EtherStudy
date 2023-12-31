// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../base/Level.sol";
import "../utils/Log.sol";
import "./Delegation.sol";

import "hardhat/console.sol";

contract DelegationFactory is Level, Log {
    address delegateAddress;

    constructor() {
        console.log("++++ `DelegationFactory` has been deployed");

        Delegate newDelegate = new Delegate(address(0));

        delegateAddress = address(newDelegate);
    }

    function createInstance(address _player)
        public
        payable
        override
        returns (address)
    {
        console.log("++++ createInstace() has been called");

        _player;

        Delegation parity = new Delegation(delegateAddress);

        emit GetInstanceAddress(address(parity));

        return address(parity);
    }

    function validateInstance(address payable _instance, address _player)
        public
        view
        override
        returns (bool)
    {
        Delegation parity = Delegation(_instance);
        return parity.owner() == _player;
    }
}
