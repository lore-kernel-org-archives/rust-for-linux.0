Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030736492A
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024218; cv=none; b=qCtFRl2sz3zYSMrnP+HTjuBf3EhNQMQfCfrfj467gVqtv8/9AbToliTvfdWv4lYAnS8xVohjbWMXrrjiUP9Rjo8NOODnVQ8LHn5baco+c1xK1Upt3DwDJlTncVepUtX8mV2EUR+Jm4MXaU5VWKXWM++cusSKv+au+Cz71yE7CHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024218; c=relaxed/simple;
	bh=+ihbdfXRiYltCakFWUrwyQB4pRBlZC8yQxKKQvvelXw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=u94mTGPq8IicBcZs+xhdBe1pVHUbMYuvZ/Gdm4mWxyM3Igfg6IR/pZXyunbNM6pmlil1GrxiBf/CMsVnDnhIMmXYPSypIzl+a6xozBsABn3ujYHZOnd+5IBWDMgbp01N007xSrWDGIbqrSK5uAiIZ/ciNHMZxIpYUj9uEXGh2xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=NHy6J/TU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ed90bjEN; arc=none smtp.client-ip=202.12.124.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="NHy6J/TU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ed90bjEN"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 57E811300159;
	Tue, 14 Jul 2026 06:16:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 06:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784024210;
	 x=1784027810; bh=+ihbdfXRiYltCakFWUrwyQB4pRBlZC8yQxKKQvvelXw=; b=
	NHy6J/TUoGn7gw5keqFdgJtMUM7Ago61ZJDmT8ggt6rkrIJWzVoef67zy5pPrt/8
	bw/VbieDho069F3Wxw2hIl3LO6PL23KTxMeefz1mCNLsTXOp/3cS+C912DNWVJuE
	QnJFf6g4O+FN9uuxYJ2DHPEaqBRDjM95hKZ3PxPt3vUTWXPLQVwlmGjQ/JSOZNy+
	+L6C18KRYn4qVJu/myCBSNUD2tPNmquu7d/J4h3wWmPim9sTK/iV3ZoYLPCS23YW
	j8aa814BMXllirjbD41cmK9Q4fcTJnnPAoLBx4pov0qx0my7tKALWmAlMKLAn2bT
	gB0YZisAGj5++qzB4OmQrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784024210; x=
	1784027810; bh=+ihbdfXRiYltCakFWUrwyQB4pRBlZC8yQxKKQvvelXw=; b=E
	d90bjENuyTx1x1pB0iHTzDsJllwyoMWFRYxhvtserowDnydi7tC7nTkAaP36391Z
	yADTL1ci5THQ8l9KWQxVz5hVfl9vglQjX3IJe3Mzgf/7DfTQRyyI7EvGf9yiMQXh
	snKbx1y554vCCkzclc5wPB1kpegxRZtbN9SUFc9t9PsMuSCTdzkn4yfQSSkRvT0T
	kHJvKApzQJ7fTCyu7aZKKs7gEsh9NvLMqzwvHlCjV7Fyau+n+HRBtexJ0cqfATCP
	TgnvxyDHUQOXiE2uHRpd/yIBpMKEaAK27Iw0uRr/L76w5VMK0vkY+SIyS2hMpWdR
	iRX59l0R9HwWXYLvuxMDw==
X-ME-Sender: <xms:kQxWam8rRhpuaq7nC22Dd8LqoLmfxZmX9dcnKd5eedy1qy3WYKraJg>
    <xme:kQxWanL_pqI5qTLnchGI1yshkVXhnWKRbeR_qtjvWXQ3UGRgBj-WkWv4RbIWGepG7
    dVr7x-W9x8SBOgXkD3mO0A0vDJQ1-q6YZUv5HVMkaKSAzsk5kLE_9k>
X-ME-Received: <xmr:kQxWahdzcXimHgREJYrn4-9awB35UxGYYh-IKqWMtXyj05I-B1Eg-xeTMpB2_ESFrnreZDji1hTma1lGsNn21h0P>
X-ME-Proxy-Cause: dmFkZTENhRUjbVgpjN2QefDfr+/H+8RJwQ3611jL2nAoetCxcC1zKV8QOwkTC0kzFkUnMy
    5tEGOKy80z+avTjGQ0eaaE/tyCqNaj8GfcxvDPJGnbtnnVeWWrUoJifhkmHqXyHCUCNAfS
    ysJ/7Tm7ZrxvWGdDd5gqPl/xPEakQU6Iw3s0bKh1DxGjP7Gs07FiDrij7jViuVVuh6evBG
    ibbQrnMnNmrhoMDusshedmV9zgbWN+DxGxk8c+IOtGTIyKlVss8dj9KABX9sJuq7drT3Zz
    DPGkUPgApspBQNco0wZJg83hajFMdxUbg5Y/mEK1l+NcwNRaYh47skEiNDr9s3nn0F4Ec2
    tDTO/uaUfko11AM1JhB/b/Ft1XUn5RbN2gQjGys+Qe4174QED6ymz62mSJYjPzQP4CPTyY
    3V2C+iYb2K06R1YtYY2ManjvV5MnP6JW8z6a+jeyNSu25yIvoJKp5buI2UMvGoUAlPEWQt
    2NG5PVXcYPQQpo1WI4bk+9fLrsNU9/QLZrf7DaIRcvBnhpCi3W+TYsKbBa5+7BZbTnJnMM
    xF5k/a7EZyYt9lElv/26p4/G6AhyZwWxUWw2Ry1598l43Yi0NAkZv/YdYc6aX9fMWJMqC8
    kbUX8zUXQSd5T28xeCbVBafwHayOcpVaNGjovtRKly9HXV6RnX/pAN2EbeGA
X-ME-Proxy: <xmx:kQxWasYBIVeAJK3yURI0WsxKYu1MqK7comEJ72plWahk79qaIFFXiw>
    <xmx:kQxWavAd5Q53SamIZiVDQ90fJC3Y3vA612hxwnmh2hhxEmzNrsEN7w>
    <xmx:kQxWanJmfP-fFDkRHpPXdrl9cXfkA5uadMc3UT5-LIg3wPHc2JszZA>
    <xmx:kQxWaurv2z8tF5cUp9EHYr4mqIU5RwupQvkh4vbvSad2-jpWhPArfQ>
    <xmx:kgxWapDC5doxcrwO6Wjj4unjIyg9g8a4EmAA4xcPPLe7OWx-GIZIYXps>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 06:16:45 -0400 (EDT)
Date: Tue, 14 Jul 2026 19:16:42 +0900 (JST)
Message-Id: <20260714.191642.1103024240790648142.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, a.hindborg@kernel.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com>
References: <20260713225235.3243480-1-tomo@flapping.org>
	<CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAxNCBKdWwgMjAyNiAxMTowOTozOSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUdWUsIEp1bCAxNCwgMjAy
NiBhdCAxMjo1MuKAr0FNIEZVSklUQSBUb21vbm9yaSA8dG9tb0BmbGFwcGluZy5vcmc+IHdyb3Rl
Og0KPj4NCj4+IEZpeGVzOiBmYWUwY2RjMTIzNDAgKCJydXN0OiB0aW1lOiBJbnRyb2R1Y2UgRGVs
dGEgdHlwZSIpDQo+IA0KPiBTaG91bGQgdGhpcyBiZSBDYzogc3RhYmxlQCwgdGhlbj8gKHNpbmNl
IHRoaXMgbGFuZGVkIGluIHY2LjE2KSBPciBpcw0KPiB0aGVyZSBhIHJlYXNvbiBub3QgdG8/DQoN
ClllYWgsIHNob3VsZCBiZS4NCg0KPiBCeSB0aGUgd2F5LCB0aGVzZSBtZXRob2RzIHNob3VsZCBo
YXZlIGAjIEV4YW1wbGVzYCBzaG93aW5nIChhbmQgdGh1cw0KPiB0ZXN0aW5nKSB0aGlzIHNvcnQg
b2YgZWRnZSBjYXNlcy4gUHJvYmFibHkgYXMgYSBzZXBhcmF0ZSBzZXJpZXM/IChJDQo+IGNhbiBj
cmVhdGUgYSAiZ29vZCBmaXJzdCBpc3N1ZSIsIGJ1dCBpZiB5b3UgcHJlZmVyIHRvIGRvIGl0LCBv
Zg0KPiBjb3Vyc2UsIHRoYXQgd291bGQgYmUgZ3JlYXQpLg0KDQpJIGNhbiBzZW5kIGEgcGF0Y2gg
YnV0IGFzIEkgcmVjYWxsLCB0aGUgbGFzdCB0aW1lIEkgcG9zdGVkIGEgcGF0Y2gNCmxpa2UgdGhh
dCwgQW5kcmVhcyB3YXMgb3Bwb3NlZCB0byB0aGF0IGtpbmQgYXBwcm9hY2g/DQoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjUwNzAxMDAxODA5LjQ5NjM4OS0xLWZ1
aml0YS50b21vbm9yaUBnbWFpbC5jb20vDQoNCg==
