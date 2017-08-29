/**
 *
 */
var PageUtil = function() // 페이지 처리 함수
{
	var totalCnt; // 총 건수
	var pageRows; // 한 페이지에 출력될 항목 갯수
	var curPage; // 현재 페이지
	var disPagepCnt;// 화면출력 페이지수
	var totalPage;

	this.setTotalPage = function() {
		this.totalPage = parseInt((this.totalCnt / this.pageRows))
				+ (this.totalCnt % this.pageRows > 0 ? 1 : 0);
	}

	this.getPrev = function() {
		var prev = 0;

		if (this.curPage > 1)
			prev = this.curPage - 1;
		else
			prev = 1;

		return prev;
	}

	this.getNext = function() {
		var next = 0;

		if (this.curPage < this.totalPage)
			next = this.curPage + 1;
		else
			next = this.totalPage;

		return next;
	}

	this.getPrevPage = function() {
		var prevPage = 0;
		var curPos = (parseInt((this.curPage / this.disPagepCnt)) + (this.curPage
				% this.disPagepCnt > 0 ? 1 : 0));

		if (curPos > 1) {
			prevPage = parseInt((curPos - 1)) * this.disPagepCnt;
		}

		return prevPage;
	}

	this.getNextPage = function() {
		var nextPage = 0;
		var curPos = parseInt((parseInt((this.curPage / this.disPagepCnt)) + (this.curPage
				% this.disPagepCnt > 0 ? 1 : 0)));

		if ((curPos * this.disPagepCnt + 1) <= this.totalPage) {
			nextPage = curPos * this.disPagepCnt + 1;
		}

		if (this.totalPage >= nextPage)
			return nextPage;
		else
			return this.totalPage;
	}

	this.Drow = function() {
		var sb = '';

		var start = ((parseInt((this.curPage / this.disPagepCnt)) + (this.curPage
				% this.disPagepCnt > 0 ? 1 : 0))
				* this.disPagepCnt - (this.disPagepCnt - 1));
		var end = ((parseInt((this.curPage / this.disPagepCnt)) + (this.curPage
				% this.disPagepCnt > 0 ? 1 : 0)) * this.disPagepCnt);
		if (end > this.totalPage)
			end = this.totalPage;

		if (this.curPage > this.disPagepCnt) {
			sb += "&nbsp;&nbsp;<a href='javascript:prev_page();'>◀◀</a>&nbsp;&nbsp;";
		}

		if (this.getPrev() < this.curPage) {
			sb += "&nbsp;&nbsp;<a href='javascript:prev();'>◀</a>&nbsp;&nbsp;";
		}

		for (var i = start; i <= end; i++) {
			if (i == this.curPage) {
				sb += "&nbsp;&nbsp;<b>" + i + "</b>&nbsp;&nbsp;";
			} else {
				sb += "&nbsp;&nbsp;<a href='javascript:goPage(" + i + ");'>"
						+ i + "</a>&nbsp;&nbsp;";
			}
		}

		if (this.curPage < this.getNext()) {
			sb += "&nbsp;&nbsp;<a href='javascript:next();'>▶</a>&nbsp;&nbsp;";
		}

		if (this.totalPage > this.getNextPage() && this.getNextPage() != 0) {
			sb += "&nbsp;&nbsp;<a href='javascript:next_page();'>▶▶</a>&nbsp;&nbsp;";
		}

		return sb;
	}
}
