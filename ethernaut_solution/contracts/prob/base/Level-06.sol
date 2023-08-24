// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import 'openzeppelin-contracts-06/access/Ownable.sol';

abstract contract Level is Ownable {
  event GetInstanceAddress(address indexed instance_address);

  function createInstance(address _player) virtual public payable returns (address);
  function validateInstance(address payable _instance, address _player) virtual public returns (bool);
}
