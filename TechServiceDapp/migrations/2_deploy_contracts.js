// migrations/2_deploy_contracts.js
const TechServiceContract = artifacts.require("TechServiceContract");

module.exports = function (deployer) {
  deployer.deploy(TechServiceContract);
};
