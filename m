Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560431E842
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448967; cv=none; b=iMuBzWeZfIV1rvEuBajhkP09ONvMKl9IXk1QDxPRWZzHSY8jPbTyZU3c0JygFDBfLczwoOKvFA+ZQaINMBfT3k8BjWuRHxmyzbOB5Vvbun7d1OswS95/epsMOvH2kjQvAA6qLq+FSCSJ2DEXXf7FYGbx+cuCJ3cfq7tPS2M44v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448967; c=relaxed/simple;
	bh=bl1Ot9Cg2UyCy4wpdEX0m/90K+7HaBiFYm0Axaey4Og=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uqDwE+ryiDN3DjJ6JaRz3Wy/OI1nMfzwjAVE4koTbK7ftpGFU8S18ZmKizsXUrOxCX+og5l/LRvwfmSYHW0Bxv/RVb+PmnlxNWvWtTP0PAkhBeUV8E5GEzxyyGi1Pc67aLNBfiyPUnNbAZgkEurUbgsjuRpoN37bIXCBOvB8+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=A7aaSyZI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YYXIPmkj; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="A7aaSyZI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YYXIPmkj"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id CC5A41300125;
	Tue, 11 Aug 2026 07:49:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 11 Aug 2026 07:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786448963;
	 x=1786452563; bh=bl1Ot9Cg2UyCy4wpdEX0m/90K+7HaBiFYm0Axaey4Og=; b=
	A7aaSyZIDZ4vJpyr9eFzvkstr9DgRvw9LV7899Surj0uzRq9sU+Z5YHhRHSQtH6B
	Ed+7btb+nx60xPULJJ45ifFC4qZsfIyd5EjG+pA/j8yb2ZxfWo3IrlhFfChmj4hZ
	BvvTlAqjMW9u2b10fNC8pQcigIm9o4yjVB1BrSktjkR04UaBv62hZUKDGRGD83Ij
	fT4MWYs3uf5TBm0U7qrRy4AX7xoTOZoJFsXol+uhwek4eKbaYfM7uPfIljnCrvml
	6A7CJVQAkdpjfYgXJtpFDADrGLpNif3b5dqlkvrsy8T/tEoliJfXeFJWJ8UglIrT
	8xr4Wiyt0kE2a8e+0MScpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786448963; x=
	1786452563; bh=bl1Ot9Cg2UyCy4wpdEX0m/90K+7HaBiFYm0Axaey4Og=; b=Y
	YXIPmkjn4TpPySHNvT4XHm7hq1lQCinY29w/hKuxFXALhgkKP/luMGVDvsBjetKw
	fEf3qWdw8Vrm5gIVlKb1BW+q9BmFhjYRs4bSWaV0S1Txuw0yrNO0/WrWmILqaaY6
	woBYa7EAXj58LYc1c5ymA/yHxvsazy/OjbMFSqQkDEjznAQKQT9LMmhL1qMLqZQw
	YN5Rzc1Ylmrnc9vl88QK6i1uq32/gUUV9s1VzH39zNev9sWnha3siXZgtFqT3o7q
	8z92qRTOiHNWGVFbczQp/dkCwqSEMTMcd/l2qpUij4+sanRXUdUrjAgDIjkNnGNb
	oF9jAoB4YWH2tMS+U5UuQ==
X-ME-Sender: <xms:Qwx7atbMKz0D7lxL6vx8GFJ_re3I5wVqikU8jEZYHcKgkoIBpEiorA>
    <xme:Qwx7aswTOzncMLivUgm_z0BZX50NKIb4DhIVmdJzX0ggnOF9PRcAdNV4w-7Zea4DB
    sv1LmpaEy62CmTM1TdRjHjay2xxxLKXv7ZVTkTN6CVjig0pSUZuzw>
X-ME-Received: <xmr:Qwx7aiIOxcRsGeoO6ApUrcdJQZpWDwp7LbEV4dkVqjzssCvd-9DOA28Li4-IhMbKIB-WohVkm2nmK1HEiRp5kQ6Z>
X-ME-Proxy-Cause: dmFkZTGVoGtGeSXuxZ8qPsYewB6lUjAgmO1LkXwcvzFxNe2iTf0e3XhMWdj6oIFmV1yY9A
    yxgMqqBxTayaMPBPolSGDGmehsuIxogS9hNV6Fr1fh6IX92pf9vicS9jSIUmo8t7AYtzdk
    HP0t4z8vIPNee+yzRsVQL4pTzT9ewYfky46tzcy6MUOYUoT+tFjIX+UburHXXCw03gt15+
    +hEm0w8YUIOm7EVQdloprJhUvwbNaERewGn9dbRNplTd6bNuKrc1kScJrgAIpNf40E0lDc
    6tOPyLU+diIA5a59V0w3qTEd/gZ7PUSbuxLkOtUtIqHeHfvYnuXR0EfSFyOONGEWvcgslM
    pmN9YiL1VXwXGEfevkqmtL/J0sNBJQ+CQ6ooBAhrtmcK32KIexL3oyp66RcX2+iZg7TkXX
    q7HdGiM89GV7NewLw5Yw676K2AGsB+LznVWY3GDmRTU77C1SganSnYkKDoJewDrvVhLgtG
    LuW4gHIg4aMM/ODSNpIq+Vf5veQQQbdb9+bp1vfVbBS+t6vuRuL/UF3pJ70W0jVJOsHXcr
    zJKWN/6iUJVpbhLxM8omg8oB4tfbio47Ri4HiCA+UewUvZTYYTqBAdDMDO14RlfNLq7ha3
    GDrsYaB5Lds8MIPezEKS/KurMxdofP9DAPqTyJrsojEFioJEZuMQletZ4wVQ
X-ME-Proxy: <xmx:Qwx7ajfCT0cxKiHT33O15oN1Kx8_sL3UNLWn8FjWPCHKaUQfHcumNw>
    <xmx:Qwx7aquE-Atjkrnb08eVPi4WEe8GHa2kw28ZImVAynibOlpJ3-inIg>
    <xmx:Qwx7ahF-tTtGB9i8u1L8Hrn2IC1FY41ysgaBQiAjB7JUBjooUlMDbA>
    <xmx:Qwx7akedJxX1JoMbXpFXyFobpFQV503uKZVaCpxGF-56VK-2Dv-ZMw>
    <xmx:Qwx7arEIbLbsBzBcvRxoCA5fqlacy55UxeFHJKypvCOOfG46lK-r13Wg>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 07:49:17 -0400 (EDT)
Date: Tue, 11 Aug 2026 20:49:14 +0900 (JST)
Message-Id: <20260811.204914.1779861669713390879.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, a.hindborg@kernel.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, acourbot@nvidia.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v6 4/7] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72kHP1s7bGr4=xfJGR8KY=aUpjOB4OwLEG5E=TKULXg5Rg@mail.gmail.com>
References: <20260808062839.1159990-1-tomo@flapping.org>
	<20260808062839.1159990-5-tomo@flapping.org>
	<CANiq72kHP1s7bGr4=xfJGR8KY=aUpjOB4OwLEG5E=TKULXg5Rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVHVlLCAxMSBBdWcgMjAyNiAwODo1NDowNyArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBTYXQsIEF1ZyA4LCAyMDI2
IGF0IDk6NDjigK9BTSBGVUpJVEEgVG9tb25vcmkgPHRvbW9AZmxhcHBpbmcub3JnPiB3cm90ZToN
Cj4+DQo+PiArICAgICAgICAvLyBDQVNUOiBgX19tc2Vjc190b19qaWZmaWVzKClgIHJldHVybnMg
YSB2YWx1ZSBpbiBgMC4uPU1BWF9KSUZGWV9PRkZTRVRgLCBpLmUuDQo+PiArICAgICAgICAvLyBg
KChMT05HX01BWCA+PiAxKSAtIDEpYCwgd2hpY2ggaXMgbm9uLW5lZ2F0aXZlIGFuZCB3ZWxsIHdp
dGhpbiBgaXNpemVgLg0KPiANCj4gSSBkb24ndCB0aGluayBJIGNhbiBwaWNrIHVwIHRoaXMgb25l
LCBiZWNhdXNlIHRoaXMgY29tbWVudCBpc24ndCB0cnVlDQo+IGZvciBhcm0zMiBgSFo9MTAwMGAs
IGkuZS4gYF9fbXNlY3NfdG9famlmZmllcygpYCBjYW4gYmUgaGlnaGVyIHRoYW4NCj4gYE1BWF9K
SUZGWV9PRkZTRVRgIGFuZCBjYW4gYWN0dWFsbHkgcmVhY2ggYGlzaXplOjpNQVhgLg0KDQpZb3Ug
YXJlIHJpZ2h0LCB0aGFua3MuIEknbGwgZml4IHRoZSBzYXR1cmF0aW9uLCB0aGUgY29tbWVudCBh
bmQgdGhlDQpjb21taXQgbWVzc2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQoNCj4gQ291bGQg
dGhlIGRvY3VtZW50YXRpb24gY2xhcmlmeSB3aGF0IHRoZSBzYXR1cmF0aW9uIGlzPyBBbmQgYWRk
IHNvbWUNCj4gZG9jdGVzdHM/IChBbHNvIHRvIHRoZSBwcmV2aW91cyBwYXRjaCdzIGZ1bmN0aW9u
IGlmIHBvc3NpYmxlKS4NCg0KU3VyZSwgZm9yIGJvdGggZnVuY3Rpb25zLiBBcyB3ZSBkaXNjdXNz
ZWQgYmVmb3JlLCBJJ2xsIGFkZCBleGFtcGxlcw0KdG9vOg0KDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9ydXN0LWZvci1saW51eC84NzRpaHhneHkwLmZzZkBrZXJuZWwub3JnLw0KDQo=
