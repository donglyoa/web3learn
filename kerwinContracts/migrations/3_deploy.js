const Contracts = artifacts.require('./KerwinToken.sol')

module.exports = function (deployer) {
    deployer.deploy(Contracts)
}