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
        "groupName": "open source",
        "items":[
            {"name": "退步集", "shortcutKey": "m", "url": "https://huhongjun.github.io/mkdocs-mydocu/", "tooltip": "个人文档站点，日常工作记录与分享。"},
            {"name": "Kubeflow文档(中文)", "shortcutKey": "k", "url": "https://osmatrix.github.io/", "tooltip": "仓库osmatrix/osmatrix.github.io - Kubeflow文档站点(中文版)"},
            {"name": "NESEG演示(WebTerminal)", "shortcutKey": "k", "url": "https://osmatrix.github.io/", "tooltip": "容器部署WebTerminal"},
            {"name": "kodexplorer", "shortcutKey": "e", "url": "kodexplorer/", "tooltip": ""}
        ]
    },
    {
        "groupName": "AI Learning",
        "items":[
            {"name": "aaaa", "shortcutKey": "z", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "kodexplorer", "shortcutKey": "e", "url": "kodexplorer/", "tooltip": ""}
        ]
    },    
    {
        "groupName": "repository",
        "items":[
            {"name": "mkdocs-asmatrix", "shortcutKey": "c", "url": "https://huhongjun.github.io/asmatrix/", "tooltip": ""},
            {"name": "mkdocs-mydocu", "shortcutKey": "c", "url": "http://portainer.asmatrix.com", "tooltip": ""},
            {"name": "aaaa", "shortcutKey": "z", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "kodexplorer", "shortcutKey": "e", "url": "kodexplorer/", "tooltip": ""}
        ]
    },
    {
        "groupName": "GitHub",
        "items":[
            {"name": "GitHub官方帮助文档", "shortcutKey": "z", "url": "https://help.github.com/cn/github", "tooltip": "部分已经有中文翻译."},
            {"name": "GitHub Pages", "shortcutKey": "z", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "Hugo", "shortcutKey": "z", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "Hugo", "shortcutKey": "z", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "octree", "shortcutKey": "e", "url": "kodexplorer/", "tooltip": ""}
        ]        
    },
    {
        "groupName": "EDLT",
        "items":[
            {"name": "计算机编程类中文书籍", "shortcutKey": "z", "url": "https://github.com/nl8590687/free-programming-books-zh_CN", "tooltip": "aaaa"},
            {"name": "kodexplorer", "shortcutKey": "e", "url": "kodexplorer/", "tooltip": ""},
            {"shortcutKey": "z", "name": "Google协作平台", "url": "https://sites.google.com", "tooltip": "Google站点管理"},
            {"shortcutKey": "z", "name": "Google协作平台[OS]", "url": "https://sites.google.com/a/osmatrix.info", "tooltip": "Google协作平台（osmatrix.info）"}

        ]
    },
    {
        "groupName": "YBDL",
        "items":[
            {"name": "aaaa", "shortcutKey": "z", "url": "https://aaaa/", "tooltip": "aaaa"},
            {"name": "kodexplorer", "shortcutKey": "e", "url": "kodexplorer/", "tooltip": ""}
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
