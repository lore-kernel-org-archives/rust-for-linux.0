Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CD9397E8A
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542331; cv=none; b=dY5qpX5QafwbQIliTxLBFwU/cWxNL11x4KWApaBNMNcPMX2S/T+HA6QXu77B1Icw1JOjITVSyC36r4lBCGyVGzI8nrkcTTVcdsvb5j5+7m8Zm/f83lbAcpv8ckaplPxK42cXRmfhYhjTShUnUl743m5IQLt82xbyVdo7vuLoe+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542331; c=relaxed/simple;
	bh=3wbgMlpZhh3iEIuHLfq2csQzSunzTHmx0tfRNWbJ6JU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bT3JXsDxI3zL6Psu9ZCIjnqK/Q4wpA+6ms/bU2xwpNpnKCJjoOSeVZQpVx+CYiPFm3BrRExE2QI+78oeYZoTjkDu/nPrtQkXQn7C1qfLRA+BoYJ2kPJ7ECrMVz9dNNwMF9D/wCTZjdOcB89I4cYsUxsxP+BE22AL5P+5JnMgp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=clIcmQ7e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XlBOVgCL; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="clIcmQ7e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XlBOVgCL"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 80FFE13801D6;
	Wed, 12 Aug 2026 09:45:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 12 Aug 2026 09:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786542327;
	 x=1786545927; bh=3wbgMlpZhh3iEIuHLfq2csQzSunzTHmx0tfRNWbJ6JU=; b=
	clIcmQ7eBVtzaNdpk2IsJKgeZpsZ+5w4cXJjsLzNGc0mhkbsETVXkAF60k39WjSr
	EA0ua7iIArALUZzpz5YYsfmfurboRQu92cFd3klrlkoMH6RmG1qjNBzwh3azegn4
	8Yg76dsxBPHJDBNPbFTYNpK7AhplTnGsVGuGlxLcSabpnB/EFLOkXzjND7ntf2pA
	ixxehDS2xftsmQLyEpwTl3qoSColFMi/GgrzYfD69KIccywF5LdTD6FXuP5r0FxQ
	UZxA5TQZpv1WwbFsIySTCD65XczIAGoLmiWE9YecxYhi3LM5B48k4IBCuD1DQqup
	yTQtk4uyKMXkOfT+j/p8vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786542327; x=
	1786545927; bh=3wbgMlpZhh3iEIuHLfq2csQzSunzTHmx0tfRNWbJ6JU=; b=X
	lBOVgCLkF0TkqH0VNvLyfcWfpQ7eFAhoxGp35wV+w9s2bWQ5Az1o2XJ92zafQZ+e
	bI3anaxlUubfI8k5Xs+b2g85dU/5cNDGBNn/+aa6JyGsn0sbD7GlhmsJb+SYIYVN
	WsnGgxOthewIBfSzkp6EJtQWIDi+sNbRwspjxO9//IcltgokWiNZAIZsm4Jn+meF
	CtT1RlCOey91Mx6yg30JSS2J/R5ihtKOWrH71hsy0ucZT2l4OA0LBIcHkFjzeTwD
	6RMXsOiYNKRf31rgdWZBgmmrwGDC6vE5/e3ZBxai7p7wXOSS0suBqFRf+n8mxN8x
	EMsUn1Jc8Ui1BKrRd4w4w==
X-ME-Sender: <xms:9nh8atwRDq5B90ybl8f2-H4hpzlvNJRWw-D-IZgZgYNQ4sJAcvEvog>
    <xme:9nh8atsJRhrr83-6U3H0UTVxmOmDgJYN5Kw3PZRcddbymcHI2oAXRp_UQgBNglhcc
    LXhOXn6b7S7zEs-MndWp1_Uoq5IsOlZEYYudHzmI8JMYNdNZuTHPUA>
X-ME-Received: <xmr:9nh8asw3T_E9XW9WYOcKdySsDIIaHWKLcnqSdkAxALjLnEIUCsKeQjITNdTnqftnqtIEdvnEEXOAH3nNGX6UkFcD>
X-ME-Proxy-Cause: dmFkZTFeWuttUdaGU7g96nC1Qs0FGLEUUKYm+hdazBcbEOzuv5Q6O0EBumGYJk1UmivJX8
    pm3BgEG0sSY6XJ4mi7/F77kN87niDUrd1tAKctuQXeO5FFbJXhCrurkeMkdvTcaUZdQUKa
    jz4GC2btWc8P0WAwZUIcgtHOds6VbYXQkamfWxbCP/dBm+v4/rGmNqMQMKd4k3W3UAz9B7
    3pMV8wWi4jUW7xmbzvAnT7rldxi+tWEWLS+LMAvhQQqRdtJhm5lHCRsMPvkJtjZOJa/HQT
    mq3UH+dNF8BHZBWlEpdRBrTnBfDHSlDC4ZXgzEIVKsxVOeUy3CQee7g/eXsLelup/gdzec
    oL+hhRbZo8OYegv+Q/cigYTB0khxvKQHOgCcUNPd626WjMLNN5MJ1NPn6LpYCkSpOsogtI
    nkFoEcodyUb8rag3CmPcgQ8Z6ekWad3ZOXHiOkHQtwoAhk11WSvvThiUBLTvAt5KYO7Wnj
    09FKHOUpr8Gwm4mhmRmygEVNCOzhtHjr91Ttv9vsKxrHQwGpBHXq7/bo3sS6WwdwjD26nU
    +5IOysHpOgWQgVnFyiTE3w2Xyogk+uGx/gT/lkr+Yij7xaXX73VVBKXzEnYEOJCk6UAOqW
    n8cN0kZfdWBpHTk1RLgFKNzyntMtinhj7NGyPAkwtHdAAicY98u2YYJBXbYQ
X-ME-Proxy: <xmx:9nh8atdgJFk47K8gn89rmjitVep8wSN3FviF1asnjHxC6uElNAkaoQ>
    <xmx:9nh8ai3eaVNb_4idrr10ZdF5waex2kbS1xt1K8XRKcxIVtr8lAAUfQ>
    <xmx:9nh8amsO9Y4u7RHsOQOmUajTByT0iC0Vh-gwyJik5JXZ4u-Be_d48w>
    <xmx:9nh8au8qsYTFV1GXV-5gGqqR8_wTWHG48Fk4tCyps4e7YR4VBvib6Q>
    <xmx:93h8ag3bpDO2NpCdqR3rWpGdXA7C7Z6W5ZHi6noDlEdy6vlC3Yhj0mpI>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:45:21 -0400 (EDT)
Date: Wed, 12 Aug 2026 22:45:17 +0900 (JST)
Message-Id: <20260812.224517.198100381475206098.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72kuOa-EKj7MHUwzjn4WiZ9f9mWJbuYsfe+PcrWgN2PgfQ@mail.gmail.com>
References: <DKM9KW3ARL1K.1JFJOBOB5EDKF@garyguo.net>
	<20260812.090516.1638662871785456326.tomo@flapping.org>
	<CANiq72kuOa-EKj7MHUwzjn4WiZ9f9mWJbuYsfe+PcrWgN2PgfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCAxMiBBdWcgMjAyNiAwODowNjoxMCArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBXZWQsIEF1ZyAxMiwgMjAy
NiBhdCAyOjA14oCvQU0gRlVKSVRBIFRvbW9ub3JpIDx0b21vQGZsYXBwaW5nLm9yZz4gd3JvdGU6
DQo+Pg0KPj4gTWlndWVsLCB5b3Ugc3VnZ2VzdGVkIGxhbmRpbmcgdGhlIG1pbmltdW0gc2V0LCBl
LmcuIHRoZSBmaXJzdCAyIG9yDQo+PiBmaXJzdCA0IHBhdGNoZXMuIFBhdGNoZXMgMS0zIGFyZSBh
bHJlYWR5IGluLCBzbyB0aGF0IGxlYXZlcyBwYXRjaA0KPj4gNC4gV291bGQgeW91IGxpa2UgdG8g
dGFrZSB0aGlzIHZlcnNpb24sIHdoaWNoIGNsYW1wcyB0aGUgcmVzdWx0IGFuZA0KPj4gaGFzIGEg
S1VuaXQgdGVzdCB0aGF0IGZhaWxzIG9uIGFybSB3aXRoIEhaPTEwMDAgd2l0aG91dCB0aGUgY2xh
bXAsDQo+PiBvciBzaG91bGQgSSBob2xkIGl0IGZvciBlYXJseSBuZXh0IGN5Y2xlPyBFaXRoZXIg
aXMgZmluZSB3aXRoIG1lLg0KPiANCj4gVXAgdG8gdGltZWtlZXBpbmcsIGJ1dCBpdCBpcyB2ZXJ5
IGxhdGUgYW5kIEkgdGhpbmsgQW5kcmVhcyB3YXMgYWxyZWFkeQ0KPiBvbiB0aGUgZmVuY2Ugb2Yg
ZGVmZXJyaW5nIGV2ZXJ5dGhpbmcgZXZlbiBiZWZvcmUgdGhpcyB2ZXJzaW9uLg0KDQpNYWtlIHNl
bnNlLCBsZXQncyBkZWZlciB0aGlzLiBJIHdpbGwgcHJlcGFyZSBpdCBmb3IgdGhlIG5leHQgY3lj
bGUuDQoNCj4gSWYgd2Ugd2VyZSB0byBhY3R1YWxseSB0YWtlIGl0LCB0aGVuIEkgdGhpbmsgdGhh
dCwgZ2VuZXJhbGx5IHNwZWFraW5nLA0KPiBhbnkgdmVyc2lvbiB0aGF0IHdvcmtzIGluIGFsbCBj
YXNlcyBpcyB0byBiZSBzdHJvbmdseSBmYXZvcmVkIGV2ZW4gaWYNCj4gaXQgY2FuIGJlIG9wdGlt
aXplZC9pbXByb3ZlZCBsYXRlciwgaS5lLiB3aGF0IEkgdGhpbmsgbWF0dGVycyB0aGUgbW9zdA0K
PiBpcyBhZ3JlZWluZyBvbiB0aGUgZG9jdW1lbnRlZCBjb250cmFjdCwgaS5lLiB0byBhZ3JlZSBv
biB3aGF0IHdlIHdhbnQNCj4gdGhlIGZ1bmN0aW9uIHRvIGFjdHVhbGx5IGRvLiBGdW5jdGlvbiBi
b2RpZXMgY2FuIGFsd2F5cyBiZSBpbXByb3ZlZA0KPiBsYXRlci4NCg0KQWdyZWVkLg0KDQo=
