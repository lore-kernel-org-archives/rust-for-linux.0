Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B12EE262
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173612; cv=none; b=qVIsx66g+MKGg1s+sACQgquWeBxZlJnLL7huhf8tYTWXqo4uyOFjZgTB53QhRDf1rY27RmeLzCbwR4AbVmUsijWpZ+LPXLFxlG3F3WwBkuCr0qG7DU9edoeb0ZhbyYP3GvuJWRjfDNLbYrC5UapGQkF8Zt4CCUV9sKJgceUxd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173612; c=relaxed/simple;
	bh=+nfJLtbfXdAGH/lRsmsXEn1T3sbfmnZGOGtwYg2O5hE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MQTRjONhSWXJOperfkY5IruABI4HzAIhYjMSTqQ2VgDKZ2kq9QNzF5yMOcK+Rb83w01X8IpPIddIOkcMbxts4NQK0tAgPVGm4CaTnVtzDuVN51CzHwkUJBqZM2bnW1vZZlLPL7flElSdyJikDl4Kw0oKoIwEiQrNAbyfw7h/fxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=BUiD8GhY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BTWStpSY; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="BUiD8GhY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BTWStpSY"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 0D0F113000C4;
	Wed, 15 Jul 2026 23:46:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 15 Jul 2026 23:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784173608;
	 x=1784177208; bh=+nfJLtbfXdAGH/lRsmsXEn1T3sbfmnZGOGtwYg2O5hE=; b=
	BUiD8GhYRirWPER17RtEzTFwuYnX35BXFi1MB+ex6pJsYuNxxaCocP7Q95T79RUJ
	GssxJM+JOr9BdurwIzGwqgvctaZ/+XSG7Wd/W36ZZqUgXsF+5lvodA3o0TaiSfw0
	sHjXi91iEYLyBs6QusrnuKeFHdRSqG56ejzITd/G74ld/dU1H3Y/XRHU7tpGnI3h
	nLPx5qLlx04S+h+3kgphnqsdOKs/mDlN+4bUyBAAs2QYPAiywQ/h0pLNZ570lCp1
	7+E9Chdlauhx34WDM4c3Tx7CwZ8B9H6dWs89PcS2WjTODy+jDRd3zWp/BulTLAWd
	pcPW1q3fGIQNZ2RlPnUMCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784173608; x=
	1784177208; bh=+nfJLtbfXdAGH/lRsmsXEn1T3sbfmnZGOGtwYg2O5hE=; b=B
	TWStpSYo7hE9ZClCiYcmKIWkVhWbDuujN37Bu3acVgso5JqBeDQQ2zFlVvaKXy1D
	7u8OqZfWHKby/o0PPZ/5K6SAIGvWVlpp3JkmeTCezj85KoCUFmycGqeZm2Ed/l5c
	QZHPN3nZ8p1n5iJbq8hVqjd/qMNwpoqlqr/yg9Wr5ZOqB7tWW8W8v4S72ht2aRKW
	voAJUBUy5Su5s1rJ+RwtxPz2j8cn08qs+wzDeO1LSg7gHuoZlIAtDPMEdZe3htGb
	3AEe2/7YG4+8OP2dzEfFMwaRyN+xjpRDUrshBpZpjrRd+GOvsXwfSdD1QJbGEQYm
	L1PGoAf4pn2EDSM7ohkqg==
X-ME-Sender: <xms:J1RYarBVqw11qVB5Jva9zbrykBZbUZY-xJL_1rJi5Ee6iODWv6v84Q>
    <xme:J1RYav6ForIT1pXlxGhErPN-g6J6F_PTrDFIFFdoh46Q5R3lyP1LsM11_r99_B08H
    foZL_FZs0mcT1VBleKNNkKAnCOgAa8bk56wio9Rl16HYaLRvdnEKHo>
X-ME-Received: <xmr:J1RYain6KFmWA4ibJkHENYVNUJOiFVv83CqPTnXjOSz1I9lYy5kAOrBpfb9OGmT8C5SjyCBCTAb0SIgEbYd0doF_>
X-ME-Proxy-Cause: dmFkZTFSAlY4HzP3MkLIPxe75n0HVkaD5rFABj1lkog3j7U10EfeMNVWTL00oTA5av6sLq
    5kdcareYEGnaRR/5J9XC8SuGnKK2FsIvIC4voperPYHtUAbOewga6utRfmUyWnepK/sh3L
    IHPgc/k90RCI6c7gSu4PVV1FYYdu52DiTYObVlDDINkYxk+5snVbSK5cK7RZiREvboe4+u
    pbIoZOq/+ylbBwZThrxBUYUJjO+7sZu3Cdq4PyfzW/ZGNBsiRE2gAA3G6wt6PrAJXJjl/X
    9biXyz4KtWHnDzXRChI2bAY+kmwKEhE5TKxuqyh9gzPQ142iG/LbbSSkjpvM0qmizBXoFq
    +0qb28NaqwThh4+Gkv6B8qXt4shjumirlOimBLpakcfjb7ui3sOgoY64oskHEDB6mCI9Ar
    eAs94fvcRfb5PJal62oQiCP2vNFaWyS8PUfG1YL7rVozYAXwYJyIdrzt/avpKuFtOeFqmk
    Zx63sHkBnwq4qIRAobLywGgb4cxLOPF3S2ja6vV9KzkUDcugm0pqJIsXnUaHeC35zKoR98
    +QrJqcSCIzhOJ+hl8+jRBOoSNHpMO7Mi3wtYV00+O/1N4a81LAFYpPieUgw8UlI7MjeNuN
    Re7phWH+JiNPRRmRpSxYhTpr38qpgnDjEbiFNLboXRFBKW60zE9fp9I9kiGQ
X-ME-Proxy: <xmx:J1RYag7wWrMLpb_2Vy8z4WgZ9hftkA778EbxHrn7trTsnPRCw_fXLQ>
    <xmx:J1RYaoXrFoxN9MBHpNgMsAzGbegCTr0Y0A2Wk7T7UWEmHDjYMcihWg>
    <xmx:J1RYas95Bnznw8eShkya0-4XvVnDh-WhxDuWqapYLPtfbDnhD0HtCA>
    <xmx:J1RYatjkv-sb1z6uz78mwdtOrkT3TaOWewJV-R0UfB6GKdHK3mZbkQ>
    <xmx:KFRYao4rDNQ8fLOZjYsdr7v5NJzKqdErcqxbmfo5-Nejv5MKolzm0znj>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 23:46:43 -0400 (EDT)
Date: Thu, 16 Jul 2026 12:46:40 +0900 (JST)
Message-Id: <20260716.124640.903442293670054204.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, tomo@flapping.org, tomo@aliasing.net,
 ojeda@kernel.org, gary@garyguo.net, dirk.behme@de.bosch.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72=XvdJhGcbfTF3yv_S9Ls7GbFL_fnwpoAUXmwFc6ND9Bg@mail.gmail.com>
References: <20260715.202254.38223441240127219.tomo@flapping.org>
	<87a4rsgyqy.fsf@kernel.org>
	<CANiq72=XvdJhGcbfTF3yv_S9Ls7GbFL_fnwpoAUXmwFc6ND9Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gV2VkLCAxNSBKdWwgMjAyNiAxNzowOToyMSArMDIwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBXZWQsIEp1bCAxNSwgMjAy
NiBhdCAzOjM34oCvUE0gQW5kcmVhcyBIaW5kYm9yZyA8YS5oaW5kYm9yZ0BrZXJuZWwub3JnPiB3
cm90ZToNCj4+DQo+PiBFaXRoZXIgd2F5IGlzIGZpbmUgZm9yIG1lLCBidXQgR2FyeSBzZWVtcyB0
byBncmF2aXRhdGUgdG93YXJkcyB0aGUNCj4+IGN1cnJlbnQgc29sdXRpb24sIHNvIG1heWJlIGtl
ZXAgdGhhdD8gV2UgY2FuIGFkZCBhICIvLyBOT1RFOiIgb24gdGhlDQo+PiBzdHJ1Y3QgZGVmaW5p
dGlvbiBzYXlpbmcgdGhhdCBzb3VuZG5lc3MgZGVwZW5kcyBvbiBhbGwgZmllbGRzIGJlaW5nIE9L
DQo+PiB3aXRoIHRoaXMgY2F2ZWF0Lg0KPiANCj4gSWYgc29tZXRoaW5nIGFjdHVhbGx5IGJyZWFr
cywgdGhlbiBhcGFydCBmcm9tIHRoZSBub3RlLCB3aGF0IGFib3V0DQo+IGByZXByKHRyYW5zcGFy
ZW50KWAgdG8gZW5mb3JjZSBpdD8NCg0KWWVhaCwgaXQgd291bGQgaGVscC4gSXQgZG9lc24ndCBn
dWFyYW50ZWUgdGhlIGZpZWxkIHN0YXlzIGJlaGluZA0KT3BhcXVlIGJ1dCBJIGRvbid0IHRoaW5r
IGFueW9uZSB3b3VsZCBzd2FwIE9wYXF1ZTxiaW5kaW5nczo6aHJ0aW1lcj4NCmZvciBhIGJhcmUg
YmluZGluZ3M6OmhydGltZXIuDQoNCg==
