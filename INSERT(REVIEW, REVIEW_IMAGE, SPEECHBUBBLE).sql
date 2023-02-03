-- COMMENT
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

COMMENT ON COLUMN TB_REVIEW_IMAGE.REVIEW_IMG_NO IS '이미지번호';
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

-- INSERT문
-- INSERT INTO TB_REVIEW VALUES(SEQ_REVIEW.NEXTVAL,'리뷰내용',별점,SYSDATE,'답변내용',답변날짜,'삭제여부',상품번호,회원번호,관리자번호);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '와 진짜 너무 예뻐여ㅠㅠ', 5, SYSDATE, '마일리지 적립 완료! 구매해주셔서 감사합니다~! 앞으로도 많이 이용해주세요!', SYSDATE,'N',1,1,1);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '흠,,, 생각보다 별루', 2, '2022-03-25', '마일리지 적립 완료! 상품이 불만족스러우셨나요?ㅠㅠ 앞으로 더 좋은 상품으로 찾아올테니, 또 이용해주세요!', '2022-03-26','Y',2,2,1);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '무난해요~ 흠냐륑~', 3, '2022-04-03', '마일리지 적립 완료! 구매해주셔서 감사합니다~! 앞으로도 많이 이용해주세요!', '2022-04-05','N',3,4,5);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '배송이 늦은거 빼고는 다 좋아용', 4, '2022-10-10', '마일리지 적립 완료! 구매해주셔서 감사합니다~! 앞으로도 많이 이용해주세요!', '2022-10-10','N',4,5,2);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '내돈,,,^^', 1, '2022-11-29', '마일리지 적립 완료! 상품이 불만족스러우셨나요?ㅠㅠ 앞으로 더 좋은 상품으로 찾아올테니, 또 이용해주세요!', '2022-11-30','Y',5,3,3);

-- INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_REVIEW.NEXTVAL,'이미지이름','이미지경로');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'멋진 운동화 후기사진','/resources/img1.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'멋진 숏자켓 후기사진','/resources/img2.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'멋진 후드티 후기사진','/resources/img3.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'멋진 조거팬츠 후기사진','/resources/img4.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'멋진 티셔츠 후기사진','/resources/img5.jpg');

-- INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '상품이름', '상품사이즈', '가격', '링크', '브랜드번호', '게시글번호', '상품번호', '카테고리번호');
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진숏자켓', 'S', 189000, 'https://www.seoulstore.com/products/1523056/detail?ecommerceListName=brandPdt_978', 2, 1, 2, 2);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진운동화', '220', 25900, 'https://www.nike.com/kr/t/%EC%9D%B8%EB%B9%88%EC%84%9C%EB%B8%94-3-%EC%97%AC%EC%84%B1-%EB%A1%9C%EB%93%9C-%EB%9F%AC%EB%8B%9D%ED%99%94-UbyT9MX4/DR2660-100', 1, 1, 1, 4);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진후드티', 'M', 33900, 'https://www.seoulstore.com/products/1548017/detail?ecommerceListName=searchResult_%EC%95%84%EB%94%94%EB%8B%A4%EC%8A%A4', 3, 2, 3, 2);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '멋진조거팬츠', 'XL', 98100, 'https://www.seoulstore.com/products/1651356/detail?ecommerceListName=searchResult_%ED%82%A4%EB%A5%B4%EC%8B%9C', 4, 4, 4, 3);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '내가갖고싶은티셔츠', 'S', 119000, 'https://www.seoulstore.com/products/1679687/detail?ecommerceListName=searchResult_OIOI', 5, 3, NULL, 2);















