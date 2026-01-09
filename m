Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F5B54763
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767919863; cv=none; b=gkayDunsNB6+/oqZKZSs1xp4C5RvSoLzP8npjEmsHR3VZBR1BG9HIsqpGRSUjfT/JiJe+xXCI3rthAH7+YQepwSH93ermDI4f/IgT+zGJVysZDu5zVE3hQM6xMafrfBNig/updFgkE+WePCfZbE/XDafzC1L/k4t5uv8Cfp8zV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767919863; c=relaxed/simple;
	bh=bq2QDD8FvlcPYQizT7VqrpwonGPvENbG9P2VHfJeDss=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DloQttpZ3HWYot9wSFhDQpBuFuGGXNK0JhZVg5IMvxHlXU44aFSzZcKIAZxfHm5PXiD/HJiZJ5NnN7JFJtnMmrfB0jqnkEE2DvOY+A3dm/DY7+D6ecdPGE5WU5+Qfku3dkFpzWOxd3af/oCBi33s9U6lExWrHZfhdhWC4jnlBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFom7JNk; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFom7JNk"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2541623b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 16:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767919861; x=1768524661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq2QDD8FvlcPYQizT7VqrpwonGPvENbG9P2VHfJeDss=;
        b=HFom7JNk/njoEXk9KVpxbtsHi6Y1WFKS3LEnfGpvAMgeff4USiQ9mmwALe9KUf9gFc
         zdQ3PohIY+rIPbGJ+u/0wT3Vy7v8HQy+I2czb5b1LtzwOEaRfSf2lxhzDWO5I0hzfjju
         tuWhtYXKww1/KY/sboIY4osvzQ12m5ACPw7waavzY7kjVQyMJ7jYwYAz6ewtpXT7fOAk
         nYcjPEHLq8qdW4Gz9PAp8AGHCyZHr+yrtTByABXsktNMUDIyWExeLVCVyuGSxwofwAiU
         1Qc3ksX9eG/Ox7Vx8r2zN+oHJQM50NKih2tnrND9XKcgzobzycSFEw1LzUZvQlQsKmcV
         ls/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767919861; x=1768524661;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bq2QDD8FvlcPYQizT7VqrpwonGPvENbG9P2VHfJeDss=;
        b=o8CJI9T44KbbIf0Fs4Aym+oO4mpn/LP3dwhxQaF47P2urWnO9c3nmGp/UxC88VKxxM
         qBjd7z6kU7dcQJ3qI8kAG9TdmKTUKY9naOVonsFQCtrN3+m7oxxU8cLPBHuGtoXtjmrG
         ZNXKExrY3jDO48C7FDNKLr5SimBawmWFAPDijIJUS9devuFxe+OfOGhcP5QsGAHhz4L9
         DeBE6z2r7ndgVW2DjWziBgK+56aGeocngOHUEOE0NkncwCPmKMS1ugRlb44boS4GGf/A
         r0DMeS7g2HJvoSRIQUP294DlJS51jCQI7VKRLRi4q4HoPzohfZMohLJ7a5dnbGcsSh9E
         q47w==
X-Forwarded-Encrypted: i=1; AJvYcCV2+P1okbZ8Zf7gi/zTfSO1pHzQFGPwuWdDJS1rqoY7jq14iARBvAPTDkq9jzLLsU9uBCkP8QCkMbyjpDFDKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzShXU/euzJKBskhQmvLUy5iSmtv5ipkn7fW7YoA8yCy90HUJRb
	jF1wfP46o4U2KFe/pDtAKyU+sMx6AMEXzaiZk4Kj6nPRX9VkoYvVGFHP
X-Gm-Gg: AY/fxX7VPuhjB/QJIv2b+LaqXQIcI7nI3E+9qeRUce2je9+WuntXc0wSokqUH80ASnK
	9QLIiXJK5Cx9KmbxjcZYsjvOPNyITBoHQIivMmC3Y4McdbDgL3uiJ2Z1t88qdJ+MvSmkN5Sorzg
	WAUBibs8xsDkozyQLZUB0jL0HR8ZoaX+9pmtCZOV+CqqCvNQ20p9zlbSp44TwN9rzGJkRJj54rg
	imcB2FtWw5gyCgcU4DYXr7zYYvEmCm4JlKVXhct8nZx/Af0x2L5OAz6bifkizbn4UxEdbiLGYd4
	CbuDaukGc0q36yxq1xyc7A+wmiUM2KPlXg7kqB16ZvdHBZ+JjqDMLlQS9/XUMdXmCL7moqrT3WZ
	oQCoGGBO2Bv6APz2WSi/XakijIENUUXnbo4izK0TEVI7a/Oeif+D+sPnsjehe9wPGe8w48wF2MX
	TDpRisRQmcbx4fKnt91W7UW4RZ5kTVZaWe6gvexuq63gP6dnVohskcaAL2gdLirapfVCM=
X-Google-Smtp-Source: AGHT+IEjk7z588bamYVO8olda4s9E+oQ9lrRSrQiLSijDuBkyIBT6wX0JYOCQgRTo3Yz4SK9YJWScg==
X-Received: by 2002:a05:6a00:e85:b0:7ac:9d93:3efa with SMTP id d2e1a72fcca58-81b7d26240bmr7867936b3a.7.1767919861170;
        Thu, 08 Jan 2026 16:51:01 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa19242sm8737370b3a.7.2026.01.08.16.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 16:51:00 -0800 (PST)
Date: Fri, 09 Jan 2026 09:50:56 +0900 (JST)
Message-Id: <20260109.095056.2061955792984432066.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic
 booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
References: <20260108125005.2945800-1-fujita.tomonori@gmail.com>
	<CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com>
	<20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCAwOSBKYW4gMjAyNiAwOTozNjo0MSArMDkwMCAoSlNUKQ0KRlVKSVRBIFRvbW9ub3Jp
IDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUaHUsIDggSmFuIDIw
MjYgMTM6NTQ6NTggKzAxMDANCj4gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+IHdy
b3RlOg0KPiANCj4+IE9uIFRodSwgSmFuIDgsIDIwMjYgYXQgMTo1MOKAr1BNIEZVSklUQSBUb21v
bm9yaQ0KPj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gQWRk
IGEgbmV3IEZsYWcgZW51bSAoQ2xlYXIvU2V0KSBhbmQgaW1wbGVtZW50IEF0b21pY1R5cGUgZm9y
IGl0LCBzbw0KPj4+IHVzZXJzIGNhbiB1c2UgQXRvbWljPEZsYWc+IGZvciBib29sZWFuIGZsYWdz
Lg0KPj4+DQo+Pj4gVGhlIGJhY2tpbmcgaW50ZWdlciB0eXBlIGlzIGFuIGltcGxlbWVudGF0aW9u
IGRldGFpbDsgaXQgaXMgY3VycmVudGx5DQo+Pj4gaTMyIGJ1dCBtYXkgY2hhbmdlIGluIHRoZSBm
dXR1cmUuDQo+Pj4NCj4+PiBEb2N1bWVudCB3aGVuIEF0b21pYzxGbGFnPiBpcyBnZW5lcmFsbHkg
cHJlZmVyYWJsZSB0byBBdG9taWM8Ym9vbD46IGluDQo+Pj4gcGFydGljdWxhciwgd2hlbiBSTVcg
b3BlcmF0aW9ucyBzdWNoIGFzIHhjaGcoKS9jbXB4Y2hnKCkgbWF5IGJlIHVzZWQNCj4+PiBhbmQg
bWluaW1pemluZyBtZW1vcnkgdXNhZ2UgaXMgbm90IHRoZSB0b3AgcHJpb3JpdHkuIE9uIHNvbWUN
Cj4+PiBhcmNoaXRlY3R1cmVzIHdpdGhvdXQgYnl0ZS1zaXplZCBSTVcgaW5zdHJ1Y3Rpb25zLCBB
dG9taWM8Ym9vbD4gY2FuIGJlDQo+Pj4gc2xvd2VyIGZvciBSTVcgb3BlcmF0aW9ucy4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWls
LmNvbT4NCj4+IA0KPj4gQ2FuIHdlIGhhdmUgYSBgc3RydWN0IEF0b21pY0ZsYWcoQXRvbWljPEZs
YWc+KWAgaGVyZSB3aG9zZSBsb2FkKCkgLw0KPj4gc3RvcmUoKSBtZXRob2RzIHVzZSByZWFsIGJv
b2xlYW5zPyBPdGhlcndpc2UgdGhpcyBzZWVtcyBpbmNvbnZlbmllbnQNCj4+IHRvIHVzZS4NCj4g
DQo+IERvIHlvdSBtZWFuIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcz8NCj4gDQo+IGRpZmYg
LS1naXQgYS9ydXN0L2tlcm5lbC9zeW5jL2F0b21pYy5ycyBiL3J1c3Qva2VybmVsL3N5bmMvYXRv
bWljLnJzDQo+IGluZGV4IDQ3M2QzYzA3ZTIzNC4uMTk3NTBiZTFhMjM5IDEwMDY0NA0KPiAtLS0g
YS9ydXN0L2tlcm5lbC9zeW5jL2F0b21pYy5ycw0KPiArKysgYi9ydXN0L2tlcm5lbC9zeW5jL2F0
b21pYy5ycw0KPiBAQCAtNjIyLDMgKzYyMiwyOSBAQCBmbiBmcm9tKGI6IGJvb2wpIC0+IFNlbGYg
ew0KPiAgICAgICAgICB9DQo+ICAgICAgfQ0KPiAgfQ0KPiArDQo+ICsvLy8gQSBjb252ZW5pZW5j
ZSB3cmFwcGVyIGFyb3VuZCBbYEF0b21pYzxGbGFnPmBdIHRoYXQgZXhwb3NlcyBhIGBib29sYCBB
UEkuDQo+ICtwdWIgc3RydWN0IEF0b21pY0ZsYWcoQXRvbWljPEZsYWc+KTsNCj4gKw0KPiAraW1w
bCBBdG9taWNGbGFnIHsNCj4gKyAgICAvLy8gQ3JlYXRlcyBhIG5ldyBhdG9taWMgZmxhZy4NCj4g
KyAgICBwdWIgY29uc3QgZm4gbmV3KGI6IGJvb2wpIC0+IFNlbGYgew0KPiArICAgICAgICBpZiBi
IHsNCj4gKyAgICAgICAgICAgIEF0b21pY0ZsYWcoQXRvbWljOjpuZXcoRmxhZzo6U2V0KSkNCj4g
KyAgICAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgIEF0b21pY0ZsYWcoQXRvbWljOjpuZXco
RmxhZzo6Q2xlYXIpKQ0KPiArICAgICAgICB9DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgLy8vIExv
YWRzIHRoZSB2YWx1ZSBmcm9tIHRoZSBhdG9taWMgZmxhZy4NCj4gKyAgICAjW2lubGluZShhbHdh
eXMpXQ0KPiArICAgIHB1YiBmbiBsb2FkPE9yZGVyaW5nOiBvcmRlcmluZzo6QWNxdWlyZU9yUmVs
YXhlZD4oJnNlbGYsIG86IE9yZGVyaW5nKSAtPiBib29sIHsNCj4gKyAgICAgICAgc2VsZi4wLmxv
YWQobykuaW50bygpDQo+ICsgICAgfQ0KPiArDQo+ICsgICAgLy8vIFN0b3JlcyBhIHZhbHVlIHRv
IHRoZSBhdG9taWMgZmxhZy4NCj4gKyAgICAjW2lubGluZShhbHdheXMpXQ0KPiArICAgIHB1YiBm
biBzdG9yZTxPcmRlcmluZzogb3JkZXJpbmc6OlJlbGVhc2VPclJlbGF4ZWQ+KCZzZWxmLCBiOiBi
b29sLCBvOiBPcmRlcmluZykgew0KPiArICAgICAgICBzZWxmLjAuc3RvcmUoYi5pbnRvKCksIG8p
DQo+ICsgICAgfQ0KPiArfQ0KDQpJZiB5b3Ugb25seSBuZWVkIGxvYWQvc3RvcmUsIEF0b21pYzxi
b29sPiBpcyBmaW5lLCBzbyBpZiB3ZSBhZGQNCmBBdG9taWNGbGFnYCwgaXQgd291bGQgYmUgZ29v
ZCB0byBleHBvc2UgUk1XIG9wZXJhdGlvbnMgKHhjaGcgYXQNCmxlYXN0KS4NCg0K
