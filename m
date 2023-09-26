Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6F26E34
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 13:46:38 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE1695
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 06:46:33 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c45c45efeeso9640795ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695735992; x=1696340792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUOYDINzw29weh/n5c5Mj1zlRGPRWHz+wTMRFGWQy70=;
        b=UcUcSYWYa41fWbWnD7Bw08B+EsIuOYkBddSGK7l+iHomJQPap4hNJPmc5mpxbMi62f
         vNOFd2dbHuyEDiOqsdTykUctvioZCl4IkmCpsRm8QGSkLvPT04fqOAhJBENgjEpvFwmT
         d4aVo3W5EOi/t5yUfogfT3nzxlV7d+AmVyU/HF6LiQN2Br8R5zxYGpYSgXNdEETdt73P
         DiI6eRKaANaCMR8tbnRYS6ZcF/UvgDpVYRsHFMaxtl5OtiisacQOQmxRFGY4QYS3j9Sd
         AWyIZp06RFVDOE0IrH3aqb0LJjgQI9FP1EY8n9o01EK0LDzp9tBf0f7pM3qgmHKlxg85
         ePPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695735992; x=1696340792;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SUOYDINzw29weh/n5c5Mj1zlRGPRWHz+wTMRFGWQy70=;
        b=LFnmaxYLx/7wIQY6MIAa9+ht2PxU11VjYATFGA5LqLWikzbGuFqPl7lbmNE1qfQ9NP
         fgReXBV26CcmBRyLYdtDpt1lgOuUyOB/DYJLDX2eYhh2Ry/3Ahi/XG/Oj6nRP+M6KtxJ
         4QbeQIoA02mTRtXIDJCwrTLkwgLtJjwuNt5WJTgshgQIJMxCmN5DZUQyx51H2qRdt+UL
         CYGcEsoHjfQTIn5XDAPTuIouru4BSbyYLTS4AQBW8DHA/Y47Z6UZP+/drpFqh2P7xJ7L
         rN7Af5FesgezxnIiLM500MYJHyddsYLH8ofCGJ+tPbmxJxGAudTNG1tTjLkzF2vdtN7u
         i5sA==
X-Gm-Message-State: AOJu0YxSde3OkCoYUe0gFUzagDln+BXv510fjfbEEpnbBqQ0RUj2GJc+
	SC2akpX/J2DkArQmo+aQSuI=
X-Google-Smtp-Source: AGHT+IFOxuHi2G99tEoTfs2Vk11D90G49Kk6eEqrfhuMKoqRjCcKMsm1RkGd7aSXGLcYckMsWx7z2A==
X-Received: by 2002:a17:902:e74f:b0:1c4:1cd3:8062 with SMTP id p15-20020a170902e74f00b001c41cd38062mr11949936plf.2.1695735992410;
        Tue, 26 Sep 2023 06:46:32 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090274cb00b001bc445e2497sm6971863plt.79.2023.09.26.06.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:46:31 -0700 (PDT)
Date: Tue, 26 Sep 2023 22:46:30 +0900 (JST)
Message-Id: <20230926.224630.1323587629112314285.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, benno.lossin@proton.me,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72nO=Eje0dv_NCagvTzOLU7WkfM-bwqH33z_kC=f=m1m1A@mail.gmail.com>
References: <70dbdfd2-9e8d-6985-ae42-0d4f1a7dcef9@proton.me>
	<20230925.192433.108741056500744806.fujita.tomonori@gmail.com>
	<CANiq72nO=Eje0dv_NCagvTzOLU7WkfM-bwqH33z_kC=f=m1m1A@mail.gmail.com>
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

SGksDQoNCk9uIE1vbiwgMjUgU2VwIDIwMjMgMTc6NDE6NDEgKzAyMDANCk1pZ3VlbCBPamVkYSA8
bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gT24gTW9uLCBTZXAg
MjUsIDIwMjMgYXQgMTI6MjTigK9QTSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9y
aUBnbWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IEknbSBub3Qgc3VyZSBlaXRoZXIuIEkgaGF2ZSBu
byBwcmVmZXJlbmNlIHRob3VnaC4NCj4gDQo+IE9uZSB3YXkgd2UgdXNlZCBpbiBvdGhlciBwbGFj
ZXMgaW4gdGhlIHBhc3QgaXM6DQo+IA0KPiAgICAgdG9fcmVzdWx0KC4uLik/Ow0KPiAgICAgT2so
Li4uKQ0KPiANCj4gQnkgdGhlIHdheSwgZm9yIG90aGVyIGtpbmRzIG9mIGNvbmRpdGlvbnMgKGku
ZS4gaWYgb25lIGNhbm5vdCB1c2UNCj4gYHRvX3Jlc3VsdGApLCBJIHdvdWxkIHN1Z2dlc3QgdGhl
IGVhcmx5IHJldHVybiBzdHlsZSwgaS5lLiB0aGUgdXN1YWwgQw0KPiBrZXJuZWwgc3R5bGU6DQo+
IA0KPiAgICAgaWYgY29uZGl0aW9uIHsNCj4gICAgICAgICByZXR1cm4gRXJyKC4uLik7DQo+ICAg
ICB9DQo+IA0KPiAgICAgT2soLi4uKQ0KPiANCj4gU29tZXRpbWVzIGZvciB0aGUgbGFzdCBvbmUg
d2UgZG8gdGhpcyB0b28gd2hlbiB0aGUgZnVuY3Rpb24gaXMNCj4gInN5bW1ldHJpYyIgKHBlcnNv
bmFsbHkgSSB3b3VsZG4ndCBtaW5kIGp1c3QgZG9pbmcgZWFybHkgZm9yIHRob3NlDQo+IGNhc2Vz
IHRvbywgdG8gYmUgY29uc2lzdGVudCk6DQo+IA0KPiAgICAgaWYgY29uZGl0aW9uIHsNCj4gICAg
ICAgICBFcnIoLi4uKQ0KPiAgICAgfSBlbHNlIHsNCj4gICAgICAgICBPayguLi4pDQo+ICAgICB9
DQo+IA0KPiBXaGF0IHdlIHNob3VsZCBub3QgZG8sIGhvd2V2ZXIsIGlzIHRoaXMgKHdoaWNoIHlv
dSB1c2VkIGluIHRoZSBwYXRjaA0KPiBiZWZvcmUgQmVubm8ncyBzdWdnZXN0aW9ucyB0byB1c2Ug
YHRvX3Jlc3VsdGApLCBpLmUuIGByZXR1cm5gIGFuZA0KPiBgZWxzZWA6DQo+IA0KPiAgICAgaWYg
Y29uZGl0aW9uIHsNCj4gICAgICAgICByZXR1cm4gRXJyKC4uLik7DQo+ICAgICB9IGVsc2Ugew0K
PiAgICAgICAgIE9rKC4uLikNCj4gICAgIH0NCg0KVGhhbmtzISBJIHVwZGF0ZWQgdGhlIGNvZGUu
DQoNCk5vIGhlbHBlciBmdW5jdGlvbiBmb3IgYSBmdW5jdGlvbiB0aGF0IHJldHVybnMgYXZhbHVl
IGxpa2UgdGhlDQpmb2xsb3dpbmc/DQoNCmxldCByZXQgPSB1bnNhZmUge2JpbmRpbmdzOjpzb21l
X2Z1bmN0aW9uKCl9Ow0KaWYgcmV0IDwgMCB7DQogICBFcnIoRXJyb3I6OmZyb21fZXJybm8ocmV0
KSkNCn0gZWxzZSB7DQogICBPayhyZXQpDQp9DQoNCmlmIHRvX3Jlc3VsdCgpIHJldHVybnMgYSB2
YWx1ZSwgaXQgY2FuIGhhbmRsZSBib3RoIHR5cGVzLg0KDQoNCj4gKEJ5IHRoZSB3YXksIEkganVz
dCByZXBvcnRlZA0KPiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QvaXNzdWVzLzEx
NjE1MCBzaW5jZSBjb2RlZ2VuIHNlZW1zIHRvDQo+IHN1ZmZlciBpbiBzb21lIGNhc2VzKQ0KDQpI
bW0sIGhvdyB0aGlzIGNhbiBoYXBwZW4/IFF1aXRlIHN1cnByaXNpbmchDQo=
