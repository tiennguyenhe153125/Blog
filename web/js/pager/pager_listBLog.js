/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function doPrev(pageindex) {
    if (pageindex > 1) {
        pageindex -= 1;
        window.location.href = "listBlog?page=" + pageindex;
    }
}

function doNext(pageindex, totalpage) {
    if (pageindex < totalpage) {
        pageindex += 1;
        window.location.href = "listBlog?page=" + pageindex;
    }
}