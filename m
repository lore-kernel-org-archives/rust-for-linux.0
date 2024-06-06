Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53262535C8
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717714972; cv=none; b=qbKduY2objv8xvfG6j90ydvcIa8bLl8+xkrEoN2spj3kAif3pKtAEwFP6hYwgICltU5xqFofij28YCGpjSo5pTHWNw2ULpfaQwLUA8nfNKw9+9IpC+E5HkwJ0o//fjb31AQFssmZ5KcwUrjOoYZrkB3W9xab74YuPlIIpSvrquk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717714972; c=relaxed/simple;
	bh=T1sxtQu8WmUu8vtlbSOJGFDZWcliLjXXsC68/m3i900=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=avUOH8OT3HCblGIi0rZ07QOPF5L72vwRH4UZWr7Qv0eTiuY+fT7Ky2Jw5VPDEN3gU2vUVFZA5Tpxdk+jexIer6HphgP7Rise5WDkiEltQkkQBqDnO9hpe+oQ9oJmaA4oDjgrHWu3ZLbEx3uzP0wo9X+jXNYWX2NbquJnu4v2NQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqrYSio1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqrYSio1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c1b91de580so225941a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 16:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717714970; x=1718319770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1sxtQu8WmUu8vtlbSOJGFDZWcliLjXXsC68/m3i900=;
        b=hqrYSio1047qLi3upCJRcGAc/xi4SwrOYv9O0FA8Upy8vG2fSzLosW/ZSPyh6B3q97
         ZD89vmqaAUmvBE8giIM7WGQ5t7kjyImSFIFqp+YChSwEpWjVhl8rLDEIIdjFJwgolr2Z
         lvPnICxbjKmI9LOr9mGE81VIInbgz5g6q2ukbSeHe2rC/GiCUPkYiuNn+ZBR71X8RicY
         Rrp+ElJzN6kXZKUkI/QOvP+s5ngU9Wyf6HG01Y3MpK2bFZa/P5GQD9rkpE34AX7/nef0
         eidZtipvMtlRgY9hnakZKtg0L2SLJ9d+g2CM4u5xhy5k7yoovdPI2sbg0C521cr0NGts
         iA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717714970; x=1718319770;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T1sxtQu8WmUu8vtlbSOJGFDZWcliLjXXsC68/m3i900=;
        b=gfUGil+rSVsIxYGriVQWRXbYQRHgV4vT/4pVGzMiB+RkmmirL2OZgPqLJuVGazjwvT
         a/dvnXbypoNtSTTsmvwm+vHbGNgMfbFkcBoEY8LRgHArfOhTWrnqT+M4fAV6SRGVBIdl
         l6ifjWArN1TYvhfd2t6myudkKtvMiUAv1VEPakBlMpRQbH0wSVWmOU1NccrWgQpGXCr8
         BjfACgLqc4xieguh5FokGhRf3lve7r04Cq4qYHh+qFtd9+Ku6BHUdV6HvXsqFCYqbbSg
         th+g2tIQpw3I/K97HQ3ymZSnFa1IZRg1MeUxKDtpsPkiyOnvirHL3kVo0MPtG/Omg9OG
         eZXw==
X-Forwarded-Encrypted: i=1; AJvYcCVVgW3ClDquD22U0nYatxRQ92I9NcBZ6gcEegGv2ArS+TVyF9GzZkgAvXg3y67qzD2RyavQXWoeCdU4AFXS2t6NPMjpMyfpxvAxNEpAbgw=
X-Gm-Message-State: AOJu0YzhFaLDXn1UFGpECYZlfKXD5eKPxGm0D74zQJBl6hSbFNrnLaLL
	P0WyYxkWXK+eAZiBkxkQp2cNyUHsClm0ofL5sSvmQ4bghhjsmAXT
X-Google-Smtp-Source: AGHT+IGYGlYhz7GMF4NO/hj2K0dGvPTocI7kVVXuz+fypKYDPmUIkSfG3NJq5vjqAZ053nyoL+ipUQ==
X-Received: by 2002:a17:902:ced1:b0:1f2:efdf:a400 with SMTP id d9443c01a7336-1f6d0408862mr9622105ad.5.1717714970440;
        Thu, 06 Jun 2024 16:02:50 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e29e1sm20523685ad.224.2024.06.06.16.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 16:02:50 -0700 (PDT)
Date: Fri, 07 Jun 2024 08:02:36 +0900 (JST)
Message-Id: <20240607.080236.199306626197602234.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, benno.lossin@proton.me
Subject: Re: [PATCH v3 1/2] rust: net::phy unified read/write API for C22
 and C45 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47sQeXZExxQK-vdx0zh6-aC376KYLbLcS6_e2rsFe_piZQ@mail.gmail.com>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
	<20240602231749.57111-2-fujita.tomonori@gmail.com>
	<CALNs47sQeXZExxQK-vdx0zh6-aC376KYLbLcS6_e2rsFe_piZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCA2IEp1biAyMDI0IDAzOjQxOjE4IC0wNTAwDQpUcmV2b3IgR3Jvc3MgPHRtZ3Jvc3NA
dW1pY2guZWR1PiB3cm90ZToNCg0KPiBPbiBTdW4sIEp1biAyLCAyMDI0IGF0IDY6MTjigK9QTSBG
VUpJVEEgVG9tb25vcmkNCj4gPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+IHdyb3RlOg0KPj4N
Cj4+IEFkZCB0aGUgdW5pZmllZCByZWFkL3dyaXRlIEFQSSBmb3IgQzIyIGFuZCBDNDUgcmVnaXN0
ZXIuIFRoZQ0KPiANCj4gcy9yZWdpc3Rlci9yZWdpc3RlcnMNCg0KT29wcywgSSdsbCBmaXguDQoN
Cj4+IGFic3RyYWN0aW9ucyBzdXBwb3J0IGFjY2VzcyB0byBvbmx5IEMyMiByZWdpc3RlcnMgbm93
LiBJbnN0ZWFkIG9mDQo+PiBhZGRpbmcgcmVhZC93cml0ZV9jNDUgbWV0aG9kcyBzcGVjaWZpY2Fs
bHkgZm9yIEM0NSwgYSBuZXcgcmVnIG1vZHVsZQ0KPj4gc3VwcG9ydHMgdGhlIHVuaWZpZWQgQVBJ
IHRvIGFjY2VzcyBDMjIgYW5kIEM0NSByZWdpc3RlcnMgd2l0aCB0cmFpdCwNCj4+IGJ5IGNhbGxp
bmcgYW4gYXBwcm9wcmlhdGUgcGh5bGliIGZ1bmN0aW9ucy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20+DQo+IA0KPiBTb3Jy
eSBmb3IgdGhlIGRlbGF5cyBpbiByZXZpZXdzLCB0aGlzIGxvb2tzIHByZXR0eSBnb29kIHRvIG1l
IHNvIGZhci4NCj4gSSBsaWtlIHRoZSBjbGVhbnVwIG9mIG1vdmluZyByZWdpc3RlciBsb2dpYyB0
byBpdHMgb3duIG1vZHVsZS4NCj4gDQo+PiBkaWZmIC0tZ2l0IGEvcnVzdC9rZXJuZWwvbmV0L3Bo
eS9yZWcucnMgYi9ydXN0L2tlcm5lbC9uZXQvcGh5L3JlZy5ycw0KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTNhODNlNjliMjAwDQo+PiAtLS0gL2Rldi9u
dWxsDQo+PiArKysgYi9ydXN0L2tlcm5lbC9uZXQvcGh5L3JlZy5ycw0KPj4gQEAgLTAsMCArMSwx
NzQgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4gKw0KPj4g
Ky8vIENvcHlyaWdodCAoQykgMjAyNCBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21vbm9yaUBn
bWFpbC5jb20+DQo+PiArDQo+PiArLy8hIFBIWSByZWdpc3RlcnMuDQo+PiArLy8hDQo+PiArLy8h
IFRoaXMgbW9kdWxlIHByb3ZpZGVzIGFuIGludGVyZmFjZSBmb3IgUEhZIHJlZ2lzdGVycyBkZWZp
bmVkIGluIElFRUUgODAyLjMNCj4+ICsvLyEgQ2xhdXNlIDIyIGFuZCA0NS4NCj4gDQo+IERvY3Mg
c3VnZ2VzdGlvbjoNCj4gDQo+ICAgICBQSFkgcmVnaXN0ZXIgaW50ZXJmYWNlcy4NCj4gDQo+ICAg
ICBUaGlzIG1vZHVsZSBwcm92aWRlcyBzdXBwb3J0IGZvciBhY2Nlc3NpbmcgUEhZIHJlZ2lzdGVy
cyB2aWEgRXRoZXJuZXQNCj4gICAgIG1hbmFnZW1lbnQgaW50ZXJmYWNlIGNsYXVzZSAyMiBhbmQg
NDUsIGFzIGRlZmluZWQgaW4gSUVFRSA4MDIuMy4NCg0KTXVjaCBiZXR0ZXIgdGhhbiBtaW5lIDop
IEknbGwgdXBkYXRlIHRoZSBjb21tZW50Lg0KDQo+PiArdXNlIHN1cGVyOjpEZXZpY2U7DQo+PiAr
dXNlIGNyYXRlOjpidWlsZF9hc3NlcnQ7DQo+PiArdXNlIGNyYXRlOjplcnJvcjo6KjsNCj4+ICt1
c2UgY3JhdGU6OnVhcGk7DQo+PiArDQo+PiArLy8vIEFjY2Vzc2VzIFBIWSByZWdpc3RlcnMuDQo+
PiArLy8vDQo+PiArLy8vIFRoaXMgdHJhaXQgaXMgdXNlZCB0byBpbXBsZW1lbnQgdGhlIHVuaWZp
ZWQgaW50ZXJmYWNlIHRvIGFjY2Vzcw0KPj4gKy8vLyBDMjIgYW5kIEM0NSBQSFkgcmVnaXN0ZXJz
Lg0KPj4gK3B1YiB0cmFpdCBSZWdpc3RlciB7DQo+IA0KPiBTaW5jZSB3ZSBkb24ndCB1c2UgdGhp
cyBhbnl3aGVyZSBjb3VsZCBpdCBiZSBzZWFsZWQ/DQoNClllYWguIE9ubHkgcmVnIG1vZHVsZSBp
bXBsZW1lbnRzIGl0LiBIb3cgaXQgY2FuIGJlIGRvbmU/DQoNCmRpZmYgLS1naXQgYS9ydXN0L2tl
cm5lbC9uZXQvcGh5L3JlZy5ycyBiL3J1c3Qva2VybmVsL25ldC9waHkvcmVnLnJzDQppbmRleCA3
NjI4ZWIwOWU5MDIuLjBkZmFlNDY3NzU3NCAxMDA2NDQNCi0tLSBhL3J1c3Qva2VybmVsL25ldC9w
aHkvcmVnLnJzDQorKysgYi9ydXN0L2tlcm5lbC9uZXQvcGh5L3JlZy5ycw0KQEAgLTEyLDExICsx
MiwxOCBAQA0KIHVzZSBjcmF0ZTo6ZXJyb3I6Oio7DQogdXNlIGNyYXRlOjp1YXBpOw0KIA0KK21v
ZCBwcml2YXRlIHsNCisgICAgcHViIHRyYWl0IFNlYWxlZCB7fQ0KKw0KKyAgICBpbXBsIFNlYWxl
ZCBmb3Igc3VwZXI6OkMyMiB7fQ0KKyAgICBpbXBsIFNlYWxlZCBmb3Igc3VwZXI6OkM0NSB7fQ0K
K30NCisNCiAvLy8gQWNjZXNzZXMgUEhZIHJlZ2lzdGVycy4NCiAvLy8NCiAvLy8gVGhpcyB0cmFp
dCBpcyB1c2VkIHRvIGltcGxlbWVudCB0aGUgdW5pZmllZCBpbnRlcmZhY2UgdG8gYWNjZXNzDQog
Ly8vIEMyMiBhbmQgQzQ1IFBIWSByZWdpc3RlcnMuDQotcHViIHRyYWl0IFJlZ2lzdGVyIHsNCitw
dWIgdHJhaXQgUmVnaXN0ZXI6IHByaXZhdGU6OlNlYWxlZCB7DQogICAgIC8vLyBSZWFkcyBhIFBI
WSByZWdpc3Rlci4NCiAgICAgZm4gcmVhZCgmc2VsZiwgZGV2OiAmbXV0IERldmljZSkgLT4gUmVz
dWx0PHUxNj47DQoNCg0KPiBUaGlzIG1pZ2h0IG5vdCBldmVuIG5lZWQgdG8gYmUgcHVibGljIHNp
bmNlIGl0IHNob3VsZCBwcm9iYWJseSBvbmx5IGJlDQo+IHVzZWQgYXMgYSBtZXRob2Qgb24gYERl
dmljZWAgKGkuZS4gYG15X2RldmljZS5yZWFkKEMyMjo6Qk1DUilgIHJhdGhlcg0KPiB0aGFuIGlt
cG9ydGluZyB0aGUgdHJhaXQgYW5kIHVzaW5nIGBDMjI6OkJDTVI6OnJlYWQobXlfZGV2aWNlKWAp
Lg0KDQpJZiBJIGRyb3AgcHVibGljLCBJIGdvdCB0aGUgZm9sbG93aW5nIGVycm9yOg0KDQplcnJv
cltFMDYwM106IHRyYWl0IGBSZWdpc3RlcmAgaXMgcHJpdmF0ZQ0KICAgLS0+IHJ1c3Qva2VybmVs
L25ldC9waHkucnM6MTgxOjI1DQogICAgfA0KMTgxIHwgICAgIHB1YiBmbiByZWFkPFI6IHJlZzo6
UmVnaXN0ZXI+KCZtdXQgc2VsZiwgcmVnOiBSKSAtPiBSZXN1bHQ8dTE2PiB7DQogICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXiBwcml2YXRlIHRyYWl0DQogICAgfA0Kbm90ZTog
dGhlIHRyYWl0IGBSZWdpc3RlcmAgaXMgZGVmaW5lZCBoZXJlDQogICAtLT4gcnVzdC9rZXJuZWwv
bmV0L3BoeS9yZWcucnM6MTk6MQ0KICAgIHwNCjE5ICB8IHRyYWl0IFJlZ2lzdGVyIHsNCiAgICB8
IF5eXl5eXl5eXl5eXl5eOg0KDQooc25pcCkNCg0KDQo+PiArICAgIC8vLyBSZWFkcyBhIFBIWSBy
ZWdpc3Rlci4NCj4+ICsgICAgZm4gcmVhZCgmc2VsZiwgZGV2OiAmbXV0IERldmljZSkgLT4gUmVz
dWx0PHUxNj47DQo+PiArDQo+PiArICAgIC8vLyBXcml0ZXMgYSBQSFkgcmVnaXN0ZXIuDQo+PiAr
ICAgIGZuIHdyaXRlKCZzZWxmLCBkZXY6ICZtdXQgRGV2aWNlLCB2YWw6IHUxNikgLT4gUmVzdWx0
Ow0KPj4gK30NCj4+ICsNCj4gDQo+PiArLy8vIEMyMiByZWdpc3RlcnMuDQo+PiArcHViIHN0cnVj
dCBDMjIodTgpOw0KPiANCj4gRG9jcyBzdWdnZXN0aW9uOg0KPiANCj4gICAgIEEgc2luZ2xlIE1E
SU8gY2xhdXNlIDIyIHJlZ2lzdGVyIGFkZHJlc3MgKDUgYml0cykuDQoNClRoYW5rcywgSSdsbC4N
Cg0KDQo+PiArLy8vIE1ESU8gbWFuYWdlYWJsZSBkZXZpY2VzLg0KPj4gK3B1YiBzdHJ1Y3QgTW1k
KHU4KTsNCj4gDQo+PiArLy8vIEM0NSByZWdpc3RlcnMuDQo+IA0KPiBEb2NzIHN1Z2dlc3Rpb24N
Cj4gDQo+ICAgICBBIHNpbmdsZSBNRElPIGNsYXVzZSA0NSByZWdpc3RlciBkZXZpY2UgYW5kIGFk
ZHJlc3MuDQo+IA0KPiAgICAgQ2xhdXNlIDQ1IHVzZXMgYSA1LWJpdCBkZXZpY2UgYWRkcmVzcyB0
byBhY2Nlc3MgYSBzcGVjaWZpYyBNTUQgd2l0aGluIGENCj4gICAgIHBvcnQsIHRoZW4gYSAxNi1i
aXQgcmVnaXN0ZXIgYWRkcmVzcyB0byBhY2Nlc3MgYSBsb2NhdGlvbiB3aXRoaW4NCj4gdGhhdCBk
ZXZpY2UuDQo+ICAgICBgQzQ1YCByZXByZXNlbnRzIHRoaXMgYnkgc3RvcmluZyBhIFtgTW1kYF0g
YW5kIGEgcmVnaXN0ZXIgbnVtYmVyLg0KPiANCg0KTG9va3MgZ29vZC4gVGhhbmtzIGEgbG90IQ0K
