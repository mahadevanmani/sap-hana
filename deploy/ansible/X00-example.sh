#!/bin/bash

# /*---------------------------------------------------------------------------8
# |                                                                            |
# |                             Playbook Wrapper                               |
# |                                                                            |
# +------------------------------------4--------------------------------------*/

export           ANSIBLE_HOST_KEY_CHECKING=False
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=Yes
# export           ANSIBLE_KEEP_REMOTE_FILES=1


ansible-playbook                                                                                                \
  --inventory   hosts.yaml                                                                                      \
  --user        azureadm                                                                                        \
  --private-key sshkey                                                                                          \
  --extra-vars="{                                                                                               \
                  \"bom_base_name\":                \"HANA_2_00_053_v001\",                                     \
                  \"download_templates\":           \"false\",                                                  \
                  \"sapbits_location_base_path\":   \"https://npeus2saplib4b2.blob.core.windows.net/sapbits\",  \
                  \"target_media_location\":        \"/usr/sap/install\"                                        \
                }"                                                                                              \
playbook_00_transition_start_for_sap_install.yaml                                                               \
playbook_01_os_base_config.yaml                                                                                 \
playbook_02_os_sap_specific_config.yaml                                                                         \
playbook_03_bom_processing.yaml                                                                                 \
playbook_04a_sap_scs_install.yaml                                                                               \
playbook_05a_hana_db_install.yaml                                                                               \
playbook_06a_sap_dbload.yaml                                                                                    \
playbook_06b_sap_pas_install.yaml                                                                               \
playbook_06c_sap_app_install.yaml                                                                               \
playbook_06d_sap_web_install.yaml
