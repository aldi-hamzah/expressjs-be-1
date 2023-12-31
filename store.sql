PGDMP                         {            store    15.3    15.3 3    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    19755    store    DATABASE     |   CREATE DATABASE store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE store;
                postgres    false            �            1259    19764    customer    TABLE     �   CREATE TABLE public.customer (
    id integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    user_id integer,
    createdat timestamp without time zone,
    updatedat timestamp without time zone
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    19763    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.customer_id_seq;
       public          postgres    false    217            5           0    0    customer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;
          public          postgres    false    216            �            1259    19811    order_detail    TABLE     �   CREATE TABLE public.order_detail (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    createdat timestamp without time zone,
    updatedat timestamp without time zone
);
     DROP TABLE public.order_detail;
       public         heap    postgres    false            �            1259    19810    order_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.order_detail_id_seq;
       public          postgres    false    225            6           0    0    order_detail_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;
          public          postgres    false    224            �            1259    19776    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    totalproduct integer,
    totalprice numeric,
    createdat timestamp without time zone,
    updatedat timestamp without time zone
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    19775    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    219            7           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    218            �            1259    19797    product    TABLE     <  CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    category_id integer,
    price numeric,
    image character varying(200),
    createdat timestamp without time zone,
    updatedat timestamp without time zone,
    quantity integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    19790    product_category    TABLE     �   CREATE TABLE public.product_category (
    id integer NOT NULL,
    name character varying(50),
    description character varying(200),
    createdat timestamp with time zone,
    updatedat timestamp with time zone
);
 $   DROP TABLE public.product_category;
       public         heap    postgres    false            �            1259    19789    product_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.product_category_id_seq;
       public          postgres    false    221            8           0    0    product_category_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;
          public          postgres    false    220            �            1259    19796    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    223            9           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    222            �            1259    19757    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50),
    createdat timestamp with time zone,
    updatedat timestamp with time zone,
    password text
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    19756    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    215            :           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    214                       2604    19767    customer id    DEFAULT     j   ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);
 :   ALTER TABLE public.customer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    19814    order_detail id    DEFAULT     r   ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);
 >   ALTER TABLE public.order_detail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    19779 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    19800 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    19793    product_category id    DEFAULT     z   ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);
 B   ALTER TABLE public.product_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            ~           2604    19760    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            &          0    19764    customer 
   TABLE DATA           Z   COPY public.customer (id, firstname, lastname, user_id, createdat, updatedat) FROM stdin;
    public          postgres    false    217   �9       .          0    19811    order_detail 
   TABLE DATA           `   COPY public.order_detail (id, order_id, product_id, quantity, createdat, updatedat) FROM stdin;
    public          postgres    false    225   �9       (          0    19776    orders 
   TABLE DATA           ]   COPY public.orders (id, user_id, totalproduct, totalprice, createdat, updatedat) FROM stdin;
    public          postgres    false    219   i:       ,          0    19797    product 
   TABLE DATA           s   COPY public.product (id, name, description, category_id, price, image, createdat, updatedat, quantity) FROM stdin;
    public          postgres    false    223   �:       *          0    19790    product_category 
   TABLE DATA           W   COPY public.product_category (id, name, description, createdat, updatedat) FROM stdin;
    public          postgres    false    221   �=       $          0    19757    user 
   TABLE DATA           N   COPY public."user" (id, username, createdat, updatedat, password) FROM stdin;
    public          postgres    false    215   R>       ;           0    0    customer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.customer_id_seq', 2, true);
          public          postgres    false    216            <           0    0    order_detail_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.order_detail_id_seq', 16, true);
          public          postgres    false    224            =           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 6, true);
          public          postgres    false    218            >           0    0    product_category_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.product_category_id_seq', 3, true);
          public          postgres    false    220            ?           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 21, true);
          public          postgres    false    222            @           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 22, true);
          public          postgres    false    214            �           2606    19769    customer customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    217            �           2606    19816    order_detail order_detail_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_detail DROP CONSTRAINT order_detail_pkey;
       public            postgres    false    225            �           2606    19783    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    19795 &   product_category product_category_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.product_category DROP CONSTRAINT product_category_pkey;
       public            postgres    false    221            �           2606    19804    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    223            �           2606    19762    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    215            �           2606    19805    product fk_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id);
 @   ALTER TABLE ONLY public.product DROP CONSTRAINT fk_category_id;
       public          postgres    false    223    3211    221            �           2606    19817    order_detail fk_order_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES public.orders(id);
 B   ALTER TABLE ONLY public.order_detail DROP CONSTRAINT fk_order_id;
       public          postgres    false    219    3209    225            �           2606    19822    order_detail fk_product_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(id);
 D   ALTER TABLE ONLY public.order_detail DROP CONSTRAINT fk_product_id;
       public          postgres    false    225    3213    223            �           2606    19770    customer fk_user_id    FK CONSTRAINT     s   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);
 =   ALTER TABLE ONLY public.customer DROP CONSTRAINT fk_user_id;
       public          postgres    false    215    3205    217            �           2606    19784    orders fk_user_id    FK CONSTRAINT     q   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_user_id;
       public          postgres    false    219    215    3205            &   L   x�3�t�I���H̭J��42�4202�50�54S04�20�25�&�e�Xՙ�id�Pf�``feb T�M�+F��� oT�      .   c   x�m��� �\i� b���_G�����%����7���٦���v(FG�6{� =�Q�C��4�Hg���W;z��<��a�7��|@ 5�      (   D   x�3�4�4�4��0 N##c]3]CsC+CC+#t1K+#.3N3�6���*�1�LL�b���� �      ,   �  x��VMo�6<K���"b���ܛ�-�u� ��B>>fk���m���R�������I��
d�s���C�n���'��{b�����ݔB��Sb���O�ʎ-���0%�p��[6WC��,�����0�5��'��ޜ��}@������,OZ��f�?w3�\7Ѐ���x�)��	R�^gc���9� �����
,���㿃�`���ʚp���M`���%���
��0��p<O3M�T���T�X�i,�Tk�#+�)�zG7�qJ�j�q�y��up��ԫ'Vp"VyFV�'�kE���a����܍CYF��H,O�a��q,�2ֈƬ��!�e�JiE:�)��Ҩ���w�1݂k~{`�c%���O���4Zɡ��.甽3V$�Q�$�V��`P�⛛r*����RQ���E�%k���&2�9!OA&���n�"��|�:��-�}(��W�M�DT	 
��
�D�ب�S!�oU�;�I�gx5�h���Ou�����g��#A ��6C�ZIŴ��I��]ոP_u��^]�����(s�B�ՠ���cN�jBn�%.c���={}�6^�s�'gH�Hb�4��9n���,�3��m��j��_��Őu~�)Q�UJ��I���.9g�����+&[��w�o]�5���T��ե���:p�1�����	��2զ'�6���˘2���m��ý
      *   �   x�}��� E��o�h�o��S�#�1�}mW�����\Nn6��H���gHN'X;�#�&%�	Y0Up\����+�J)�O��O� w�}�
'��	�����.�M�~m)�d�!axł��MƁ�2�0��h�7g�=���]%�
���KJ���O~      $   �  x���˒�@�<�,ܥ����씫�`D����""��M���l�����S���I��A �W@^�°"�E,�`9$|�N3�(�cP��U& ��½  ,br�t��π��%u������fH�1���&�4F�VmBl��.م#sm�*f5����t��S�O����7J��}עYz�VCNr�
�� ��(���7�h󳉷&��½��yϥ��{�Z'��)���{|h>�A�I���hom�t�o%��'%5j��K,akE��	��9�aD����73����P��2��PEExlf���
��p��w���-�L$BqW�},�"|ڎN|3�1�l+OT�3��S�������.Os�U��x�L#E�);[>�5�s9F�4���ⴞ��A�P+�h�6fH�N��ጅZ���ܩ����lX{B	Ww��e�?ζ�L#߷�e�ӕԀ�o�d�ʵ��nu2ՙ���$��f`�ڃ��c٦~�E}�H�C     