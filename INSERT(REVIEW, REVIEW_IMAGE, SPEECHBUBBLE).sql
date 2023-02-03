-- COMMENT
COMMENT ON COLUMN TB_REVIEW.REVIEW_NO IS '�����ȣ';
COMMENT ON COLUMN TB_REVIEW.REVIEW_CONTENT IS '���䳻��';
COMMENT ON COLUMN TB_REVIEW.REVIEW_STAR IS '����';
COMMENT ON COLUMN TB_REVIEW.REVIEW_DATE IS '�����ۼ���¥';
COMMENT ON COLUMN TB_REVIEW.REVIEW_ANS_CONTENT IS '�亯����';
COMMENT ON COLUMN TB_REVIEW.REVIEW_ANS_DATE IS '�亯��¥';
COMMENT ON COLUMN TB_REVIEW.DEL_YN IS '��������';
COMMENT ON COLUMN TB_REVIEW.PRODUCT_NO2 IS '��ǰ��ȣ';
COMMENT ON COLUMN TB_REVIEW.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_REVIEW.MANAGER_NO IS '�����ڹ�ȣ';

COMMENT ON COLUMN TB_REVIEW_IMAGE.REVIEW_IMG_NO IS '�̹�����ȣ';
COMMENT ON COLUMN TB_REVIEW_IMAGE.REVIEW_IMG_NAME IS '�̹����̸�';
COMMENT ON COLUMN TB_REVIEW_IMAGE.REVIEW_IMG_SRC IS '�̹������';

COMMENT ON COLUMN TB_SPEECHBUBBLE.BUBLLE_NO IS '��ǳ����ȣ';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_NAME IS '��ǰ�̸�';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_SIZE IS '��ǰ������';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_PRICE IS '����';
COMMENT ON COLUMN TB_SPEECHBUBBLE.LINK IS '��ũ';
COMMENT ON COLUMN TB_SPEECHBUBBLE.BRAND_NO IS '�귣���ȣ';
COMMENT ON COLUMN TB_SPEECHBUBBLE.COM_NO IS '�Խñ۹�ȣ';
COMMENT ON COLUMN TB_SPEECHBUBBLE.PRODUCT_NO IS '��ǰ��ȣ';
COMMENT ON COLUMN TB_SPEECHBUBBLE.CATEGORY_NO IS 'ī�װ���ȣ';

-- INSERT��
-- INSERT INTO TB_REVIEW VALUES(SEQ_REVIEW.NEXTVAL,'���䳻��',����,SYSDATE,'�亯����',�亯��¥,'��������',��ǰ��ȣ,ȸ����ȣ,�����ڹ�ȣ);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '�� ��¥ �ʹ� �������Ф�', 5, SYSDATE, '���ϸ��� ���� �Ϸ�! �������ּż� �����մϴ�~! �����ε� ���� �̿����ּ���!', SYSDATE,'N',1,1,1);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '��,,, �������� ����', 2, '2022-03-25', '���ϸ��� ���� �Ϸ�! ��ǰ�� �Ҹ���������̳���?�Ф� ������ �� ���� ��ǰ���� ã�ƿ��״�, �� �̿����ּ���!', '2022-03-26','Y',2,2,1);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '�����ؿ�~ ��ķ�~', 3, '2022-04-03', '���ϸ��� ���� �Ϸ�! �������ּż� �����մϴ�~! �����ε� ���� �̿����ּ���!', '2022-04-05','N',3,4,5);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '����� ������ ����� �� ���ƿ�', 4, '2022-10-10', '���ϸ��� ���� �Ϸ�! �������ּż� �����մϴ�~! �����ε� ���� �̿����ּ���!', '2022-10-10','N',4,5,2);
INSERT INTO TB_REVIEW 
VALUES(SEQ_REVIEW.NEXTVAL, '����,,,^^', 1, '2022-11-29', '���ϸ��� ���� �Ϸ�! ��ǰ�� �Ҹ���������̳���?�Ф� ������ �� ���� ��ǰ���� ã�ƿ��״�, �� �̿����ּ���!', '2022-11-31','Y',5,3,3);

-- INSERT INTO TB_INSTA_IMAGE VALUES(SEQ_REVIEW.NEXTVAL,'�̹����̸�','�̹������');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'���� �ȭ �ı����','/resources/img1.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'���� ������ �ı����','/resources/img2.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'���� �ĵ�Ƽ �ı����','/resources/img3.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'���� �������� �ı����','/resources/img4.jpg');
INSERT INTO TB_INSTA_IMAGE
VALUES(SEQ_INSTA_IMAGE.NEXTVAL,'���� Ƽ���� �ı����','/resources/img5.jpg');

-- INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '��ǰ�̸�', '��ǰ������', '����', '��ũ', '�귣���ȣ', '�Խñ۹�ȣ', '��ǰ��ȣ', 'ī�װ���ȣ');
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '����������', 'S', 189000, 'https://www.seoulstore.com/products/1523056/detail?ecommerceListName=brandPdt_978', 2, 1, 2, 2);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '�����ȭ', '220', 25,900, 'https://www.nike.com/kr/t/%EC%9D%B8%EB%B9%88%EC%84%9C%EB%B8%94-3-%EC%97%AC%EC%84%B1-%EB%A1%9C%EB%93%9C-%EB%9F%AC%EB%8B%9D%ED%99%94-UbyT9MX4/DR2660-100', 1, 1, 1, 4);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '�����ĵ�Ƽ', 'M', 33,900, 'https://www.seoulstore.com/products/1548017/detail?ecommerceListName=searchResult_%EC%95%84%EB%94%94%EB%8B%A4%EC%8A%A4', 3, 2, 3, 2);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '������������', 'XL', 98,100, 'https://www.seoulstore.com/products/1651356/detail?ecommerceListName=searchResult_%ED%82%A4%EB%A5%B4%EC%8B%9C', 4, 4, 4, 3);
INSERT INTO TB_SPEECHBUBBLE VALUES(SEQ_SPEECHBUBBLE.NEXTVAL, '�����������Ƽ����', 'S', 119,000, 'https://www.seoulstore.com/products/1679687/detail?ecommerceListName=searchResult_OIOI', 5, 3, NULL, 2);















