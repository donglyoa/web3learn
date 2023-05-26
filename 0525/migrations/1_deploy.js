const Contracts = artifacts.require('StudentListStorage.sol')

module.exports = function (deployer) {
    deployer.deploy(Contracts)
}