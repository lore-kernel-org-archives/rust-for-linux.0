Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB72F49F6
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026167; cv=none; b=HEuAjeMYVV6+j1tBRj+pi70OGd/QZBmccZ6ixeOuXzfsvT3HUqYXAEkbhXCjN/4rPD6UkdDvzCYIIXTZGkXnGWtP4p2vg20KAKzEjtTwrBIoQx6x9KvvNwD9thEPDKirVXhGSDmeRv084xGjrzwQzgIsCzO72Z4SqvW6hlLwPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026167; c=relaxed/simple;
	bh=iwqf/brmABftnOVLCzVjRzV6STnCOX+mhQjvCUhLEJ4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iQmb46vYXRoBQACFjO7f8qMQOMBpFElmX1FLXjD1XLUbkFOcmAaaaW7OXT1IiD4Tl/4OtKoxei4iVSI6snr2ISYRINUEkft7pcyqRzfK8m0OGfHV/yKNTdrwiUDuZcBIMFXtd1mDG7AmGL6Oa1vBs45XKHslaXsPINEmUTtlRdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=geDBPN00; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I9smlK4j; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="geDBPN00";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I9smlK4j"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 98B6F1300129;
	Tue, 14 Jul 2026 06:49:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 14 Jul 2026 06:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784026163;
	 x=1784029763; bh=iwqf/brmABftnOVLCzVjRzV6STnCOX+mhQjvCUhLEJ4=; b=
	geDBPN00obxZ4ZOaIrY0iQpP1u+Lc7QFdDX80nN5TQmFNM/7X++OCOTSMylmELHv
	OtyHqG7PTvB40edXnq7nCs6G5jiF/iSNugikkDqBn4TsXbW6cLHB7F85Rc2o+ROU
	V26QTa2jZTfG+FUJ3Hig9GZWReeKQiSwmEz6wVMrYgZB7egmTyRtNDA1JF/64uWu
	dWDm2fYsGVu8gaHNMikUD+hbrqbHD842Iz25tkxIWFh4ipqezla4ViYAZWuatcoO
	kcUjcyvN2vL5Uh9FhAcDHVEJNstoFvt1gZcv4uwEQ+7y+PpomIz9WZukb0MoVP9I
	nYgRJp/hN9KTYqZi7x9yWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784026163; x=
	1784029763; bh=iwqf/brmABftnOVLCzVjRzV6STnCOX+mhQjvCUhLEJ4=; b=I
	9smlK4jCk37JbeAs9JZgy4RN4DnX0gtPWWdxkauIDCnyoS/kyAPupTVXk7ZzwiCn
	7adxEtkQqzMGeGfUiYpMYFq+DsBScdV0P5n0vtzX052taWluIGvmAz+/mpGOXo/L
	dCuzS/R7r0GI4qAQpP6ZqpIwSu4pexnAlyek6ZHVIcDevLi1qztgbCVD3Owo85H8
	m9Lp3/f56eYmmGgHxcckHXS1QPcUQYW54gSgKWuILUNAVOUFdHd4SzYgm7gvZ99Q
	HeGuiaF4hm5a8kU2gK67phtQv67UPvbhbL6DCLPWYCMd5yDK+vDnHP60AjdaiVq2
	tkmsDWQl5L0/D2t5KFT3g==
X-ME-Sender: <xms:MhRWasz46cQS_gFUS4oYNEqLYfs-cMPJbceszaGzisN4QsT_Bwsnng>
    <xme:MhRWagv-omwh9IBla0ycwFEhfFu55XBVrBQR0JcpyAU8pNsFKkwuRMmifuKi6RSzM
    nU4x2e0b7fdchexBoSoo9V8cImBfnAMU8a4YHZe3d0VSZdlejHxOg>
X-ME-Received: <xmr:MhRWajxQhkLIvFa0n7DStnMDCptXvmbi0kXaZ8KJzIUN6ocFVKC1hL0vlYYwGb2o4-k3mR6zi32KxzbbAra_aX4w>
X-ME-Proxy-Cause: dmFkZTEVqQtTLYrqF2iUKQsNuhsXxTwB8m/CY/0mS1fWS68OqWyJnPUTCEAXTcCdlWt27V
    rdeT/dWnapdJayiDsZcCqsux3cc2Fyudwrwrin7SRrN/6PB9U7GYCZ18yZR5bA0omwafOT
    9mMdiLYBAdF7GV0awxVdcCucG98zXes+XQm6sePozdtx1l0g0YHIj4IiZLP9jpW8Mq5IEX
    UOokBzJ95vHMvfOySDEy9T2rH/jsTzdBEv2cJA94yoZWUsx4CX86ZvRYBGHMknrbfF8OBV
    3Rg9ZkC/C6Lu2OnSLD4oKL40yI/eLYGZzZSb/ACCndzMjzppPA2wfQw8yiNdRNkH3XZukS
    9cZJ7cuqMEszCPV1PDY0VqHxD9Uj8VE/OCLQ+0NtZoMjMW1QjBqlEr+KNGkqwFthWdxHDL
    NmAWkqNGk55rTgi0/QkVzMDGx7EdGMc39zY+47Bysbbf9tS9BO9OT7+c5+ZtCiBtJWv8aX
    Mixry6cBYzv5ue8QynayB57xHAcSUqlMjlvNvbnfkMWTpyfy2ywANCQPWTeSa7+RMCDEsh
    AxiFI8gjgqFqGqODjS0l9wP8tD9405mgwrXIXCf4D/xdHzTZDPr4R7qQOtDWOwO6NnwH6v
    IZNIjOBNLPHNSrwxsdrCW85TBj1xpG40vgvRkli10l36Jn12hfnfPK9LtlqQ
X-ME-Proxy: <xmx:MhRWaodozhS624nlM0878V8ojbxqpf4VlObo4QIqlZ6qxv0rT7R3jw>
    <xmx:MhRWah1E97MEBvi-F9bnzVWK0WCdF00H5iU8YOMTKN2tsBL0TNjWEQ>
    <xmx:MhRWapsV_81Q6YVdhizMtov5_P0zjOpcgI4u_sGZyMxbWkQQqgQHXA>
    <xmx:MhRWal9aq55bfvQ8Pm3YMVvLurrsnitA3NAMjW2gVSuC7sCcEcxVZw>
    <xmx:MxRWav3s6RYVyloP5klHyqOsWDdbD-Rl-aByYnkcVEjSiq8JBofoTBim>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 06:49:18 -0400 (EDT)
Date: Tue, 14 Jul 2026 19:49:16 +0900 (JST)
Message-Id: <20260714.194916.571807180513332641.tomo@flapping.org>
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
In-Reply-To: <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
References: <CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com>
	<20260714.191642.1103024240790648142.tomo@flapping.org>
	<CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAxNCBKdWwgMjAyNiAxMjozODowMyArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBUdWUsIEp1bCAxNCwgMjAy
NiBhdCAxMjoxNuKAr1BNIEZVSklUQSBUb21vbm9yaSA8dG9tb0BmbGFwcGluZy5vcmc+IHdyb3Rl
Og0KPj4NCj4+IEkgY2FuIHNlbmQgYSBwYXRjaCBidXQgYXMgSSByZWNhbGwsIHRoZSBsYXN0IHRp
bWUgSSBwb3N0ZWQgYSBwYXRjaA0KPj4gbGlrZSB0aGF0LCBBbmRyZWFzIHdhcyBvcHBvc2VkIHRv
IHRoYXQga2luZCBhcHByb2FjaD8NCj4+DQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0
LWZvci1saW51eC8yMDI1MDcwMTAwMTgwOS40OTYzODktMS1mdWppdGEudG9tb25vcmlAZ21haWwu
Y29tLw0KPiANCj4gQWgsIHRoYXQgZXhwbGFpbnMgd2h5IEkgaGFkIHRoZSBmZWVsaW5nIEkgYWxy
ZWFkeSBtZW50aW9uZWQgdGhpcyBpbg0KPiB0aGUgcGFzdC4uLiBUaGFua3MgZm9yIGxpbmtpbmcg
aXQhIDopDQo+IA0KPiBNeSByZWFkaW5nIGF0IHRoZSBlbmQgb2YgdGhhdCB0aHJlYWQgd2FzIHRo
YXQgaGUgd291bGQgb3BlbiB0byBpdCBhcw0KPiBsb25nIGFzIHRoZSBjb25zdGFudHMgaGFkIGEg
bmFtZSBvciBjb21wdXRlZCByZWxhdGl2ZSB0byBzb21ldGhpbmcNCj4gZWxzZSwgd2hpY2ggaXMg
YSBnb29kIGlkZWEgcmVnYXJkbGVzcywgYW5kIEkgcmVwbGllZCB3aXRoIGFncmVlbWVudCAtLQ0K
PiBzbyBJIGRvbid0IHRoaW5rIEFuZHJlYXMgd2FzIGNvbXBsZXRlbHkgb3Bwb3NlZCB0byBkb2lu
ZyBzbz8NCj4gDQo+IFdlIHNob3VsZCBhbnl3YXkgYmUgY29uc2lzdGVudCBhYm91dCB0aGlzIHRy
ZWV3aWRlLiBXaGF0IHdlIGhhdmUgYmVlbg0KPiBkb2luZyAob3IgYXQgbGVhc3QgbXkgaW50ZW50
aW9uKSB3YXMgdG8gZG9jdW1lbnQgYW4gZXhhbXBsZSBvZiBlYWNoDQo+IHBvc3NpYmxlIHJldHVy
biBwYXRoIC8gZWRnZSBjYXNlLiBUaGF0IGlzLCB3ZSBkb24ndCB3YW50IGV2ZXJ5IHNpbmdsZQ0K
PiB0ZXN0IGluIGV4YW1wbGVzLCBidXQgZm9yIGluc3RhbmNlIGhlcmUgYXQgdGhlIHZlcnkgbGVh
c3QgSSB3b3VsZA0KPiBleHBlY3QgdG8gc2VlIDEpIGEgbm9ybWFsIGNhc2UsIDIpIGEgc2F0dXJh
dGluZyBjYXNlLCAzKSB0aGUgYmVoYXZpb3INCj4gb2YgdGhhdCB3aXRoIG5lZ2F0aXZlczsgYnV0
IHBlcmhhcHMgd2UgZG9uJ3Qgd2FudCB0byBoYXZlIGV2ZXJ5IHNpbmdsZQ0KPiB0ZXN0IHdlIG1h
eSBoYXZlIGFib3V0IGVhY2ggb2YgdGhvc2UgImdyb3VwcyIuDQoNCkFzIEkgcmVjYWxsLCB0aGUg
bGFzdCB0aW1lIEkgcG9zdGVkIGEgcGF0Y2ggdG8gbWFrZSB0aGVtIGNvbnN0YW50cywNCkdhcnkg
d2FzIG9wcG9zZWQ/DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIw
MjYwMTE5MjMzNjIxLjM0NjUzMDQtMS1mdWppdGEudG9tb25vcmlAZ21haWwuY29tLw0KDQoNCj4g
U29tZXRpbWVzIGl0IGNhbiBhbHNvIGhlbHAgZm9yIHJlYWRhYmlsaXR5IHRvIHNwbGl0IHRoZSBn
cm91cHMgd2l0aCBhDQo+IGNvbW1lbnQgYW5kIGEgbmV3bGluZSwgZS5nLiBgLy8gTmVnYXRpdmUg
bnVtYmVycy5gLCBlc3BlY2lhbGx5IGlmIHdlDQo+IGhhdmUgc2V2ZXJhbCBvbiBlYWNoICJncm91
cCIuDQo+IA0KPiBJbiBhbnkgY2FzZSwgb25lIHdheSBvciBhbm90aGVyLCBsZXQncyBwbGVhc2Ug
bm90IGhhdmUgdGhvc2UNCj4gZXhhbXBsZXMvdGVzdHMgYmUgZm9yZ290dGVuLi4uIEFuZHJlYXM/
DQoNCkknbSBob3Bpbmcgd2UgY2FuIGFjdHVhbGx5IHNldHRsZSBvbiBzb21ldGhpbmcgdGhpcyB0
aW1lIGFyb3VuZCwgaXQNCndvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIHRyZWUtd2lkZSBwb2xpY3kg
b24gaG93IHRvIGhhbmRsZSBjYXNlcyBsaWtlDQp0aGlzLg0K
