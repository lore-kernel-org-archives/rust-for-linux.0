Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61440EBAA
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200281; cv=none; b=cV89wgrejkA5gY8QJu/s4J2eLUe+4Zt3CmzwJb0ZF2abKBEPBoHGWvoCt/zyG/KVtkI2ko8jY8YkhRfkEd5loTHOVzNQMzhGH1GL1tQu11NSpi5ANyKheXZ2155zGPYf18A354dGM3x/SZ16JAvsMZU6VT5rbL6FhyGNL/PdUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200281; c=relaxed/simple;
	bh=ndbO3r7i5sFv64TP8cOVlZbEuW9qg1wIIclj7hfcRV8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qvHYljRlzAtHeGSZWPLE6t2OyyNwWofphDjqj2aVyMrnjUxXzVaZ1S4Y02MSCbmBAWCNPVqf3N4Bvd5Sr4JNOL3kbzrjQda/t3zfwZuN9ijKmQy0R1ZPV07UUM7nQ0TcHwb/QM2TFp3h91vS8Po2Jw4ep6mEHUao53WicjhYcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=XHiQQN6l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DjjKKI0m; arc=none smtp.client-ip=202.12.124.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="XHiQQN6l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DjjKKI0m"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 218F71300161;
	Thu, 16 Jul 2026 07:11:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 16 Jul 2026 07:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784200273;
	 x=1784203873; bh=ndbO3r7i5sFv64TP8cOVlZbEuW9qg1wIIclj7hfcRV8=; b=
	XHiQQN6lZdWD9HuxJznjsMPzwDx04vwtruQ6OSqXjQE/s/0iwoanIrlYLkhuqAM3
	qcslO90bygebAU+WMLadM1nWSzZVW5h0NiYz0BIS98bKqT8ecbPKCSLbtRxuffq1
	+6TLZRPJ7FXxVzIrPlPOJHq7FWAIOO7CIXasyjxuXmirfaDmeJyQl0YUrlk4Pkpr
	2y0bBcUp+imUM3lutlbQFCgemPxnnuYorLqyc1i+JUPi4oArcYL/0aXTfaUMiei0
	3Vqmu3gwoefv4f8IcLHBd1nH/m8NYAvzgAtd3OxhgLm9Hg6DxzSkxjnNQwxi0pzk
	QD8veHhrn2tqm7/EUSc7fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784200273; x=
	1784203873; bh=ndbO3r7i5sFv64TP8cOVlZbEuW9qg1wIIclj7hfcRV8=; b=D
	jjKKI0mK2c/sC1OM504yxDY6+3oRV3YyqB+x1tppPczwXjH1uaH6+P89r4QHaxUY
	gG97t7oYOFf1VJMpa6uTym6UXntMildQDvOLJ36JSRz1VJE0j3ZmNrNJyNOgXF25
	O5z/z0nykxXc45OQZcnZxsfatp8CvzbNUEt4yK5ZVEaFc/5lTm+lmXBkzVtn3ZhI
	GSE0ow9hWs+a8t2oVVtf2nFV/2akXyWG+bam9BVdQO/Tlbuv/ol6ik2AG0BT9Dbq
	+ve9cwX7O7hShzH+siNwfne5zyWLLk7HKzzff7uKoqFkvuCdzlkiya2zvVOoE7fw
	xG7zs/EwdfbWF1hQw/1Kg==
X-ME-Sender: <xms:UbxYanKOXBKTwWEQxeb7m4YXsf7Lt862YLfh8XZNe3Eb7NJZJ3rwdA>
    <xme:UbxYatBqP1HidDC5LD8Peiv7BtfRdjB-fRdQKfqLJb15PAv-f6nypYcGUlaOSxc5J
    ci4iAig9f1ifZohW0rM7LKooFPB0101uNrpchwVExzGRKksA3YuJyo>
X-ME-Received: <xmr:UbxYak2MFVvxFYrCKdZ2Cklsi2sl_n47ljQq2wJmc-wKQfsh646N8yVUzYPLbyxrZjT3kdcMJ5mUkzyR6dbZ-wpC>
X-ME-Proxy-Cause: dmFkZTEArRWM3RR6tOvX3PbEsUF4wE/OOxGTxfrdAUPHmoqVhtdaeBipLz1A17Feuh6hrS
    STB8gwlRTLhzepwn91/3uYc1CkQeeJtfVMErOOKhdrvcZ2ULKU4IfEMP+yMAhOeTJO1JgI
    kEnkz4uaKCH7m/M3qywgaOEArmDqP22xrji+e3rHGPXKP64W9VfVPrAtPpJGSMDecoiwcG
    9VkAXrBlCnNdZ8F6ZD6Jk/3Efk6v9fvQdpn9mT/DqSmOBxEnm1X6WuuPYMJmMog1Xb9ijI
    KofNkN1DWD49sBl/KFti+XYJ9KzOG+iYdTrI4Bxj6XV85wmQqIfb1LuAWqKmTbYMNgufXv
    hEk1sM6xBzvoCHjF9uJfN1jDSAJRnMPjVsom+Wu7nPkF7VFehUHyBK/mvyDwco0P3RAg2X
    Bx1Ris6uTa0uUwjanWDJkXpwm5GAfZu3uQPz1oeo2sHDSf20pPQ23LX/aHSo8Fb+cns4eE
    kObBFtd0MeddX4irz5S24YP16BgnCkGEkc9FG5M/DO3yu8Oyhw4tskJGMVzNOznR1O9loh
    W1BLxvlP4/23X9x6Wwbag+Fvs2OF4p1sMMKXLYx5MKVcYwZpa9xT9VkwYWLAjT6h/Q8OMo
    DG0gmuv5YygyoAti+h+ESafj0Ici1WEXs5lToLYQbwqAkysnocSa3NoJzfPw
X-ME-Proxy: <xmx:UbxYaglUB4v47LK22fcS2hW7RTez5LiUG7O1e6J9Qecdk4wCQ7TIfA>
    <xmx:UbxYahc9-lFGdN6QA3dHrhVm1nUR14eNkhUgHW3gOLBY7F0zulTSKg>
    <xmx:UbxYatVWlKH-I_5BJYpaZGCOTkLzfPrqs2J5K7eCa0MZxUxCy30ZuA>
    <xmx:UbxYalGuf4z1zjkhLBKCyA5flBDGngkNWU8wCOWCWbk6UU2l4z8MQw>
    <xmx:UbxYagRlJZjHbEjqxx1v8mijWHR1Uq-I0fdvtJuGvtoTG96mqEy-CGkl>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 07:11:07 -0400 (EDT)
Date: Thu, 16 Jul 2026 20:11:05 +0900 (JST)
Message-Id: <20260716.201105.1009171057211934960.tomo@flapping.org>
To: gary@garyguo.net
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org,
 tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com,
 acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to
 Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DJZ7ZM736AAP.2P7XFVPGPE0I1@garyguo.net>
References: <87cxwogywo.fsf@kernel.org>
	<CANiq72n8-=QF7T9d8hon82eQktyRW-_1YsCQwnLZaWmmcx1hUw@mail.gmail.com>
	<DJZ7ZM736AAP.2P7XFVPGPE0I1@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCAxNSBKdWwgMjAyNiAxNTozODoxNyArMDEwMA0KIkdhcnkgR3VvIiA8Z2FyeUBnYXJ5
Z3VvLm5ldD4gd3JvdGU6DQoNCj4gT24gV2VkIEp1bCAxNSwgMjAyNiBhdCAzOjIyIFBNIEJTVCwg
TWlndWVsIE9qZWRhIHdyb3RlOg0KPj4gT24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgMzozNOKAr1BN
IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4NCj4+
PiBJIHRoaW5rIHdpZGVuaW5nIHRvIDEyOCBiaXRzIGlzIGZpbmUuIE15IHF1ZXN0aW9uIGlzIHdo
eSBgTlNFQ19QRVJfU0VDDQo+Pj4gYXMgdTEyOGAgaW5zdGVhZCBvZiBgdTEyODo6ZnJvbShOU0VD
X1BFUl9TRUMpYD8NCj4+DQo+PiBZZXMsIHBsZWFzZSBhdm9pZCBjYXN0cyBpZiBwb3NzaWJsZS4N
Cj4+DQo+PiBSZWdhcmRpbmcgYHUxMjhgIC0tIHBsZWFzZSBtYWtlIHN1cmUgaXQgd29ya3MgaW4g
MzItYml0IGFyY2hpdGVjdHVyZXMuDQo+PiBJdCBzZWVtcyBsaWtlIHlvdSBhcmUgZG9pbmcgYSAx
MjgtYml0IG11bHRpcGxpY2F0aW9uIHRoZXJlPw0KPiANCj4gVGhpcyB3aWxsIGFsc28gbmVlZCBh
IGRpdmlzaW9uIHdoZW4gSFogaXMgbm90IGEgZmFjdG9yIG9mIE5TRUNfUEVSX1NFQyAtLSB3aGlj
aA0KPiB3aWxsIGJlIHRoZSBjYXNlIGZvciBIWl8zMDAuDQo+IA0KPiBUaGlzIHNob3VsZCBqdXN0
IGxpbWl0IHRoZSBwcmVjaXNpb24gYnkgZG9pbmcgYSBtdWx0aXBsaWNhdGlvbiB3aXRoDQo+IChV
U0VDX1BFUl9TRUMgLyBIWikgbGlrZSBqaWZmaWVzX3RvX3VzZWNzLg0KDQpBZ3JlZWQuDQoNCkRl
dmljZSBkcml2ZXJzIHVzZSBqaWZmaWVzX3RvX3VzZWNzKCkgcmF0aGVyIHRoYW4NCmppZmZpZXM2
NF90b19uc2VjcygpLCBzbyB0aGUgbWljcm9zZWNvbmQgcHJlY2lzaW9uIGZyb20gYSBwbGFpbg0K
KFVTRUNfUEVSX1NFQyAvIEhaKSBtdWx0aXBsaWNhdGlvbiBzaG91bGQgYmUgc3VmZmljaWVudCBo
ZXJlLg0KDQpJJ2xsIGltcGxlbWVudCBpdCB3aXRoIHRoYXQgbG9naWMgaW4gdjMuDQoNCg==
