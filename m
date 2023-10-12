Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB2655
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 03:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1MAi23G"
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161D994
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 20:16:58 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-58974d4335aso67142a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 20:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697080617; x=1697685417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eWqIQSYsLz4aq4pyTdJK9AFQOVKqdrC/EFC3wh58XI=;
        b=M1MAi23G902iQFPsuPg+gd820752KsP4BKYoqP7bL10PEf1qpDFx7bE48iwAWmx8gS
         Iz9FjSAKIZiL7amvTXsfyQtAEROXwIoNNd99SleLuw8GDDqTv75LUlS9cU1hspuymkQ9
         NDBHbJ9mNsmYaoM3zZgMrDXNHrXbtIGKvxiqeh5dqEk78rmTCyMBnrDcNRVoohsCOmfY
         3NGRQ5hSUsjPcQLQPuDg6Tz+bA10QZpgdFPUY2PeP4WhRZQH3y2oC1cJUMJtbfAEnCHe
         gWEFPjVQOyxtvausK62TnnzZHEZrb55+wGTFnR3H9uuYQ8TnwjWsz3ZCqbd1lJBzBHqk
         lJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697080617; x=1697685417;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0eWqIQSYsLz4aq4pyTdJK9AFQOVKqdrC/EFC3wh58XI=;
        b=sUFtVTIOifGVWEMCf0MEl1TQCrgUOqQVEfULZYEaIJCyW/vxoX12EANAdN5pqLVY2n
         Mn8Acl3D0e/q1XMXV5dKEKtlIX01IBipuH9qPb4QNj4ITZqo/1Zply/8OgdVVm9cS6Mo
         c4iNMcd8oM4vgvI+PG5st/Qmvyu1+k79Txro4wtzSZtkTvSqUWMsAIsZVSErXB3y9Mt6
         z9TgJ6qhqemazNQsjRPSESwfWFcebYUmHq4iS8Xb5zPT1CmK5Z2178G5G48rTL2aJlHJ
         +OTx5e6ZpGdIrx9fpsOYvYXss6M4l/Tu2BxKSeJxnEXTVdptpIkZCXP92k3lii3oeeDr
         FbTQ==
X-Gm-Message-State: AOJu0YzEm+T02qs6jyCn/sMeNuky2J3IW7IMs7d0KrcIMnHdBgCJ1eAV
	n4Cuc8djZFWUXrDdWm40pik=
X-Google-Smtp-Source: AGHT+IF+u2mPBzzffOp6P4x6Kv0ytWotBSnLZ+XXDgN+LKEyLhGMCW8Y1JL9leWUJhXIlSyI5PKSxA==
X-Received: by 2002:a05:6a20:9417:b0:16c:4959:c372 with SMTP id hl23-20020a056a20941700b0016c4959c372mr11754041pzb.6.1697080617399;
        Wed, 11 Oct 2023 20:16:57 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b001c5fd2a28d3sm665032plg.28.2023.10.11.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 20:16:57 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:16:56 +0900 (JST)
Message-Id: <20231012.121656.1502998233251919494.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com,
 miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47s_wjytz3sw6uXA-27NnZkN1z+WYztfQ2Hnw0qVqEWwDw@mail.gmail.com>
References: <CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com>
	<20231012.085715.1926246245884454683.fujita.tomonori@gmail.com>
	<CALNs47s_wjytz3sw6uXA-27NnZkN1z+WYztfQ2Hnw0qVqEWwDw@mail.gmail.com>
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

T24gV2VkLCAxMSBPY3QgMjAyMyAyMzowOTowMyAtMDQwMA0KVHJldm9yIEdyb3NzIDx0bWdyb3Nz
QHVtaWNoLmVkdT4gd3JvdGU6DQoNCj4gT24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgNzo1N+KAr1BN
IEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6DQo+
Pg0KPj4gT24gVHVlLCAxMCBPY3QgMjAyMyAxOToxMjo0MyAtMDQwMA0KPj4gVHJldm9yIEdyb3Nz
IDx0bWdyb3NzQHVtaWNoLmVkdT4gd3JvdGU6DQo+Pg0KPj4gPiBPbiBUdWUsIE9jdCAxMCwgMjAy
MyBhdCA2OjU04oCvUE0gTWlndWVsIE9qZWRhDQo+PiA+IDxtaWd1ZWwub2plZGEuc2FuZG9uaXNA
Z21haWwuY29tPiB3cm90ZToNCj4+ID4+DQo+PiA+PiBPbiBXZWQsIE9jdCAxMSwgMjAyMyBhdCAx
Mjo1MOKAr0FNIFRyZXZvciBHcm9zcyA8dG1ncm9zc0B1bWljaC5lZHU+IHdyb3RlOg0KPj4gPj4g
Pg0KPj4gPj4gPiBJIGFncmVlLCBidXQgdGhlcmUgbmVlZHMgdG8gYmUgYSB3YXkgdG8gdXNlIGEg
ZHJpdmVyIG1vcmUgdGhhbiBvbmNlDQo+PiA+PiA+IHdpdGggZGlmZmVyZW50IElEcy4gU2VlDQo+
PiA+PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4L0NBTE5zNDd2eVcr
QTV1d0NRLXVnMDMzNzN4aitRTWVoeD0xcFhaOFZpUzJqWjhLaGZ4UUBtYWlsLmdtYWlsLmNvbS8N
Cj4+ID4+ID4gYW5kIHRoZSBmb2xsb3d1cCwgbWF5YmUgeW91IGhhdmUgYSBiZXR0ZXIgc3VnZ2Vz
dGlvbg0KPj4gPj4NCj4+ID4+IERvZXMgaXQgbWFrZSBzZW5zZSB0byBnZW5lcmF0ZSBvbmUgb2Yg
dGhvc2UgYmFzZWQgb24gdGhlIG90aGVyLCB1bmxlc3MNCj4+ID4+IGJvdGggYXJlIHByb3ZpZGVk
LCBmb3IgaW5zdGFuY2U/DQo+PiA+DQo+PiA+IFRoYXQgaXMgd2hhdCBJIHdhcyBhaW1pbmcgZm9y
IHdpdGggbXkgZXhhbXBsZSBgeyBwaHk6IFBoeUFYODg3NzJBLCBpZDoNCj4+ID4gc29tZV9vdGhl
cl9kZXZpY2VfaWQgfWAsIGl0IHNlZW1zIHRvIG1ha2Ugc2Vuc2UgdGhhdCB3ZSBkZWZhdWx0DQo+
PiA+IHNvbWVob3cuDQo+PiA+DQo+PiA+IE9yLCBkaWQgeW91IG1lYW4gc29tZXRoaW5nIHNwZWNp
ZmljIGxpa2Ugc3RvcmluZyA+MSBkZXZpY2UgSUQgaW4gdGhlDQo+PiA+IGBEcml2ZXJgIHRyYWl0
PyBDaGFuZ2luZyBmcm9tOg0KPj4gPg0KPj4gPiAgICAgdHJhaXQgRHJpdmVyew0KPj4gPiAgICAg
ICAgIGNvbnN0IFBIWV9ERVZJQ0VfSUQ6IERldmljZUlkID0gRGV2aWNlSWQ6Om5ld193aXRoX2N1
c3RvbV9tYXNrKDAsIDApOw0KPj4gPiAgICAgfQ0KPj4gPg0KPj4gPiBUbzoNCj4+ID4NCj4+ID4g
ICAgIHRyYWl0IERyaXZlcnsNCj4+ID4gICAgICAgICBjb25zdCBQSFlfREVWSUNFX0lEUzogJidz
dGF0aWMgW0RldmljZUlkXSA9DQo+PiA+ICAgICAgICAgICAgICZbRGV2aWNlSWQ6Om5ld193aXRo
X2N1c3RvbV9tYXNrKDAsIDApXTsNCj4+ID4gICAgIH0NCj4+ID4NCj4+ID4gTWF5YmUgdGhhdCB3
b3VsZCBiZSBiZXR0ZXIgYmVjYXVzZSB0aGUgaW5mb3JtYXRpb24gaXMgYWxsIGluIG9uZSBwbGFj
ZQ0KPj4gPiBhbmQgdGhlIG1hY3JvIGRvZXNuJ3QgbmVlZCB0byBnYWluIGFueSBtb3JlIHN5bnRh
eA0KPj4NCj4+IDMuIG11bHRpcGxlIHBoeSBkcml2ZXJzIGhhcyBvbmUgaWQgaW4gZGV2aWNlX3Rh
YmxlLg0KPj4NCj4+IEhvdyB0aGVzZSBhcHByb2FjaCBjYW4gaGFuZGxlIHRoZSBjYXNlPw0KPj4N
Cj4+IEFsc28gbm90ZSB0aGF0IHRoZXJlIGlzIGEgZHJpdmVyIGRvZXNuJ3QgZGVmaW5lIFBIWV9J
RCwgdXNlcw0KPj4gbWF0Y2hfcGh5X2RldmljZSgpIGluc3RlYWQuDQo+IA0KPiBJbiB0aGlzIGNh
c2UgeW91IHdvdWxkIGp1c3QgbmVlZCB0byBwdXQgdGhlIHNhbWUgYERldmljZUlkYCBpbiB0aGUN
Cj4gYXJyYXkgZm9yIGJvdGggZHJpdmVycywgcGVyaGFwcyBhcyBhIGNvbnN0LiBJIHRoaW5rIHRo
aXMgcHJvcG9zYWwNCg0KSSdtIG5vdCBzdXJlIG1vZHBvc3QgY2FuIGhhbmRsZSBpdC4NCg0KSSBn
dWVzcyB0aGF0IHlvdSB3b3VsZCBoYXZlIHR3byBleGFjdCBzYW1lIGxpbmVzIGluIG1vZHVsZXMu
YWxpYXMsDQp3aGljaCBtaWdodCB3b3JrcyBidXQgSSBkb24ndCB0aGluayB0aGF0IGl0J3Mgbm90
IGRlc2lnbmVkIHRvIGhhbmRsZQ0Kc3VjaC4NCg0KT3IgdGhlIG1hY3JvIG5lZWRzIHRvIGZpbmQg
dGhlIHNhbWUgaWQgYW5kIGtlZXAgb25seSBvbmUuDQo=
