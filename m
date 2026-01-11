Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9E125A0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768108301; cv=none; b=RWtXbbGwigqvIe3UHgeL0D1pospoka5pkhctHhrtwtFwKF1MeOJMBsAgBgWDSc10hMd+1NSA/P5xQ3Ih/IOv9SOTBcvc5gOsLidQejmrsUnvMosmn0vazXy2te19dYYVHVTe41QUyp9miFc27D4O+o/7w/mn/JpaIztm0NqdxXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768108301; c=relaxed/simple;
	bh=9DN7a1e0UtsYhKaAZfk2LMRK6SvMPpQ7zCI72c/Zk2s=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z/qCHx3h95kflMLP6qrwTVFBGIHJhy+Yiyb8CX2rGO0rc7/qiAjQmVZNF9N/QMWYezkAtHpLPw+eKPhbCLh2TaPT8p1YjQlmLOwO0O+ameULzZLupMYEvdt6dGNN0Hs4D3L0GaRpqi1KObMu88jEdb9H87MT+roPKvUYanDqNFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTpOiul+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTpOiul+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a07fac8aa1so40494715ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 21:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768108299; x=1768713099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DN7a1e0UtsYhKaAZfk2LMRK6SvMPpQ7zCI72c/Zk2s=;
        b=YTpOiul+XJXIkY/sLErj85kNSAj2KqvF2jyMsxYq31H8V7Ea6ZsTO69Wt40IhoRpN8
         uuCDs6xFa7c5Ym9T0DjMZAwD7LDSlRZyuJkl9hV8n4OO0E61EeKYHeggULwYR6hVTIAq
         iKmXYZDkyvtUrkmakw+xse0+cLCoep2PD+Z2cHQ2PMTirvSlSin9iIyI5MKKEaxRZEHf
         0JLGbgmrXVGgsN/B+ZZy6IClkgk/VMDorrVzGDDySu5PD0vyG2cLyWTY+kQQo7vQrATY
         hS7HQlpmh1i4NRD98JgKOyLDl6SZwMHInH7Z/U5U0J/+TCv3uXPKLtQOHh1CKkEgiOzZ
         XwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768108299; x=1768713099;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DN7a1e0UtsYhKaAZfk2LMRK6SvMPpQ7zCI72c/Zk2s=;
        b=O0oUyu1FWMrXhg4JS3DP6xvJo87NO0K6EiX2VWku2cd1CEVVUzlH60B4TDVTY1QJDe
         AEuhBY/zfDbCFiLq+XEMjVHbVhWbeGjFf/43MDBuoLGFWybjvJBTf+j00tQyODwn1Ng6
         Ysp1X+VJhOWHrB3+gj9nqnxYdxfV8PK3OsQIXcI7RoZtrZSjoDIGIAoQW0HpQpyOgUbT
         5VSsNT0Dn86SeM5vrZLJ1GfBNYQlf2cAvR9QE576OmDZ/B1C3MpysTsmxzpBYEJyKqtP
         3c/qUpIFKQJLWI9+birX2MvNuPsdL0C+JJzlGT4xOH4zQbT/2b4kO9O2j89MftR4p7X0
         RLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfLDwvUItILvMKfSCr41wzz75yJ27nsN6I5wbtkMMfiy4eFp2KnvFS2EfBMfDJPQogLEjvOL1yfiD7uOORjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjFdnzrratoKBTR1GKLhSGqLUgr+Bx91AFAeZGE4p5d6qQZYOS
	PNMV7NStjUOZR72ILGVmLLE+ltyVmwwe/3qXxDPFpz2I9M0FVtBhKZ9PA3QhiA==
X-Gm-Gg: AY/fxX40SrF0ikVO19gX68ik+vcKPOPPkW5HOWdMSG2KwqnxoRjKtqzg1lQ95GyKe5Y
	Dwnx9i9LkFc9kXX465ILErjbodmeflWiRjn5w9n0aCafLykVX0yHDO4Kc04K06ktG8AdX3db9ul
	ilJagjFAJAs+Sa0FO5vLupwWxK19rKzVrb/ABMJ+iTUOjVAJdv1Py/NK9pckpk6OXzAc45L3SMl
	cd2EhGQCVmInyt00uBfLxeufAfFR9RzCc3qdufbUSLzIqKZkhjSOZY2TtGcIUx+uR80FmkrzRRC
	PW/Ce5LWoPbUagiwR5LXkkewiftP+5Af8QufEwT8OzSbpkuBJ0WPUrBSWGDcCiACsG0HcnA4NUw
	FjsHP4xx9LeudLFI41B/HP9y7TIiFqHktZHTDo3hHf+LChDkCP8n6+gwBcRs4uDpMi1yp1UbrBO
	Tqj/maSCNI6pB6lgMQHb1mn5zAp88bFPXV9XpyA3pOjW+iW8mk+ouzZbcjdJ1jahK4gfk=
X-Google-Smtp-Source: AGHT+IHvoa17Z+VQApvm7geJWTRREAkumgk1vE+So3EEeLP3O8TA9FOdWlxtOXCx139lbthdgEZQ8Q==
X-Received: by 2002:a17:903:247:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a3ee4bff1cmr128478035ad.41.1768108299039;
        Sat, 10 Jan 2026 21:11:39 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4654sm142023995ad.97.2026.01.10.21.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:11:38 -0800 (PST)
Date: Sun, 11 Jan 2026 14:11:34 +0900 (JST)
Message-Id: <20260111.141134.1708250444474417202.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic
 booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgjtL4PdPOmsORBe=JmfsJuSbZmrU+R7zyjhPxRnYqET7Q@mail.gmail.com>
References: <aWC66BAmhDgyqpfJ@google.com>
	<20260110.214825.1069367234137458141.fujita.tomonori@gmail.com>
	<CAH5fLgjtL4PdPOmsORBe=JmfsJuSbZmrU+R7zyjhPxRnYqET7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gU2F0LCAxMCBKYW4gMjAyNiAxNToxODo0MSArMDEwMA0KQWxpY2UgUnlobCA8YWxpY2VyeWhs
QGdvb2dsZS5jb20+IHdyb3RlOg0KDQo+IE9uIFNhdCwgSmFuIDEwLCAyMDI2IGF0IDE6NDjigK9Q
TSBGVUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0K
Pj4NCj4+IE9uIEZyaSwgOSBKYW4gMjAyNiAwODoyMzowNCArMDAwMA0KPj4gQWxpY2UgUnlobCA8
YWxpY2VyeWhsQGdvb2dsZS5jb20+IHdyb3RlOg0KPj4NCj4+ID4gT24gRnJpLCBKYW4gMDksIDIw
MjYgYXQgMDk6MzY6NDFBTSArMDkwMCwgRlVKSVRBIFRvbW9ub3JpIHdyb3RlOg0KPj4gPj4gT24g
VGh1LCA4IEphbiAyMDI2IDEzOjU0OjU4ICswMTAwDQo+PiA+PiBBbGljZSBSeWhsIDxhbGljZXJ5
aGxAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+PiA+Pg0KPj4gPj4gPiBPbiBUaHUsIEphbiA4LCAyMDI2
IGF0IDE6NTDigK9QTSBGVUpJVEEgVG9tb25vcmkNCj4+ID4+ID4gPGZ1aml0YS50b21vbm9yaUBn
bWFpbC5jb20+IHdyb3RlOg0KPj4gPj4gPj4NCj4+ID4+ID4+IEFkZCBhIG5ldyBGbGFnIGVudW0g
KENsZWFyL1NldCkgYW5kIGltcGxlbWVudCBBdG9taWNUeXBlIGZvciBpdCwgc28NCj4+ID4+ID4+
IHVzZXJzIGNhbiB1c2UgQXRvbWljPEZsYWc+IGZvciBib29sZWFuIGZsYWdzLg0KPj4gPj4gPj4N
Cj4+ID4+ID4+IFRoZSBiYWNraW5nIGludGVnZXIgdHlwZSBpcyBhbiBpbXBsZW1lbnRhdGlvbiBk
ZXRhaWw7IGl0IGlzIGN1cnJlbnRseQ0KPj4gPj4gPj4gaTMyIGJ1dCBtYXkgY2hhbmdlIGluIHRo
ZSBmdXR1cmUuDQo+PiA+PiA+Pg0KPj4gPj4gPj4gRG9jdW1lbnQgd2hlbiBBdG9taWM8RmxhZz4g
aXMgZ2VuZXJhbGx5IHByZWZlcmFibGUgdG8gQXRvbWljPGJvb2w+OiBpbg0KPj4gPj4gPj4gcGFy
dGljdWxhciwgd2hlbiBSTVcgb3BlcmF0aW9ucyBzdWNoIGFzIHhjaGcoKS9jbXB4Y2hnKCkgbWF5
IGJlIHVzZWQNCj4+ID4+ID4+IGFuZCBtaW5pbWl6aW5nIG1lbW9yeSB1c2FnZSBpcyBub3QgdGhl
IHRvcCBwcmlvcml0eS4gT24gc29tZQ0KPj4gPj4gPj4gYXJjaGl0ZWN0dXJlcyB3aXRob3V0IGJ5
dGUtc2l6ZWQgUk1XIGluc3RydWN0aW9ucywgQXRvbWljPGJvb2w+IGNhbiBiZQ0KPj4gPj4gPj4g
c2xvd2VyIGZvciBSTVcgb3BlcmF0aW9ucy4NCj4+ID4+ID4+DQo+PiA+PiA+PiBTaWduZWQtb2Zm
LWJ5OiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+PiA+PiA+
DQo+PiA+PiA+IENhbiB3ZSBoYXZlIGEgYHN0cnVjdCBBdG9taWNGbGFnKEF0b21pYzxGbGFnPilg
IGhlcmUgd2hvc2UgbG9hZCgpIC8NCj4+ID4+ID4gc3RvcmUoKSBtZXRob2RzIHVzZSByZWFsIGJv
b2xlYW5zPyBPdGhlcndpc2UgdGhpcyBzZWVtcyBpbmNvbnZlbmllbnQNCj4+ID4+ID4gdG8gdXNl
Lg0KPj4gPj4NCj4+ID4+IERvIHlvdSBtZWFuIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcz8N
Cj4+ID4+DQo+PiA+PiBkaWZmIC0tZ2l0IGEvcnVzdC9rZXJuZWwvc3luYy9hdG9taWMucnMgYi9y
dXN0L2tlcm5lbC9zeW5jL2F0b21pYy5ycw0KPj4gPj4gaW5kZXggNDczZDNjMDdlMjM0Li4xOTc1
MGJlMWEyMzkgMTAwNjQ0DQo+PiA+PiAtLS0gYS9ydXN0L2tlcm5lbC9zeW5jL2F0b21pYy5ycw0K
Pj4gPj4gKysrIGIvcnVzdC9rZXJuZWwvc3luYy9hdG9taWMucnMNCj4+ID4+IEBAIC02MjIsMyAr
NjIyLDI5IEBAIGZuIGZyb20oYjogYm9vbCkgLT4gU2VsZiB7DQo+PiA+PiAgICAgICAgICB9DQo+
PiA+PiAgICAgIH0NCj4+ID4+ICB9DQo+PiA+PiArDQo+PiA+PiArLy8vIEEgY29udmVuaWVuY2Ug
d3JhcHBlciBhcm91bmQgW2BBdG9taWM8RmxhZz5gXSB0aGF0IGV4cG9zZXMgYSBgYm9vbGAgQVBJ
Lg0KPj4gPj4gK3B1YiBzdHJ1Y3QgQXRvbWljRmxhZyhBdG9taWM8RmxhZz4pOw0KPj4gPj4gKw0K
Pj4gPj4gK2ltcGwgQXRvbWljRmxhZyB7DQo+PiA+PiArICAgIC8vLyBDcmVhdGVzIGEgbmV3IGF0
b21pYyBmbGFnLg0KPj4gPj4gKyAgICBwdWIgY29uc3QgZm4gbmV3KGI6IGJvb2wpIC0+IFNlbGYg
ew0KPj4gPj4gKyAgICAgICAgaWYgYiB7DQo+PiA+PiArICAgICAgICAgICAgQXRvbWljRmxhZyhB
dG9taWM6Om5ldyhGbGFnOjpTZXQpKQ0KPj4gPj4gKyAgICAgICAgfSBlbHNlIHsNCj4+ID4+ICsg
ICAgICAgICAgICBBdG9taWNGbGFnKEF0b21pYzo6bmV3KEZsYWc6OkNsZWFyKSkNCj4+ID4+ICsg
ICAgICAgIH0NCj4+ID4+ICsgICAgfQ0KPj4gPj4gKw0KPj4gPj4gKyAgICAvLy8gTG9hZHMgdGhl
IHZhbHVlIGZyb20gdGhlIGF0b21pYyBmbGFnLg0KPj4gPj4gKyAgICAjW2lubGluZShhbHdheXMp
XQ0KPj4gPj4gKyAgICBwdWIgZm4gbG9hZDxPcmRlcmluZzogb3JkZXJpbmc6OkFjcXVpcmVPclJl
bGF4ZWQ+KCZzZWxmLCBvOiBPcmRlcmluZykgLT4gYm9vbCB7DQo+PiA+PiArICAgICAgICBzZWxm
LjAubG9hZChvKS5pbnRvKCkNCj4+ID4+ICsgICAgfQ0KPj4gPj4gKw0KPj4gPj4gKyAgICAvLy8g
U3RvcmVzIGEgdmFsdWUgdG8gdGhlIGF0b21pYyBmbGFnLg0KPj4gPj4gKyAgICAjW2lubGluZShh
bHdheXMpXQ0KPj4gPj4gKyAgICBwdWIgZm4gc3RvcmU8T3JkZXJpbmc6IG9yZGVyaW5nOjpSZWxl
YXNlT3JSZWxheGVkPigmc2VsZiwgYjogYm9vbCwgbzogT3JkZXJpbmcpIHsNCj4+ID4+ICsgICAg
ICAgIHNlbGYuMC5zdG9yZShiLmludG8oKSwgbykNCj4+ID4+ICsgICAgfQ0KPj4gPj4gK30NCj4+
ID4NCj4+ID4gWWVzLCB0aGF0J3Mgd2hhdCBJIG1lYW50Lg0KPj4NCj4+IFRoYW5rcyBmb3IgY29u
ZmlybWluZy4gSSdsbCBhZGQgaW4gdjMuDQo+IA0KPiBJIGd1ZXNzIGFub3RoZXIgZ29vZCB1c2Ut
Y2FzZSBjb3VsZCBiZSBgQXRvbWljVHJhY2tlcmAgaW4NCj4gcnVzdC9rZXJuZWwvbGlzdC9hcmMu
cnMNCg0KQm9xdW4sIG1heWJlIHdlIHNob3VsZCBkcm9wIHRoZSBhbHJlYWR5LW1lcmdlZCBwYXRj
aCBiZWxvdyBmcm9tIHRoZQ0KcnVzdC1zeW5jIGJyYW5jaCB0byBrZWVwIHRoZSBoaXN0b3J5IGNs
ZWFuPw0KDQpjb21taXQgMzIzZTRiZmNiZTJkYzZjNmNhYzZlMDA3ZGRlZDBiYTRmODlhNjQ1OA0K
QXV0aG9yOiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQpEYXRl
OiAgIFR1ZSBEZWMgMzAgMTg6Mzc6MTcgMjAyNSArMDkwMA0KDQogICAgcnVzdDogbGlzdDogU3dp
dGNoIHRvIGtlcm5lbDo6c3luYyBhdG9taWMgcHJpbWl0aXZlcw0KDQogICAgQ29udmVydCB1c2Vz
IG9mIGBBdG9taWNCb29sYCB0byBgQXRvbWljPGJvb2w+YC4NCg0K
