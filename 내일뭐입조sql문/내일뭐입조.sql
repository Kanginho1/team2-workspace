-- TABLE DROP
DROP TABLE TB_DTL_ORDER; --  추가드랍 테이블
DROP TABLE TB_MILEAGE_HISTORY;
DROP TABLE TB_LOCATION;
DROP TABLE TB_LIKE;
DROP TABLE TB_ANSWER_INSTAGRAM;
DROP TABLE TB_SPEECHBUBBLE;
DROP TABLE TB_CART;
DROP TABLE TB_INQUIRE;
DROP TABLE TB_HEADER;
DROP TABLE TB_REVIEW_IMAGE;
DROP TABLE TB_REVIEW;
DROP TABLE TB_RETURN;
DROP TABLE TB_ORDER;
DROP TABLE TB_PRODUCT_IMAGE;
DROP TABLE TB_OPTION;
DROP TABLE TB_FOLLOW;
DROP TABLE TB_PRODUCT;
DROP TABLE TB_BRAND;
DROP TABLE TB_NOTICE_ATTACHMENT; -- 추가 드랍테이블
DROP TABLE TB_NOTICE;
DROP TABLE TB_MANAGER;
DROP TABLE TB_CATEGORY;
DROP TABLE TB_INSTA_IMAGE;
DROP TABLE TB_INSTAGRAM;
DROP TABLE TB_MEMBER;
-- SEQUENCE DROP
DROP SEQUENCE SEQ_DTL_ORDER;
DROP SEQUENCE SEQ_MILEAGE_HISTORY;
DROP SEQUENCE SEQ_LOCATION;
DROP SEQUENCE SEQ_LIKE;
DROP SEQUENCE SEQ_INSTA_IMAGE;
DROP SEQUENCE SEQ_ANSWER_INSTAGRAM;
DROP SEQUENCE SEQ_SPEECHBUBBLE;
DROP SEQUENCE SEQ_CART;
DROP SEQUENCE SEQ_INQUIRE;
DROP SEQUENCE SEQ_HEADER;
DROP SEQUENCE SEQ_REVIEW_IMAGE;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_RETURN;
DROP SEQUENCE SEQ_ORDER;
DROP SEQUENCE SEQ_PRODUCT_IMAGE;
DROP SEQUENCE SEQ_OPTION;
DROP SEQUENCE SEQ_INSTAGRAM;
DROP SEQUENCE SEQ_FOLLOW;
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_PRODUCT;
DROP SEQUENCE SEQ_BRAND;
DROP SEQUENCE SEQ_MANAGER;
DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_NFNO; -- 추가 드랍시퀀스
DROP SEQUENCE SEQ_NOTICE;


-- CREATE TABLE
CREATE TABLE TB_MEMBER (
	MEM_NO	NUMBER PRIMARY KEY,
	MEM_ID	VARCHAR2(20) NOT NULL UNIQUE,
	MEM_PWD	VARCHAR2(20) NOT NULL,
	MEM_NAME VARCHAR2(30) NOT NULL,
	EMAIL	VARCHAR2(30),
	PHONE	VARCHAR2(15) NOT NULL,
	ENROLL_DATE	DATE DEFAULT SYSDATE NOT NULL ,
	-- AD_CHECK CHAR(1) DEFAULT 'N' CHECK(AD_CHECK IN('Y', 'N')) NOT NULL,
    AD_CHECK VARCHAR2(16),
	GENDER	CHAR(3)	CHECK(GENDER IN('남', '여')) ,
	BIRTHDAY VARCHAR2(10),
	INSTA_ID VARCHAR2(30),
    ACT_YN CHAR(1) DEFAULT 'Y' CHECK(ACT_YN IN('Y','N')) NOT NULL,
    MILEAGE	NUMBER DEFAULT 0 NOT NULL
    -- NOT NULL DEFAULT 0 추가
);

CREATE TABLE TB_BRAND(
    BRAND_NO NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(30) NOT NULL
);

CREATE TABLE TB_CATEGORY (
	CATEGORY_NO	NUMBER	PRIMARY KEY,
	CATEGORY_NAME VARCHAR2(30) NOT NULL
);


-- PRODUCT 수정내용
-- VIEW_COUNT DEFAULT 0 추가
CREATE TABLE TB_PRODUCT (
	PRODUCT_NO NUMBER PRIMARY KEY,
	PRODUCT_NAME VARCHAR2(500) NOT NULL,
	PRODUCT_DESC VARCHAR2(4000)	NOT NULL,
    PRODUCT_DISCOUNT NUMBER,
	PRODUCT_PRICE NUMBER NOT NULL,
	PRODUCT_ENROLL_DATE	DATE DEFAULT SYSDATE NOT NULL,
	PRODUCT_VIEW_COUNT	NUMBER DEFAULT 0 NOT NULL,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')) NOT NULL,
	CATEGORY_NO NUMBER	NOT NULL REFERENCES TB_CATEGORY, 
    BRAND_NO NUMBER NOT NULL REFERENCES TB_BRAND
);


CREATE TABLE TB_MANAGER (
	MANAGER_NO	NUMBER	PRIMARY KEY,
	MANAGER_ID	VARCHAR2(20) NOT NULL UNIQUE,
	MANAGER_PWD	VARCHAR2(20) NOT NULL,
    MANAGER_NAME VARCHAR2(20) NOT NULL -- 추가 컬럼
);

-- NOTICE 수정내용
-- SYSDATE DEFAULT SYSDATE 추가
-- COUNT 추가
CREATE TABLE TB_NOTICE (
    NOTICE_NO NUMBER PRIMARY KEY,
    NOTICE_TITLE VARCHAR2(100) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
    NOTICE_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT 추가
    MANAGER_NO NUMBER NOT NULL REFERENCES TB_MANAGER,
    COUNT NUMBER DEFAULT 0 NOT NULL,
    DEL_YN VARCHAR2(1) DEFAULT 'N' CHECK (DEL_YN IN('Y', 'N'))
);

-- NOTICE_ATTACHMENT 추가
CREATE TABLE TB_NOTICE_ATTACHMENT (
  FILE_NO NUMBER PRIMARY KEY,
  REF_BNO NUMBER,
  ORIGIN_NAME VARCHAR2(255) NOT NULL,
  CHANGE_NAME VARCHAR2(255) NOT NULL,
  FILE_PATH VARCHAR2(1000),
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  DEL_YN VARCHAR2(1) DEFAULT 'N' CHECK(DEL_YN IN('Y', 'N')),
  FOREIGN KEY (REF_BNO) REFERENCES TB_NOTICE(NOTICE_NO)
);


CREATE TABLE TB_FOLLOW (
	FOLLOW_NO NUMBER PRIMARY KEY,
	FOLLOWING_ID NUMBER	NOT NULL REFERENCES TB_MEMBER,
	FOLLOWER_ID	NUMBER NOT NULL REFERENCES TB_MEMBER,
    ACT_YN CHAR(1) DEFAULT 'Y' CHECK(ACT_YN IN('Y','N')) NOT NULL
);

CREATE TABLE TB_REVIEW (
	REVIEW_NO NUMBER PRIMARY KEY,
	REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
	REVIEW_STAR	NUMBER CHECK(REVIEW_STAR IN(1,2,3,4,5))	NOT NULL,
	REVIEW_DATE	DATE DEFAULT SYSDATE NOT NULL ,
	REVIEW_ANS_CONTENT	VARCHAR2(2000) NULL,
	REVIEW_ANS_DATE	DATE,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	PRODUCT_NO2	NUMBER	NOT NULL REFERENCES TB_PRODUCT,
	MEM_NO	NUMBER	NOT NULL REFERENCES TB_MEMBER,
	MANAGER_NO NUMBER REFERENCES TB_MANAGER
);

CREATE TABLE TB_INSTAGRAM (
	COM_NO	NUMBER PRIMARY KEY,
	COM_CONTENT	VARCHAR2(2000) NOT NULL,
	COM_TAG	VARCHAR2(100) NOT NULL,
	INSTA_ID VARCHAR2(30) NOT NULL,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')) NOT NULL,
	MEM_NO	NUMBER	NOT NULL REFERENCES TB_MEMBER,
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL -- 02/28 컬럼 추가
);

CREATE TABLE TB_INSTA_IMAGE (
	INSTA_IMG_NO NUMBER	PRIMARY KEY,
    REF_CNO NUMBER NOT NULL,
	INSTA_IMG_ORIGIN VARCHAR2(30) NOT NULL, --  INSTA_IMG_NAME  -->INSTA_IMG_ORIGIN 컬럼 이름 변경
	INSTA_IMG_SRC VARCHAR2(200) NOT NULL, -- VARCHAR2(30) --> VARCHAR2(200)
    INSTA_IMG_CHANGE VARCHAR2(50) NOT NULL, -- 추가 컬럼
    FOREIGN KEY (REF_CNO) REFERENCES TB_INSTAGRAM(COM_NO)
);

CREATE TABLE TB_LIKE (
	LIKE_NO	NUMBER PRIMARY KEY,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
	COM_NO NUMBER NOT NULL REFERENCES TB_INSTAGRAM
);
CREATE TABLE TB_SPEECHBUBBLE (
	BUBLLE_NO NUMBER PRIMARY KEY,
	PRODUCT_NAME VARCHAR2(30) NOT NULL,
	PRODUCT_SIZE VARCHAR2(20) NOT NULL,
	PRODUCT_PRICE NUMBER NOT NULL,
	LINK VARCHAR2(1000),
    BRAND_NO NUMBER NOT NULL REFERENCES TB_BRAND,
	COM_NO NUMBER NOT NULL REFERENCES TB_INSTAGRAM,
    PRODUCT_NO NUMBER REFERENCES TB_PRODUCT,
	CATEGORY_NO	NUMBER NOT NULL REFERENCES TB_CATEGORY
);

-- HEADER 수정내용
-- 오타수정
CREATE TABLE TB_HEADER (
	HEADER_NO NUMBER PRIMARY KEY,
	HEADER_CONTENT	VARCHAR2(20) NOT NULL -- 오타수정 (HERADER -> HEADER)
);


-- INQUIRE 수정내용
-- VIEW_COUNT DEFAULT 0 추가
CREATE TABLE TB_INQUIRE (
	QNA_NO NUMBER PRIMARY KEY,
	QNA_TITLE VARCHAR2(100)	NOT NULL,
	QNA_CONTENT	VARCHAR2(2000) NOT NULL,
	QNA_DATE DATE DEFAULT SYSDATE NOT NULL ,
	QNA_VIEW_COUNT NUMBER DEFAULT 0 NOT NULL,
	ANS_CONTENT	VARCHAR2(2000),
	ANS_DATE DATE DEFAULT SYSDATE,
    ANS_YN CHAR(1) DEFAULT 'N' CHECK(ANS_YN IN('Y','N')), 
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	HEADER_NO NUMBER NOT NULL REFERENCES TB_HEADER,
	MANAGER_NO NUMBER REFERENCES TB_MANAGER,
    MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER
);

CREATE TABLE TB_INQUIRE_ATTACHMENT (
  FILE_NO NUMBER PRIMARY KEY,
  REF_BNO NUMBER,
  ORIGIN_NAME VARCHAR2(255) NOT NULL,
  CHANGE_NAME VARCHAR2(255) NOT NULL,
  FILE_PATH VARCHAR2(1000),
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  DEL_YN VARCHAR2(1) DEFAULT 'N' CHECK(DEL_YN IN('Y', 'N')),
  FOREIGN KEY (REF_BNO) REFERENCES TB_INQUIRE(QNA_NO)
);

CREATE TABLE TB_LOCATION (
	LOC_NO NUMBER PRIMARY KEY,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
	LOC_ADDRESS_NAME VARCHAR2(30) NOT NULL,
	LOC_NAME VARCHAR2(30) NOT NULL,
	LOC_PHONE VARCHAR2(15) NOT NULL,
	LOC_ADDRESS	VARCHAR2(100) NOT NULL, --VARCHAR2(50) --> VARCHAR2(100)
	LOC_ADDRESS_DTL	VARCHAR2(100) NOT NULL, --VARCHAR2(50) --> VARCHAR2(100)
	LOC_POST_CODE VARCHAR2(20) NOT NULL,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	LOC_YN	CHAR(1) CHECK(LOC_YN IN('Y', 'N'))	NOT NULL
);

CREATE TABLE TB_ORDER (
	ORDER_NO NUMBER	PRIMARY KEY,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
	ORDER_QNT NUMBER DEFAULT 1 NOT NULL,
	ORDER_DATE DATE DEFAULT SYSDATE	NOT NULL,
	ORDER_STATUS VARCHAR2(20)  DEFAULT '상품준비중' CHECK(ORDER_STATUS IN('상품준비중','배송중','배송완료','취소완료','교환요청','교환중','교환완료','환불요청','환불중','환불완료')) NOT NULL,
	RCP_ADDRESS_NAME VARCHAR2(30),
	RCP_NAME VARCHAR2(30) NOT NULL,
	RCP_PHONE VARCHAR2(15) NOT NULL,
	RCP_ADDRESS	VARCHAR2(50) NOT NULL,
	RCP_ADDRESS_DTL	VARCHAR2(50) NOT NULL,
	RCP_POST_CODE VARCHAR2(20) NOT NULL,
	RCP_MSG	VARCHAR2(50),
    SAVE_MILEAGE NUMBER NOT NULL, -- 추가컬럼
    USE_MILEAGE NUMBER -- 추가컬럼
);



CREATE TABLE TB_CART (
	CART_NO	NUMBER PRIMARY KEY,
	CART_QNT NUMBER	NOT NULL,
	PRODUCT_NO NUMBER NOT NULL REFERENCES TB_PRODUCT,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
    CART_SIZE VARCHAR2(10) NOT NULL, -- 추가된 컬럼 상품 사이즈
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N'))-- 추가된 컬럼 삭제여부
);


CREATE TABLE TB_RETURN (
	RETURN_NO NUMBER PRIMARY KEY,
	RETURN_STATUS CHAR(6) CHECK(RETURN_STATUS IN('교환','반품'))	NOT NULL,
	RETURN_REASON VARCHAR2(4000) NOT NULL,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER ,
	ORDER_NO NUMBER	NOT NULL REFERENCES TB_ORDER
);

-- 230306 수정 
CREATE TABLE TB_PRODUCT_IMAGE (    
    PRODUCT_IMG_NO NUMBER PRIMARY KEY,
    PRODUCT_NO NUMBER,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000),
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    IMG_TYPE NUMBER CHECK(IMG_TYPE IN(1,2,3)) NOT NULL,
    DEL_YN VARCHAR2(1) DEFAULT 'N' CHECK(DEL_YN IN('Y', 'N')),
    FOREIGN KEY (PRODUCT_NO) REFERENCES TB_PRODUCT(PRODUCT_NO)
);

CREATE TABLE TB_ANSWER_INSTAGRAM (
	ANS_NO NUMBER PRIMARY KEY,
	ANS_CONTENT	VARCHAR2(500),
	ANS_DATE DATE DEFAULT SYSDATE,
	ADD_ANS_YN CHAR(1) CHECK(ADD_ANS_YN IN('Y', 'N')),
	OG_ANS_NO NUMBER,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	COM_NO NUMBER NOT NULL REFERENCES TB_INSTAGRAM,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER
);



CREATE TABLE TB_REVIEW_IMAGE (
	--REVIEW_IMG_NO NUMBER PRIMARY KEY,
	REVIEW_IMG_NAME	VARCHAR2(50) NOT NULL,
	REVIEW_IMG_SRC VARCHAR2(50) NOT NULL,
	REVIEW_NO NUMBER REFERENCES TB_REVIEW PRIMARY KEY
);



CREATE TABLE TB_OPTION (
	OPTION_NO NUMBER PRIMARY KEY,
	OPTION_SIZE	VARCHAR2(20) NOT NULL,
	OPTION_STOCK NUMBER DEFAULT 0 NOT NULL,
	PRODUCT_NO NUMBER NOT NULL REFERENCES TB_PRODUCT
);

CREATE TABLE TB_MILEAGE_HISTORY(
    MILEAGE_NO NUMBER PRIMARY KEY,
    MILEAGE_HISTORY CHAR(6) CHECK(MILEAGE_HISTORY IN('사용','적립')),
    MILEAGE NUMBER NOT NULL, -- 추가컬럼(수정)
    MEM_NO NUMBER REFERENCES TB_MEMBER,
    ORDER_NO NUMBER REFERENCES TB_ORDER -- 추가 컬럼
);

CREATE TABLE TB_DTL_ORDER( --추가 테이블
    DTL_ORDER_NO NUMBER PRIMARY KEY,
    ORDER_NO NUMBER NOT NULL REFERENCES TB_ORDER,
    PRODUCT_NO NUMBER NOT NULL REFERENCES TB_PRODUCT,
    DTL_SIZE VARCHAR2(20) NOT NULL,
    DTL_QNT NUMBER NOT NULL 
);
-- COMMENT 추가
COMMENT ON COLUMN TB_REVIEW.REVIEW_NO IS '리뷰번호';
COMMENT ON COLUMN TB_REVIEW.REVIEW_CONTENT IS '리뷰내용';
COMMENT ON COLUMN TB_REVIEW.REVIEW_STAR IS '별점';
COMMENT ON COLUMN TB_REVIEW.REVIEW_DATE IS '리뷰작성날짜';
COMMENT ON COLUMN TB_REVIEW.REVIEW_ANS_CONTENT IS '답변내용';
COMMENT ON COLUMN TB_REVIEW.REVIEW_ANS_DATE IS '답변날짜';
COMMENT ON COLUMN TB_REVIEW.DEL_YN IS '삭제여부';
COMMENT ON COLUMN TB_REVIEW.PRODUCT_NO2 IS '상품번호';
COMMENT ON COLUMN TB_REVIEW.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_REVIEW.MANAGER_NO IS '관리자번호';

COMMENT ON COLUMN TB_REVIEW_IMAGE.REVIEW_IMG_NAME IS '이미지이름';
COMMENT ON COLUMN TB_REVIEW_IMAGE.REVIEW_IMG_SRC IS '이미지경로';

COMMENT ON COLUMN TB_SPEECHBUBBLE.BUBLLE_NO IS '말풍선번호';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_NAME IS '상품이름';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_SIZE IS '상품사이즈';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_PRICE IS '가격';
COMMENT ON COLUMN TB_SPEECHBUBBLE.LINK IS '링크';
COMMENT ON COLUMN TB_SPEECHBUBBLE.BRAND_NO IS '브랜드번호';
COMMENT ON COLUMN TB_SPEECHBUBBLE.COM_NO IS '게시글번호';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN TB_SPEECHBUBBLE.CATEGORY_NO IS '카테고리번호';

COMMENT ON COLUMN TB_HEADER.HEADER_NO IS '말머리번호';
COMMENT ON COLUMN TB_HEADER.HEADER_CONTENT IS '말머리내용'; -- 오타수정 (HERADER -> HEADER)


COMMENT ON COLUMN TB_INQUIRE.QNA_NO IS '문의번호';
COMMENT ON COLUMN TB_INQUIRE.QNA_TITLE IS '문의제목';
COMMENT ON COLUMN TB_INQUIRE.QNA_CONTENT IS '문의내용';
COMMENT ON COLUMN TB_INQUIRE.QNA_DATE IS '문의날짜';
COMMENT ON COLUMN TB_INQUIRE.QNA_VIEW_COUNT IS '조회수';
COMMENT ON COLUMN TB_INQUIRE.ANS_CONTENT IS '답변내용';
COMMENT ON COLUMN TB_INQUIRE.ANS_DATE IS '답변날짜';
COMMENT ON COLUMN TB_INQUIRE.ANS_YN IS '답변여부'; -- 수정
COMMENT ON COLUMN TB_INQUIRE.DEL_YN IS '삭제여부'; 
COMMENT ON COLUMN TB_INQUIRE.HEADER_NO IS '말머리번호';
COMMENT ON COLUMN TB_INQUIRE.MANAGER_NO IS '관리자번호';
COMMENT ON COLUMN TB_INQUIRE.MEM_NO IS '회원번호';

COMMENT ON COLUMN TB_NOTICE.NOTICE_NO IS '공지사항번호';
COMMENT ON COLUMN TB_NOTICE.NOTICE_TITLE IS '공지사항제목';
COMMENT ON COLUMN TB_NOTICE.NOTICE_CONTENT IS '공지사항내용';
COMMENT ON COLUMN TB_NOTICE.NOTICE_DATE IS '작성일';
COMMENT ON COLUMN TB_NOTICE.MANAGER_NO IS '관리자번호';
COMMENT ON COLUMN TB_NOTICE.DEL_YN IS '삭제여부(Y/N)'; -- 추가 코멘트

COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.REF_BNO IS '참조게시글번호';
COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN TB_NOTICE_ATTACHMENT.DEL_YN IS '삭제여부(Y/N)';


COMMENT ON COLUMN TB_FOLLOW.FOLLOW_NO IS '팔로잉식별번호';
COMMENT ON COLUMN TB_FOLLOW.FOLLOWING_ID IS '팔로잉회원번호';
COMMENT ON COLUMN TB_FOLLOW.FOLLOWER_ID IS '팔로워회원번호';
COMMENT ON COLUMN TB_FOLLOW.ACT_YN IS '삭제여부';

COMMENT ON COLUMN TB_PRODUCT_IMAGE.PRODUCT_IMG_NO IS '이미지번호';
COMMENT ON COLUMN TB_PRODUCT_IMAGE.PRODUCT_NO IS '참조상품번호';
COMMENT ON COLUMN TB_PRODUCT_IMAGE.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN TB_PRODUCT_IMAGE.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN TB_PRODUCT_IMAGE.FILE_PATH IS '저장폴더경로';
COMMENT ON COLUMN TB_PRODUCT_IMAGE.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN TB_PRODUCT_IMAGE.DEL_YN IS '삭제여부(Y/N)';

COMMENT ON COLUMN TB_PRODUCT.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN TB_PRODUCT.PRODUCT_NAME IS '상품이름';
COMMENT ON COLUMN TB_PRODUCT.PRODUCT_DESC IS '상품설명';
COMMENT ON COLUMN TB_PRODUCT.PRODUCT_PRICE IS '가격';
COMMENT ON COLUMN TB_PRODUCT.PRODUCT_ENROLL_DATE IS '등록날짜';
COMMENT ON COLUMN TB_PRODUCT.PRODUCT_VIEW_COUNT IS '조회수';
COMMENT ON COLUMN TB_PRODUCT.DEL_YN IS '삭제여부';
COMMENT ON COLUMN TB_PRODUCT.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN TB_PRODUCT.BRAND_NO IS '브랜드번호';

COMMENT ON COLUMN TB_CART.CART_NO IS '장바구니번호';
COMMENT ON COLUMN TB_CART.CART_QNT IS '수량';
COMMENT ON COLUMN TB_CART.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN TB_CART.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_CART.CART_SIZE IS '장바구니크기'; -- 추가 코멘트
COMMENT ON COLUMN TB_CART.DEL_YN IS '삭제여부'; -- 추가코멘트

COMMENT ON COLUMN TB_INSTAGRAM.COM_NO IS '게시글번호';
COMMENT ON COLUMN TB_INSTAGRAM.COM_CONTENT IS '게시글내용';
COMMENT ON COLUMN TB_INSTAGRAM.COM_TAG IS '태그';
COMMENT ON COLUMN TB_INSTAGRAM.INSTA_ID IS '인스타아이디';
COMMENT ON COLUMN TB_INSTAGRAM.DEL_YN IS '삭제여부';
COMMENT ON COLUMN TB_INSTAGRAM.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_INSTAGRAM.UPLOAD_DATE IS '업로드일'; -- 추가 컬럼


COMMENT ON COLUMN TB_INSTA_IMAGE.INSTA_IMG_NO IS '이미지번호';
COMMENT ON COLUMN TB_INSTA_IMAGE.REF_CNO IS '참조게시글번호';
COMMENT ON COLUMN TB_INSTA_IMAGE.INSTA_IMG_ORIGIN IS '원래이미지이름';
COMMENT ON COLUMN TB_INSTA_IMAGE.INSTA_IMG_SRC IS '이미지경로';
COMMENT ON COLUMN TB_INSTA_IMAGE.INSTA_IMG_CHANGE IS '바뀐이미지이름';

COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.ANS_NO IS '댓글번호';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.ANS_CONTENT IS '댓글내용';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.ANS_DATE IS '작성날짜';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.ADD_ANS_YN IS '대댓글여부';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.OG_ANS_NO IS '원댓글여부';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.DEL_YN IS '삭제여부';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.COM_NO IS '게시글여부';
COMMENT ON COLUMN TB_ANSWER_INSTAGRAM.MEM_NO IS '회원번호';

COMMENT ON COLUMN TB_LIKE.LIKE_NO IS '좋아요번호';
COMMENT ON COLUMN TB_LIKE.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_LIKE.COM_NO IS '게시글번호';

COMMENT ON COLUMN TB_CATEGORY.CATEGORY_NO IS '카테고리번호';
COMMENT ON COLUMN TB_CATEGORY.CATEGORY_NAME IS '카테고리이름';

COMMENT ON COLUMN TB_MANAGER.MANAGER_NO IS '관리자번호';
COMMENT ON COLUMN TB_MANAGER.MANAGER_ID IS '관리자아이디';
COMMENT ON COLUMN TB_MANAGER.MANAGER_PWD IS '관리자비밀번호';
COMMENT ON COLUMN TB_MANAGER.MANAGER_NAME IS '관리자이름'; -- 추가 코멘트

COMMENT ON COLUMN TB_BRAND.BRAND_NO IS '브랜드번호';
COMMENT ON COLUMN TB_BRAND.BRAND_NAME IS '브랜드이름';

COMMENT ON COLUMN TB_OPTION.OPTION_NO IS '옵션번호';
COMMENT ON COLUMN TB_OPTION.OPTION_SIZE IS '상품사이즈';
COMMENT ON COLUMN TB_OPTION.OPTION_STOCK IS '옵션재고';
COMMENT ON COLUMN TB_OPTION.PRODUCT_NO IS '상품번호';

COMMENT ON COLUMN TB_LOCATION.LOC_NO IS '배송지번호';
COMMENT ON COLUMN TB_LOCATION.LOC_ADDRESS_NAME IS '배송지명';
COMMENT ON COLUMN TB_LOCATION.LOC_NAME IS '수취인명';
COMMENT ON COLUMN TB_LOCATION.LOC_PHONE IS '전화번호';
COMMENT ON COLUMN TB_LOCATION.LOC_ADDRESS IS '주소';
COMMENT ON COLUMN TB_LOCATION.LOC_ADDRESS_DTL IS '상세주소';
COMMENT ON COLUMN TB_LOCATION.LOC_POST_CODE IS '우편번호';
COMMENT ON COLUMN TB_LOCATION.LOC_YN IS '기본배송지여부';
COMMENT ON COLUMN TB_LOCATION.DEL_YN IS '삭제여부';
COMMENT ON COLUMN TB_LOCATION.MEM_NO IS '회원번호';

COMMENT ON COLUMN TB_MILEAGE_HISTORY.MILEAGE_NO IS '적립금번호';
COMMENT ON COLUMN TB_MILEAGE_HISTORY.MILEAGE_HISTORY IS '적립금내역';
COMMENT ON COLUMN TB_MILEAGE_HISTORY.MILEAGE IS '적립금';
COMMENT ON COLUMN TB_MILEAGE_HISTORY.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_MILEAGE_HISTORY.ORDER_NO IS '주문번호'; --추가코멘트

COMMENT ON COLUMN TB_RETURN.RETURN_NO IS '환불번호';
COMMENT ON COLUMN TB_RETURN.RETURN_STATUS IS '환불상태';
COMMENT ON COLUMN TB_RETURN.RETURN_REASON IS '환불사유';
COMMENT ON COLUMN TB_RETURN.ORDER_NO IS '주문정보';

COMMENT ON COLUMN TB_ORDER.ORDER_NO IS '주문정보';
COMMENT ON COLUMN TB_ORDER.MEM_NO IS '회원번호';
COMMENT ON COLUMN TB_ORDER.ORDER_QNT IS '주문수량';
COMMENT ON COLUMN TB_ORDER.ORDER_DATE IS '주문날짜';
COMMENT ON COLUMN TB_ORDER.ORDER_STATUS IS '주문상태';
COMMENT ON COLUMN TB_ORDER.RCP_ADDRESS_NAME IS '배송지명';
COMMENT ON COLUMN TB_ORDER.RCP_NAME IS '수취인명';
COMMENT ON COLUMN TB_ORDER.RCP_PHONE IS '수취인 전화번호';
COMMENT ON COLUMN TB_ORDER.RCP_ADDRESS IS '주소';
COMMENT ON COLUMN TB_ORDER.RCP_ADDRESS_DTL IS '상세주소';
COMMENT ON COLUMN TB_ORDER.RCP_MSG IS '요청사항';
COMMENT ON COLUMN TB_ORDER.SAVE_MILEAGE IS '적립마일리지';
COMMENT ON COLUMN TB_ORDER.USE_MILEAGE IS '사용마일리지';

COMMENT ON COLUMN TB_DTL_ORDER.DTL_ORDER_NO IS '상세주문번호';
COMMENT ON COLUMN TB_DTL_ORDER.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN TB_DTL_ORDER.ORDER_NO IS '주문번호';
COMMENT ON COLUMN TB_DTL_ORDER.DTL_SIZE IS '주문 상품 사이즈';
COMMENT ON COLUMN TB_DTL_ORDER.DTL_QNT IS '주문 상품 수량';

--CREATE SEQUENCE 
CREATE SEQUENCE SEQ_MEMBER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CATEGORY
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_BRAND
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_MANAGER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_FOLLOW
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_REVIEW
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_INSTAGRAM
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LIKE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_SPEECHBUBBLE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_NFNO
NOCACHE;


CREATE SEQUENCE SEQ_HEADER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_INQUIRE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LOCATION
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ORDER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CART
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_RETURN
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_IMAGE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ANSWER_INSTAGRAM
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_REVIEW_IMAGE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_INSTA_IMAGE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_OPTION
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_MILEAGE_HISTORY
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_NOTICE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_DTL_ORDER
NOCYCLE
NOCACHE;

-- 트리거

-- 공지사항 첨부파일 트리거
CREATE OR REPLACE TRIGGER TRG_DEL
AFTER UPDATE ON TB_NOTICE 
FOR EACH ROW
BEGIN
    IF (:NEW.DEL_YN = 'Y')
        THEN
        UPDATE TB_NOTICE_ATTACHMENT 
           SET DEL_YN = 'Y'
         WHERE REF_BNO = :NEW.NOTICE_NO;
    END IF;
END;
/



-- 마일리지 적립, 사용 트리거
CREATE OR REPLACE TRIGGER TRG_MILEAGE
AFTER INSERT ON TB_MILEAGE_HISTORY
FOR EACH ROW
BEGIN
    
    IF (:NEW.MILEAGE_HISTORY = '적립')
        THEN
            UPDATE TB_MEMBER
            SET MILEAGE = MILEAGE + :NEW.MILEAGE
            WHERE MEM_NO = :NEW.MEM_NO;
        END IF;
    
    IF (:NEW.MILEAGE_HISTORY = '사용')
        THEN
            UPDATE TB_MEMBER
            SET MILEAGE = MILEAGE - :NEW.MILEAGE
            WHERE MEM_NO = :NEW.MEM_NO;
    END IF;
END;
/

-- 회원 삭제 시 배송지 삭제 트리거
CREATE OR REPLACE TRIGGER TRG_LOC_DEL
AFTER UPDATE ON TB_MEMBER 
FOR EACH ROW
BEGIN
    IF (:NEW.ACT_YN = 'N')
        THEN
        UPDATE TB_LOCATION
           SET DEL_YN = 'Y'
        WHERE MEM_NO = :NEW.MEM_NO;
    END IF;
END;
/

-- 회원 삭제 시 배송지 삭제 트리거
CREATE OR REPLACE TRIGGER TRG_FWL_DEL
AFTER UPDATE ON TB_MEMBER 
FOR EACH ROW
BEGIN
    IF (:NEW.ACT_YN = 'N')
        THEN
        UPDATE TB_LOCATION
           SET DEL_YN = 'Y'
        WHERE MEM_NO = :NEW.MEM_NO;
    END IF;
END;
/

-- 230308 수정 
-- 상품 이미지 트리거 추가
CREATE OR REPLACE TRIGGER TRG_PDEL
AFTER UPDATE ON TB_PRODUCT
FOR EACH ROW
BEGIN
    IF (:NEW.DEL_YN = 'Y')
        THEN
        UPDATE TB_PRODUCT_IMAGE 
           SET DEL_YN = 'Y'
         WHERE PRODUCT_NO = :NEW.PRODUCT_NO;
    END IF;
END;
/

-- INSERT문

INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user01','pass01','박희연','email01@kh.kr','01062612122',DEFAULT,DEFAULT,NULL,NULL,NULL,DEFAULT,4000);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user02','pass02','이윤화','email02@kh.kr','01064622323',DEFAULT,DEFAULT,NULL,NULL,NULL,DEFAULT,2500);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user03','pass03','전혜정','email03@kh.kr','01066632524',DEFAULT,DEFAULT,NULL,NULL,NULL,DEFAULT,3000);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user04','pass04','정지용','email04@kh.kr','01068642725',DEFAULT,DEFAULT,NULL,NULL,NULL,DEFAULT,2790);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user05','pass05','최승협','email05@kh.kr','01060652926',DEFAULT,DEFAULT,NULL,NULL,NULL,DEFAULT,1500);

INSERT INTO TB_BRAND VALUES(SEQ_BRAND.NEXTVAL, '나이키');
INSERT INTO TB_BRAND VALUES(SEQ_BRAND.NEXTVAL, '무아무아');
INSERT INTO TB_BRAND VALUES(SEQ_BRAND.NEXTVAL, '아디다스');
INSERT INTO TB_BRAND VALUES(SEQ_BRAND.NEXTVAL, '키르시');
INSERT INTO TB_BRAND VALUES(SEQ_BRAND.NEXTVAL, 'OiOi');

INSERT INTO TB_CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '아우터');
INSERT INTO TB_CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '상의');
INSERT INTO TB_CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '하의');
INSERT INTO TB_CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '신발');
INSERT INTO TB_CATEGORY VALUES(SEQ_CATEGORY.NEXTVAL, '악세사리');

INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,'WASHED LEATHER BLAZER','멋진 재질을 가진 자켓.',5,189000,'2023-02-03',20,DEFAULT,1,2);
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,'체리 포켓 플리스 점퍼','양털 자켓',10,129000,'2023-02-03',20,DEFAULT,1,2);
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,'A PUFFER DOWN PADDING','분홍 패딩',35,332000,'2023-01-03',40,DEFAULT,1,2);
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,'빅패치 아이보리 야구자켓','야구자켓.',30,359000,'2023-01-30',30,DEFAULT,1,2);
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,'조거팬츠','멋진 재질을 가진 바지입니다.',15,33000,'2023-02-02',100,DEFAULT,4,5);
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT.NEXTVAL,'티셔츠','멋진 재질을 가진 티셔츠입니다.',40,27000,'2023-01-25',150,DEFAULT,3,4);

INSERT INTO TB_MANAGER VALUES(SEQ_MANAGER.NEXTVAL, 'admin01', 'pwd01', '관리자KANG');
INSERT INTO TB_MANAGER VALUES(SEQ_MANAGER.NEXTVAL, 'admin02', 'pwd02', '관리자HEE');
INSERT INTO TB_MANAGER VALUES(SEQ_MANAGER.NEXTVAL, 'admin03', 'pwd03', '관리자HWA');
INSERT INTO TB_MANAGER VALUES(SEQ_MANAGER.NEXTVAL, 'admin04', 'pwd04', '관리자YONG');
INSERT INTO TB_MANAGER VALUES(SEQ_MANAGER.NEXTVAL, 'admin05', 'pwd05', '관리자SEONG');


INSERT INTO TB_NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '설 연휴 배송 안내!', '설 연휴 관련 배송안내입니다.', SYSDATE, 3,DEFAULT);
INSERT INTO TB_NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '크크루삥뽕마스 이벤트', '산타가 쳐들어온다.', '2022-12-15', 4,DEFAULT);
INSERT INTO TB_NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '스포츠웨어의 정석! <나이키> 입점 안내	', 'JUST DO IT, NIKE.','2022-11-01', 1,DEFAULT);
INSERT INTO TB_NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '추석 연휴 배송 안내', '송편도 꼭꼭 공지사항도 꼭꼭.','2022-09-20', 2,DEFAULT);
INSERT INTO TB_NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '오잉? 여름이다! 여름 휴가 맞이 이벤트', '내일뭐입지 팀이 휴가를 갑니다', '2022-08-18', 5,DEFAULT);

INSERT INTO TB_FOLLOW
VALUES(SEQ_FOLLOW.NEXTVAL, 1,2,DEFAULT);
INSERT INTO TB_FOLLOW
VALUES(SEQ_FOLLOW.NEXTVAL, 1,3,DEFAULT);
INSERT INTO TB_FOLLOW
VALUES(SEQ_FOLLOW.NEXTVAL, 1,4,DEFAULT);
INSERT INTO TB_FOLLOW
VALUES(SEQ_FOLLOW.NEXTVAL, 2,3,DEFAULT);
INSERT INTO TB_FOLLOW
VALUES(SEQ_FOLLOW.NEXTVAL, 2,4,DEFAULT);

INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '와 진짜 너무 예뻐여ㅠㅠ', 5, SYSDATE, '마일리지 적립 완료! 구매해주셔서 감사합니다~! 앞으로도 많이 이용해주세요!', SYSDATE,'N',1,1,1);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '흠,,, 생각보다 별루', 2, '2022-03-25', '마일리지 적립 완료! 상품이 불만족스러우셨나요?ㅠㅠ 앞으로 더 좋은 상품으로 찾아올테니, 또 이용해주세요!', '2022-03-26','N',1,2,1);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '무난해요~ 흠냐륑~', 3, '2022-04-03', '마일리지 적립 완료! 구매해주셔서 감사합니다~! 앞으로도 많이 이용해주세요!', '2022-04-05','N',3,4,5);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '배송이 늦은거 빼고는 다 좋아용', 4, '2022-10-10', '마일리지 적립 완료! 구매해주셔서 감사합니다~! 앞으로도 많이 이용해주세요!', '2022-10-10','N',4,5,2);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '내돈,,,^^', 1, '2022-11-29', '마일리지 적립 완료! 상품이 불만족스러우셨나요?ㅠㅠ 앞으로 더 좋은 상품으로 찾아올테니, 또 이용해주세요!', '2022-11-30','Y',4,3,3);


INSERT INTO TB_INSTAGRAM VALUES(SEQ_INSTAGRAM.NEXTVAL,'옷은 내가 제일 잘입어','#패션','INSTA01','N',3,SYSDATE);
INSERT INTO TB_INSTAGRAM VALUES(SEQ_INSTAGRAM.NEXTVAL,'인생패션입니다.','#인생,#스트릿,#가을','INSTA02','N',1,SYSDATE);
INSERT INTO TB_INSTAGRAM VALUES(SEQ_INSTAGRAM.NEXTVAL,'아~ 내 청춘이여','#청춘,#심플','INSTA03','N',2,SYSDATE);
INSERT INTO TB_INSTAGRAM VALUES(SEQ_INSTAGRAM.NEXTVAL,'내 옷 이쁘죠?','#내가최고,#캐주얼,#봄','INSTA04','N',2,SYSDATE);
INSERT INTO TB_INSTAGRAM VALUES(SEQ_INSTAGRAM.NEXTVAL,'이쁜 연보라','#퍼플,#시티,#스타일','INSTA05','N',4,SYSDATE);

INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_INSTA_IMAGE.NEXTVAL,1,'익명의 패션사진1','https://image.msscdn.net/mfile_s01/_shopstaff/view.staff_6400bee7281ba.jpg?20230303085713','바뀐사진1');
INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_INSTA_IMAGE.NEXTVAL,2,'익명의 패션사진2','https://image.msscdn.net/mfile_s01/_shopstaff/view.staff_64006b477bc31.jpg?20230303001253','바뀐사진2');
INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_INSTA_IMAGE.NEXTVAL,3,'익명의 패션사진3','https://image.msscdn.net/mfile_s01/_shopstaff/view.staff_6400679036dd4.jpg?20230303001141','바뀐사진3');
INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_INSTA_IMAGE.NEXTVAL,4,'익명의 패션사진4','https://image.msscdn.net/mfile_s01/_shopstaff/view.staff_64006774dec7d.jpg?20230303001141','바뀐사진4');
INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_INSTA_IMAGE.NEXTVAL,5,'익명의 패션사진5','https://image.msscdn.net/mfile_s01/_shopstaff/view.staff_64005e9d5a0ed.jpg?20230303000350','바뀐사진5');

INSERT INTO TB_LIKE VALUES(SEQ_LIKE.NEXTVAL,2,2);
INSERT INTO TB_LIKE VALUES(SEQ_LIKE.NEXTVAL,1,4);
INSERT INTO TB_LIKE VALUES(SEQ_LIKE.NEXTVAL,3,5);
INSERT INTO TB_LIKE VALUES(SEQ_LIKE.NEXTVAL,4,1);
INSERT INTO TB_LIKE VALUES(SEQ_LIKE.NEXTVAL,2,3);

INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진숏자켓', 'S', 189000, 'https://www.seoulstore.com/products/1523056/detail?ecommerceListName=brandPdt_978', 2, 1, 2, 2);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진운동화', '220', 25900, 'https://www.nike.com/kr/t/%EC%9D%B8%EB%B9%88%EC%84%9C%EB%B8%94-3-%EC%97%AC%EC%84%B1-%EB%A1%9C%EB%93%9C-%EB%9F%AC%EB%8B%9D%ED%99%94-UbyT9MX4/DR2660-100', 1, 1, 1, 4);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진후드티', 'M', 33900, 'https://www.seoulstore.com/products/1548017/detail?ecommerceListName=searchResult_%EC%95%84%EB%94%94%EB%8B%A4%EC%8A%A4', 3, 2, 3, 2);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진조거팬츠', 'XL', 98100, 'https://www.seoulstore.com/products/1651356/detail?ecommerceListName=searchResult_%ED%82%A4%EB%A5%B4%EC%8B%9C', 4, 4, 4, 3);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '내가갖고싶은티셔츠', 'S', 119000, 'https://www.seoulstore.com/products/1679687/detail?ecommerceListName=searchResult_OIOI', 5, 3, NULL, 2);

INSERT INTO TB_HEADER
VALUES(SEQ_HEADER.NEXTVAL, '상품문의');
INSERT INTO TB_HEADER
VALUES(SEQ_HEADER.NEXTVAL, '주문문의');
INSERT INTO TB_HEADER
VALUES(SEQ_HEADER.NEXTVAL, '교환/환불문의');
INSERT INTO TB_HEADER
VALUES(SEQ_HEADER.NEXTVAL, '기타문의');

INSERT INTO TB_INQUIRE
VALUES(SEQ_INQUIRE.NEXTVAL, '언제와여', '주문한지 세시간 지났는데 언제와요', SYSDATE, 0, '15시 이전 주문 건은 당일 17시에 출고됩니다.', SYSDATE, 'Y', DEFAULT, 2, 2, 1);
INSERT INTO TB_INQUIRE
VALUES(SEQ_INQUIRE.NEXTVAL, '상품관련 문의 드립니다.', '해당 상품 재입고 언제 되나요', SYSDATE, 0, '해당 상품에 대한 재입고 계획이 없습니다.', SYSDATE, 'Y', 'Y', 1, 3, 2);
INSERT INTO TB_INQUIRE
VALUES(SEQ_INQUIRE.NEXTVAL, '교환해주세요!', '한 사이즈 큰 치수로 부탁드려요', '2022-12-21', 0, '매장으로 다시 보내주시면 교환해 드리겠습니다.', '2022-12-21', 'N', DEFAULT, 3, 2, 3);
INSERT INTO TB_INQUIRE
VALUES(SEQ_INQUIRE.NEXTVAL, '오프라인 매장 위치', '위치가 어디요', '2022-11-17', 0, '강남구 역삼동 예솔솔파크 77층 8호입니다.', '2022-11-17', 'Y', 'Y', 4, 3, 4);
INSERT INTO TB_INQUIRE
VALUES(SEQ_INQUIRE.NEXTVAL, '주문 취소 요청합니다', '방금 결제 했는데 취소 부탁드려요', '2022-09-01', 0, '해당 상품 출고 전으로 주문 취소 되었습니다, 감사합니다.',  '2022-09-01', 'N', DEFAULT, 2, 1, 5);

INSERT INTO TB_LOCATION VALUES(SEQ_LOCATION.NEXTVAL,1,'희연배송지','박희연','01062612122','역삼 래미안 아파트','101동303호','06218','N','Y');
INSERT INTO TB_LOCATION VALUES(SEQ_LOCATION.NEXTVAL,2,'윤화배송지','이윤화','01064622323','역삼 래미안 아파트','103동503호','06218','N','Y');
INSERT INTO TB_LOCATION VALUES(SEQ_LOCATION.NEXTVAL,3,'혜정배송지','전혜정','01066632524','여의도 자이아파트','105동 809호','07324','N','Y');
INSERT INTO TB_LOCATION VALUES(SEQ_LOCATION.NEXTVAL,4,'지용배송지','정지용','01068642725','신길 목련아파트','101동 303호','07362','N','Y');
INSERT INTO TB_LOCATION VALUES(SEQ_LOCATION.NEXTVAL,5,'승협하우스','최승협','01060652926','여의도 자이아파트','106동 1103호','07324','N','Y');

INSERT INTO TB_ORDER VALUES(SEQ_ORDER.NEXTVAL,1,1,DEFAULT,'배송완료',NULL,'박희연','01062612122','역삼 래미안 아파트','101동303호','06218',NULL,400,200);
INSERT INTO TB_ORDER VALUES(SEQ_ORDER.NEXTVAL,2,1,DEFAULT,'배송완료',NULL,'이윤화','01064622323','역삼 래미안 아파트','103동503호','06218','부재시 문앞에 두고가주세요',500,300);
INSERT INTO TB_ORDER VALUES(SEQ_ORDER.NEXTVAL,3,2,DEFAULT,'배송완료',NULL,'전혜정','01066632524','여의도 자이아파트','105동 809호','07324','경비실에 맡겨주세요',500,400);
INSERT INTO TB_ORDER VALUES(SEQ_ORDER.NEXTVAL,4,1,DEFAULT,'배송완료',NULL,'정지용','01068642725','신길 목련아파트','101동 303호','07362',NULL,600,300);
INSERT INTO TB_ORDER VALUES(SEQ_ORDER.NEXTVAL,5,1,DEFAULT,'배송완료',NULL,'최승협','01060652926','여의도 자이아파트','106동 1103호','07324',NULL,700,400);

INSERT INTO TB_RETURN VALUES(SEQ_RETURN.NEXTVAL,'교환','사이즈가 맞지않아 교환신청합니다',1,1);
INSERT INTO TB_RETURN VALUES(SEQ_RETURN.NEXTVAL,'반품','안어울려서 환불합니다...',2,2);
INSERT INTO TB_RETURN VALUES(SEQ_RETURN.NEXTVAL,'교환','색상이 안어울려서 검정제품으로 교환원합니다',1,2);
INSERT INTO TB_RETURN VALUES(SEQ_RETURN.NEXTVAL,'반품','배송이 너무 늦게와서 환불요청드립니다.',2,3);
INSERT INTO TB_RETURN VALUES(SEQ_RETURN.NEXTVAL,'교환','바지사이즈가 맞지않아 S로 교환신청합니다.',5,5);

INSERT INTO TB_CART VALUES(SEQ_CART.NEXTVAL,3,1,1,'S',DEFAULT);
INSERT INTO TB_CART VALUES(SEQ_CART.NEXTVAL,8,3,2,'M',DEFAULT);
INSERT INTO TB_CART VALUES(SEQ_CART.NEXTVAL,1,1,3,'FREE',DEFAULT);
INSERT INTO TB_CART VALUES(SEQ_CART.NEXTVAL,3,3,4,'XL',DEFAULT);
INSERT INTO TB_CART VALUES(SEQ_CART.NEXTVAL,7,4,5,'L',DEFAULT); 

--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'블레이저 메인 사진','https://image.brandi.me/cproduct/2023/02/10/SB000000000001176832_1676013624_image5_S.jpeg',1,1);
--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'블레이저 서브 사진','https://image.brandi.me/cproduct/2023/02/10/SB000000000001176832_1676013624_image3_S.jpeg',1,2);
--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'블레이저 서브 사진','https://image.brandi.me/cproduct/2023/02/10/SB000000000001176832_1676013624_image2_S.jpeg',1,2);
--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'블레이저 설명 사진','<img src="https://image.brandi.me/media/488cc22e6cdca788f59c27a531a22167.jpg">',1,3);
--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'포켓플리스 메인사진','https://image.brandi.me/cproduct/2023/01/26/SB000000000000032889_1674717666_image1_S.jpeg',2,1);
--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'분홍 패딩 메인사진','https://image.brandi.me/cproduct/2023/02/13/SB000000000001336262_1676278968_image1_S.jpeg',3,1);
--INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,'야구자캣 메인사진','https://image.brandi.me/cproduct/2023/01/31/SB000000000000918406_1675149911_image1_S.jpeg',4,1);
INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,1,'FLOWER1.PNG','2023030721274313207.PNG','/resources/admin/product_upfiles/','2023-03-06',1,'N');
INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,1,'FLOWER2.PNG','2023030721295012303.PNG','/resources/admin/product_upfiles/','2023-03-06',2,'N');
INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,2,'FLOWER3.PNG','2023030722231311283.PNG','/resources/admin/product_upfiles/','2023-03-06',1,'N');
INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,3,'FLOWER4.PNG','2023030722250211238.PNG','/resources/admin/product_upfiles/','2023-03-06',1,'N');
INSERT INTO TB_PRODUCT_IMAGE VALUES(SEQ_PRODUCT_IMAGE.NEXTVAL,3,'FLOWER5.PNG','2023030722262214768.PNG','/resources/admin/product_upfiles/','2023-03-06',2,'N');

INSERT INTO TB_ANSWER_INSTAGRAM VALUES(SEQ_ANSWER_INSTAGRAM.NEXTVAL,'와.. 잘입었다..',SYSDATE,NULL,NULL,'N',3,2);
INSERT INTO TB_ANSWER_INSTAGRAM VALUES(SEQ_ANSWER_INSTAGRAM.NEXTVAL,'저 옷을 저렇게 매치했다니..',SYSDATE,NULL,NULL,'N',4,1);
INSERT INTO TB_ANSWER_INSTAGRAM VALUES(SEQ_ANSWER_INSTAGRAM.NEXTVAL,'구린데요',SYSDATE,NULL,NULL,'N',1,4);
INSERT INTO TB_ANSWER_INSTAGRAM VALUES(SEQ_ANSWER_INSTAGRAM.NEXTVAL,'최고에요!!',SYSDATE,NULL,NULL,'N',2,5);
INSERT INTO TB_ANSWER_INSTAGRAM VALUES(SEQ_ANSWER_INSTAGRAM.NEXTVAL,'한 수 배우고 갑니다.',SYSDATE,NULL,NULL,'N',5,3);

INSERT INTO TB_REVIEW_IMAGE
VALUES('멋진 운동화 후기사진','/resources/img1.jpg',1);
INSERT INTO TB_REVIEW_IMAGE
VALUES('멋진 숏자켓 후기사진','/resources/img2.jpg',2);
INSERT INTO TB_REVIEW_IMAGE
VALUES('멋진 후드티 후기사진','/resources/img3.jpg',3);
INSERT INTO TB_REVIEW_IMAGE
VALUES('멋진 조거팬츠 후기사진','/resources/img4.jpg',4);
INSERT INTO TB_REVIEW_IMAGE
VALUES('멋진 티셔츠 후기사진','/resources/img5.jpg',5);

INSERT INTO TB_OPTION VALUES(SEQ_OPTION.NEXTVAL, 'S', 10, 1);
INSERT INTO TB_OPTION VALUES(SEQ_OPTION.NEXTVAL, 'M', 15, 1);
INSERT INTO TB_OPTION VALUES(SEQ_OPTION.NEXTVAL, 'L', 13, 1);
INSERT INTO TB_OPTION VALUES(SEQ_OPTION.NEXTVAL, 'XL', 10, 1);
INSERT INTO TB_OPTION VALUES(SEQ_OPTION.NEXTVAL, 'FREE', 10, 5);

INSERT INTO TB_MILEAGE_HISTORY VALUES(SEQ_MILEAGE_HISTORY.NEXTVAL,'적립',300,1,1);
INSERT INTO TB_MILEAGE_HISTORY VALUES(SEQ_MILEAGE_HISTORY.NEXTVAL,'사용',200,2,2);
INSERT INTO TB_MILEAGE_HISTORY VALUES(SEQ_MILEAGE_HISTORY.NEXTVAL,'적립',300,3,3);
INSERT INTO TB_MILEAGE_HISTORY VALUES(SEQ_MILEAGE_HISTORY.NEXTVAL,'적립',100,4,4);
INSERT INTO TB_MILEAGE_HISTORY VALUES(SEQ_MILEAGE_HISTORY.NEXTVAL,'적립',150,5,5);
INSERT INTO TB_MILEAGE_HISTORY VALUES(SEQ_MILEAGE_HISTORY.NEXTVAL,'적립',200,5,5);

COMMIT;