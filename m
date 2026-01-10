Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D304117A30A
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768049313; cv=none; b=jMcCcITSXdVqus8KRH6DpwJa3rL5IrWH+U35N97RLEu5E1O2qAQ4GJcFs9aVmZRn5SVBKTJOXjAUMZjVX4PZkW6sxWZ6gYKje9kl24a5db/Jr49f/+flq7nzglEBaZAKlrGtb5gXDBgHzvvbSCityp734N7FiVNNuvDzV992SRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768049313; c=relaxed/simple;
	bh=eKguwjjiYbCupEf9T4Jc9Dal0c+LXMpwBGD0M5rzKEw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Qpprc/eAU9pjQFq6MoFS1zld92tN4U8Jt5Z0imjAokMysGYkhJI0QXYB2RTP9uFTV+6xMZeLhnfwguIYUyfxFHpvLNtpj9BmsBAnMG1SQBKi1ZXrJ4USaSZ5kf70xUe3aSR1qypuIrWnW1EqOZB7Ai6PPI4oa2dtMUYmMtSas9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMY1SfxM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMY1SfxM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34cf1e31f85so3146144a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 04:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768049311; x=1768654111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKguwjjiYbCupEf9T4Jc9Dal0c+LXMpwBGD0M5rzKEw=;
        b=fMY1SfxMIFpCT1fpHR2+2IbnDTCWo6kdLGrL5Nzd07lULPtvBL4gBBolUa5nrQeJ42
         XzAGCOOTjP06mXwpb37pgdAoJHwlBGVj9uBNxYEbckZX9EeV7HPnQs+K08Ev90MqmmWH
         4WagvsDU2MzgEaQXaA8m8Yedt677EIe+TUS3P2aKxq+Q8XfnVLQMrkljXkFaTs9hqmsM
         feaVceXhZK5d7ZJL5SVLxjsD5LTKUCKp0BRqfxJ/2MIAP9nW9H9u2qZMHBXwd29TBynD
         B/lVOoHVum+Ls/httDCZ3Rh3olJvbG9qZu9+KVuJq+YON5s1UB8urupIpLsYfvGrqVfG
         NTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768049311; x=1768654111;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKguwjjiYbCupEf9T4Jc9Dal0c+LXMpwBGD0M5rzKEw=;
        b=jKU0AfBFKccviopPGlwAFYXB6T8gleN6Bp11MXM2QRJd/3dMmQhf7WFXYH+VGkkMdw
         W5Uwo9hNxJbb6rTxPur0Vndk9trBKJ/f1H/CURquzCjYRl8qdJiR7LbfxRHwu9yvor/E
         2UUH6xfQmAKGgI1pX46Pam1oH/hlUCCiQK/hXn56tU5gfetvAv9KypCPMxurvei+k4hA
         RMFJjbWYplnJsEBFBH4YE1b1aItLwSsEvnYgBMnSJrLEcIeygwzRhYO7COUY+OiR8z6i
         YNDaCJsJmyV6H/AQKlky5ysO9zE76lKEr+eF7Qoyxkb9wyPud/xBnnwCmbtGhGKPlFdg
         qplQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3f7FmPbzC5/zok1ZpAXgYLfDAbXbwroOMQmV2LZvVcCA4PhFaVld3Dqg6O2aqEeZbMB4AOUnilsGIA7ZC+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCgkkOocgrgNbQsYQxeJyQUZ4/jY0cGsz38neC3K5uAjfSAlI
	AkW4lXTs7NEhyJ0GkrlhPNGjGEtsf6V804ux0TT9JXeZT74lRY7GPMQo
X-Gm-Gg: AY/fxX5l5PtNU2wrEdPzzWfMUr0K2y+BEWSzURZX3LlSzdUvOQgX2FTKngWkd00SOQm
	AZvXO6E0tXhywwiYiFdzJFhhE2OrdXyqzKCaQ/slOqbl14m44PBvcS1w3N1UF0Oo7lVE/jAHZyg
	xIJGN7hCOwtusjIhsbxv1PXCc2AnPaYDNVscWa+OQZYaOrqxZFA0Bnyr6paI02QEVZ9xNTrufPk
	bALdvK2xjNW8B87MTEd9PXDcOsVrUj/1TgPV2lHi0vQssQA3uHixPtMfdjoRP+EJLDGhDfTNgkA
	CAqBOYX2gYibzYllZPAHCLBApPnRET6fpBqffUojOkRiOjVuR9mGOEzI7DK70NqnW3OdDwuzMZx
	qjCSBefXvm2viRiu0hBljVqu+XD8elvFjfE8F4RtjVeAUUEapWa8sTo6D4v510BchUoWrAt7GFZ
	GayasU60lpJcCGcmFuNwq9VN9am5VvxrJSq1BLyVLhWtYgL4Fn0+M6gA49ypfYn5yCoio=
X-Google-Smtp-Source: AGHT+IHIUDRrI0U6Vd6fZYSozt6VqqpPyjZ406WRbm3zursfT4U+N+vrNHlBfAAiwtSXrB5DxX2LXA==
X-Received: by 2002:a17:90a:c888:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-34f68b64f91mr11120010a91.10.1768049311019;
        Sat, 10 Jan 2026 04:48:31 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb74435sm13155748a91.14.2026.01.10.04.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 04:48:30 -0800 (PST)
Date: Sat, 10 Jan 2026 21:48:25 +0900 (JST)
Message-Id: <20260110.214825.1069367234137458141.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic
 booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aWC66BAmhDgyqpfJ@google.com>
References: <CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com>
	<20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
	<aWC66BAmhDgyqpfJ@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCA5IEphbiAyMDI2IDA4OjIzOjA0ICswMDAwDQpBbGljZSBSeWhsIDxhbGljZXJ5aGxA
Z29vZ2xlLmNvbT4gd3JvdGU6DQoNCj4gT24gRnJpLCBKYW4gMDksIDIwMjYgYXQgMDk6MzY6NDFB
TSArMDkwMCwgRlVKSVRBIFRvbW9ub3JpIHdyb3RlOg0KPj4gT24gVGh1LCA4IEphbiAyMDI2IDEz
OjU0OjU4ICswMTAwDQo+PiBBbGljZSBSeWhsIDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4gd3JvdGU6
DQo+PiANCj4+ID4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCAxOjUw4oCvUE0gRlVKSVRBIFRvbW9u
b3JpDQo+PiA+IDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPiB3cm90ZToNCj4+ID4+DQo+PiA+
PiBBZGQgYSBuZXcgRmxhZyBlbnVtIChDbGVhci9TZXQpIGFuZCBpbXBsZW1lbnQgQXRvbWljVHlw
ZSBmb3IgaXQsIHNvDQo+PiA+PiB1c2VycyBjYW4gdXNlIEF0b21pYzxGbGFnPiBmb3IgYm9vbGVh
biBmbGFncy4NCj4+ID4+DQo+PiA+PiBUaGUgYmFja2luZyBpbnRlZ2VyIHR5cGUgaXMgYW4gaW1w
bGVtZW50YXRpb24gZGV0YWlsOyBpdCBpcyBjdXJyZW50bHkNCj4+ID4+IGkzMiBidXQgbWF5IGNo
YW5nZSBpbiB0aGUgZnV0dXJlLg0KPj4gPj4NCj4+ID4+IERvY3VtZW50IHdoZW4gQXRvbWljPEZs
YWc+IGlzIGdlbmVyYWxseSBwcmVmZXJhYmxlIHRvIEF0b21pYzxib29sPjogaW4NCj4+ID4+IHBh
cnRpY3VsYXIsIHdoZW4gUk1XIG9wZXJhdGlvbnMgc3VjaCBhcyB4Y2hnKCkvY21weGNoZygpIG1h
eSBiZSB1c2VkDQo+PiA+PiBhbmQgbWluaW1pemluZyBtZW1vcnkgdXNhZ2UgaXMgbm90IHRoZSB0
b3AgcHJpb3JpdHkuIE9uIHNvbWUNCj4+ID4+IGFyY2hpdGVjdHVyZXMgd2l0aG91dCBieXRlLXNp
emVkIFJNVyBpbnN0cnVjdGlvbnMsIEF0b21pYzxib29sPiBjYW4gYmUNCj4+ID4+IHNsb3dlciBm
b3IgUk1XIG9wZXJhdGlvbnMuDQo+PiA+Pg0KPj4gPj4gU2lnbmVkLW9mZi1ieTogRlVKSVRBIFRv
bW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPg0KPj4gPiANCj4+ID4gQ2FuIHdlIGhh
dmUgYSBgc3RydWN0IEF0b21pY0ZsYWcoQXRvbWljPEZsYWc+KWAgaGVyZSB3aG9zZSBsb2FkKCkg
Lw0KPj4gPiBzdG9yZSgpIG1ldGhvZHMgdXNlIHJlYWwgYm9vbGVhbnM/IE90aGVyd2lzZSB0aGlz
IHNlZW1zIGluY29udmVuaWVudA0KPj4gPiB0byB1c2UuDQo+PiANCj4+IERvIHlvdSBtZWFuIHNv
bWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcz8NCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3J1c3Qva2Vy
bmVsL3N5bmMvYXRvbWljLnJzIGIvcnVzdC9rZXJuZWwvc3luYy9hdG9taWMucnMNCj4+IGluZGV4
IDQ3M2QzYzA3ZTIzNC4uMTk3NTBiZTFhMjM5IDEwMDY0NA0KPj4gLS0tIGEvcnVzdC9rZXJuZWwv
c3luYy9hdG9taWMucnMNCj4+ICsrKyBiL3J1c3Qva2VybmVsL3N5bmMvYXRvbWljLnJzDQo+PiBA
QCAtNjIyLDMgKzYyMiwyOSBAQCBmbiBmcm9tKGI6IGJvb2wpIC0+IFNlbGYgew0KPj4gICAgICAg
ICAgfQ0KPj4gICAgICB9DQo+PiAgfQ0KPj4gKw0KPj4gKy8vLyBBIGNvbnZlbmllbmNlIHdyYXBw
ZXIgYXJvdW5kIFtgQXRvbWljPEZsYWc+YF0gdGhhdCBleHBvc2VzIGEgYGJvb2xgIEFQSS4NCj4+
ICtwdWIgc3RydWN0IEF0b21pY0ZsYWcoQXRvbWljPEZsYWc+KTsNCj4+ICsNCj4+ICtpbXBsIEF0
b21pY0ZsYWcgew0KPj4gKyAgICAvLy8gQ3JlYXRlcyBhIG5ldyBhdG9taWMgZmxhZy4NCj4+ICsg
ICAgcHViIGNvbnN0IGZuIG5ldyhiOiBib29sKSAtPiBTZWxmIHsNCj4+ICsgICAgICAgIGlmIGIg
ew0KPj4gKyAgICAgICAgICAgIEF0b21pY0ZsYWcoQXRvbWljOjpuZXcoRmxhZzo6U2V0KSkNCj4+
ICsgICAgICAgIH0gZWxzZSB7DQo+PiArICAgICAgICAgICAgQXRvbWljRmxhZyhBdG9taWM6Om5l
dyhGbGFnOjpDbGVhcikpDQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAg
Ly8vIExvYWRzIHRoZSB2YWx1ZSBmcm9tIHRoZSBhdG9taWMgZmxhZy4NCj4+ICsgICAgI1tpbmxp
bmUoYWx3YXlzKV0NCj4+ICsgICAgcHViIGZuIGxvYWQ8T3JkZXJpbmc6IG9yZGVyaW5nOjpBY3F1
aXJlT3JSZWxheGVkPigmc2VsZiwgbzogT3JkZXJpbmcpIC0+IGJvb2wgew0KPj4gKyAgICAgICAg
c2VsZi4wLmxvYWQobykuaW50bygpDQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgLy8vIFN0b3Jl
cyBhIHZhbHVlIHRvIHRoZSBhdG9taWMgZmxhZy4NCj4+ICsgICAgI1tpbmxpbmUoYWx3YXlzKV0N
Cj4+ICsgICAgcHViIGZuIHN0b3JlPE9yZGVyaW5nOiBvcmRlcmluZzo6UmVsZWFzZU9yUmVsYXhl
ZD4oJnNlbGYsIGI6IGJvb2wsIG86IE9yZGVyaW5nKSB7DQo+PiArICAgICAgICBzZWxmLjAuc3Rv
cmUoYi5pbnRvKCksIG8pDQo+PiArICAgIH0NCj4+ICt9DQo+IA0KPiBZZXMsIHRoYXQncyB3aGF0
IEkgbWVhbnQuDQoNClRoYW5rcyBmb3IgY29uZmlybWluZy4gSSdsbCBhZGQgaW4gdjMuDQo=
