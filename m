Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF24535C8
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 23:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717715260; cv=none; b=u4j6HJAn4BZft5k3wWNtkUdzjmXseClGV634m6i20W+nd5vn9rMJYGJfkciVRb335KDrccvRgsk4QCYlLGjzQkUBG5M1aYQ5kF4AFOImA0lv/ITpguqoRDpxN40NIXr299a2Z60XK6gXNfjEXTDTcDpoL8pgRFbJ2MdKJGZUwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717715260; c=relaxed/simple;
	bh=dVCca+Ne+2PEfi/get0Sy7WUAa2AM06r/LAkq1tl2Cs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fLybkBtMDDJCmUa+oWZ7vq/Kzm/em+GAj5dnl+xD3J3s7oAXt22A+/8TrGimLAdn60F3LerV5FHGp114UlFbI30HZnvD/QAucVk3dVZYobAQms3Hx1NSRfQZYjebOXHtA5CG75BDt9KY3JMexRi7GcaSY5M3NdhkdHONCheQMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHC8RtIV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHC8RtIV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f61c2c689eso391455ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 16:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717715258; x=1718320058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVCca+Ne+2PEfi/get0Sy7WUAa2AM06r/LAkq1tl2Cs=;
        b=UHC8RtIVtZwWCE2WUPSTWrAzhbuN+i1yZBIBjWTYP739TI83sgPH/Kvb7K7PvOzp45
         cmvgvkA7DJIQaY0lPQztYmmEZeuSgQTdQlgyO86N8qh/+XWF43W6T3oFd6wCq6fzC3Bh
         /j9qUuM8bzHQG3zrbRzyVVOl4td264Mx59uGG83nlfFHwInJDEX6mPMpZoHix1kRLYLy
         nqEeV9j3Fnvbe8Jd7pApCv9xX06B251dub84//3/PsYPUI+BN255P4hzh+r1u67z4ZLB
         GVsqFsWwpqwXV1qn+4c9+Cm36lyCNtNzqpqXuvsGNf3vLFFeuMFNWzVJ0CZF1p2Pm4nX
         Vj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717715258; x=1718320058;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dVCca+Ne+2PEfi/get0Sy7WUAa2AM06r/LAkq1tl2Cs=;
        b=qAqF1bzw2pBSRTZYlG2K0PucMydXQmFCdBCKBb7QdX4b5Paj6xNkENAbJLexqctlr7
         5dKu2e2K5CC371/0OK9qMoDR8+lCh1Jlk0GXFFHdmAGf3xfYEIhDd37UrqebH902u19N
         G0JJtzj7O93zzc5667QjW+LYg8vzTM0nAN28dFFmfVKLwDZWAV27jSVT0/coaIzR9rAx
         x1TjK/DNS+LwmvlRIUEF1b3DXeE2pLjzocOnxclP8Ifi13ZtybFzuT6Qdw0TqfK4KJnL
         +xa79caBzH+5olqgwrPMr17c7EB1kNK74VC1ik02GEgbhq+thr2bqp/tyICISR3KEoio
         lxHA==
X-Forwarded-Encrypted: i=1; AJvYcCVzOZXq1mVQGtnXovE0ZyvTKIizmS0muIYX7JCCO0yxhM3DxtnGgX/hF3PVkshawZiCKX51Rgi58j1H94SpszipqvozGNemCBRNag2q5wU=
X-Gm-Message-State: AOJu0YyfEhVXYKhebf44GaWdkOLOpn/92eT9IsUqOmAwpfRQiDt3VyKC
	5A+IfdbKyMBpr47X7jInHZXpj9qOA7RpQeiXx+QhGh5RS7OcJc1V
X-Google-Smtp-Source: AGHT+IH6cLRm/L1j53L6QKXGBxU0AiCacWHPpZOXdCFDP5CJDVYHZbKohSMDEyHZhJyXcsPZSp2jgw==
X-Received: by 2002:a17:902:e84f:b0:1f4:b02d:bb61 with SMTP id d9443c01a7336-1f6d039ec98mr10749105ad.3.1717715257614;
        Thu, 06 Jun 2024 16:07:37 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd769bc7sm21158465ad.67.2024.06.06.16.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 16:07:37 -0700 (PDT)
Date: Fri, 07 Jun 2024 08:07:34 +0900 (JST)
Message-Id: <20240607.080734.1452322747397069433.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, benno.lossin@proton.me
Subject: Re: [PATCH v3 2/2] rust: net::phy unified genphy_read_status
 function for C22 and C45 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47tOMsT2dxUGSqZzsOvmja_744ykc1SUj3EJH=YFLk+wRw@mail.gmail.com>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
	<20240602231749.57111-3-fujita.tomonori@gmail.com>
	<CALNs47tOMsT2dxUGSqZzsOvmja_744ykc1SUj3EJH=YFLk+wRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCA2IEp1biAyMDI0IDAzOjUyOjEyIC0wNTAwDQpUcmV2b3IgR3Jvc3MgPHRtZ3Jvc3NA
dW1pY2guZWR1PiB3cm90ZToNCg0KPiBPbiBTdW4sIEp1biAyLCAyMDI0IGF0IDY6MTjigK9QTSBG
VUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4N
Cj4+IEFkZCB1bmlmaWVkIGdlbnBoeV9yZWFkX3N0YXR1cyBmdW5jdGlvbiBmb3IgQzIyIGFuZCBD
NDUNCj4+IHJlZ2lzdGVycy4gSW5zdGVhZCBvZiBoYXZpbmcgZ2VucGh5X2MyMiBhbmQgZ2VucGh5
X2M0NSBtZXRob2RzLCB0aGlzDQo+PiB1bmlmaWVzIGdlbnBoeV9yZWFkX3N0YXR1cyBmdW5jdGlv
bnMgZm9yIEMyMiBhbmQgQzQ1Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEZVSklUQSBUb21vbm9y
aSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4NCj4+IFsuLi5dDQo+PiBkaWZmIC0tZ2l0IGEv
cnVzdC9rZXJuZWwvbmV0L3BoeS5ycyBiL3J1c3Qva2VybmVsL25ldC9waHkucnMNCj4+IGluZGV4
IDliNGM0ZDI0YjIzMS4uZmYxNmQ0NGM3YmIwIDEwMDY0NA0KPj4gLS0tIGEvcnVzdC9rZXJuZWwv
bmV0L3BoeS5ycw0KPj4gKysrIGIvcnVzdC9rZXJuZWwvbmV0L3BoeS5ycw0KPj4gQEAgLTI0OSwx
NiArMjQ5LDggQEAgcHViIGZuIGdlbnBoeV9zdXNwZW5kKCZtdXQgc2VsZikgLT4gUmVzdWx0IHsN
Cj4+ICAgICAgfQ0KPj4NCj4+ICAgICAgLy8vIENoZWNrcyB0aGUgbGluayBzdGF0dXMgYW5kIHVw
ZGF0ZXMgY3VycmVudCBsaW5rIHN0YXRlLg0KPiANCj4gQ2FuIHlvdSBhZGQgYW4gZXhhbXBsZSB3
aXRoIHRoZSB1c2FnZSB5b3Ugc2hvd2VkIGF0IFsxXT8NCj4gDQo+IFsxXTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNDA2MDMuMjMzOTU0LjE2NDQ4MDMxNTEyNjgw
MzU3ODcuZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbS8NCg0KSW5kZWVkLCBJJ2xsLg0KDQoNCj4+
ICsgICAgcHViIGZuIGdlbnBoeV9yZWFkX3N0YXR1czxSOiByZWc6OlJlZ2lzdGVyPigmbXV0IHNl
bGYpIC0+IFJlc3VsdDx1MTY+IHsNCj4+ICsgICAgICAgIFI6OnJlYWRfc3RhdHVzKHNlbGYpDQo+
PiAgICAgIH0NCj4+DQo+PiAgICAgIC8vLyBVcGRhdGVzIHRoZSBsaW5rIHN0YXR1cy4NCj4+IGRp
ZmYgLS1naXQgYS9ydXN0L2tlcm5lbC9uZXQvcGh5L3JlZy5ycyBiL3J1c3Qva2VybmVsL25ldC9w
aHkvcmVnLnJzDQo+PiBpbmRleCA1M2E4M2U2OWIyMDAuLjc2MjhlYjA5ZTkwMiAxMDA2NDQNCj4+
IC0tLSBhL3J1c3Qva2VybmVsL25ldC9waHkvcmVnLnJzDQo+PiArKysgYi9ydXN0L2tlcm5lbC9u
ZXQvcGh5L3JlZy5ycw0KPj4gWy4uLl0NCj4+ICAvLy8gQzIyIHJlZ2lzdGVycy4NCj4+IEBAIC05
Niw2ICs5OSwxOCBAQCBmbiB3cml0ZSgmc2VsZiwgZGV2OiAmbXV0IERldmljZSwgdmFsOiB1MTYp
IC0+IFJlc3VsdCB7DQo+PiAgICAgICAgICAgICAgYmluZGluZ3M6Om1kaW9idXNfd3JpdGUoKCpw
aHlkZXYpLm1kaW8uYnVzLCAoKnBoeWRldikubWRpby5hZGRyLCBzZWxmLjAuaW50bygpLCB2YWwp
DQo+PiAgICAgICAgICB9KQ0KPj4gICAgICB9DQo+PiArDQo+PiArICAgIGZuIHJlYWRfc3RhdHVz
KGRldjogJm11dCBEZXZpY2UpIC0+IFJlc3VsdDx1MTY+IHsNCj4+IFsuLi5dDQo+PiArICAgICAg
ICBpZiByZXQgPCAwIHsNCj4+ICsgICAgICAgICAgICBFcnIoRXJyb3I6OmZyb21fZXJybm8ocmV0
KSkNCj4+ICsgICAgICAgIH0gZWxzZSB7DQo+PiArICAgICAgICAgICAgT2socmV0IGFzIHUxNikN
Cj4+ICsgICAgICAgIH0NCj4gDQo+IHRvX3Jlc3VsdCBjYW4gZG8gdGhpcyBjaGVjayBhbmQgY29u
dmVyc2lvbiBhIGJpdCBtb3JlIHN1Y2NpbmN0bHksIHVwDQo+IHRvIHlvdSBpZiB5b3Ugd291bGQg
cHJlZmVyIHRvIHVzZSBpdA0KPiANCj4gICAgIGVycm9yOjp0b19yZXN1bHQocmV0KT87DQo+ICAg
ICBPayhyZXQgYXMgdTE2KQ0KPiANCj4gVGhlcmUgYXJlIHNvbWUgaW5zdGFuY2VzIGluIHBhdGNo
IDEvMiBhcyB3ZWxsIGlmIHlvdSBjaG9vc2UgdG8gY2hhbmdlIGl0Lg0KDQpBaCwgY2xlYXZlci4g
SSdsbCB1c2UgdGhpcy4NCg0KDQo+PiArICAgIH0NCj4+ICB9DQo+Pg0KPj4gIC8vLyBNRElPIG1h
bmFnZWFibGUgZGV2aWNlcy4NCj4+IEBAIC0xNzEsNCArMTg2LDE2IEBAIGZuIHdyaXRlKCZzZWxm
LCBkZXY6ICZtdXQgRGV2aWNlLCB2YWw6IHUxNikgLT4gUmVzdWx0IHsNCj4+ICAgICAgICAgICAg
ICBiaW5kaW5nczo6cGh5X3dyaXRlX21tZChwaHlkZXYsIHNlbGYuZGV2YWQuMC5pbnRvKCksIHNl
bGYucmVnbnVtLmludG8oKSwgdmFsKQ0KPj4gICAgICAgICAgfSkNCj4+ICAgICAgfQ0KPj4gKw0K
Pj4gKyAgICBmbiByZWFkX3N0YXR1cyhkZXY6ICZtdXQgRGV2aWNlKSAtPiBSZXN1bHQ8dTE2PiB7
DQo+PiArICAgICAgICBsZXQgcGh5ZGV2ID0gZGV2LjAuZ2V0KCk7DQo+PiArICAgICAgICAvLyBT
QUZFVFk6IGBwaHlkZXZgIGlzIHBvaW50aW5nIHRvIGEgdmFsaWQgb2JqZWN0IGJ5IHRoZSB0eXBl
IGludmFyaWFudCBvZiBgU2VsZmAuDQo+PiArICAgICAgICAvLyBTbyBpdCdzIGp1c3QgYW4gRkZJ
IGNhbGwuDQo+PiArICAgICAgICBsZXQgcmV0ID0gdW5zYWZlIHsgYmluZGluZ3M6OmdlbnBoeV9j
NDVfcmVhZF9zdGF0dXMocGh5ZGV2KSB9Ow0KPj4gKyAgICAgICAgaWYgcmV0IDwgMCB7DQo+PiAr
ICAgICAgICAgICAgRXJyKEVycm9yOjpmcm9tX2Vycm5vKHJldCkpDQo+PiArICAgICAgICB9IGVs
c2Ugew0KPj4gKyAgICAgICAgICAgIE9rKHJldCBhcyB1MTYpDQo+PiArICAgICAgICB9DQo+IA0K
PiBEaXR0byB0aGUgYWJvdmUNCg0KSSdsbCBjaGFuZ2UgdGhlIGFib3ZlIHRvby4NCg0KDQpUaGFu
a3MgYSBsb3QhDQo=
