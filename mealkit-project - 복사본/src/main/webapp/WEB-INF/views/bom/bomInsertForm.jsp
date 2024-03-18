	<!-- header 공통 부분 연결 -->
	<%@ include file="header.jsp" %>
	<!-- ============================================================================== -->
	
	<!-- BOM 등록 -->
	<section>
		<div class="main_wrap">
			<div class="blank"></div>
			<!-- 조건 설정 -->
			<div class="inner condition_container">
				<div class="inner bomInsertList">
					<div class="bomInsertList Bom_condition_tit">
						<h1 class="Bom_condition_tit">BOM 등록</h1>
					</div>
					<div class="inner">
							<!-- BOM 등록 MultiForm 연결 -->
							<%@ include file="newBom.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<!-- ============================================================================== -->
	<!-- footer 공통 부분 연결 -->
	<%@ include file="footer.jsp" %>