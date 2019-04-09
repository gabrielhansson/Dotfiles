// Copyright (C) 1999-2019 Siber Systems Inc. All Rights Reserved.
function localeString2(e){try{var r=e.replace(new RegExp("[^a-zA-Z0-9_]","g"),"_"),n="";return"undefined"!=typeof browser&&void 0!==browser.i18n&&"function"==typeof browser.i18n.getMessage&&(n=browser.i18n.getMessage(r)),void 0!==n&&null!=n||(n=""),n||(n=r),n}catch(r){return r.toString(),e}}
//# sourceMappingURL=localization.js.map