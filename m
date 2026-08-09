Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8DE2AD2C
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Aug 2026 00:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786235665; cv=none; b=JvDfmuY/fyGZI3RIteXYbL+Gc0i7PG1ctzdjabSKuS79CnVeEmwgdSpAdsiHls7p+B62IgWB5O5vLgIcrI3MJXIZGwnJP7vy8jxjUrwJf356dk+7GAUNHB2ERq8zaX3D7BtS2/ttwM4vU1FFXZlvEbHBNjkOgW4/H2U2BytnZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786235665; c=relaxed/simple;
	bh=Ii1jnjrWAx/xfDUxiNNXLI98nwKHF5WAn9U7cJ+Mbd0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JmQyZmACwoAv+E5i27Of35nf3Scbfoe2qlPCG7xw+P5ULrK35PBcFAOQle9NYyz35LpyrzNT48R7kdZO6RLFdLVEynHJ1594p64TPazSDYM6BwPgZLLIfV3PFg/uLijVHtJUGKq/nm2QKpmeEfyTui6DYK8I/qasQk9hYwWlWJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=kZO2x8d8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KJ68D97l; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="kZO2x8d8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KJ68D97l"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 71C8B13000DE;
	Sat,  8 Aug 2026 20:34:22 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 08 Aug 2026 20:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786235662;
	 x=1786239262; bh=Ii1jnjrWAx/xfDUxiNNXLI98nwKHF5WAn9U7cJ+Mbd0=; b=
	kZO2x8d8VTQxHbNxpomB9sselSyTxw3q/a/OlMhqiH95EbwRwAy6DQGEBm+dE6Ki
	BOmcF79IqHehrXAnczQKbU8tllxxhmq70py40+QDuhjW5rLwlo8OQ6EMkSj/amlE
	SSib4N0UyiQCuERj/UxL82JyItdTMvK6rASd+2NldZVmzBtjQAEOt85IeSKY6kKr
	aXFL8s9BtM6OPAbpsgMeHtPSxdUrHrRmNtkqFHuz9CPgedCSFo3kG+RyJkpVdjv0
	6J7YWmM1wOFR0v6fafdmwPxI7F16U5ae4GDlRVaVbntiHGzM+gJM4x+1iR7ayV2K
	57lxsnAD3AchgFEWiy4HBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786235662; x=
	1786239262; bh=Ii1jnjrWAx/xfDUxiNNXLI98nwKHF5WAn9U7cJ+Mbd0=; b=K
	J68D97lCyl2Z1I16PXLIa6GABbGnzxjcTDJv8uUur6i0RY9MbCsT7ps5Ccoc0uI3
	0NzO6jafuBd1D1EoaU2v4MFd0StXF9v00N8RDX6Swssd00OLNbTxQhCMU6uUr1Q7
	ZkBjCo5dZYPZHlLgINCunh8esGhjKtx6OyAvyrspiEzEvdt3wPRArQ/7LiiAPoZh
	iyJMMwWquRKgePQ9ROK/tTxZpcplVHpkQAMTmguBUDjRKC6ZuA++c4Qlfo4JWVXF
	20+piypBENtV4qQGFqWQVqosYlefCpi+JvdZlk04VzQID4O5P3IkHkdvdodrtBse
	IavTm+ooPxjIGeiwt4Tkw==
X-ME-Sender: <xms:Dct3aoAVraWYUO1HxF37G8I0kOVztOZWiLldyx8uXsNNS45mjEKeug>
    <xme:Dct3apBlib2272y1qQw-Vf-GaMxqwrqFSxcZrabn9weTeMEbPP2Tqdh78c2BsygcL
    uyhYyd-gdUVWIZd5-6LoAZ0R-KG6DMb8D2hxT086cW-3rqru42eqQ>
X-ME-Received: <xmr:Dct3aia6exuU_Vgms5RDdOaOF7l0FLk0Ok8Iiu_BwLPD5MDfhkaRiDU6M7TxSuUWSzAcUIFaKmBxS-9c1O2Lgjon>
X-ME-Proxy-Cause: dmFkZTFfKCdzdtVKqicJm3G6LB0zxf6WXLLYKo10vxq56hadoy89HfWxzIjevoU+N0tRUR
    r+IVgonjKTqO9ppzMIF8QYZquWuG2ebIELMtGWkRHhTTfqIHzFZ9ChDZalBV8xPIEeAkRp
    6FCMx6DvOmGqnyDuxjuPeomC80ibZKGUhFudMTtPADs4Fj3ROcUjOwZ7k9z691WwRVFoLz
    gybL7xYyXZiICn5ZNEehfLp8UA7W4H/GqO7Rvd6rzFUIbRj5YthaCk/HyKOkNuAlOxa5Vz
    yCcBBvfoUyvdBYUgc1daCD4BlfVcjlf1ibuXesQTZffn1d4n1Bp6poIKQfUJlQWSZJPch7
    pD1YqqrguG3TE2WkogKFzjur0lDO95tVBxocQvbLHzaNZ2VHiUWOD+xfMV6osNN8M0mUa9
    q65YPZmHP8nEendpVwoaiMyoShjQiGKJZat50cB7vWsb+N/uq0DqL0S00xvytPGTht9kRd
    0y5CROaT9d/pPoDgk4FjnoLkpniGqecNLInOMyvW66XGXoE9N10FBd2Y9AOuhv3iBFh6ag
    dj+i6KjsH3U7MHn1XsHfHPO6KdNlUmvNaiYOxLcBWPBArPY16qN+mM7uDIHEY2ah88XghB
    X5FbBe4pDNwIBJLl9sr2vlpci0f7NEP/E/8j0MHURijmXkh+s10AzbeyZhJw
X-ME-Proxy: <xmx:Dct3auyxWj12V7qsRnJtkcMSn3ptL9Wh5ZmHTja3XlimdAWxXGcaNg>
    <xmx:Dct3alcHBxlgcx_If-lzOkeJNvzuO6qOdNv8z7FP75LmTdtx58RbUw>
    <xmx:Dct3akLIAmvje0nIaScGhLHZbyP-k8qyYWBq7R0WDwd1EqzVcbdPMQ>
    <xmx:Dct3au2Vn8f7cYZMk9Ks6RPb2LFUl2RyaT0PTehONldQ1IVW4tI80Q>
    <xmx:Dst3aqJ1dH6PEd0f7sR541BLWpgGNh706cOrS0AhlGpAqghtRxF8WJnL>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 20:34:18 -0400 (EDT)
Date: Sun, 09 Aug 2026 09:34:15 +0900 (JST)
Message-Id: <20260809.093415.1407278992536442461.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: gary@garyguo.net, tomo@flapping.org, ojeda@kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, lossin@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from
 warn_on!'s flags constant
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72nWcqd3aSKdPqOSRRQBuwWNW-s2EOscYszQ9kSbmrKxcw@mail.gmail.com>
References: <20260720035510.4048145-1-tomo@flapping.org>
	<DK6CISNRMHJD.391EZL08Z6HM0@garyguo.net>
	<CANiq72nWcqd3aSKdPqOSRRQBuwWNW-s2EOscYszQ9kSbmrKxcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gU2F0LCA4IEF1ZyAyMDI2IDIwOjE5OjI1ICswMjAwDQpNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+IE9uIEZyaSwgSnVsIDI0LCAyMDI2
IGF0IDE6NDDigK9BTSBHYXJ5IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4gd3JvdGU6DQo+Pg0KPj4g
QWxzbywgdGhlIHByb3BlciBmaXggd291bGQgYmUgdG8gbWFyayBpdCBhcyB1c2VkIGluIHRoZSBg
d2Fybl9mbGFnc2AgbWFjcm8NCj4+IHRoYXQgZGlzY2FyZCB0aGUgZXhwcmVzc2lvbi4NCj4+DQo+
PiAgICAgaWYgZmFsc2Ugew0KPj4gICAgICAgICBfID0gJGZsYWdzOw0KPj4gICAgIH0NCj4gDQo+
IE1heWJlIGl0IGNvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhIGBkaXNjYXJkIWAgbWFjcm8gbGF0ZXIg
b24uDQoNCkxvb2tzIGxpa2UgZGVjbGFyZV90cmFjZSEgaW4gcnVzdC9rZXJuZWwvdHJhY2Vwb2lu
dC5ycyBkb2VzIHRoZSBzYW1lDQp0aGluZyBzbyBJIHRoaW5rIGl0IGlzIHdvcnRoIGhhdmluZyBh
cyBhIHN0YW5kYWxvbmUgbWFjcm8uDQoNClNpbmNlIGl0IG1hcmtzIHRoZSBleHByZXNzaW9ucyBh
cyB1c2VkIHdpdGhvdXQgZXZhbHVhdGluZyB0aGVtLCBob3cNCmFib3V0IGBtYXJrX3VzZWQhYD8N
Cg0KSSB3aWxsIHNlbmQgYSBwYXRjaCBvbmNlIHRoaXMgbGFuZHMuDQo=
