Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9EC388E4D
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 12:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945089; cv=none; b=RA3hLLCccamiF734uLJXMAv3nARjxdz3KQlSAHtBsLevl0VqpX2AwwnZwb/HqaccQjjodpU9TwPR/PPtMIuYSdL74EXsAOgLtKCi9bdhIS4KJKLoUFTb9P6h3bgsKwcg6vaGr7wjsXekEgL+VnEFKVihr4wWBDASApDCS/s5sZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945089; c=relaxed/simple;
	bh=eyVtWHFxGpr/yszaVA91p2Z/5zIhLToqaZXqJKBUQ2c=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qr6W/TFS+jbdy5IVGqlwuZGx8u5roAiBuPjs78F6Oq2Lx2o4ozS3wiz1WsS88NSZsAeWy2h8Q/rTn23fvIZzIG6bX3CZ5fB8nTdiM3Mvj/UJb+WDEL/Ha7HzZvnI3hfrwS1IBRzN5pmobcS+PXmwQ5vm/CMajXRfChGmqa0gYXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=g5qv0/a8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=imj9cWpv; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="g5qv0/a8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="imj9cWpv"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id 9A533138013D;
	Mon, 13 Jul 2026 08:18:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 13 Jul 2026 08:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783945086;
	 x=1783948686; bh=eyVtWHFxGpr/yszaVA91p2Z/5zIhLToqaZXqJKBUQ2c=; b=
	g5qv0/a85hdQzjmFMrdCTctjVOY+K7jLGaxB8mRT+RuussZNK5jUYQ8jg52iK2DT
	+nPJxiLmGPFn2OiPZmQeRlwqdymowC7U9Akx0h3vOEwsY0EyLJnloo4lqK9Uy+fh
	RQqNiG0t2alm1ijU37azuwMT7dtQCz0OBcCrhThckJmyU/H+fIcmxmWQzNIPOGnj
	JKW55KpJu5zOckr/c4QWxM+vZTRw8d3afPtApMNmc20cmzqP1swfLs3CmGwO6ovt
	9wxarxtur8fxw4ah2HheviT7IGJ4Fac01koJm0RF3PTjvhdwbMNoV0n6FzbU3XGj
	e+/qqtmSFSHNNZmGJYXpsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783945086; x=
	1783948686; bh=eyVtWHFxGpr/yszaVA91p2Z/5zIhLToqaZXqJKBUQ2c=; b=i
	mj9cWpvx3r2aXfFZGMg9xRCmLek+8qLlszQPuQ7+QtcHWlDphvTy1svRcHS64D37
	Bv64mzDuPEHu8Z94cFfKAScRF92qJzWVhvAPzTjQ0Uj+Ygzn538IftqOafq/P46/
	jbJxiafO4MLHl31YSgSPeO7CB8ANarhQRggVh5epUju+9IFe7LrglEN0vob1BejK
	QX4M2JZXtud8vJ1pV8wFZnGJqg9A9cy+RMwcsGCh1NJsAug8XEfx5qCbHZzO5/6P
	4x9KbNQe5eURnX7j2NHonMlT2I8s1WhNummmPTgAfTni57OqhUFfZUvdB2iHbm1X
	9Mp4io/PYe6uQqs/sDTLg==
X-ME-Sender: <xms:ftdUai39IU1GJVOTbBvSKJAQrOOFG93F7-cEMJrom4ZfZwRz4MsjCg>
    <xme:ftdUaglBQyOQEc4c1aBpH-A-7GGFN5aojVF7ldOyoPr8aNLvXJCdGCJfl_2M81gAm
    hAIZAvji2fBjp5VaDC4-mfhvrSlQilIlsIPKM4USx1KDNBf30vECGE>
X-ME-Received: <xmr:ftdUag5-DRr4dBHg_iZmfcaLW9AFFeMSyK-y-6Vsz27tUvyJVO_ZFWFFWc3ekHulzA1WleeyeDV7EXViYMqjXJfb>
X-ME-Proxy-Cause: dmFkZTFfUIYLWPxv5Hfdjy58p/wUyT7s1FW4aUPNLVYvIPZ8153z2JjEXebeSRb4z+oNiO
    7s6dehHmURAoZdrnVPyi8gmNpJp+VFMN7VNtRjCyTCbpT82D0cbP4UyZOfmloTCQa1uDaA
    fB2FyVJnSDAXc9OfYS7b1xYGexcP+92MxMsWrdx4aorEetAMOif7KTXqEmg4cQy1bQp4+P
    Hxupk1nJn8aAfPIFR36gI4spMtoEed0Ub9HZA/6KSxSO88y/3cmBBOFvU3Xemy+03JaL22
    891MvslNscwreAY+4LRpywrcc6fvHT37DaMveGLnc3fxjDlIbESXsxcQnLMEnbaeZYagBZ
    QejEY5FWA/9jQGbHtQNrti4BNMkcEDd+Jl7kIAGVj0vhGILCpbdp4+XFl6fn/uoMBvR4Eg
    8nailcGK+/btWxCm0AIrJdJjs0oE4d3kvUdDdyAx8UPErjYfbeZez0oCG6LBcxuaHDCxFY
    mIzqqS0tt3EWzL4YgPrDNzxLNifps+aeEcXs12AKdnGUGx3W6NwKwzde/M+XEx6PlF9Wl6
    Wp5fc6EC5OB6JJ8zNWS5+wX/vdDkDhx2Uh/ipWZzyBIcCoYnef5poSjVsLJ8od8HhbEiHS
    83aEA8JUrCYuK8MsvaGPsdL2ZDCHhc82nTurNmhQR2QKuKOdcDjhI3WBVV8A
X-ME-Proxy: <xmx:ftdUahkVb8ZET9V-_NoaK7ERof62UCMvhxkkQ2479gOiZlln6v82QA>
    <xmx:ftdUaqS3Jr5PIhe6B_e7c9X2_e3qv0KX952zDiaNWG4evn5Ll0fVhA>
    <xmx:ftdUanlE-mAJp8IEaB4osNB93mf1A-87AM6MDpElpTvyVIrr0UyuIg>
    <xmx:ftdUajN25JsP2_WOmtUQ_cVmn77fPv0_3WlKoHtllpCSk006Eta5Yg>
    <xmx:ftdUao2X8_UCMyuwHgegj3xJijEoUTiyVkU-mvxNvKqReSZTGXU_tdf6>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 08:18:00 -0400 (EDT)
Date: Mon, 13 Jul 2026 21:17:55 +0900 (JST)
Message-Id: <20260713.211755.1597856561989928143.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, work@onurozkan.dev, aliceryhl@google.com,
 a.hindborg@kernel.org, arve@android.com, boqun@kernel.org,
 brauner@kernel.org, cmllamas@google.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com, acourbot@nvidia.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 3/4] rust: workqueue: use Delta for
 enqueue_delayed's delay parameter
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DJXF9YNZ0JNN.WIMNJSH4BH2Z@garyguo.net>
References: <20260713090732.115293-1-work@onurozkan.dev>
	<20260713.184034.916211318483609924.tomo@flapping.org>
	<DJXF9YNZ0JNN.WIMNJSH4BH2Z@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gTW9uLCAxMyBKdWwgMjAyNiAxMjo1NTozNiArMDEwMA0KIkdhcnkgR3VvIiA8Z2FyeUBnYXJ5
Z3VvLm5ldD4gd3JvdGU6DQoNCj4gT24gTW9uIEp1bCAxMywgMjAyNiBhdCAxMDo0MCBBTSBCU1Qs
IEZVSklUQSBUb21vbm9yaSB3cm90ZToNCj4+IE9uIE1vbiwgMTMgSnVsIDIwMjYgMTI6MDc6MzAg
KzAzMDANCj4+IE9udXIgw5Z6a2FuIDx3b3JrQG9udXJvemthbi5kZXY+IHdyb3RlOg0KPj4NCj4+
PiBPbiBNb24sIDEzIEp1bCAyMDI2IDA4OjU5OjU2ICswMDAwDQo+Pj4gQWxpY2UgUnlobCA8YWxp
Y2VyeWhsQGdvb2dsZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+PiBPbiBNb24sIEp1bCAxMywgMjAy
NiBhdCAwODo1Mjo0NUFNICswOTAwLCBGVUpJVEEgVG9tb25vcmkgd3JvdGU6DQo+Pj4+ID4gRnJv
bTogRlVKSVRBIFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPg0KPj4+PiA+IA0K
Pj4+PiA+IGVucXVldWVfZGVsYXllZCgpIHRvb2sgYSByYXcgamlmZmllcyBjb3VudCAoYSBwbGFp
biBjX3Vsb25nIGFsaWFzIHdpdGgNCj4+Pj4gPiBubyB0eXBlIHNhZmV0eSksIHNvIGNhbGxlcnMg
aGFkIHRvIGtub3cgb24gdGhlaXIgb3duIHRoYXQgdGhlIHZhbHVlDQo+Pj4+ID4gbWVhbnQgamlm
ZmllcyBhbmQgY29udmVydCB0by9mcm9tIGl0IHRoZW1zZWx2ZXMuIFRoaXMgbWlycm9ycyB0aGUN
Cj4+Pj4gPiBpc3N1ZSBhbHJlYWR5IGZpeGVkIGZvciBDb25kVmFyJ3Mgd2FpdF9pbnRlcnJ1cHRp
YmxlX3RpbWVvdXQoKS4NCj4+Pj4gPiANCj4+Pj4gPiBTd2l0Y2ggdG8gRGVsdGEsIHRoZSBkdXJh
dGlvbiB0eXBlIGFscmVhZHkgdXNlZCBlbHNld2hlcmUsIHNvIHRoZQ0KPj4+PiA+IHVuaXQgaXMg
cGFydCBvZiB0aGUgdHlwZSBpbnN0ZWFkIG9mIGEgY2FsbGVyIGNvbnZlbnRpb24uDQo+Pj4+ID4g
DQo+Pj4+ID4gVXNlIGFzX2ppZmZpZXNfY2VpbCgpIHJhdGhlciB0aGFuIGEgcGxhaW4gdHJ1bmNh
dGluZyBjb252ZXJzaW9uOg0KPj4+PiA+IHF1ZXVlX2RlbGF5ZWRfd29ya19vbigpIHRyZWF0cyBh
IGRlbGF5IG9mIDAgamlmZmllcyBhcyAiZW5xdWV1ZQ0KPj4+PiA+IGltbWVkaWF0ZWx5Iiwgc28g
dHJ1bmNhdGluZyBhIHNtYWxsIG5vbnplcm8gRGVsdGEgZG93biB0byAwIHdvdWxkDQo+Pj4+ID4g
c2lsZW50bHkgdHVybiBhIHJlcXVlc3RlZCBkZWxheSBpbnRvIG5vIGRlbGF5IGF0IGFsbC4NCj4+
Pj4gPiANCj4+Pj4gPiBTaWduZWQtb2ZmLWJ5OiBGVUpJVEEgVG9tb25vcmkgPGZ1aml0YS50b21v
bm9yaUBnbWFpbC5jb20+DQo+Pj4+IA0KPj4+PiBJdCBzZWVtcyB1bmZvcnR1bmF0ZSB0aGF0IGEg
Y2FsbGVyIG1pZ2h0IGJlIGZvcmNlZCB0byBjb252ZXJ0IGppZmZpZXMgLT4NCj4+Pj4gbmFub3Mg
LT4gamlmZmllcyBpZiB0aGV5IGFscmVhZHkgaGF2ZSB0aGUgdmFsdWUgaW4gamlmZmllcy4NCj4+
Pj4gDQo+Pj4+IEFsaWNlDQo+Pj4gDQo+Pj4gWWVhaCB0aGF0J3Mgbm90IGlkZWFsLiBXZSBjYW4g
c29sdmUgdGhpcyBieSBtYWtpbmcgdGhlIGFyZ3VtZW50IHNvbWV0aGluZyBsaWtlDQo+Pj4gYGlt
cGwgSW50bzxEZWx0YT5gLCByaWdodD8NCj4+DQo+PiBXaXRoIGltcGwgSW50bzxEZWx0YT4sIHRo
ZSBhcmd1bWVudCB0eXBlIGNoYW5nZXMsIGJ1dCBpZiBEZWx0YSdzDQo+PiBpbnRlcm5hbCByZXBy
ZXNlbnRhdGlvbiBzdGF5cyBhIHBsYWluIG5hbm9zZWNvbmQgY291bnQsIHRoZW4gLmludG8oKQ0K
Pj4gc3RpbGwgcGVyZm9ybXMgdGhlIGppZmZpZXMgLT4gbmFub3MgY29udmVyc2lvbi4gVGhlbiBl
bnF1ZXVlX2RlbGF5ZWQoKQ0KPj4gc3RpbGwgY2FsbHMgYXNfamlmZmllc19jZWlsKCkgdG8gY29u
dmVydCBiYWNrIHRvIGppZmZpZXMgYWZ0ZXJ3YXJkcy4NCj4+DQo+PiAjW2Rlcml2ZShDb3B5LCBD
bG9uZSldDQo+PiBlbnVtIFJlcHIgew0KPj4gICAgIE5hbm9zKGk2NCksDQo+PiAgICAgSmlmZmll
cyh1NjQpLA0KPj4gfQ0KPj4NCj4+ICNbZGVyaXZlKENvcHksIENsb25lKV0NCj4+IHB1YiBzdHJ1
Y3QgRGVsdGEgew0KPj4gICAgIHJlcHI6IFJlcHIsDQo+PiB9DQo+Pg0KPj4gVGhlIGVudW0gcmVw
cmVzZW50YXRpb24gbGlrZSBhYm92ZSB3b3Jrcz8gRGVsdGE6OmZyb21famlmZmllcygpIGp1c3QN
Cj4+IHN0b3JlcyB0aGUgamlmZmllcyBjb3VudC4gQVBJcyBsaWtlIGVucXVldWVfZGVsYXllZCgp
IHRoYXQgdXNlcw0KPj4gamlmZmllcyB0aW1lLXVuaXQgZG9uJ3QgbmVlZCB0byBkbyBhbnkgY29u
dmVyc2lvbi4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdXNpbmcgZW51bXMgaXMgdGhlIGNvcnJlY3Qg
YXBwcm9hY2guDQo+IA0KPiBXaHkgY2FuJ3Qgd2UgbWFrZSBKaWZmaWVzIGEgbmV3IHR5cGUgYXMg
d2VsbD8gVGhlbiB3ZSBjYW4gaW1wbGVtZW50DQo+IGBGcm9tPEppZmZpZXM+YCBmb3IgYERlbHRh
YCBhbmQgYEZyb208RGVsdGE+YCBmb3IgYEppZmZpZXNgLCBhbmQgdGhlbiB0aGUgQVBJDQo+IGNh
biBqdXN0IGhhdmUgYEludG88V2hhdEV2ZXJUaW1lUmVwckl0TmVlZD5gPw0KDQpJZiB0aGUgcHJp
bmNpcGxlIGlzICJlYWNoIEFQSSBzaG91bGQgYWNjZXB0IHdoYXRldmVyIHR5cGUgbWF0Y2hlcyB0
aGUNCkMgZnVuY3Rpb24ncyBuYXRpdmUgdGltZSB1bml0IiwgZG9lcyB0aGF0IG1lYW4gd2UnZCBh
bHNvIGludHJvZHVjZQ0Kb3RoZXIgdGltZSB1bml0cyBhcyB0eXBlcyDigJQgZS5nLiBhIE1pY3Jv
cyB0eXBlIHNvIHRoYXQNCmZzbGVlcCgpL3VkZWxheSgpIHRha2UgaW1wbCBJbnRvPE1pY3Jvcz4/
DQoNCk9yIGlzIEppZmZpZXMgbWVhbnQgdG8gYmUgYSBzcGVjaWFsIGNhc2UgaGVyZSwgZGlzdGlu
Y3QgZnJvbSB0aG9zZT8NCg==
