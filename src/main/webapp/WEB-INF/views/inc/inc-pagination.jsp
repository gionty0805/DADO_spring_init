<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${pagination.endPage ne null}">
<ul class="pagination pagination-rounded justify-content-center">
    <li class="paginate_button page-item previous ${pagination.prev ? '' : 'disabled'}" id="scroll-horizontal-datatable_previous">
        <a href="javascript:go_page(${pagination.startPage -1})" tabindex="0" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
    </li>

    <c:forEach var="num" begin="${pagination.startPage}" end="${pagination.endPage}">
        <li class="paginate_button page-item ${pagination.pageVO.page_no == num ? "active":""}">
            <a href="javascript:go_page(${num})" tabindex="0" class="page-link">${num}</a>
        </li>
    </c:forEach>

    <li class="paginate_button page-item next ${pagination.next ? '' : 'disabled'}" id="scroll-horizontal-datatable_next">
        <a href="javascript:go_page(${pagination.endPage +1 })" tabindex="0" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
    </li>
</ul>
</c:if>