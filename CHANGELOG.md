# Changelog

## [1.9.0](https://github.com/PeterMosmans/tools-image/compare/1.8.0...1.9.0) (2025-06-18)


### Features

* add shcheck.py to tools ([3000428](https://github.com/PeterMosmans/tools-image/-/commit/3000428acd137614625734428f6412edced873bd))
* add test for testssl.sh ([8c77c95](https://github.com/PeterMosmans/tools-image/-/commit/8c77c950de46ceee2152a4572bb6956d9c821c98))
* add tests ([502b024](https://github.com/PeterMosmans/tools-image/-/commit/502b02404c09cd66de4ccdad02f060b687ef9949))
* add Trivy ([33ce6f9](https://github.com/PeterMosmans/tools-image/-/commit/33ce6f9bc193c8ff165f84adb4029780e7945273))
* improve automated security tests ([ba8527e](https://github.com/PeterMosmans/tools-image/-/commit/ba8527ede3f4ffc21139a7e2be9341a53b289d8c))
* read Grype configuration file ([55ab206](https://github.com/PeterMosmans/tools-image/-/commit/55ab206094dade26c7a5dee76d570dc3c51f0605))
* remove check for outdated libraries from test ([8e1dee3](https://github.com/PeterMosmans/tools-image/-/commit/8e1dee30d50121ec8bb7b78f17c4b0ce7356097b))
* remove versions out of harness ([10b1680](https://github.com/PeterMosmans/tools-image/-/commit/10b16805bd8239c5b686edd89a0175191d596098))
* supply Grype configuration file ([8536afb](https://github.com/PeterMosmans/tools-image/-/commit/8536afbc0275a8db1e03ee23053edbd6e8b2ffaa))
* suppress false positive with regards to ssh-audit ([3cc7bd4](https://github.com/PeterMosmans/tools-image/-/commit/3cc7bd4930608b59f2907971289c1869dab23d93))
* update Node.js version ([848b404](https://github.com/PeterMosmans/tools-image/-/commit/848b4044ee2cf911281a28f8ff7e756b8b693b10))
* update versions ([443976e](https://github.com/PeterMosmans/tools-image/-/commit/443976e1d6a3395f1edea6352f986bf46338334c))
* use shared cache directory ([0d36431](https://github.com/PeterMosmans/tools-image/-/commit/0d36431eb57373a88e06d872fe2b25f9efe674a1))


### Bug Fixes

* automatically install jwt_tool requirements ([3ce9fd7](https://github.com/PeterMosmans/tools-image/-/commit/3ce9fd78d2a2e08b674bee69d7725a488e9f2745))
* don't be too verbose during building ([00cf9c0](https://github.com/PeterMosmans/tools-image/-/commit/00cf9c050909399a18173f823e0199c761bdaa50))
* don't try to upload unexisting files to SonarQube ([353618d](https://github.com/PeterMosmans/tools-image/-/commit/353618dd83c42b6fa1310bf04e3edfd497fd0cbc))
* use new cyclonedx-py syntax ([6a02fb2](https://github.com/PeterMosmans/tools-image/-/commit/6a02fb2ffc0b86f67c0e6265387ca3babf2aaec5))

## [1.8.0](https://github.com/PeterMosmans/tools-image/compare/1.7.0...1.8.0) (2024-01-23)


### Features

* add and use Grype HTML template ([bbcee76](https://github.com/PeterMosmans/tools-image/-/commit/bbcee76378843020181960b7b65bd37314aa2bfb))
* add gitignore file ([ad73838](https://github.com/PeterMosmans/tools-image/-/commit/ad738382f7e3365e31eb2ae8389e1bb36d55e0d9))
* add Grype ([e32f01d](https://github.com/PeterMosmans/tools-image/-/commit/e32f01d078c6016fef01494ef5b53e72bb9ac2db))
* add ssh-audit ([fe8018e](https://github.com/PeterMosmans/tools-image/-/commit/fe8018e0034aa3aceeb904e9c2aa4e6c18df5898))
* create an SBOM during the Docker build process ([106584b](https://github.com/PeterMosmans/tools-image/-/commit/106584b8255b6090f71593c80849b151418c1e85))
* create multiple reports with Grype ([9624c27](https://github.com/PeterMosmans/tools-image/-/commit/9624c272b18f073e5bfe2427fd01b75ce2b7f96d))
* do a shallow fetch for Dependency-Check configuration file ([99bae94](https://github.com/PeterMosmans/tools-image/-/commit/99bae9431d91f8ac79f2e602146fb8112456ebb5))
* ensure that Hadolint can read a settings file ([8c2f4eb](https://github.com/PeterMosmans/tools-image/-/commit/8c2f4eb14e4df11b3cc099ea45cb5a55d36cd385))
* execute Dockle in directory with configuration file ([a90d993](https://github.com/PeterMosmans/tools-image/-/commit/a90d9939fff403f15d68488a6e9a4ae02457ab61))
* improve and upgrade automated security tests ([3b8c293](https://github.com/PeterMosmans/tools-image/-/commit/3b8c293d06b94a24a6e4ebdeb04b18c3ff2794af))
* improve Docker build process ([229dc12](https://github.com/PeterMosmans/tools-image/-/commit/229dc12125da27183b8de2ba56110c9f33113394))
* make SonarQube dependent on hadolint and grype ([4eaf6da](https://github.com/PeterMosmans/tools-image/-/commit/4eaf6da961884e77d33905aec41197893583c192))
* pin and parameterize jwt_tool ([e7409eb](https://github.com/PeterMosmans/tools-image/-/commit/e7409ebf395751f180a1bdc3a48b47a254e604a8))
* pin and parameterize Nikto ([c6c8af0](https://github.com/PeterMosmans/tools-image/-/commit/c6c8af0711f40311eed04ac8192449ee8d90523f))
* pin and parameterize testssl.sh ([effea30](https://github.com/PeterMosmans/tools-image/-/commit/effea30305ec2735b96dfd3b27985d174230fdda))
* pin versions ([186b92b](https://github.com/PeterMosmans/tools-image/-/commit/186b92b4f014e9e796952cd5c88aac7b363e3701))
* remove anchore-cli and black ([92865c7](https://github.com/PeterMosmans/tools-image/-/commit/92865c73f56ff1a4dba743768c1c3a98ba21334c))
* remove truffleHog as its Python library is very outdated ([78ee471](https://github.com/PeterMosmans/tools-image/-/commit/78ee471244352ef11ba2757780f07a7f8d765b02))
* remove unused vars as all tools now use configuration files ([43afaad](https://github.com/PeterMosmans/tools-image/-/commit/43afaad5b573d11359b16a5893ed29b2c0e03445))
* update Debian of Docker base image ([a72d3c5](https://github.com/PeterMosmans/tools-image/-/commit/a72d3c599ab9701d882fa233694d133c6dfe2e7f))
* update Sonarscanner CLI ([f13e614](https://github.com/PeterMosmans/tools-image/-/commit/f13e614036258d9877b6a532e73175b0168414ca))
* upload Grype and Hadolint reports with SonarQube ([533322b](https://github.com/PeterMosmans/tools-image/-/commit/533322be585d6b5688b700a0cfb9e32082e8fc76))
* use vars for automated security testing configuration files ([a4ee529](https://github.com/PeterMosmans/tools-image/-/commit/a4ee529eb529a5ae2ac44334cbce0b3323dda93b))


### Bug Fixes

* clean up correct jwt_tool directory ([3d01208](https://github.com/PeterMosmans/tools-image/-/commit/3d01208470bbe2607019e216c87728a20dae6740))
* ensure CHANGELOG links work ([f150ee1](https://github.com/PeterMosmans/tools-image/-/commit/f150ee1eac749e8176d248a55920af29fe9fbb69))
* ensure cyclonedx remains installed ([6c9475b](https://github.com/PeterMosmans/tools-image/-/commit/6c9475bb9281737e94dfdd3894242a033a15d142))
* use correct name for job ([df4062d](https://github.com/PeterMosmans/tools-image/-/commit/df4062d15732bb519bafbe77bd12f763244bc5fd))

## [1.7.0](https://github.com/PeterMosmans/tools-image/compare/1.6.0...1.7.0) (2023-01-23)

### Features

- add jwt_tool 986d6a6
- push latest tag on any build d0c14f3
- refactor test stage 40f67e7

## [1.6.0](https://github.com/PeterMosmans/tools-image/compare/1.5.0...1.6.0) (2022-07-21)

### Features

- add several new automated security scans
  ([990d9a6](https://github.com/PeterMosmans/tools-image/commit/990d9a63212b95b2a636687c772bad93affcd430))

## [1.5.0](https://github.com/PeterMosmans/tools-image/compare/1.4.0...1.5.0) (2022-06-16)

### Features

- add nmap to image
  ([d1abbcb](https://github.com/PeterMosmans/tools-image/commit/d1abbcb070ad2a83545e190cc39056e93e5ace0e))
- parameterize sonar-scanner-cli version
  ([d55a9ad](https://github.com/PeterMosmans/tools-image/commit/d55a9ade64a477a8392ad159fcbf1ad0420c654d))
- use newer npm syntax
  ([06b4ad4](https://github.com/PeterMosmans/tools-image/commit/06b4ad49e79aaab23f58073b3b6643e7e5ba2f8f))

### Bug Fixes

- set workdir earlier to prevent NodeJS build issues
  ([e30fb74](https://github.com/PeterMosmans/tools-image/commit/e30fb743bcc6ee65c773cd28e2d67a4fd5cca619))

## [1.4.0](https://github.com/PeterMosmans/tools-image/compare/1.3.0...1.4.0) (2022-04-19)

### Features

- add black and pylint
  ([988fb2d](https://github.com/PeterMosmans/tools-image/commit/988fb2d6d54081c5bc440cfa2d490f04d220b2fb))
- add test for yamllint
  ([897330b](https://github.com/PeterMosmans/tools-image/commit/897330ba3885276eb2d5808f204400e534df4d06))
- ensure owner is set directly on new files
  ([060131e](https://github.com/PeterMosmans/tools-image/commit/060131e9391a03574181bcd6b459f2a065152775))
- set default workdir to /workdir
  ([2260825](https://github.com/PeterMosmans/tools-image/commit/2260825b7a0b134a8db5d03f157afbf887ec2879))

## [1.3.0](https://github.com/PeterMosmans/tools-image/compare/1.2.0...1.3.0) (2022-04-11)

### Features

- add ansible-lint
  ([7730e1b](https://github.com/PeterMosmans/tools-image/commit/7730e1bf1771e49b1bb5e8091ccab9d1d4391cbe))

## [1.2.0](https://github.com/PeterMosmans/tools-image/compare/1.1.0...1.2.0) (2022-02-10)

### Features

- add basic GitLab pipeline
  ([6ca3523](https://github.com/PeterMosmans/tools-image/commit/6ca35234e875bd4d9b59a771e064a386b612cad2))

## 1.1.0 (2022-02-08)

### Features

- add curl
  ([3fafdff](https://github.com/PeterMosmans/tools-image/commit/3fafdff16fa8f9febacb50fccc9e2dba2683461f))
- add demo 2
  ([fc6ef42](https://github.com/PeterMosmans/tools-image/commit/fc6ef42bdf61276fd1d580fe3702252d58277132))
- add jq to image
  ([88879c5](https://github.com/PeterMosmans/tools-image/commit/88879c545721dbe5825ed00150149d37fa956074))
- add linting of Dockerfile
  ([3961d30](https://github.com/PeterMosmans/tools-image/commit/3961d306163ad7f2966e018483421bdae3484525))
- add test for curl
  ([03bcf38](https://github.com/PeterMosmans/tools-image/commit/03bcf38f251fdc07678e395ab15693f500059288))
- add testssl.sh
  ([475cf09](https://github.com/PeterMosmans/tools-image/commit/475cf0962fa9301d50d9cd0f2d783bbba3c5f940))
- change default Anchore Engine address
  ([e27aa24](https://github.com/PeterMosmans/tools-image/commit/e27aa2411b96f6e4fb9259341cd252c9e938d175))
- clean up hadolint issues
  ([b80d90f](https://github.com/PeterMosmans/tools-image/commit/b80d90f1bef98397f34193e135761f95982a408d))
- compact resulting Dockerfile
  ([1cc582e](https://github.com/PeterMosmans/tools-image/commit/1cc582e09f3ae244794712fff18459818c9be29c))
- ensure that linting results are stored
  ([ce60453](https://github.com/PeterMosmans/tools-image/commit/ce604533eecc323d3d175b73c7252f41065651b4))
- install CycloneDX module to create Software Bill-of-Materials
  ([5b5caf0](https://github.com/PeterMosmans/tools-image/commit/5b5caf054a0280913a44e98898f53be389429f99))
- install typescript
  ([6804f91](https://github.com/PeterMosmans/tools-image/commit/6804f912db5a301e987ddd78a7255027abd47199))
- remove ansible-lint, add yamllint
  ([4a272c5](https://github.com/PeterMosmans/tools-image/commit/4a272c574eba9310c906a8890e5fd27e1fbe2b06))
- specify NODE_PATH as required by sonar-scanner
  ([e235373](https://github.com/PeterMosmans/tools-image/commit/e23537347a9bfb805915af8be12387dfc42cb1c2))
- specify WORKDIR
  ([97b38e8](https://github.com/PeterMosmans/tools-image/commit/97b38e8ab92519f2df8a480566d0b958249a2b20))
- update npm packages
  ([1820611](https://github.com/PeterMosmans/tools-image/commit/18206115ece33070946cc8fa9e44bce0c50b3db5))
- update sonar scanner binary
  ([8db2706](https://github.com/PeterMosmans/tools-image/commit/8db270654b59f545db06e5f1d2e1b78993d7a1b3))
- use current Debian as base image
  ([b2dd53b](https://github.com/PeterMosmans/tools-image/commit/b2dd53b7405656fdd0f603ef32d98f32c9458bc5))

### Bug Fixes

- ensure that packages get updated globally
  ([5bb0b7d](https://github.com/PeterMosmans/tools-image/commit/5bb0b7dd70ca2fdf5b8556a735d0300220955ad6))
