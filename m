Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3097F
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 09:38:40 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44321F1
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 02:38:39 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c5cc63ce27so5944245ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695548319; x=1696153119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBVxYt95kIeJYqZ+3afrtCLsRt6Pynft246oxEJxxqE=;
        b=c9Wfx6XNHsMPELYY8QSnKT72zTC7h1QXIuv640oCEsxRWC/dsa/hrvG1eC7VyrEw7a
         3wwYMQ12qYxzzBMSjdU1JlRX+5gWF7NXtOZCTFIt2qQ1f91hyhssdUrPoOXIa83zw2We
         5SJ0MpB/5kWksyruGX5jZeivLc1PMVftPGgt4BYOI1FW7yJV7P35xCTTVOVLfrX3BX+s
         GmSGIs2xROohgiCLLtAsi7duOEWAqnFL4M3/jUlxl3Olz6uHXROlbpaHd++6HCdeHfzh
         st7oaf0CE/6e5syxWmE7AexflTNuKUBr9XzlOdg5MVN93yGXuDBvoNm1bGCteef8Us5C
         vsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695548319; x=1696153119;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CBVxYt95kIeJYqZ+3afrtCLsRt6Pynft246oxEJxxqE=;
        b=TkFPYlBoT9cMVSn52JgN6C0u36KtYsam/JgrnDHG6yaD6wRGMi3xqMpKGfbSjMp789
         VfOB+of5b1z+tJlExsKclaXVxcq4z7Q3ts8voLTCkvt/OWKdvZIPPJQI+ar76rKED1ex
         hgHWd8VqVrxf5JBOmZEzGllf6CeUp+t5QJeFeoNnG+vNK3jDkiySHW4hsR5d0lPoJ9A9
         xWn8f07Ij2eigdx/1wKRiAKONz+yPHD6+70jNvU8dGiSK9ZY3UnCThY14YeY2932qlLg
         AFbWeh87rPentZla9N1kKzK0qk6VnZKPGD66EQw+20fiQK6wkv25DC2QAJQ2zLJkcOtK
         eAbg==
X-Gm-Message-State: AOJu0YxVVaxJ90ZVb8AgwP8KU5bp+YMKtw8qpJiKBJ6dXI/ni13uMSmq
	cRuc98Jq8ZMTm083a8tf15s=
X-Google-Smtp-Source: AGHT+IHTqu1hN4cYnttgBaC03R6z5g2+MsBMqoN1jSRGGG5/p76eWwaKHWrrCr7d5WaV3CaaDvMxdA==
X-Received: by 2002:a17:902:da91:b0:1c3:6d97:e897 with SMTP id j17-20020a170902da9100b001c36d97e897mr4695137plx.5.1695548318585;
        Sun, 24 Sep 2023 02:38:38 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id jb22-20020a170903259600b001b81a97860asm6568975plb.27.2023.09.24.02.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 02:38:38 -0700 (PDT)
Date: Sun, 24 Sep 2023 18:38:37 +0900 (JST)
Message-Id: <20230924.183837.147734556664207389.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72miU6stf5fmxuRo4gb2zxUYoQuQV9T2zpcBrH5pn0KWSA@mail.gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
	<20230924064902.1339662-4-fujita.tomonori@gmail.com>
	<CANiq72miU6stf5fmxuRo4gb2zxUYoQuQV9T2zpcBrH5pn0KWSA@mail.gmail.com>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

SGksDQoNCk9uIFN1biwgMjQgU2VwIDIwMjMgMTA6MDU6MzAgKzAyMDANCk1pZ3VlbCBPamVkYSA8
bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gT24gU3VuLCBTZXAg
MjQsIDIwMjMgYXQgODo0OeKAr0FNIEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3Jp
QGdtYWlsLmNvbT4gd3JvdGU6DQo+Pg0KPj4gK2NvbmZpZyBBWDg4Nzk2Ql9DX1BIWQ0KPj4gK2Nv
bmZpZyBBWDg4Nzk2Ql9SVVNUX1BIWQ0KPiANCj4gUGVyaGFwcyBmb3IgdGhpcyBraW5kIG9mICJS
dXN0IHJlZmVyZW5jZSBkcml2ZXIiIChhbiBleGNlcHRpb24gdG8gdGhlDQo+ICJubyBkdXBsaWNh
dGUgZHJpdmVycyIgcnVsZSkgd2UgY291bGQgZG8gaXQgYXMgYSBzdWZmaXggb2YgdGhlIG1haW4N
Cj4gb3B0aW9uLCBlLmcuIGBBWDg4Nzk2Ql9QSFlfQ2AgYW5kIGBBWDg4Nzk2Ql9QSFlfUlVTVGAg
aW5zdGVhZCBvZiBpbg0KPiB0aGUgbWlkZGxlLg0KDQpMb29rcyBsaWtlIHRoZSBjb25maWcgbmFt
ZXMgb2YgYWxsIFBIWSBkcml2ZXJzIGVuZCB3aXRoIF9QSFkgc28gSSBwdXQNCml0IGluIHRoZSBt
aWRkbGUuIEkgaGF2ZSBubyBwcmVmZXJlbmNlLg0KDQo+IEluIGFkZGl0aW9uLCBtb3JlIHRoYW4g
MiBjaG9pY2VzIGlzIHVubGlrZWx5ICh0aGlzIGlzIGFscmVhZHkgYW4NCj4gZXhjZXB0aW9uKSwg
c28gcGVyaGFwcyBgY2hvaWNlYCBpcyBvdmVya2lsbCBoZXJlLiBXaGF0IGFib3V0IGluc3RlYWQg
YQ0KPiBgYm9vbGAgd2l0aCB0aXRsZSAiVXNlIFJ1c3QgaW1wbGVtZW50YXRpb24iIGluc3RlYWQg
YW5kIGRlZmF1bHQgTj8NCg0KV2l0aCB0aGF0IGFwcHJvYWNoLCB5b3UgY2FuIGVuYWJsZSBib3Ro
IEMgYW5kIFJ1c3QgdmVyc2lvbnM/IEl0IG1pZ2h0DQpicmVha3MgYXV0by1tb2R1bGUtbG9hZGlu
Zy4NCg0KPj4gLW9iai0kKENPTkZJR19BWDg4Nzk2Ql9QSFkpICAgICArPSBheDg4Nzk2Yi5vDQo+
PiAraWZkZWYgQ09ORklHX0FYODg3OTZCX1BIWQ0KPj4gKyAgaWZkZWYgQ09ORklHX0FYODg3OTZC
X0NfUEhZDQo+PiArICAgIG9iai0kKENPTkZJR19BWDg4Nzk2Ql9QSFkpICs9IGF4ODg3OTZiLm8N
Cj4+ICsgIGVsc2UNCj4+ICsgICAgb2JqLSQoQ09ORklHX0FYODg3OTZCX1BIWSkgKz0gYXg4ODc5
NmJfcnVzdC5vDQo+PiArICBlbmRpZg0KPj4gK2VuZGlmDQo+IA0KPiBJcyB0aGUgb3V0ZXIgYGlm
ZGVmYCBuZWVkZWQ/DQoNClRoZXJlIGFyZSBvdGhlciBtb2R1bGVzIHRoYXQgc2VsZWN0IENPTkZJ
R19BWDg4Nzk2Ql9QSFkuIEkgY2FuJ3QgZmluZA0KYSB3YXkgdG8gbWFrZSBhIG1vZHVsZSBzZWxl
Y3Qgb25lIG9mIG11bHRpcGxlIG9waXRpb25zLA0KQ09ORklHX0FYODg3OTZCX0NfUEhZIG9yIENP
TkZJR19BWDg4Nzk2Ql9SVVNUX1BIWS4NCg0KSWYgYSBtb2R1bGUgc2VsZWN0cyBDT05GSUdfQVg4
ODc5NkJfUEhZLCB0aGVuIHdlIG5lZWQNCkNPTkZJR19BWDg4Nzk2Ql9DX1BIWSBvciBDT05GSUdf
QVg4ODc5NkJfUlVTVF9QSFkuDQo=
