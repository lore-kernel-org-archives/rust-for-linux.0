Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776715;
	b=UFg+jUPYBdgKT4uTJ8FxO1M6DXpRzq/whSBYrBlQEtBsWDp17dC53tGkDazFgSQb5Hnr
	 zuUUMCXFQ4ov1VRcmpI+CVIlL8PwwcR+CDzj4kdJiCzcjono+bbW2iADhvuB6zwQkdcJP
	 GgYTQufO3g1GG5fbukQp053fBG7xDpkH0yYlx2niPGG7KBhDb+lXeZ34sQquUuFkKbdyh
	 DnRZPdna4h1qYk2sEAuGfJxm7jWGil5mQ+p+Z9XdvHVfkBqJzLEHGbfTlo34xTgmlynbd
	 uRkHy/UVgrgFqG4HfZQOE51pJzGjqvn86m7sdFPd1wmqBOfarGyHg6fQSgOCqiDTnOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776715;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=38+0M1hHMr995Gt0aoapcSXnYcouam3Qlvab25dJNSA=;
	b=ldl90jW9iw5+smU0BpRnkJC+Xp21sCv47b16JCLqSAEFWcc4ydxjyqcjG+p/4d8u0tUs
	 hmR7k3gK/15d+de/NswIKCtrnbHMr1G0QpB61EfSlWEmyxKdVvpdzwSvcBgxR0Om9ERQz
	 Cc5CwJ/6LBgq8YS251BmziFJTkX3IQMBpl4VZlgla2YkTO/bi909LhIOlkGhav6RzReV8
	 nOI3PzOQzdqaCgT3riLXfXaJ1kVr3ntH3ZVHEj8Uhn+Rln1ATNyOmE85Cu0miEPqfbkVV
	 9Dm1MWRUz6d8hwWIbmpOojfKarHoelTmyXrcAUAheJ5dS8eeIZKPa6qRdvq59POLQaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=miMNnGFO;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3k2rHvRb;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48712606A31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 07:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48712606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=miMNnGFO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3k2rHvRb
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 78AA01400138
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 02:18:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Nov 2026 02:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793776714;
	 x=1793863114; bh=38+0M1hHMr995Gt0aoapcSXnYcouam3Qlvab25dJNSA=; b=
	miMNnGFOHvPO0A+1NzjcopqUHlqXxhPL4f6NV7rm94PVwQ2/oIy+7mKDOULD0dbG
	Wt/gByWxXD8RVOe6Twdy0035ubi91TOhpCj+QrGa60Y0cCMPi62xFjIaRBSmxx2X
	hIgP1nPYf/sfKD3NjPtq01rSLx2yyXItkdR6B/j/SXW7KIqrGU3X+NmYulYrH1LI
	MqoD17Vn171rHLwVOlBsAs9r3AVXbRrEFaMCUhBnmVgCPz27Ec3fpYnnblr1FffZ
	m0VYj3EarIa8ELAW9C/LUtm9aktEdaz0mZv3nDrAirxjLkilpIMrPViOhOikQovW
	vLy55t+nKPDOXG9b5J0Q3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793776714; x=
	1793863114; bh=38+0M1hHMr995Gt0aoapcSXnYcouam3Qlvab25dJNSA=; b=3
	k2rHvRbF+/fD+fnwsQ3m71vPnDBNwfcUhYPvslOUDUH1viB27zry1anohx8RUiS6
	W07IC0BP+goVmdymzBOfWZ3R84+znppBlFW32RsD5lxQQzAhwIU8I6l0KB5SRS5K
	cr/hXOj2kUZ9NH80c1EL6+BO9sgT00TFAmeo++xfRNsallDOODNZA/uJQXGKM+LN
	US8eMQmdr49H45hNsZkitQCYiJFahHP5nIPzL0qFZ20g2KH90vL+8Nc3X29mpTjV
	mmf94nXuLKVoNJAUEOVpyWfW5/2IqPzmYdreqZqkuTKByn2LaMDVJk3E8+hGnqxT
	nskSo4cks7caAiGytdlfg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793776714; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:IiFtMk1nSYTGXZlBa+TapHoIH5ezSNaUhAypgD7ZNWq8IQa
	npzx82rbBSHLldr8YkAZfxpVxenhx3ymoG7YA15nCI28nkJ7fpShzzV23uL5j/iX
	bSecSnDRF51ZSwk0NF3679EkVb8gIHpFAydqVC6ahCMApZY732aPXabqCpI3hYeA
	JrexwM8xd+BO0lY5hTbMF8E7PT6VjN8gwqbIkkyntFK54FzJy0MPbATR4pfHYap3
	Fsjgb43zKYqPp/iQI8KdNyng0SlFzE5Ol7mkgU2CHbVBaARF/13qnsPs3henr7qX
	UkwBDuisNcZQum28OnU6zqDROpxD7qWfIx5M6hg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vuWZ7Eh8JZ5yfWHXaPws4U99VXZGLRB49uTcygt83mQ=:QWPOBnQY3n2dTrBIMuf/rEqMV/jwuFTbbkIKcsZE/bw=;
X-ME-Sender: <xms:Stzqan_5EsdkXMmqzYXTivv_FS_cDSWKoMYjyo4yFYuZB5klMHCfVw>
    <xme:StzqaiOT1tFI0vNE1ae2xJsZf9YoVHcsf4WD7ExmoQJ9imMS3Pw90SWw0VQVcubmm
    vmadb9o6K9YQuI3VqL8B8LznrtfaOLCP2TgJlBFiRUyfw0iySw4VHc>
X-ME-Received: <xmr:Stzqar0zzpSLmDZ3txUp_Jt8GORD-pOlIGBuQhfBvGcg5U1kE8e3b3ENGoak1pRuuZooFJDZas5Chv1hFlhlmhjy>
X-ME-Proxy-Cause: dmFkZTGcO86lJ7UQYlZM8KNdBHjtzrJ/vw3waeGDbtc17T/IbW9n9jCa7w4rVhbadRYti1
    71gqZKf8auUcKWmg+Y9Jw2PWhspV5HlW5QFWD7Tz0eywXRwBQoFq0+F+qLf10zaRq+UcnR
    YCqqQyAsJOPOCQ2RJntkho+Erqvv5bRJZZKGZeKpoz9KZsPVQyPfCEpifTnClxHgVZIK29
    vEZ9fbRXVYEg/1aW5gHZolvvIyF0bbCH9dBghRPXzDBeIgHHjGMW65VAS8y51I7iaszBxF
    mo71z2Gmv/HuINjnFXrwWnLeDQ99igGHRR6+2SkSpfqXCXLQiKTWsc4i3EQAnGIK1icWLc
    wH2/WP29hhq86yX1yfLOWNPG7JPLjXa+O1mj/oBwIuceKHywzb77QNkRLLMuCUBP1KQjOe
    zL1OKxa/19qD425ONc023AM8022fZb8Mx+cPG7FNhnz7MP0BMQOqBSpM1HUmOhWVRfpU1j
    p1+PeUZj3Jl/WdL/vZNULFzNIW2k4zw+Pi9CrrDVGZco9yj2A9sYOj87Cyau8bl5ciXKE7
    DqUt4UKmWpDNJ6CO73NhFQgVvZ9YHmhdGP607wvLcHGpvJil38cxT8Y1aw0QCJ43p5nljH
    223KQk7pPf8F3mSYc3UY5PHQdC2rHRzKqd1emJhf+X4QNUlv1oH+W1sju8mQ
X-ME-Proxy: <xmx:Stzqajch6gdxu0NnFEhpGD-Ldr1XLEybizMHB6WgpA4kJHFdp8M0mw>
    <xmx:StzqakbMOtnIHUfSb_ep4eaJopyl5sVeCvOB9ije68Rzv6PibcdjlQ>
    <xmx:StzqagVcUJKY0qETDFt8mL61t1G0nbCXd_r2ZDe7cUmSkdimbeeoaA>
    <xmx:StzqavSxLIhCCbN0WrsOYwWZJ8DUtHwLW78p1yD4QaniLSEYf3qaRA>
    <xmx:Stzqal_IU-DMj7L0enCmgsguvMKa2dVDUkAKfUp9yOCug31v38_vhg8b>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 02:18:30 -0500 (EST)
Date: Wed, 04 Nov 2026 16:18:27 +0900 (JST)
Message-Id: <20261104.161827.1314980875007049737.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, lossin@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DMM6QD2BUR9V.37KO0N2MXG64L@garyguo.net>
References: <20261009224626.1331914-1-tomo@flapping.org>
	<CANiq72nxjrWpBjwzgdWncKECKwzj6zfjS3XC=da62xr8wiSxEQ@mail.gmail.com>
	<20261104.075702.612319673416199209.tomo@flapping.org>
	<DMM6QD2BUR9V.37KO0N2MXG64L@garyguo.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 04 Nov 2026 13:42:27 +0800
"Gary Guo" <gary@garyguo.net> wrote:

>>> By the way, since this is here (in `kernel`), do we need then the
>>> original one in `compiler_builtins`?
>>
>> No. With this patch, compiler_builtins.rs is empty, so I will drop it.
> 
> compiler_builtins as a crate must exist, so you cannot just drop it.

Sorry, by "it" I meant the `-w -W '__*'` line for compiler_builtins.o,
not the crate. The crate stays as an empty crate.

>>> And now, here, in `kernel`, we don't seem to need it either for the
>>> original reason, except for the `objtool`, but also for yet another
>>> reason: if they weren't weak, they would be exported
>>> (`EXPORT_SYMBOL_RUST_GPL`). Which again points to the fact that we
>>> should probably clarify all this with a good comment or that we should
>>> do this sort of thing in another way, e.g. in a separate, small crate.
>>
>> Right. The new crate is not in exports.c, so the stubs are not
>> exported. Then the weakening is needed only for objtool. I tried the
>> new crate. Without the weakening, I got an objtool warning with
>> CONFIG_X86_KERNEL_IBT=y:
>>
>>   vmlinux.o: warning: objtool: _RNvNtNtCshy5ABSPeoCG_4core3fmt3num8exp_u128+0x381: __rust__udivti3() missing __noreturn in .c/.h or NORETURN() in noreturns.h
> 
> I think that can be fixed by adding out-of-band annotation for these functions
> in objtool? That sounds more preferrable then weakening the symbol.

Josh's objtool series adds an annotation for these stubs. v5 keeps the
weakening.
