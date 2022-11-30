# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update:; forge update

# Build & test
build  :; forge build --sizes
test   :; forge test -vvv

deploy-payload :; forge script scripts/DeployLdoEmissionAdmin.s.sol:DeployLdoEmissionAdmin --rpc-url ${RPC_POLYGON} --broadcast --ledger --sender ${LEDGER_SENDER} --verify --chain 137 --etherscan-api-key ${POLYGONSCAN_API_KEY} -vvvv

verify-payload :; forge verify-contract --chain-id 137 --watch 0xF08e4772754b59A036a520e24e2af2095f5CAFbb ./src/contracts/ChangeLdoEmissionAdminPayload.sol:ChangeLdoEmissionAdminPayload ${POLYGONSCAN_API_KEY}

submit-proposal :; forge script scripts/DeployL1PolygonProposal.s.sol:DeployLdo --rpc-url ${RPC_ETHEREUM} --broadcast --private-key ${PRIVATE_KEY} -vvvv