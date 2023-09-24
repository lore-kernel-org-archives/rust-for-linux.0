Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F563F
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 11:02:36 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5DA100
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 04:02:35 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-277317a0528so301220a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 04:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695553355; x=1696158155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nEGMFWLqoaw/7KaStJ4tX6XJ1n60sEhDwS830aCFrM=;
        b=nN/4bjmeGlquaiC5fADBK0naZrWvLx9PHxsnoAqwOGeZpU3f1NjLHRQHmgAoT0tWix
         LKHsvyTxVM3pUhrbA/VHvM+UUq0XVkHypHcX+qT3qT/fvin2Z/H/pDxEv8EMCau82HZp
         TYE/kUW3TpF4phnoc8x3zjE7pxghj6IgwzMeyG2iGr7i1ZH5dNLKJbSPIBPGrSWvUjpc
         jUAJ1tP6im0RVAvfwiS/MspACFaHCPfZKXWQLG9r9gcnABrp8lntyi4pjUrrrpdIXhg5
         CYJVrF2eFbH/7f2MyuFOy/Q0y2NPiQ6tlLEDtBBT53pRLmiDlzbHuFNEBCz5F5zd/YY1
         Tj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695553355; x=1696158155;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+nEGMFWLqoaw/7KaStJ4tX6XJ1n60sEhDwS830aCFrM=;
        b=mCpxlsoBgLVuAc5UWbh0bMCpAl0iFjJyNm2PGxHfyqP1LV71QHIr05sVekfFNdbRCH
         PMpeDzr9J70kYiAdavuSPSGmGeKKY1v01EG1/UjeiQ4riIrHnN6zBhLYxeiUNpgNh2C/
         tM9BbX1Mx076gCyFVl90HorEc8c5djS8tMLQYaAZSrOK/eVyagPVKMr5GV8Ser28w6BU
         KJu0qG32o6YVPV4RnSd/RSMWQ6XV8Qm2jfc0fagHHVVMuEY6LlZGxFwAlDMGaBm2cBpc
         5PligjzS/jCq8nBYpu9PJC59zl9j9iWw3NmFrAh8ooWGgGp5O4elQkwqz6OBFCePIy3x
         YvYQ==
X-Gm-Message-State: AOJu0YyF5pjTEp1C+UAm1Zp4lsIEmEwG6GIUeua8yePffwLFAiZ9rVKL
	EioulY0PnH9T2EFQU246QZU=
X-Google-Smtp-Source: AGHT+IFxIpQ8IKuI/y6E2qko/7oxqf6X1MzGsAMsjOBqXq2T1SllRGgLYKhSG0wSbxFWaRy1Pdvh+w==
X-Received: by 2002:a17:90a:4f0e:b0:26d:414d:a98a with SMTP id p14-20020a17090a4f0e00b0026d414da98amr3714642pjh.1.1695553354861;
        Sun, 24 Sep 2023 04:02:34 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id sf9-20020a17090b51c900b002609cadc56esm6027154pjb.11.2023.09.24.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 04:02:34 -0700 (PDT)
Date: Sun, 24 Sep 2023 20:00:56 +0900 (JST)
Message-Id: <20230924.200056.171141856238500181.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72m_jv3a2umn-Ogho+c1zs5+=1XuVjE3K7mhw9w6gwR3Rw@mail.gmail.com>
References: <CANiq72miU6stf5fmxuRo4gb2zxUYoQuQV9T2zpcBrH5pn0KWSA@mail.gmail.com>
	<20230924.183837.147734556664207389.fujita.tomonori@gmail.com>
	<CANiq72m_jv3a2umn-Ogho+c1zs5+=1XuVjE3K7mhw9w6gwR3Rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

T24gU3VuLCAyNCBTZXAgMjAyMyAxMjoxMDo1OCArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBTdW4sIFNlcCAyNCwgMjAy
MyBhdCAxMTozOOKAr0FNIEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWls
LmNvbT4gd3JvdGU6DQo+Pg0KPj4gV2l0aCB0aGF0IGFwcHJvYWNoLCB5b3UgY2FuIGVuYWJsZSBi
b3RoIEMgYW5kIFJ1c3QgdmVyc2lvbnM/IEl0IG1pZ2h0DQo+PiBicmVha3MgYXV0by1tb2R1bGUt
bG9hZGluZy4NCj4gDQo+IE5vLCBJIG1lYW50IHRoYXQgaXQgd291bGQgc3RpbGwgYmUgb25lIG9y
IHRoZSBvdGhlciwgaS5lLiBgTmAgd291bGQNCj4gbWVhbiAidXNlIHRoZSBub3JtYWwsIGV4aXN0
aW5nLCBwcm9kdWN0aW9uIEMgb25lIjsgd2hpbGUgYFlgIHdvdWxkDQo+IHJlcGxhY2UgaXQgd2l0
aCB0aGUgUnVzdCByZWZlcmVuY2UgZHJpdmVyLg0KDQpJIHNlZS4NCg0KPj4gSWYgYSBtb2R1bGUg
c2VsZWN0cyBDT05GSUdfQVg4ODc5NkJfUEhZLCB0aGVuIHdlIG5lZWQNCj4+IENPTkZJR19BWDg4
Nzk2Ql9DX1BIWSBvciBDT05GSUdfQVg4ODc5NkJfUlVTVF9QSFkuDQo+IA0KPiBBcmUgeW91IHRh
bGtpbmcgYWJvdXQgdGhlIGlubmVyIG9uZSBwZXJoYXBzPyBXaGF0IEkgbWVhbnQgaXMgdGhhdA0K
PiBgb2JqLSQoQ09ORklHX0FYODg3OTZCX1BIWSlgIGV4cGFuZHMgdG8gYG9iai1gIGlmDQo+IGBD
T05GSUdfQVg4ODc5NkJfUEhZYCBpcyBub3QgZGVmaW5lZCwgc28gaXQgYWxyZWFkeSBkb2VzIHRo
ZSBqb2Igb2YNCj4gdGhlIG91dGVyIGBpZmRlZmAsIHJpZ2h0Pw0KDQpBaCwgd291bGQgd29yaywg
SSBndWVzcy4NCg0KU29tZXRoaW5nIHNpbXBsZXIgbGlrZSB0aGUgZm9sbG93aW5nIG1pZ2h0IHdv
cmsuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkvS2NvbmZpZyBiL2RyaXZlcnMvbmV0
L3BoeS9LY29uZmlnDQppbmRleCAxMDc4ODBkMTNkMjEuLmU0ZDk0MWYwZWJlNCAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvbmV0L3BoeS9LY29uZmlnDQorKysgYi9kcml2ZXJzL25ldC9waHkvS2NvbmZp
Zw0KQEAgLTEwNyw2ICsxMDcsMTMgQEAgY29uZmlnIEFYODg3OTZCX1BIWQ0KIAkgIEN1cnJlbnRs
eSBzdXBwb3J0cyB0aGUgQXNpeCBFbGVjdHJvbmljcyBQSFkgZm91bmQgaW4gdGhlIFgtU3VyZiAx
MDANCiAJICBBWDg4Nzk2QiBwYWNrYWdlLg0KIA0KK2NvbmZpZyBBWDg4Nzk2Ql9SVVNUX1BIWQ0K
Kwlib29sICJSdXN0IHJlZmVyZW5jZSBkcml2ZXIiDQorCWRlcGVuZHMgb24gUlVTVCAmJiBBWDg4
Nzk2Ql9QSFkNCisJZGVmYXVsdCBuDQorCWhlbHANCisJICBVc2VzIHRoZSBSdXN0IHZlcnNpb24g
ZHJpdmVyIGZvciBBc2l4IFBIWXMuDQorDQogY29uZmlnIEJST0FEQ09NX1BIWQ0KIAl0cmlzdGF0
ZSAiQnJvYWRjb20gNTRYWCBQSFlzIg0KIAlzZWxlY3QgQkNNX05FVF9QSFlMSUINCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUgYi9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUN
CmluZGV4IGM5NDVlZDliZDE0Yi4uNThkN2RmYjA5NWFiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9u
ZXQvcGh5L01ha2VmaWxlDQorKysgYi9kcml2ZXJzL25ldC9waHkvTWFrZWZpbGUNCkBAIC00MSw3
ICs0MSwxMSBAQCBhcXVhbnRpYS1vYmpzCQkJKz0gYXF1YW50aWFfaHdtb24ubw0KIGVuZGlmDQog
b2JqLSQoQ09ORklHX0FRVUFOVElBX1BIWSkJKz0gYXF1YW50aWEubw0KIG9iai0kKENPTkZJR19B
VDgwM1hfUEhZKQkrPSBhdDgwM3gubw0KLW9iai0kKENPTkZJR19BWDg4Nzk2Ql9QSFkpCSs9IGF4
ODg3OTZiLm8NCitpZmRlZiBDT05GSUdfQVg4ODc5NkJfUlVTVF9QSFkNCisgIG9iai0kKENPTkZJ
R19BWDg4Nzk2Ql9QSFkpCSs9IGF4ODg3OTZiX3J1c3Qubw0KK2Vsc2UNCisgIG9iai0kKENPTkZJ
R19BWDg4Nzk2Ql9QSFkpCSs9IGF4ODg3OTZiLm8NCitlbmRpZg0KIG9iai0kKENPTkZJR19CQ001
NDE0MF9QSFkpCSs9IGJjbTU0MTQwLm8NCiBvYmotJChDT05GSUdfQkNNNjNYWF9QSFkpCSs9IGJj
bTYzeHgubw0KIG9iai0kKENPTkZJR19CQ003WFhYX1BIWSkJKz0gYmNtN3h4eC5vDQo=
