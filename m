Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AF43BDA4
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809236; cv=none; b=qBjcDS0So4sV/0ORFkJwJ/HsiT0T/J49HrdT4Kw1hGy8y3YDuIH/CpzFBU2YzoDrqPtDa59x4OMCyNecgX96gi/1G9JKrDo+jhe33j1sujBKx3p+M5RRMd4gyEXv+1LZSGM2EOZCC1r2CqqCos/gE+ap/+jU5w498FghZDbjOZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809236; c=relaxed/simple;
	bh=aa5pOIrDS2KNjOuMuMb605o4TdepEVN7uz3cN9DcGak=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YMsN2Ps8ARyPmg57TB2A/z9HIULIQILFJREf/ty0UQl6LWG7AILhkeUTqtjQMwXnAeeui+uSwY7cMLy7WiFvh1ytjSes9FHFhM8cvBN0V0iYmockfvWZISNm9b0uD3f1EEJ6PyiHlZPi5uzecxb01FK04SokjmDxeEbivB3csB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=QCBbr0nn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dnxkTHBz; arc=none smtp.client-ip=202.12.124.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="QCBbr0nn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dnxkTHBz"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 41DBB1300106;
	Thu, 23 Jul 2026 08:20:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 23 Jul 2026 08:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784809233;
	 x=1784812833; bh=aa5pOIrDS2KNjOuMuMb605o4TdepEVN7uz3cN9DcGak=; b=
	QCBbr0nniSH/yOUPP3tmtqI6LGcdpYY1nMspLwvM4JMZQILWGkVQHaEOFM3oxmaA
	GXsH01TbJwL7R7ZnbJlyYfJPUvYet51rqQ8GH/bfZIHlXa6zpvM+iP89h0SfPV2o
	pS2OEWJzdCDH/B2gFL1ithteaRs56iLUgwsJCU/ljqk6nsC6xiuj7UqjRCsTMclh
	6/sq1XigNBZpihkqyGp5ALi5qorljvDynnSM+VRrPxLjp100TFv5a4z7BDOmuA74
	MJdQj2oS7NIAoyhjVsKEFDldBSq+rCR8bErNXui2omlFNQKlaU5e50IPLq9mUf9o
	eoRlBu6IoOkL9IxJhvPEGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784809233; x=
	1784812833; bh=aa5pOIrDS2KNjOuMuMb605o4TdepEVN7uz3cN9DcGak=; b=d
	nxkTHBzO0U9ukNL8JEt0HtZ8L7q62G0hzdwXG4QaIKsbZJOV002z9nynjiXZuEKs
	YvtYFoSxxkH5ANTC9U/HRZ4Us7nwhjL77ulIQEG9+4FiepS8qgCPA76X9vyQ0T+f
	r7bL9XSSeBx8y0+YuRrQy7nLnz3rmwICT0/IquR5IrTx61KMHCQSIgGdJ4EQzgSN
	c20FIGcglRPeZsNSImQwCbjFyT5V/Kw6uAX4bfyJKaujd6QIu0y5OJWh0RjvdTbR
	2yrE1CoNq4hnydwmyxixG5TYehG7ZWXzU05iNACTacX12fKgtQ0cy17JpIt6MNbO
	RQ7OZ+04YR012hoatA04A==
X-ME-Sender: <xms:EAdiaoLkyMxNp7mYujEGCKaG5rn2LjpQM2-cePqYd8aQkSQoOJskDw>
    <xme:EAdiaoneGi5r1vPaGLmtTaolY_zKjsCKOIQU4Rc1od4kEv6gf546WRYG0Dl9czMWU
    RcDAhJBQF78ojnXpfNmfLnAJ60-JdVL0eaLv0aLuFmjs1p_RXoDrw>
X-ME-Received: <xmr:EAdiauIZao6UqMfNkXnhKItF62EPErDq_L3Q21Ir50EpU2r_lQAGG2s6FjAjOYzGy812kRjW1tMST_qQ06biC0Z->
X-ME-Proxy-Cause: dmFkZTEfqpI+Pe7k+oEUpNtED3zzUv+DSGAUS97wQQnhhty5U73znHA++U6+iNCVKBwn5j
    +l23fCdSd9qeO3TXXLIxPq/IemJbWUwMHwdkggqAtkMsRYOQRxWVFb1xsSO51zg58igLBG
    FwV/n3HazqnEXzUNMTp4HRHIn/qHU2RCvahpoMUZ507c4qNBgAboL2iuj2vKyvoZWeVv54
    MX33s+OE6wha9H+DNi2a0ly5uxqTXBqq9HJ9+GOqYKp1lXZi50ASTVWeT8Jo11F5I0QXtu
    ovI+/2T3iAnkEy40XHpIrnD9XdrqpamAfbW1FHJrZLazPTSpGB50wAtcwt0OIPAacSKlUM
    4aHlTerZFiWzgbSaPICHQdKXMS0AtxbXdIQ6ogbIXYJ6kxIw5zCAZgzgCcVsQnZKrXJ3vM
    C6bXTS8IuPTbd+zkSroMKO+T+fQiKoa/I2wWPO8OvbGrOcIrxfbmkG/ldGMfdBOvkGrT1B
    cBvulTvXE1GMw3/rC2nbB5gc0NnCYKhi0KvR34140FQfvUAUyLQvzXwYSCcf3tGGx8q+Nr
    75zIKMOfhD2MZY5DD2HH0PrP/t3H/3TxC73M1QbL43VBnfe7vTuDSZoUqgtyctBuNNZNV6
    8lE8a3Hnimom1fRB7FhnpnQjHaQOtnoDVKcSUPCBCiQVyn3TwiYIYamvbvxQ
X-ME-Proxy: <xmx:EAdiajVo_uQohRj7D2KkBC-0tPX6YI-JFNGwaYEVNa0JDxRg9XDfGQ>
    <xmx:EAdiajN1hRD5fFwWeKd6cc_XF7iKc37UZ5dkDAQ2m7Gt3eoCrF69Og>
    <xmx:EAdiavm_60pSH7H3OVGLY6GOZISaSwHxymiOefxDEbef1Z5kQ0uUaQ>
    <xmx:EAdiamVYKAMneV9drZUB6CBAAbP0j_Hzd6d9NWSnx17hEvIqoltSSQ>
    <xmx:EQdiapMhy3Y6mHG52qcFj1ddlb9_CJ2j9Oh7Lb_RuudE4nLZQxNFG4nu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jul 2026 08:20:28 -0400 (EDT)
Date: Thu, 23 Jul 2026 21:20:25 +0900 (JST)
Message-Id: <20260723.212025.1180359605820107933.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, tomo@flapping.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com>
References: <20260713225235.3243480-1-tomo@flapping.org>
	<877bmtgy6e.fsf@kernel.org>
	<CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gU2F0LCAxOCBKdWwgMjAyNiAxOToyMzoxOSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBGcmksIEp1bCAxNywgMjAy
NiBhdCAxMDozMeKAr1BNIEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2VybmVsLm9yZz4g
d3JvdGU6DQo+Pg0KPj4gQWNrZWQtYnk6IEFuZHJlYXMgSGluZGJvcmcgPGEuaGluZGJvcmdAa2Vy
bmVsLm9yZz4NCj4+DQo+PiBATWlndWVsLCBjYW4geW91IHRha2UgdGhpcyB3aXRoIHJ1c3QgZml4
ZXM/DQo+IA0KPiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2sgZXZlbiBvbiBob2xpZGF5cyAtLSBv
biBpdC4NCj4gDQo+IEJ5IHRoZSB3YXksIGFwYXJ0IGZyb20gdGhpcyBmaXgsIGZvciB0aGUgcG9z
aXRpdmUgc2lkZSwgcmVhZGluZyBvbiB0aGUNCj4gZG9jdGVzdHMgd2Ugd2VyZSBkaXNjdXNzaW5n
LCBpZiB3ZSB3YW50Og0KPiANCj4gICArICAgIC8vLyAvLyBPbmUgcGFzdCB0aGUgYm91bmRhcnk6
IHNhdHVyYXRlcy4NCj4gICArICAgIC8vLyBhc3NlcnRfZXEhKERlbHRhOjpmcm9tX21pY3JvcyhN
QVhfTUlDUk9TICsgMSksDQo+IERlbHRhOjpmcm9tX25hbm9zKGk2NDo6TUFYKSk7DQo+IA0KPiBU
aGVuIGRvIHdlIHdhbnQgYERlbHRhOjpmcm9tX21pY3JvcyhNQVhfTUlDUk9TICsgMSkuYXNfbWlj
cm9zX2NlaWwoKWANCj4gdG8gcmV0dXJuIGBNQVhfTUlDUk9TYCBvciBgTUFYX01JQ1JPUyArIDFg
Pw0KPiANCj4gVGhlIGRvY3Mgc2VlbSB0byBpbXBseSBgTUFYX01JQ1JPUyArIDFgIGJ1dCB3ZSBy
ZXR1cm4gYE1BWF9NSUNST1NgLg0KDQpZb3UgYXJlIHJpZ2h0LiBJJ3ZlIGp1c3QgYSBmaXguDQoN
CkkgZGlkbid0IGluY2x1ZGUgdGVzdCBpbiB0aGUgcGF0Y2gsIGJ1dCBJJ2xsIHNlbmQgYSBmb2xs
b3ctdXAgcGF0Y2gNCmFkZGluZyBleGFtcGxlcyBhbmQgdGVzdHMgZm9yIHJ1c3QtbmV4dC4NCg0K
