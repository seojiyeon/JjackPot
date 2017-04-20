<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=5" type="text/css" />   
<html>


<head>




<div class="mask">
<body class="methods-page" data-page="methods">
	
<body class="modal-open" style="padding-right: 0px;">
	


    <div class="modal-content">
    	<div class="modal-header">
    		<h2 class="modal-title">
    			<i class="icon modal-title-user"></i>사용자 선택</h2>
    	
   	 	<div class="modal-close"><a href="javascript:void(0)" data-dismiss="modal">
    		<i class="icon pop-close"></i><span>Close</span></a>
    	</div>
 
    

   
    
    
    <div>
   		<div class="modal-body">
			<div class="shuttleL">
				<div id="divOrgMainTab" class="box-header">
					<ul class="nav nav-tabs3 push" style="width: 130px">
						<li class="active">
							<a href="#organogramTabOrg" data-toggle="tab tooltip" title="">조직도</a></li>
							<li style="width: 700px">
							<div class="inbox mini-box">
							<div id="orgTreeDept" class="jstree jstree-1 jstree-default" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="treeItem_G102863_U144716" aria-busy="false">
							<ul class="jstree-container-ul jstree-children" role="group">
							<c:forEach var="emp_d2" items="${emp_d2}" >
							<li role="treeitem" code="G102863" aria-selected="false" aria-level="1" aria-labelledby="treeItem_G102863_anchor" aria-expanded="true" id="treeItem_G102863" class="jstree-node  jstree-last jstree-open">
							<i class="jstree-icon jstree-ocl" role="presentation"></i>
							<a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_anchor">
							<i class="jstree-icon jstree-themeicon dept jstree-themeicon-custom" role="presentation"></i>
							${emp_d2.department}</a>	</li>
							</c:forEach>
							</ul>
							</div>
							
							<ul role="group" class="jstree-children" style="">	
							<c:forEach var="emp_d" items="${emp_d}" >
							<li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144416_anchor" id="treeItem_G102863_U144416" class="jstree-node  jstree-leaf">
							<i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144416_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>
							${emp_d.emp_name}(${emp_d.position })</a></li>
								
								</c:forEach>
</ul></div>
					</ul>
				</div>
				
				<div class="tab-content">
					
						<div class="tab-pane active" id="organogramTabOrg">





 




<!-- 

<script type="text/javascript">
(function($) {
	var $groupTree,
	    $pubAddrgroupTree,
	    $priAddrgroupTree;
	
	function createGroupTree() {
		if(!$groupTree) {
			$("#orgTreeDept").on("loaded.jstree", function (event, data) {
			    var _node = data.instance.get_node(initTreeItem),
			        _parents=[], 
			        _targets=[];
			    
			    if(!_node || _node.id === '#') {
			    } else {
			        _parents = _node.parents;
			    }
			    
			    for(var i=0;i<_parents.length;i++) {
    				if(i !== '#') {
    					_targets.push(_parents[i]);
    				}else{
    				    break;
    				}
    			}
			    
			    if(_targets.length>0){
			        _targets.reverse();
			        for(var i=0;i<_targets.length;i++)    {
			            $("#orgTreeDept").jstree("open_node", _targets[i], false);
			        }
			    }
	        });

			
			$groupTree = $("#orgTreeDept").jstree({
			    "core" : {
			        "data" : function (node, cb) {
                        $.ajax({
						    url : "/support/popup/requestGroupChildren.do",
						    dataType : "json",
						    data : {
						        "operation" : "get_children",
							    "groupId" : node.id == "#" ? '': node.li_attr.code,
							    "controlType" : "ORG",
// 							    "controlTabType" : $('input[name=controlTabType]:hidden').val(),
							    "selectType" : "USER",
							    "joinYn" : ""
						    }
				        })
				        .done(function(data) {
                        	cb(spro.arrayToJSTreeData(data.items, null, true));
                        });
                    },
    				"multiple":true
    			}
			}).delegate("a[href$='#']", "dblclick", function (e) {
				e.preventDefault();
				this.blur();
				$("#orgTreeDept").jstree("open_node", this, false, true);
	        });
		}
	}

	
	function createPriAddrGroupTree() {
		if(!$priAddrgroupTree) {
			$priAddrgroupTree = $("#orgTreeDeptPri").jstree({
				"core" : {
			        "data" : function (node, cb) {
                        $.ajax({
						    url : "/support/popup/requestGroupChildren.do",
						    dataType : "json",
						    data : {
						        "operation" : "get_children",
							    "groupId" : node.id == "#" ? '': node.li_attr.code,
							    "controlType" : "PRI",
// 							    "controlTabType" : $('input[name=controlTabType]:hidden').val(),
							    "selectType" : "USER",
							    "joinYn" : ""
						    }
				        })
				        .done(function(data) {
                        	cb(spro.arrayToJSTreeData(data.items));
                        });
                    },
    				"multiple":true
    			}
			}).delegate("a[href$='#']", "dblclick", function (e) {
				e.preventDefault();
				this.blur();
				$("#orgTreeDeptPri").jstree("open_node", this, false, true);
	        });
		}
	}
	
	$(function() {
		$("#orgDivTabs>ul a:first").tab("show");
		if($("#orgDivTabs>ul a").size() <= 1)  {
			$("#orgDivTabs").hide();
		} else {
		    $("#orgDivTabs>ul a").click(function (e) {
	            e.preventDefault();
	            
	            switch($(this).attr("href")) {
					case "#orgTab-orggroup" : createGroupTree();
						break;
					case "#orgTab-prigroup" : createPriAddrGroupTree();
						break;
				}
	            $(this).tab('show');
	        });
		}
	    
	    createGroupTree();
	    
	    $("#orgTreeDept, #orgTreeDeptPri").on("dblclick", dblClickOrg);
	});
})(jQuery);
</script> -->

<div id="orgDivTabs" class="box-header">
	<ul class="nav nav-tabs5 push">
		<li class="active"><a href="#orgTab-orggroup" data-toggle="tab tooltip" title="조직도"><i class="icon org-person"></i><span class="none">조직도</span></a></li>
		
			<li><a href="#orgTab-prigroup" data-toggle="tab tooltip" title="개인그룹"><i class="icon org-mygroup"></i><span class="none">개인그룹</span></a></li>
		
	</ul>
</div>
<div class="tab-content">
	<div class="tab-pane active" id="orgTab-orggroup">
		<div class="inbox mini-box">
			<div id="orgTreeDept" class="jstree jstree-1 jstree-default" role="tree" aria-multiselectable="true" tabindex="0" aria-activedescendant="treeItem_G102863_U144416" aria-busy="false"><ul class="jstree-container-ul jstree-children" role="group"><li role="treeitem" code="G102863" aria-selected="false" aria-level="1" aria-labelledby="treeItem_G102863_anchor" aria-expanded="true" id="treeItem_G102863" class="jstree-node  jstree-last jstree-open"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_anchor"><i class="jstree-icon jstree-themeicon dept jstree-themeicon-custom" role="presentation"></i>루크</a><ul role="group" class="jstree-children" style=""><li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144416_anchor" id="treeItem_G102863_U144416" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144416_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>신성무 회장/사장 (부서장)</a></li><li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144718_anchor" id="treeItem_G102863_U144718" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144718_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>서지연 전무</a></li><li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144499_anchor" id="treeItem_G102863_U144499" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144499_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>유준상 이사/부서장</a></li><li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144716_anchor" id="treeItem_G102863_U144716" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144716_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>김민영 대리</a></li><li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144717_anchor" id="treeItem_G102863_U144717" class="jstree-node  jstree-leaf"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144717_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>박혜진 대리</a></li><li role="treeitem" code="" aria-selected="false" aria-level="2" aria-labelledby="treeItem_G102863_U144715_anchor" id="treeItem_G102863_U144715" class="jstree-node  jstree-leaf jstree-last"><i class="jstree-icon jstree-ocl" role="presentation"></i><a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144715_anchor"><i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>안진영 사원</a></li></ul></li></ul></div>
		</div>
	</div>
	<div class="tab-pane" id="orgTab-prigroup">
		<div class="inbox mini-box">
			<div id="orgTreeDeptPri"></div>
		</div>
	</div>
</div></div>
					
					
					
					
					<div class="tab-pane" id="organogramTabSearch">
						<div class="inbox">
							<form onsubmit="return false" novalidate="novalidate">
								<select title="검색조건" name="tablesch_01" id="searchColumn">
									
										
											<option value="">사용자명</option>
										
										
										

									
								</select>
								<div class="input-search dpI">												
									<input id="schKeyword" name="keyword" type="text" title="검색" class="w150">
									<button class="btn btn-color7 br tbl-inner" type="submit">
										<i class="fa fa-search fa-fw"></i><span class="blind">검색</span>
									</button>
								</div>
							</form>
							
							<div id="divSearchResult"></div>
						</div>
					</div>
					
				</div>

			</div>
			<div class="shuttleM">
				<ul id="btnItem">
					<li><a href="#" class="btn-color5"><i class="fa fa-angle-right"></i><span class="blind">Add</span></a></li>
					<li><a href="#"><i class="fa fa-angle-left"></i><span class="blind">Remove</span></a></li>
					<li><a href="#"><i class="fa fa-rotate-left"></i><span class="blind">Reset</span></a></li>
				</ul>
			</div>
			<div class="shuttleR">
				<div class="box-header">
					<div class="totalNum">
					    선택 (<span id="cntSelectedItem">0</span>/<span>500</span>)
					</div>
				</div>
				<div class="inbox">
					<ul id="ulResult" class="per-list ui-selectable"></ul>
				</div>
			</div>
			<div class="clearboth"></div>
		</div>
    	
    	
    	</div>
    
    </div>
    
</head>    
</html>