lua << EOF
package.loaded['gruvbox-material'] = nil
package.loaded['gruvbox-material.util'] = nil
package.loaded['gruvbox-material.colors'] = nil
package.loaded['gruvbox-material.theme'] = nil
package.loaded['gruvbox-material.functions'] = nil

require('gruvbox-material').set()
EOF
