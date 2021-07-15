const NAME = "Pastoral !";
const WELCOME_MESSAGE_TEMPLATE = ["night", "morning", "afternoon", "evening"];

// All shortcuts are in a `SHORTCUT_STARTER+shortcutKey` format. 
// So, for example, pressing `tab+q` would redirect you to https://google.com/?q=q
const SHORTCUT_STARTER = 'tab' 

// How much time (in milliseconds) you have to press shortcutKey after pressing SHORTCUT_STARTER.
// Also change --SHORTCUT_TIMEOUT in styles.css if you change this option.
const SHORTCUT_TIMEOUT = 1500;

// The groups of links are generated from this object. Edit it to edit the page's contents.
// shortcutKey must hold an all-lowercase single button. Theoretically should work with values like `esc` and `f1`,
// but intended to be used with just regular latin letters.
const MASTER_MAP = [
    {
        "groupName": "开源相关",
        "items":[
            {"name": "About my GitHub", "url": "https://huhongjun.github.io/docs/", "tooltip": ""},
            {"name": "退步集", "url": "https://huhongjun.github.io/mkdocs-mydocu/", "tooltip": ""},
            {"name": "Kubeflow文档(中文)", "url": "https://osmatrix.github.io/", "tooltip": ""},
            {"name": "pypi-neseg", "url": "https://pypi.org/project/neseg/", "tooltip": "aaaa"},
            {"name": "DS215j portal", "url": "http://ds215j", "tooltip": "aaaa"},
            {"name": "aaaa", "url": "aaaa", "tooltip": "aaaa"}           
        ]
    },
    {
        "groupName": "Bitbucket,gitlab,gitee",
        "items":[
            {"name": "toutiao", "url": "https://gitlab.com/huhongjun/toutiao", "tooltip": "今日头条创作。"},
            {"name": "docu-gdqx", "url": "https://bitbucket.org/huhongjun/docu-gdqx", "tooltip": "aaaa"},
            {"name": "docu-niislms", "url": "https://bitbucket.org/huhongjun/docu-niislms", "tooltip": "aaaa"},
            {"name": "docu-elgg", "url": "https://bitbucket.org/huhongjun/docu-elgg", "tooltip": "aaaa"},
            {"name": "blcms", "url": "https://bitbucket.org/huhongjun/blcms", "tooltip": "aaaa"},
            {"name": "harmony3", "url": "https://bitbucket.org/huhongjun/harmony3", "tooltip": "aaaa"},
            {"name": "edltsns", "url": "https://bitbucket.org/huhongjun/edltsns", "tooltip": "aaaa"},
            {"name": "lab-test", "url": "https://bitbucket.org/huhongjun/lab-test", "tooltip": "aaaa"},
            {"name": "blsms", "url": "https://bitbucket.org/huhongjun/blsms", "tooltip": "aaaa"},
            {"name": "ne-segmentation", "url": "https://bitbucket.org/huhongjun/ne-segmentation", "tooltip": "aaaa"},
            {"name": "harmony3-github", "url": "https://bitbucket.org/huhongjun/harmony3-github", "tooltip": "aaaa"},
            {"name": "aaaa", "url": "https://bitbucket.org/huhongjun/aaaa", "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "发布站点",
        "items":[
            {"name": "Potree Demo", "url": "https://huhongjun.github.io/potree/Potree/examples/viewer.html", "tooltip": "aaaa"},
            {"name": "awstutor", "url": "awstutor.asmatrix.com", "tooltip": "aaaa"},
            {"name": "courseware", "url": "courseware.asmatrix.com", "tooltip": "aaaa"},
            {"name": "exam", "url": "exam.asmatrix.com", "tooltip": "aaaa"},
            {"name": "gateway", "url": "gateway.asmatrix.com", "tooltip": "aaaa"},
            {"name": "nps", "url": "nps.asmatrix.com", "tooltip": "aaaa"},
            {"name": "portal", "url": "portal.asmatrix.com", "tooltip": "aaaa"},
            {"name": "static", "url": "static.asmatrix.com", "tooltip": "aaaa"},
            {"name": "w3d", "url": "w3d.asmatrix.com", "tooltip": "aaaa"},
            {"name": "aaaa", "url": "aaaa", "tooltip": "aaaa"},
            {"name": "aaaa", "url": "aaaa", "tooltip": "aaaa"}
        ]
    },    
    {
        "groupName": "仓库-hu01",
        "items":[
            {"name": "huhongjun.github.io", "url": "https://github.com/huhongjun/mkdocs-asmatrix", "tooltip": "产品演示与项目介绍网站，对外发布。"},
            {"name": "mkdocs-asmatrix", "url": "https://github.com/huhongjun/mkdocs-asmatrix", "tooltip": "产品演示与项目介绍网站，对外发布。"},
            {"name": "mkdocs-desktop", "url": "https://github.com/huhongjun/mkdocs-desktop", "tooltip": ""},
            {"name": "gateway.asmatrix.com", "url": "https://github.com/huhongjun/gateway.asmatrix.com", "tooltip": "aaaa"},
            {"name": "lidar-biz-docu", "url": "https://github.com/huhongjun/lidar-biz-docu", "tooltip": "aaaa"},
            {"name": "aws-instance", "url": "https://github.com/huhongjun/aws-instance", "tooltip": "aaaa"},
            {"name": "workshop", "url": "https://github.com/huhongjun/workshop", "tooltip": "aaaa"},
            {"name": "TDemo-docu", "url": "https://github.com/huhongjun/TDemo-docu", "tooltip": "aaaa"},
            {"name": "TDemo-website-docu", "url": "https://github.com/huhongjun/TDemo-website-docu", "tooltip": "aaaa"},
            {"name": "www.asmatrix.com", "url": "https://github.com/huhongjun/www.asmatrix.com", "tooltip": "aaaa"},
            {"name": "clp_vms_cs", "url": "https://github.com/huhongjun/clp_vms_cs", "tooltip": "aaaa"},
            {"name": "CesiumJS-Mars", "url": "https://github.com/huhongjun/CesiumJS-Mars", "tooltip": "aaaa"},
            {"name": "MyResearch", "url": "https://github.com/huhongjun/MyResearch", "tooltip": "aaaa"},
            {"name": "MyOpenSource", "url": "https://github.com/huhongjun/MyOpenSource", "tooltip": "关注开源软件的整理记录。"},
            {"name": "CloudDeploy", "url": "https://github.com/huhongjun/CloudDeploy", "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "仓库-02",
        "items":[
            {"name": "EarthViewer", "url": "https://github.com/huhongjun/EarthViewer", "tooltip": "aaaa"},
            {"name": "potree", "url": "https://github.com/huhongjun/potree", "tooltip": "aaaa"},
            {"name": "Padavan-build", "url": "https://github.com/huhongjun/Padavan-build", "tooltip": "aaaa"},
            {"name": "AutoBuild-OpenWrt", "url": "https://github.com/huhongjun/AutoBuild-OpenWrt", "tooltip": "aaaa"},
            {"name": "vscode-sshfs", "url": "https://github.com/huhongjun/vscode-sshfs", "tooltip": "aaaa"},
            {"name": "openwrt-build", "url": "https://github.com/huhongjun/openwrt-build", "tooltip": "aaaa"},
            {"name": "manifests", "url": "https://github.com/huhongjun/manifests", "tooltip": "aaaa"}            
        ]
    },
    {
        "groupName": "仓库-EDLT",
        "items":[
            {"name": "计算机编程类中文书籍", "url": "https://github.com/nl8590687/free-programming-books-zh_CN", "tooltip": "aaaa"},
            {"name": "Google Site", "url": "https://sites.google.com", "tooltip": "Google站点管理"},
            {"name": "Google Site[OS]", "url": "https://sites.google.com/a/osmatrix.info", "tooltip": "Google协作平台（osmatrix.info）"}
            
        ]
    },
    {
        "groupName": "仓库-YBDL",
        "items":[
            {"name": "lidar-docu", "url": "https://github.com/myybdl/lidar-docu", "tooltip": "aaaa"},
            {"name": "CloudCompare", "url": "https://github.com/myybdl/CloudCompare", "tooltip": "aaaa"},
            {"name": "Open3D-PointNet2-Semantic3D", "url": "https://github.com/myybdl/Open3D-PointNet2-Semantic3D", "tooltip": "aaaa"},
            {"name": "DoF-Enhancement-PointNet-model", "url": "https://github.com/myybdl/DoF-Enhancement-PointNet-model", "tooltip": "aaaa"},
            {"name": "3d-semantic-segmentation", "url": "https://github.com/myybdl/3d-semantic-segmentation", "tooltip": "aaaa"},
            {"name": "3DmFV-Net", "url": "https://github.com/myybdl/3DmFV-Net", "tooltip": "aaaa"},
            {"name": "cloudcompare-docu", "url": "https://github.com/myybdl/cloudcompare-docu",  "tooltip": "aaaa"},
            {"name": "pointnet2", "url": "https://github.com/myybdl/pointnet2",  "tooltip": "aaaa"},
            {"name": "3D-Machine-Learning", "url": "https://github.com/myybdl/3D-Machine-Learning",  "tooltip": "aaaa"},
            {"name": "CloudCompareTool", "url": "https://github.com/myybdl/CloudCompareTool",  "tooltip": "aaaa"},
            {"name": "koala", "url": "https://github.com/myybdl/koala",  "tooltip": "aaaa"},
            {"name": "dddlib", "url": "https://github.com/myybdl/dddlib",  "tooltip": "aaaa"},
            {"name": "Urban-point-cloud-classification", "url": "https://github.com/myybdl/Urban-point-cloud-classification",  "tooltip": "aaaa"},
            {"name": "lidar-xgboost", "url": "https://github.com/myybdl/lidar-xgboost", "tooltip": "aaaa"},
            {"name": "delineating-linear-elements", "url": "https://github.com/myybdl/delineating-linear-elements", "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "仓库-osmatrix",
        "items":[
            {"name": "Heimdall", "url": "https://github.com/osmatrix/Heimdall",  "tooltip": "aaaa"},
            {"name": "cheatsheets", "url": "https://github.com/osmatrix/cheatsheets",  "tooltip": "aaaa"},
            {"name": "Homely", "url": "https://github.com/osmatrix/Homely",  "tooltip": "aaaa"},
            {"name": "gridstudio", "url": "https://github.com/osmatrix/gridstudio",  "tooltip": "aaaa"},
            {"name": "SOFTX-DCT-FEATURE", "url": "https://github.com/osmatrix/SOFTX-DCT-FEATURE",  "tooltip": "aaaa"},
            {"name": "davinci", "url": "https://github.com/osmatrix/davinci",  "tooltip": "aaaa"},
            {"name": "CBoard", "url": "https://github.com/osmatrix/CBoard",  "tooltip": "aaaa"},
            {"name": "mcg-helper", "url": "https://github.com/osmatrix/mcg-helper",  "tooltip": "aaaa"},
            {"name": "Guide-on-the-Side", "url": "https://github.com/osmatrix/Guide-on-the-Side",  "tooltip": "aaaa"},
            {"name": "kurogo", "url": "https://github.com/osmatrix/kurogo",  "tooltip": "aaaa"},
            {"name": "orange3", "url": "https://github.com/osmatrix/orange3", "tooltip": "aaaa"},
            {"name": "3DLineDetection", "url": "https://github.com/osmatrix/3DLineDetection",  "tooltip": "aaaa"},
            {"name": "DirectoryLister", "url": "https://github.com/osmatrix/DirectoryLister", "tooltip": "aaaa"},
            {"name": "website-kubeflow", "url": "https://github.com/osmatrix/website-kubeflow", "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "仓库-myosmatrix",
        "items":[
            {"name": "SimpleNodeProxyServer", "url": "https://github.com/myosmatrix/SimpleNodeProxyServer",  "tooltip": "aaaa"},
            {"name": "iEducation", "url": "https://github.com/myosmatrix/iEducation",  "tooltip": "aaaa"},
            {"name": "mlearning", "url": "https://github.com/myosmatrix/mlearning",  "tooltip": "aaaa"},
            {"name": "mycop", "url": "https://github.com/myosmatrix/mycop",  "tooltip": "aaaa"},
            {"name": "计算机编程类中文书籍", "url": "https://github.com/nl8590687/free-programming-books-zh_CN", "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "仓库-myshiyanshi",
        "items":[
            {"name": "simple-java-maven-app", "url": "https://github.com/myshiyanshi/simple-java-maven-app", "tooltip": "aaaa"},
            {"name": "tfgpu", "url": "https://github.com/myshiyanshi/tfgpu",  "tooltip": "aaaa"},
            {"name": "jenkins-exam", "url": "https://github.com/myshiyanshi/jenkins-exam", "tooltip": "aaaa"},
            {"name": "cheat-sheet-collection", "url": "https://github.com/myshiyanshi/cheat-sheet-collection",  "tooltip": "aaaa"},
            {"name": "1click-webpage-screenshot", "url": "https://github.com/myshiyanshi/1click-webpage-screenshot",  "tooltip": "aaaa"},
            {"name": "PDAL-exercise", "url": "https://github.com/myshiyanshi/PDAL-exercise",  "tooltip": "aaaa"},
            {"name": "machine-learning-tutorials", "url": "https://github.com/myshiyanshi/machine-learning-tutorials",  "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "仓库-收集",
        "items":[
            {"name": "计算机编程类中文书籍", "url": "https://github.com/nl8590687/free-programming-books-zh_CN", "tooltip": "aaaa"}
        ]
    },
    {
        "groupName": "个人云空间",
        "items":[
            {"name": "Google协作平台", "url": "https://sites.google.com", "tooltip": "Google站点管理"},
            {"name": "Google协作平台[OS]", "url": "https://sites.google.com/a/osmatrix.info", "tooltip": "Google协作平台（osmatrix.info）"}
        ]
    },
    {
        "groupName": "参考",
        "items":[
            {"name": "GitHub官方文档", "url": "https://help.github.com/cn/github", "tooltip": "部分已经有中文翻译."},
            {"name": "GitHub Pages", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "Hugo", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "mkdocs", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "octree", "url": "kodexplorer/", "tooltip": ""}
        ]        
    }
]    

let $container = document.getElementById("content");
let getUrl = {};

let $shortcutDisplayList = document.getElementsByClassName("shortcut");
let listeningForShortcut = false;
let listenerTimeout;

function setupWelcomeMessage(){
    let curHours = new Date().getHours();
    curHours = Math.floor(curHours/6); // Simply dividing current hours by 6 proves to be a good enough aproximation.
    if (curHours == 4) curHours = 3;
    let welcome = "Good " + WELCOME_MESSAGE_TEMPLATE[curHours] + ", " + NAME;
    //let welcome = "" + NAME;
    document.getElementById("welcome-string").innerHTML = welcome;
}

function setupGroups(){
    for (let i = 0; i < MASTER_MAP.length; i++){
        let curGroupData = MASTER_MAP[i];

        let group = document.createElement("div");
        group.className = "group";
        $container.appendChild(group);

        let header = document.createElement("h1");
        header.innerHTML = curGroupData.groupName;
        group.appendChild(header);

        for (let j = 0; j < curGroupData.items.length; j++){
            let curItemData = curGroupData.items[j];

            let pContainer = document.createElement("p");
            group.appendChild(pContainer);

            let link = document.createElement("a");
            link.innerHTML = curItemData.name;
            link.setAttribute("href", curItemData.url);
            link.setAttribute("title", curItemData.tooltip);
            pContainer.appendChild(link);

            let shortcutDisplay = document.createElement("span");
            shortcutDisplay.innerHTML = curItemData.shortcutKey;
            shortcutDisplay.className = "shortcut";
            shortcutDisplay.style.animation = "none";
            pContainer.appendChild(shortcutDisplay);

            getUrl[curItemData.shortcutKey] = curItemData.url
        }
    }
}

function shortcutListener(e) {
    let key = e.key.toLowerCase();

    if (listeningForShortcut && getUrl.hasOwnProperty(key)){
        window.location = getUrl[key];
    }

    if (key === SHORTCUT_STARTER) {
        clearTimeout(listenerTimeout);
        listeningForShortcut = true;

        // Animation reset
        for (let i = 0; i < $shortcutDisplayList.length; i++){
            $shortcutDisplayList[i].style.animation = "none";
            setTimeout(function() { $shortcutDisplayList[i].style.animation = ''; }, 10);
        }

        listenerTimeout = setTimeout(function(){ listeningForShortcut = false; }, SHORTCUT_TIMEOUT);
    }
}

function main(){
    setupWelcomeMessage();
    setupGroups();
    document.addEventListener('keyup', shortcutListener, false);
}

main();
