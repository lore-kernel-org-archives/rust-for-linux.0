Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B123B38DD3
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767919008; cv=none; b=oIT2XwGg+jzDinnlYKmRLKLEe1eHSuObMIl7zCLMUP9Wn1G/c+PZ0n9Z+PUM+ftXYjR/omYi6seaIZdaFM63RKNnUbX2MizhZeqHEgwiLMWQYBXj3bxnBtyv7uRwFyWtS2KADe84jFVVyeyfwl+K1x0ZbP4sRdBBcC4vXlaVXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767919008; c=relaxed/simple;
	bh=vfiD0Sn85pcKYDmBsGQzdoemouFqtVj29Djn73H9cbc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WPX/4biOwUIaqhU5kb7WXkFvf1cNPhcZ0kAO1P2FF1zlpjTftLA0xA3s0OkEugHZVxJ2vTjb5RzGn2umJD5HWRuu/0NsvMUdwSvnUst7H39qYmSOl1lPp1YVlh3nkmJAHbOqkYecIG1lQ8cUtBo3ZDohPm6/wQ3l/fKrCfx8B1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcTnbIBI; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcTnbIBI"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aab7623f42so3261875b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 16:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767919006; x=1768523806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfiD0Sn85pcKYDmBsGQzdoemouFqtVj29Djn73H9cbc=;
        b=jcTnbIBIWoXYAeMaDv5c9curIsqZOm+ZF9nuyoKJeDcwtVEQtS8BVO0EfyodoxrqZp
         v54q5YQwz75R1k7p0k0XdvWM7zjkH6QCSB9T2OqGo29xpZuM5qDIxCIVZ3H5Pg3uJ8dQ
         /GgxUaJPzXmq1i7Ay4lvx0+bCd9lkX5mJ7vSnZoYr3l8F5r46Zobgv6j+tyFfI4so8S/
         aQK82WSbgdUUu69hgxtt7WRt3v4MLAu58gvNkdyGylg832TtMOi7xvPpEDATc2I26nF/
         YY56Fo/2yfJNP3I1TQLSHRkQDo5wZod0oYZylFCCRp/83OEK6kleEb2osUiATKjQ3XlH
         gpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767919006; x=1768523806;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfiD0Sn85pcKYDmBsGQzdoemouFqtVj29Djn73H9cbc=;
        b=ct75TtgrbrQq2WiWXg1WQsg/TD10ydg3cbLrexvuQdpIYnHhEsDgfHnwcjl48PaEgs
         HvbPw7CgxYJuBsp8tOM5UBSsWGycK/rQ2GxDkAkO5zJBrNYrzQ4U/EofswsLJecS4dvM
         EjML+7lpfRvUZcKJqAztdR0SE56acl94ZFCRy3P0p6Rqjm1myb3Z00II36kq6RGP1HeS
         mi2Cty+UDZrddmN9HF467d51yc72lBeQwzARyXP3J9jkR63RPrITCC1ZxLCnSYoXzfA5
         vB2uB4PFZkK0QCOCiuNy9gSs2c+sG6S240sB4g97N5j4MLiqPZoRfSE3MdG1aTRvEtQe
         NSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOpjh2otJAH7mNpSSep5D5LjYVsDcftxkWB3E75ysNz3JSGZWDaHzWI9oXuK7zGSjSdQMzqCNEL+cjpE4y8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EcxUQJKwc90iwg8/ol5jaq0uuS5OyP1UGEhYAf4kKfejDMVB
	fEksb56yWzjVxSEfbjWp/fj4QEI7PBhIScWWwoSzg5nyPfXwmFKRs5YD
X-Gm-Gg: AY/fxX7uhfg34NG3Ih2VNQJG1lQP8EgSm1qgptUe1QVYTN6RjW3Gm+SyLcIvV4fusAF
	FR26YAIa7SybDTMA55geBAT2uERzNvrEZqYWWP9kVGLCvaxctJmgDdvxbo8rSDTkbqfIVUJ4xTM
	qM+34c4WRTLcUhHkpMwWJiuiHh0b7fQeeubOddWGVEHvxRvptA3Q8rmfLbjLah/exkTBczYhr2o
	Yaof8/P62Cayx+7Q1pUEsaIQKhJ8II5kGrLboS5SQQOE9loQowMQpkfaaSYYtSzwqWJFeDRI/Gs
	P4Eu02Y8utKOX8SAItHXfo63F4UowyfHtyGVWb/FkDir3XqD7COle8z87qkTHmsHRskwNsjlRjG
	zAXkewyj0k6zxsRvunhurdm1S6R2qvcEC2biwhd3JAoEXew2csB7LV1hMh9thxnSOXryz5s/PuK
	oemoCMsiiz3DOt580Emq2zjAoyXdGYXFsTJnWuNnB39Ph/M0yEYe9BofNRc6NetBaZfX0=
X-Google-Smtp-Source: AGHT+IEelNlhKHHnjDo+UF8IY3I8Gxjtm0F8jvc08hiFfxxCGNJCrxiIg9nSPoCeUTXaQObTZnThSw==
X-Received: by 2002:a05:6a00:909d:b0:781:2538:bf95 with SMTP id d2e1a72fcca58-81b7d865d3emr7055731b3a.10.1767919005854;
        Thu, 08 Jan 2026 16:36:45 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e150d6bf0sm364050b3a.26.2026.01.08.16.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 16:36:45 -0800 (PST)
Date: Fri, 09 Jan 2026 09:36:41 +0900 (JST)
Message-Id: <20260109.093641.1161098806794561807.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic
 booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com>
References: <20260108125005.2945800-1-fujita.tomonori@gmail.com>
	<CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCA4IEphbiAyMDI2IDEzOjU0OjU4ICswMTAwDQpBbGljZSBSeWhsIDxhbGljZXJ5aGxA
Z29vZ2xlLmNvbT4gd3JvdGU6DQoNCj4gT24gVGh1LCBKYW4gOCwgMjAyNiBhdCAxOjUw4oCvUE0g
RlVKSVRBIFRvbW9ub3JpDQo+IDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPiB3cm90ZToNCj4+
DQo+PiBBZGQgYSBuZXcgRmxhZyBlbnVtIChDbGVhci9TZXQpIGFuZCBpbXBsZW1lbnQgQXRvbWlj
VHlwZSBmb3IgaXQsIHNvDQo+PiB1c2VycyBjYW4gdXNlIEF0b21pYzxGbGFnPiBmb3IgYm9vbGVh
biBmbGFncy4NCj4+DQo+PiBUaGUgYmFja2luZyBpbnRlZ2VyIHR5cGUgaXMgYW4gaW1wbGVtZW50
YXRpb24gZGV0YWlsOyBpdCBpcyBjdXJyZW50bHkNCj4+IGkzMiBidXQgbWF5IGNoYW5nZSBpbiB0
aGUgZnV0dXJlLg0KPj4NCj4+IERvY3VtZW50IHdoZW4gQXRvbWljPEZsYWc+IGlzIGdlbmVyYWxs
eSBwcmVmZXJhYmxlIHRvIEF0b21pYzxib29sPjogaW4NCj4+IHBhcnRpY3VsYXIsIHdoZW4gUk1X
IG9wZXJhdGlvbnMgc3VjaCBhcyB4Y2hnKCkvY21weGNoZygpIG1heSBiZSB1c2VkDQo+PiBhbmQg
bWluaW1pemluZyBtZW1vcnkgdXNhZ2UgaXMgbm90IHRoZSB0b3AgcHJpb3JpdHkuIE9uIHNvbWUN
Cj4+IGFyY2hpdGVjdHVyZXMgd2l0aG91dCBieXRlLXNpemVkIFJNVyBpbnN0cnVjdGlvbnMsIEF0
b21pYzxib29sPiBjYW4gYmUNCj4+IHNsb3dlciBmb3IgUk1XIG9wZXJhdGlvbnMuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29t
Pg0KPiANCj4gQ2FuIHdlIGhhdmUgYSBgc3RydWN0IEF0b21pY0ZsYWcoQXRvbWljPEZsYWc+KWAg
aGVyZSB3aG9zZSBsb2FkKCkgLw0KPiBzdG9yZSgpIG1ldGhvZHMgdXNlIHJlYWwgYm9vbGVhbnM/
IE90aGVyd2lzZSB0aGlzIHNlZW1zIGluY29udmVuaWVudA0KPiB0byB1c2UuDQoNCkRvIHlvdSBt
ZWFuIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcz8NCg0KZGlmZiAtLWdpdCBhL3J1c3Qva2Vy
bmVsL3N5bmMvYXRvbWljLnJzIGIvcnVzdC9rZXJuZWwvc3luYy9hdG9taWMucnMNCmluZGV4IDQ3
M2QzYzA3ZTIzNC4uMTk3NTBiZTFhMjM5IDEwMDY0NA0KLS0tIGEvcnVzdC9rZXJuZWwvc3luYy9h
dG9taWMucnMNCisrKyBiL3J1c3Qva2VybmVsL3N5bmMvYXRvbWljLnJzDQpAQCAtNjIyLDMgKzYy
MiwyOSBAQCBmbiBmcm9tKGI6IGJvb2wpIC0+IFNlbGYgew0KICAgICAgICAgfQ0KICAgICB9DQog
fQ0KKw0KKy8vLyBBIGNvbnZlbmllbmNlIHdyYXBwZXIgYXJvdW5kIFtgQXRvbWljPEZsYWc+YF0g
dGhhdCBleHBvc2VzIGEgYGJvb2xgIEFQSS4NCitwdWIgc3RydWN0IEF0b21pY0ZsYWcoQXRvbWlj
PEZsYWc+KTsNCisNCitpbXBsIEF0b21pY0ZsYWcgew0KKyAgICAvLy8gQ3JlYXRlcyBhIG5ldyBh
dG9taWMgZmxhZy4NCisgICAgcHViIGNvbnN0IGZuIG5ldyhiOiBib29sKSAtPiBTZWxmIHsNCisg
ICAgICAgIGlmIGIgew0KKyAgICAgICAgICAgIEF0b21pY0ZsYWcoQXRvbWljOjpuZXcoRmxhZzo6
U2V0KSkNCisgICAgICAgIH0gZWxzZSB7DQorICAgICAgICAgICAgQXRvbWljRmxhZyhBdG9taWM6
Om5ldyhGbGFnOjpDbGVhcikpDQorICAgICAgICB9DQorICAgIH0NCisNCisgICAgLy8vIExvYWRz
IHRoZSB2YWx1ZSBmcm9tIHRoZSBhdG9taWMgZmxhZy4NCisgICAgI1tpbmxpbmUoYWx3YXlzKV0N
CisgICAgcHViIGZuIGxvYWQ8T3JkZXJpbmc6IG9yZGVyaW5nOjpBY3F1aXJlT3JSZWxheGVkPigm
c2VsZiwgbzogT3JkZXJpbmcpIC0+IGJvb2wgew0KKyAgICAgICAgc2VsZi4wLmxvYWQobykuaW50
bygpDQorICAgIH0NCisNCisgICAgLy8vIFN0b3JlcyBhIHZhbHVlIHRvIHRoZSBhdG9taWMgZmxh
Zy4NCisgICAgI1tpbmxpbmUoYWx3YXlzKV0NCisgICAgcHViIGZuIHN0b3JlPE9yZGVyaW5nOiBv
cmRlcmluZzo6UmVsZWFzZU9yUmVsYXhlZD4oJnNlbGYsIGI6IGJvb2wsIG86IE9yZGVyaW5nKSB7
DQorICAgICAgICBzZWxmLjAuc3RvcmUoYi5pbnRvKCksIG8pDQorICAgIH0NCit9DQo=
