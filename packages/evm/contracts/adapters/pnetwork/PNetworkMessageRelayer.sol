// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.17;

import { MessageRelay } from "../MessageRelay.sol";
import { PNetworkReporter } from "./PNetworkReporter.sol";

contract PNetworkMessageRelay is MessageRelay, PNetworkReporter {
    constructor(
        address yaho,
        uint64 adapterChain,
        address vault,
        address token,
        uint32 pNetworkAdapterChain
    ) MessageRelay(yaho, adapterChain) PNetworkReporter(vault, token, pNetworkAdapterChain) {} // solhint-disable no-empty-blocks

    function _sendPayload(bytes memory payload, address adapter) internal override {
        _pNetworkSend(payload, adapter);
    }
}
