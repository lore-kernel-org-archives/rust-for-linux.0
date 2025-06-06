Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E962222AC
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245791; cv=none; b=dJB9fOIA6z7tFdmsY49Yi1HrbuorFbOalJ4IJNELBzzVIZ2lm9Va51308RayrZ8bbzbZelJmkv7bLd81+nQCAVDu9+d+SZ9tLkmItiBN7TgUg50HfQtfg8mFdG+TjuKYCaOu2Zd6lXQ0CTq8YmPl+bsRiTBcWg0wMQarh3vpf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245791; c=relaxed/simple;
	bh=qWQLhtyeu579zTjrJIZyi3Pih4gZEhwFO9P1hRerHTQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jfIGSnVgMw0BzPZ1W3m83uFCq88JWcjnYcZyHk+a4B/nMW70X6gKR8poL/E+SroxbIR6zCLKtiqTnhXZKzmRmuM3spWbQ/cAxvdZkYZFz9VujHn8PliGIYKx8VPXTRc4afaUdUG0K1DJlC9ZoPGDhmtPRO8PkHyYZ4kuOqRpwkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaXQviA0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaXQviA0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23539a1a421so23358605ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Jun 2025 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749245789; x=1749850589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWQLhtyeu579zTjrJIZyi3Pih4gZEhwFO9P1hRerHTQ=;
        b=IaXQviA01jehIsvcI9eNbcLP78MVw6O1gr3pOVfI9lXNbNdCwQdR0SCim70oNriT/Z
         O5WtOo98e80mWUZ1/ZT6/zpeVg9EWdB0t7I1Xqm8XK8uTwCNsbiG8wKbDqZlXd4UOJRP
         kfrfvSOYWl605rXxdP/1x7rig30zoJksNjPm/73jMfuZw9m+QvNhnooZSKVoAn7FrRM8
         eWKa/HKT/7P+hefHEC6Mqt2LmWmGmyIlanID+d8iJD5GSbIz0qKItJSB7Aecn6DeavJ2
         29ru3hL17tJ+F6cIWI4Pps7+yuePy+P8lQtUOsjSufHvPR7Jgky0IwQnhDazQfr3uoit
         fWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749245789; x=1749850589;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qWQLhtyeu579zTjrJIZyi3Pih4gZEhwFO9P1hRerHTQ=;
        b=RvxQLMqufc/yozK4Wc9eq0ToLOEVcvbRH/ggD9eAV3biyTelso/6/XCsrNwl3kR1s4
         aVTxx/oTbgTAWtqMqczmCxUT32PMvA/9xyca5jnwpErj/G9Glm8f42S36Aq3dVyU7JCW
         q77SlZ7B5e3SAG5r2Srl7ItQXZW9wSVr4dF1It9jew6YPULSSHpSHWcSU5vMPLZor5Aa
         CTWopN/xfZ8dnJ/PhHnh9rKFIksh/ss561xd7kchrudOSfv3/FolpSeTI4PG5EqpBnez
         YULc0Lfzg/n/zS/tInzOJSnqwZeNYQk05qlzqK7v7h0K8Oz4+ooNmOi0SNZy7gBNXksP
         169A==
X-Forwarded-Encrypted: i=1; AJvYcCXE5zxzGfS0rEDzl9ygG78SPeEML4wsrj/zwzRK6xNtgkKv0jqHkrAVbF9B0bEr7ZHgwid8mignj6lHpeLb3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYeL67rRVaZb/Lf1SW302o/d+SVOKyBjbAYllP7VlBwZb/nNa+
	1o+R14ZbemovoyTawoSJ1vSOmhnuPT1F+Idg3eOsnC872iiR5zNSbrrd
X-Gm-Gg: ASbGnctWYPPVx0TIiJS5yRNnN21seYDI0X1c6qE86HZ7PYOpHDbq8YzfGn/9A1uaegn
	f3h0PqdTgmQDncOs/a9BheI8OLKQkShJV7Vb5Fztm7JcvXkN33leUAC2IQQa5myzZSyV/8iUFM3
	0A9VTnNBYz3MnwD6nu7+pb1XMWYbR7EPJs9WlnfDQ7B2ZukpP0I14G9LznP1FbgmtddnWsrSEyp
	hkHhZMTovwEx9McTeqaI/zPbZfSCyewISMubfCTVJmRrCDc3FFPnQoZTY2hT9aFi2TBVm3raCDs
	Cev4qgSmjnGJkzw/Vu9/PGnWY+6giJo2f5ijACUh6L/RCu/wMioMHbho/VqRVWdOOpu04Ke1Kf4
	kQSLFc+PaDpl5f4UOCtoAlJscfQOKULeLk63FyZkAEw6S
X-Google-Smtp-Source: AGHT+IGmxyhqLhF4d3tWqfD44BXKK4BhCyHmZ3M0wlQwXndYcFI/STwUnuwGm+xpeP2absibWrHt9Q==
X-Received: by 2002:a17:902:d48f:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23601deb5d8mr72062815ad.43.1749245789341;
        Fri, 06 Jun 2025 14:36:29 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fccf1sm16890525ad.97.2025.06.06.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 14:36:28 -0700 (PDT)
Date: Sat, 07 Jun 2025 06:36:17 +0900 (JST)
Message-Id: <20250607.063617.455813499811073744.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, a.hindborg@kernel.org,
 alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, tamird@gmail.com
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer
 macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
	<CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gRnJpLCA2IEp1biAyMDI1IDE3OjM0OjAzICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIEZyaSwgSnVuIDYsIDIwMjUg
YXQgNDowNuKAr0FNIEZVSklUQSBUb21vbm9yaQ0KPiA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gRml4IGEgY29tcGlsZSBlcnJvciBpbiB0aGUgYGltcGxfaGFzX2hy
X3RpbWVyIWAgbWFjcm8gYXMgZm9sbG93czoNCj4+DQo+PiBlcnJvcltFMDU5OV06IG5vIG1ldGhv
ZCBuYW1lZCBjYXN0X211dCBmb3VuZCBmb3IgcmF3IHBvaW50ZXIgKm11dCBGb28gaW4gdGhlIGN1
cnJlbnQgc2NvcGUNCj4+DQo+PiBUaGUgYGNvbnRhaW5lcl9vZiFgIG1hY3JvIGFscmVhZHkgcmV0
dXJucyBhIG11dGFibGUgcG9pbnRlciB3aGVuIHVzZWQNCj4+IGluIGEgYCptdXQgVGAgY29udGV4
dCBzbyB0aGUgYC5jYXN0X211dCgpYCBtZXRob2QgaXMgbm90IGF2YWlsYWJsZS4NCj4+DQo+PiBG
aXhlczogNzRkNmE2MDZjMmIzICgicnVzdDogcmV0YWluIHBvaW50ZXIgbXV0LW5lc3MgaW4gYGNv
bnRhaW5lcl9vZiFgIikNCj4+IFNpZ25lZC1vZmYtYnk6IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4NCj4gDQo+IEFoLCByaWdodCwgd2UgbWlzc2VkIHRoaXMgb25l
IGJlY2F1c2UgdGhlcmUgaXMgbm8gY2FsbGVyIHlldCBhbmQgaXQgaXMNCj4gYSBtYWNybywgc29y
cnkgYWJvdXQgdGhhdC4gU28sIGp1c3QgdG8gY29uZmlybSwgdGhlIGJ1aWxkIGVycm9yIGlzDQo+
IHdpdGggZXh0cmEgY29kZSBvbiB0b3AsIHJpZ2h0Pw0KDQpUaGF0J3MgcmlnaHQuDQoNCj4gVGhl
IEZpeGVzIHRhZyBzZWVtcyByaWdodCwgc2luY2UgdGhlIGNvZGUgYWxyZWFkeSBleGlzdGVkIGJh
Y2sgdGhlbi4NCj4gV2Ugc2hvdWxkIHByb2JhYmx5IGJhY2twb3J0IHRvbywgZXZlbiBpZiB0aGVy
ZSBhcmUgbm8gdXBzdHJlYW0gdXNlcnMsDQo+IHNpbmNlIHRoZXJlIHNob3VsZCBiZSBubyBkb3du
c2lkZSBhbmQgaXQgaXMgZWFzeSwgc286DQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zw0KDQpUaGUgY29tbWl0IHdhcyBtZXJnZWQgaW50byBtYWlubGluZSBpbiB0aGUgcHVsbCByZXF1
ZXN0IGZvcg0KdjYuMTYuIElzbid0IHRoZXJlIG5vIHN0YWJsZSBrZXJuZWwgdmVyc2lvbiB0aGF0
IHRoaXMgc2hvdWxkIGJlDQpiYWNrcG9ydGVkIHRvPw0KDQoNCj4gVGhhbmtzIFRvbW8sIEkgd2ls
bCB0YWtlIGl0IGFzIGEgZml4IHRoZW4uDQoNClRoYW5rcyENCg==
