Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD423CB2EA
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031484; cv=none; b=R5HgSXl/nHJ/dJjmaVr/LztCbp9Fsb0sKd6Fa8AnljVKgyBPOFzKZuSCoAf7G8WJQk9i4S+I2PNsGNlR1m9jZZB9FzXuBuuEGa0wtzJFNTUFTUpXx9twlz7RC/hUaAZPzrbbY1ogzWFGtRaq+JIrrdlgAaXFvwGLrtbKgDB7jU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031484; c=relaxed/simple;
	bh=9gLrTTtM0bh81Goh+C4RvNVXRWyhGFVfVbKgXWGbgZc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iSCcqFWATURvTs91vDFoS7oFVBn1Rvk/en+KonQx6GQDQb+4iDHQODg3SWpt0ErUYBl6KDL9BTSRh6eXVPbushnVfT7gUMDkTi7GVOYAtnpl9Q039SVh/sg1F3ZJ14h7LV0AqrmJ1BVc7cuFXoGzytgmDUGHjp5+/LURJ2H7AiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=F2CvNuvc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ppBWZjVp; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="F2CvNuvc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ppBWZjVp"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id 71EC31300124;
	Tue, 14 Jul 2026 08:18:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 14 Jul 2026 08:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784031480;
	 x=1784035080; bh=9gLrTTtM0bh81Goh+C4RvNVXRWyhGFVfVbKgXWGbgZc=; b=
	F2CvNuvcnwyTLLSB/EYaKSRyXDGbdTuQTFg9KrDuMvIvciUpOtWRdjeISaVfQvkc
	lqhfRzGhg39ReUgIKM+VE0Kw204x0ISy4vb9oH/ZkznwSDRccL5caTOtBQ4guCWO
	7IuwYjRcr/jlBKI/62AndIfUzL1OvEg4YK5I/ftOB0LPuV0j4YSq9GdOnYsxXAkx
	jfS2rd106Y+CaaV5ZTe/qnB88pz3CjsVJI+hAc2ozwKVP9KBHdFhpyI3t7SSjhfg
	jCzM+doDpcJMVb03/EkW895HCT+kUPfPTKGA5jl30LzTjCt7v5eu3U+2xuerxNel
	ghBvpDGvCw1oOA5RH54Nog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784031480; x=
	1784035080; bh=9gLrTTtM0bh81Goh+C4RvNVXRWyhGFVfVbKgXWGbgZc=; b=p
	pBWZjVpYjgjcTChevbYy4m9WKELhdB6Qp74CDHX3l3unMV3cBj92BVElN+gUogTh
	ZdwnwU68jGFkY1ZbEhk3VQU/gFUEx1pB7XSX6zAp7FC2w74rZm6J8WfIzew0wNPG
	3T0h6NVKAlSIbCtidfdBfWl0R3IsTPqDURqRMbUFIwTUq9QZlMyMhSk4ik4zg7WY
	VUyWzPUttKZyjKcnMGkltmXxSIuB/H8Qj/DbllgnmIS4R6A2iJZB+k/am4S3zMaN
	KnAxcnXrAblDIqnlM69JZvYrwIS4DC9WNT1gnn3eldeSU6+b3LSOOZGSMoqWSB27
	pjv68kRzmrqmk5wEFqdfg==
X-ME-Sender: <xms:9yhWas8ewSNbC5vxgUelAq_Kua-wStxXod5BFMvyD81jbFX_ABUvrw>
    <xme:9yhWalLfKL8dS9SdKP5BPkaRgnAHFYuJtWbmI-6UXrLKAzqBpbrEtilqZNp_7T3rC
    uQkL20o7WwP30DiSk-xUQrSXcyt5DEhy6RRPQrJgJeMRjCQZUWhTM8>
X-ME-Received: <xmr:9yhWancFYe3A4z4rYzonh4xLbuyRKmwpx66ASsc-K2rSWMBj3aQadyoTOt93zZ2ZjxKYVapY0Q6F9RIYsh79pEbg>
X-ME-Proxy-Cause: dmFkZTGNIwEDxrKSQv5A8ag5Da8OXFMs+0RpgGx/hs+AciLpqgAgu8mCQB5ZhEHHzQ6LF9
    t6MVGXyAIFsp5HqP3CH9wXYukZq5I1SSCwHJqd55KNfKnufS7PkblOTW8SCtG+Xvdxej3s
    WaDKrBTIZRDvuQ64v+k12VeAYtC71Uk+FutrkivpQvecp4gHYCIv1g/w0oyfBduQhl4j/b
    YLSr20MVl/WSZdrkvKSnNKhoFQt0YMpHOOBI1pIZ+Ow9ukKbPBsxpXXs1dfJptNO81N6Lk
    pwRJt2tHmKWE9Z3BH9sfVLMbqtDH5Mv9Dq2Hq9Su2X5273OtbvM7flo2XFZl4weWmglSQY
    YxnfKj/Fd9KvVWmFw9dckrlTWH/mJoBnfUQ4P9kC0oMl0km+v42QinL4hgklBRdjGxrcBF
    23D4Cx0NW/874a/2dvH3yNmfFGRCD0fjr0rBOCmuckyZPSwb5DWCu1EoHxDPLOy0O82HwP
    RR+Wg39I3IMrOppiHTL7p5QMXv4I92KuI1ePeyWKBG+blSO8xTR2HAcjF9jHQBXlcVZlyO
    ej3IfrSaTqNBXUxSQ6ePUtiWMtaFUTT6tNb71UwiZmlI/uwUOX6/pppuZUeJeFW2gBZ7uj
    LpHuNg+N034tOVrCtLwCdBRIbiSNVxzTm9NaKkT6vzi7lfETqqkk1FFTl5Jg
X-ME-Proxy: <xmx:9yhWaqaUJI-2DIFaaYFZCaHq9BDDsquY_gl6rNsOggikskvp9pClqA>
    <xmx:9yhWalDn38QJyR-W74jOVkrRWAQu-dB5_sDvpQaF128vhcm7GvDoLg>
    <xmx:9yhWalJksLDL2ODTJAjxt0iTJ-4V68BKqv2irAvRMisGW5T3c5G29Q>
    <xmx:9yhWakpIlrP0ZGTyEQZnEJsjut_9Lt59iYc-7gfmlAUNnJ0ztyLgPQ>
    <xmx:9yhWavDD1sxgLSXuF4Cj5veG_RtbrWwgMuP2CWnzhg8CiqeJ2u02jtCk>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 08:17:54 -0400 (EDT)
Date: Tue, 14 Jul 2026 21:17:51 +0900 (JST)
Message-Id: <20260714.211751.124079232269470730.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, miguel.ojeda.sandonis@gmail.com,
 a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
References: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
	<20260714.194916.571807180513332641.tomo@flapping.org>
	<DJY8NM7TIHZK.15213B4MWETHU@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAxNCBKdWwgMjAyNiAxMTo1Njo1OCArMDEwMA0KIkdhcnkgR3VvIiA8Z2FyeUBnYXJ5
Z3VvLm5ldD4gd3JvdGU6DQoNCj4gT24gVHVlIEp1bCAxNCwgMjAyNiBhdCAxMTo0OSBBTSBCU1Qs
IEZVSklUQSBUb21vbm9yaSB3cm90ZToNCj4+IE9uIFR1ZSwgMTQgSnVsIDIwMjYgMTI6Mzg6MDMg
KzAyMDANCj4+IE1pZ3VlbCBPamVkYSA8bWlndWVsLm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pg0KPj4+IE9uIFR1ZSwgSnVsIDE0LCAyMDI2IGF0IDEyOjE24oCvUE0gRlVKSVRB
IFRvbW9ub3JpIDx0b21vQGZsYXBwaW5nLm9yZz4gd3JvdGU6DQo+Pj4+DQo+Pj4+IEkgY2FuIHNl
bmQgYSBwYXRjaCBidXQgYXMgSSByZWNhbGwsIHRoZSBsYXN0IHRpbWUgSSBwb3N0ZWQgYSBwYXRj
aA0KPj4+PiBsaWtlIHRoYXQsIEFuZHJlYXMgd2FzIG9wcG9zZWQgdG8gdGhhdCBraW5kIGFwcHJv
YWNoPw0KPj4+Pg0KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8y
MDI1MDcwMTAwMTgwOS40OTYzODktMS1mdWppdGEudG9tb25vcmlAZ21haWwuY29tLw0KPj4+IA0K
Pj4+IEFoLCB0aGF0IGV4cGxhaW5zIHdoeSBJIGhhZCB0aGUgZmVlbGluZyBJIGFscmVhZHkgbWVu
dGlvbmVkIHRoaXMgaW4NCj4+PiB0aGUgcGFzdC4uLiBUaGFua3MgZm9yIGxpbmtpbmcgaXQhIDop
DQo+Pj4gDQo+Pj4gTXkgcmVhZGluZyBhdCB0aGUgZW5kIG9mIHRoYXQgdGhyZWFkIHdhcyB0aGF0
IGhlIHdvdWxkIG9wZW4gdG8gaXQgYXMNCj4+PiBsb25nIGFzIHRoZSBjb25zdGFudHMgaGFkIGEg
bmFtZSBvciBjb21wdXRlZCByZWxhdGl2ZSB0byBzb21ldGhpbmcNCj4+PiBlbHNlLCB3aGljaCBp
cyBhIGdvb2QgaWRlYSByZWdhcmRsZXNzLCBhbmQgSSByZXBsaWVkIHdpdGggYWdyZWVtZW50IC0t
DQo+Pj4gc28gSSBkb24ndCB0aGluayBBbmRyZWFzIHdhcyBjb21wbGV0ZWx5IG9wcG9zZWQgdG8g
ZG9pbmcgc28/DQo+Pj4gDQo+Pj4gV2Ugc2hvdWxkIGFueXdheSBiZSBjb25zaXN0ZW50IGFib3V0
IHRoaXMgdHJlZXdpZGUuIFdoYXQgd2UgaGF2ZSBiZWVuDQo+Pj4gZG9pbmcgKG9yIGF0IGxlYXN0
IG15IGludGVudGlvbikgd2FzIHRvIGRvY3VtZW50IGFuIGV4YW1wbGUgb2YgZWFjaA0KPj4+IHBv
c3NpYmxlIHJldHVybiBwYXRoIC8gZWRnZSBjYXNlLiBUaGF0IGlzLCB3ZSBkb24ndCB3YW50IGV2
ZXJ5IHNpbmdsZQ0KPj4+IHRlc3QgaW4gZXhhbXBsZXMsIGJ1dCBmb3IgaW5zdGFuY2UgaGVyZSBh
dCB0aGUgdmVyeSBsZWFzdCBJIHdvdWxkDQo+Pj4gZXhwZWN0IHRvIHNlZSAxKSBhIG5vcm1hbCBj
YXNlLCAyKSBhIHNhdHVyYXRpbmcgY2FzZSwgMykgdGhlIGJlaGF2aW9yDQo+Pj4gb2YgdGhhdCB3
aXRoIG5lZ2F0aXZlczsgYnV0IHBlcmhhcHMgd2UgZG9uJ3Qgd2FudCB0byBoYXZlIGV2ZXJ5IHNp
bmdsZQ0KPj4+IHRlc3Qgd2UgbWF5IGhhdmUgYWJvdXQgZWFjaCBvZiB0aG9zZSAiZ3JvdXBzIi4N
Cj4+DQo+PiBBcyBJIHJlY2FsbCwgdGhlIGxhc3QgdGltZSBJIHBvc3RlZCBhIHBhdGNoIHRvIG1h
a2UgdGhlbSBjb25zdGFudHMsDQo+PiBHYXJ5IHdhcyBvcHBvc2VkPw0KPj4NCj4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjYwMTE5MjMzNjIxLjM0NjUzMDQtMS1m
dWppdGEudG9tb25vcmlAZ21haWwuY29tLw0KPiANCj4gSSdtIG9rYXkgaGF2aW5nIHRlc3QgY2Fz
ZXMgZm9yIGNvcm5lciBjYXNlcyBidXQgdGhleSBzaG91bGRuJ3QgYmUgcGFydCBvZiB0aGUNCj4g
QVBJLg0KDQpJZiBJIHVuZGVyc3RhbmQgZXZlcnlvbmUncyBwb3NpdGlvbnMgY29ycmVjdGx5Og0K
DQotIEFuZHJlYXMgd2FudGVkIHRoZSBkb2NzIHRvIGF2b2lkIHJhdyBtYWdpYyBudW1iZXJzLg0K
LSBHYXJ5IGRpZG4ndCB3YW50IHRvIGdyb3cgdGhlIHB1YmxpYyBBUEkgd2l0aCBjb25zdGFudHMg
cHVyZWx5IGZvcg0KICBkb2N1bWVudGF0aW9uIHB1cnBvc2VzLg0KLSBNaWd1ZWwgc3VnZ2VzdGVk
IGRvY3Rlc3RzIGNvdWxkIHNob3cgdGhlIGJvdW5kYXJ5IGJlaGF2aW9yLCB3aXRoIHRoZQ0KICB2
YWx1ZSBkZWNsYXJlZCBsb2NhbGx5IGluc2lkZSB0aGUgZXhhbXBsZS4gICANCg0KSGVyZSdzIGEg
Y29uY3JlYXRlIGF0dGVtcHQgYXQgZnJvbV9taWNyb3MoKToNCg0KZGlmZiAtLWdpdCBhL3J1c3Qv
a2VybmVsL3RpbWUucnMgYi9ydXN0L2tlcm5lbC90aW1lLnJzDQppbmRleCAzNjNlOTNjYmIxMzku
LmE2MGEyNDhhMzcyYiAxMDA2NDQNCi0tLSBhL3J1c3Qva2VybmVsL3RpbWUucnMNCisrKyBiL3J1
c3Qva2VybmVsL3RpbWUucnMNCkBAIC0zODgsNiArMzg4LDI0IEBAIHB1YiBjb25zdCBmbiBmcm9t
X25hbm9zKG5hbm9zOiBpNjQpIC0+IFNlbGYgew0KICAgICAvLy8gVGhlIGBtaWNyb3NgIGNhbiBy
YW5nZSBmcm9tIC05XzIyM18zNzJfMDM2Xzg1NF83NzUgdG8gOV8yMjNfMzcyXzAzNl84NTRfNzc1
Lg0KICAgICAvLy8gSWYgYG1pY3Jvc2AgaXMgb3V0c2lkZSB0aGlzIHJhbmdlLCBgaTY0OjpNSU5g
IGlzIHVzZWQgZm9yIG5lZ2F0aXZlIHZhbHVlcywNCiAgICAgLy8vIGFuZCBgaTY0OjpNQVhgIGlz
IHVzZWQgZm9yIHBvc2l0aXZlIHZhbHVlcyBkdWUgdG8gc2F0dXJhdGlvbi4NCisgICAgLy8vDQor
ICAgIC8vLyAjIEV4YW1wbGVzDQorICAgIC8vLw0KKyAgICAvLy8gYGBgDQorICAgIC8vLyB1c2Ug
a2VybmVsOjp0aW1lOjp7RGVsdGEsIE5TRUNfUEVSX1VTRUN9Ow0KKyAgICAvLy8NCisgICAgLy8v
IGFzc2VydF9lcSEoRGVsdGE6OmZyb21fbWljcm9zKDEpLmFzX25hbm9zKCksIDFfMDAwKTsNCisg
ICAgLy8vDQorICAgIC8vLyAvLyBUaGUgYm91bmRhcnkgb2YgdGhlIHJlcHJlc2VudGFibGUgcmFu
Z2U6IGRvZXMgbm90IHNhdHVyYXRlLg0KKyAgICAvLy8gY29uc3QgTUFYX01JQ1JPUzogaTY0ID0g
OV8yMjNfMzcyXzAzNl84NTRfNzc1Ow0KKyAgICAvLy8gYXNzZXJ0X2VxIShEZWx0YTo6ZnJvbV9t
aWNyb3MoTUFYX01JQ1JPUykuYXNfbmFub3MoKSwgTUFYX01JQ1JPUyAqIE5TRUNfUEVSX1VTRUMp
Ow0KKyAgICAvLy8NCisgICAgLy8vIC8vIE9uZSBwYXN0IHRoZSBib3VuZGFyeTogc2F0dXJhdGVz
Lg0KKyAgICAvLy8gYXNzZXJ0X2VxIShEZWx0YTo6ZnJvbV9taWNyb3MoTUFYX01JQ1JPUyArIDEp
LCBEZWx0YTo6ZnJvbV9uYW5vcyhpNjQ6Ok1BWCkpOw0KKyAgICAvLy8NCisgICAgLy8vIC8vIE5l
Z2F0aXZlIHZhbHVlcy4NCisgICAgLy8vIGFzc2VydF9lcSEoRGVsdGE6OmZyb21fbWljcm9zKC0x
KS5hc19uYW5vcygpLCAtMV8wMDApOw0KKyAgICAvLy8gYGBgDQogICAgICNbaW5saW5lXQ0KICAg
ICBwdWIgY29uc3QgZm4gZnJvbV9taWNyb3MobWljcm9zOiBpNjQpIC0+IFNlbGYgew0KICAgICAg
ICAgU2VsZiB7DQoNCg0KQ2FuIHdlIGFncmVlIG9uIHNvbWV0aGluZyBsaWtlIHRoaXM/DQo=
