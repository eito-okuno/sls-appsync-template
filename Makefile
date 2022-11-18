# ダミーターゲットの定義
.PHONY: init print_all deploy deploy_all remove_all

# 定数の定義
ENV = dev
SRC_DIR_PATH = ./src
LAYER_DIR_PATH = ./layer
INFRA_DIR_PATH = ./infra
OPTION_CMD = --stage $(ENV) --verbose
SRC_OPTION_CMD = --param="env=$(ENV)" --verbose

# インストール系のコマンド
SLS_INSTALL_CMD = npm i serverless@3
SLS_PLUGIN_INSTALL_CMD = serverless plugin install -n
SRC_INSTALL_CMD = $(SLS_INSTALL_CMD) && $(SLS_PLUGIN_INSTALL_CMD) serverless-prune-plugin && $(SLS_PLUGIN_INSTALL_CMD) serverless-appsync-plugin
LAYER_INSTALL_CMD = $(SLS_INSTALL_CMD) && $(SLS_PLUGIN_INSTALL_CMD) serverless-prune-plugin && $(SLS_PLUGIN_INSTALL_CMD) serverless-python-requirements
INFRA_INSTALL_CMD = $(SLS_INSTALL_CMD) && $(SLS_PLUGIN_INSTALL_CMD) serverless-prune-plugin

# 環境構築
init:
	npm update -g
	npm install -g serverless
	cd $(INFRA_DIR_PATH) && $(INFRA_INSTALL_CMD)
	cd $(LAYER_DIR_PATH) && $(LAYER_INSTALL_CMD)
	cd $(SRC_DIR_PATH) && $(SRC_INSTALL_CMD)

# print系（cloudformationの出力）
# 一括出力
print_all:
	cd $(INFRA_DIR_PATH) && sls print $(OPTION_CMD)
	cd $(LAYER_DIR_PATH) && sls print $(OPTION_CMD)
	cd $(SRC_DIR_PATH) && sls print $(SRC_OPTION_CMD)

# deploy系（cloudformationのデプロイ）
# コードデプロイ
deploy:
	cd $(LAYER_DIR_PATH) && sls deploy $(OPTION_CMD)
	cd $(SRC_DIR_PATH) && sls deploy $(SRC_OPTION_CMD)

# 一括デプロイ
deploy_all:
	cd $(INFRA_DIR_PATH) && sls deploy $(OPTION_CMD)
	cd $(LAYER_DIR_PATH) && sls deploy $(OPTION_CMD)
	cd $(SRC_DIR_PATH) && sls deploy $(SRC_OPTION_CMD)

# remove系（cloudformationの削除）
# 一括削除
remove_all:
	cd $(INFRA_DIR_PATH) && sls remove $(OPTION_CMD)
	cd $(LAYER_DIR_PATH) && sls remove $(OPTION_CMD)
	cd $(SRC_DIR_PATH) && sls remove $(SRC_OPTION_CMD)