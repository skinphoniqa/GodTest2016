/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.oe1.cms.arc.service;

import java.util.List;

/**
 * 아키텍쳐메뉴 등록/수정/삭제/조회 기능을 처리하는 비즈니스 인터페이스
 * 
 * @author  운영환경1 개발팀 김연수
 * @since 2010.08.11
 * @version 1.0
 * @see
 * 
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.08.11  김연수          최초 생성
 *
 * </pre>
 */
public interface EgovOe1ArcMenuService {


	/**
	 * 아키텍쳐 메뉴를 등록한다.
	 * @param vo
	 * 
	 * @throws Exception 
	 */
	public void insertArcMenu(EgovOe1ArcMenuVO vo) throws Exception;

	/**
	 * 아키텍쳐 메뉴를 수정한다.
	 * @param vo
	 * 
	 * @throws Exception 
	 */
	public void updateArcMenu(EgovOe1ArcMenuVO vo);
	
	/**
	 * 아키텍쳐 메뉴를 삭제한다.
	 * @param vo
	 * 
	 * @throws Exception 
	 */
	public void deleteArcMenu(EgovOe1ArcMenuVO vo);

	/**
	 * 아키텍쳐 메뉴를 조회한다.
	 * @param vo
	 * @return EgovOe1ArcMenuVO
	 * @throws Exception 
	 */
	public EgovOe1ArcMenuVO selectArcMenu(EgovOe1ArcMenuVO vo);

	/**
	 * 아키텍쳐 메뉴 목록을 조회한다.
	 * @param vo
	 * @return List
	 * @throws Exception 
	 */
	public List selectArcMenuList(EgovOe1ArcMenuVO vo);
	
	/**
	 * 아키텍쳐 메뉴 목록의 개수를 구한다.
	 * @param vo
	 * @return int
	 * @throws Exception 
	 */
	public int selectArcMenuListTot(EgovOe1ArcMenuVO vo);

	/**
	 * 아키텍쳐 메뉴 트리구조를 조회한다.
	 * @param vo
	 * @return List
	 * @throws Exception 
	 */
	public List selectArcMenuTree(EgovOe1ArcMenuVO vo);
	
	/**
	 * 아키텍쳐 메뉴 트리구조를 조회한다.2
	 * @param vo
	 * @return List
	 * @throws Exception 
	 */
	public List selectArcMenuTree2(EgovOe1ArcMenuVO vo);
}