# Pyth-integration

> **_NOTE:_** The project is a WIP.

An implementation of a [Pyth Network](https://pyth.network/) oracle contract in Sway. Utilising minimal, internal [Wormhole](https://docs.wormhole.com/wormhole/) functionality and state.

## Interfaces

The project provides four interfaces for interaction with the oracle contract:

- [PythCore](./pyth-interface/src/interface.sw#L20) - provides the core functionality to required to utilise the oracle; getting fees, updating prices and fetching prices.
- [PythInit](./pyth-interface/src/interface.sw#L250) - provides the functionality to setup the oracle's state.
- [PythInfo](./pyth-interface/src/interface.sw#L255) - provides additional information about the oracle's state.
- [WormholeGuardians](./pyth-interface/src/interface.sw#L283) - provides functionality to maintain and query the wormhole-state-elements used by the oracle.

## Running the project

### Project

Run the following commands from the root of the repository.

#### Program compilation

```bash
forc build
```

#### Running the tests

Before running the tests the programs must be compiled with the command above.

```bash
cargo test
```

#### Before deploying

Before deploying the oracle contract; the `deployer` must be set to the address of the deploying wallet in the storage block, so that the deployer can setup the contract with the `constructor()` method.

Parameters for the `constructor()` method can be seen in the [tests of the method](./pyth-contract/tests/functions/pyth_init/constuctor.rs#L28), which at the time of writing uses the real up-to-date values as per Pyth's documentation and EVM integrations. Care should be taken to ensure that the most up-to-date values are used for the `constructor()` method's parameters.

#### Fuel Beta-5 network deployment:
The Pyth oracle contract has been deployed to Beta-5 at the `ContractId`: 0x3cd5005f23321c8ae0ccfa98fb07d9a5ff325c483f21d2d9540d6897007600c9.
