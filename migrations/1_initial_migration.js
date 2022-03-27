const CommunityMotions = artifacts.require("CommunityMotions");
const Motions = artifacts.require("Motions");

module.exports = function (deployer) {
  deployer.deploy(CommunityMotions, "Community Motion", "Community Motion", 1, "0x1d896e6354797947e1988a7d224fF16782fD88aE");
  deployer.deploy(Motions);
};
