############################################################################
# FILE: .bash_fuctions
#
# This file loads Ty's bash functions
# **NOTE** must be loaded after .bash_exports
#
#############################################################################

#############################################################################
# function svncloner
# usage:  svncloner <project-name> [destination-dir]
#############################################################################
function svncloner {
    if [[ -z ${SVN_REPO} ]]; then
	echo "Failed to clone, \$SVN_REPO is not set"
	return
    fi
    if [[ -z ${SVN_SANDBOX} ]]; then
	pushd ${SVN_SANDBOX} >> /dev/null
	svn clone ${SVN_REPO}/${1}
	popd >> /dev/null
    else
	svn co ${SVN_REPO}/${1} ${2}
    fi
}

#############################################################################
# function hgcloner
# usage:  hgcloner <project-name> [destination-dir]
#############################################################################
function hgcloner {
    if [[ -z ${HG_REPO} ]]; then
	echo "Failed to clone, \$HG_REPO is not set"
	return
    fi
    if [[ -z ${HG_SANDBOX} ]]; then
	pushd ${HG_SANDBOX} >> /dev/null
	hg clone ${HG_REPO}/${1}
	popd >> /dev/null
    else
	hg clone ${HG_REPO}/${1} ${2}
    fi
}


#############################################################################
# function gitcloner
# usage:  gitcloner <project-name> [destination-dir]
#############################################################################
function gitcloner {
    if [[ -z ${GIT_REPO} ]]; then
	echo "Failed to clone, \$GIT_REPO is not set"
	return
    fi
    if [[ -z ${GIT_SANDBOX} ]]; then
	pushd ${GIT_SANDBOX} >> /dev/null
	git clone ${GIT_REPO}/${1}
	popd >> /dev/null
    else
	git clone ${GIT_REPO}/${1} ${2}
    fi
}


#############################################################################
# function cleanpath
# remove duplicates in PATH, but keep the order
# usage:  cleanpath
# 
#############################################################################
function cleanpath {
    PATH="$(printf "%s" "${PATH}" | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
    PATH="${PATH%:}"  # remove trailing colon
    export PATH
}