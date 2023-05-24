const Contracts = artifacts.require('StudentStorage.sol')

module.exports = async (callback) => {
    // 实例化智能合约
    const studentStorage = await Contracts.deployed()

    await studentStorage.setData('kerwinliu', 100)

    const data = await studentStorage.getData()

    const name = await studentStorage.name()

    console.log(data, name)

    callback()
}