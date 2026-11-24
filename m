Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528273;
	b=noyxwLOb7NBs3ZyVw/qnk7t7+xuHpBr+9CODEao5x13mTgwfhOwpztbJ+ljfWlOWtjce
	 ruy3rOHr8ZgIdm0fW/JIgj36nEN0lfqmWCvWwIe8H80PYYsKrtgil4/3y4HyT93NHHkkJ
	 4vJ32eFBpMtDX7NMaNU8HTTpaNbuWHpZgy4RJWFmPp2xUVvUzJvRgOim6747m6ddiCY+f
	 ifntaKqRlo4W/uWmSilnIrAAnDQwWQ2ZxE80ftjqDWpTUP8sWExnSixlvi7W8ICt1UebX
	 ut+9brma2zlX2+97BbdDgCsWyGmcQh5zIn0cE65OzCKHxWJIp6+pyhB889t2dUKZbzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528273;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=f2leS56IQnLIsej7oHG8g76IpquyYA4RYdbGUPkRAZU=;
	b=LH+VTc02tZXq8aVEKaeSnAVeMEuLLe4m+4Fr+0XL4udGzgGcsfj/zG31fsqLgWzBsHzG
	 iUKKvhrtbuzdvuyKIFVHtQWMwUYmJVx8a0IISRJD4r8EPrcP2WBVi1sL1GxdZ+puRJazl
	 SXolrL4GCBnDYAIudyaALrTdDVr9p/ga+7rOXeXvkRN9JlQ8L1zoqYnCQlkBF62DwHaQK
	 3m4u/iuAdCmOkmpZy/yNskzqEdmVzU1DCevIkp8LV/JJ8d0n4Jo2va9dZLlYvoF661eeC
	 sIhpKfI3H3BlRndGVI+XDWkAWq5pb7MsYZWDH9T81ea28VEGsf5sh3l9Ir85AN8WnWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=nf0t66nR;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Jz7+1GsP;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA7606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 13:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BA7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=nf0t66nR;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Jz7+1GsP
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D427E14002F6
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 08:51:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 24 Nov 2026 08:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795528271;
	 x=1795614671; bh=f2leS56IQnLIsej7oHG8g76IpquyYA4RYdbGUPkRAZU=; b=
	nf0t66nRkx45Py3pEDTxf0Wkn9DTsmkoc6D69PO1HxEr8V39+k8heveqlX2POWRA
	qMRFCKLuuTTo7QtHW0zqsNyVX/Xudn48DEFTrZWzCeN6Owy6tk/gPr+s2txHYRWD
	wN1UebBYnV4fU6kR4KS2bxwwt9p8Xjrjg0PqCY0iFFPiPkgVUg/C6/V7jHfVaw40
	H/tdG6m33ZYuJuiTkjd5nZSxQ4yEQki+NdjKpLMR0FANIuMtF0XXp6dqqXgC20G4
	DjPPS9K1gFJrZ+LhOZFxxtX3LyF8QdM8HPAwChxCtwY2jUgcOxf+ZNksIjtDIqt1
	RlXT1eFikCzxUGsCD9GGmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795528271; x=
	1795614671; bh=f2leS56IQnLIsej7oHG8g76IpquyYA4RYdbGUPkRAZU=; b=J
	z7+1GsPzOwwbUcV3Mq59+PLaklhQvlyPkbv9zOTJmA1KVEFbTezA+nEbfCQT3Gt7
	OhHgNeuMq1a0IuUhFWHaBXjC1mDGmRh4eMApahBRt2/vy54ZkMN2I0aO8LOTzFqd
	EjqNW7AMhI38VzeyMHLQa4UZTxRpDAeEaHqeOEkw8TXmuLhWqrZv3l3tkOGriRyF
	ohr1Bqk2K50RnxrpItP0iEIf3B4Ds+QSI/rxE84lyny2RBMWIWh6l84mnlEGcK/l
	zZtfmxk82iBaSf4RcsyaVhsHH5dGvGpnwlUe7TZ86tUkTrDWZhyM9FPSTmrs0FZO
	opep8IiwiKTtnSj/mPs3w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795528271; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:lfXqctFHlboxjTeO4NNCd6jo34VhFIfZ9+pyladK3dZRpIe
	usrqGVXjK2HKkVworCrrNsU5JAmD28aeBJqXoRyKBsM03ArTQtlH/q0nver48h0W
	yWwFoqH0Q3UGlpl4nvnNuO+TgiB28Y4Gk1DeE4NSJoPumVc2LughXTZ7ZIhCaxHN
	z3uEP0iFZAm4gd2K3l8DH+vUiGA0eLgwdnt53W3/v7J9QmVLz/yxLwPfw2addZif
	liHRiNINViJ3cB6BlB9qINawD7YI/FaV99tVp43aGEO4RZ2U+9ZDhEANvr81Tsmg
	LXrNohbDpbpIfndGUEYFnwaIqs5Ut7yzTwbM1Lw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:D9JpEVSw3+CaR+/zAG/ZtKGfb6Hnu8TQl6NWW5YBUvw=:TpaMJqXcfF48sXXko0Y3mvjNFyU+4RRgqI8f/QjKVmY=;
X-ME-Sender: <xms:TpYFa95o8FEErg5eeixvlLNQhy8VYGa7yeeWVFDeF7Hdj7ltPkvLaA>
    <xme:TpYFa3Pkvb_JYoLbHMdzuTb6L-LOCHABhxyACmWzIo4yf0N1A4RcNb8N6lrYFFUol
    ut2yAdPAuEbZJBlFItYyP2vTnhhTo57Ttv-Uan-h-t8p6MHF3X8DHBm>
X-ME-Received: <xmr:TpYFa2E5E03mncl9WGaiVx2jUtbttJTUM1CyUc_vqFX6QmUjyB_C3qgGsgSRerag2qEyPoKie1Cjp8DNOmu-4tiW>
X-ME-Proxy-Cause: dmFkZTE0UfNEf42WvoOd8/pMDjanKDvg5ggA/8QYZRpTGyDZE2iDpDcj9KwaiWeySkT2v/
    +aab0vcJ5y0oFBP/IXHAgtWEeZHg7rPCCA5goQnjqn4feSL/EiBX+RnggQ+fl/B6gjXjaJ
    5nEsXSgiSBnnwRmmzZzQl4oidB2qprS8eFrj8Srt58NVWKLh06NrorS8NT+cXjVbczW2l/
    NA7Ym43EioB90BMmvsX/HgeYgbw001WC4rQ7tRnihNHnQl6HY3aNyG6G/B9Dkubtdy5nre
    i0uou/iVtJmT70jTxboR/OgLMHGCgnk+1WBlA5eZvYPMCxknt4qx6xMeA8AoOLmyElsEH1
    uUYKJJ3aY1Zgs+cnBqGMGh7shIBCdhNkkoYNCd74+dMKhKVODkIeqp0ShYkmO/zaj8xH1l
    Tj6CFw0taOCrt/sWGL8T5BNcFN96DOL7vQ/EhGR8A18vZO4uu7o+6acvD6DcHp1NprQSLg
    zZf1RCxnINvxX2aAxptI5kNvdgyJm+c74OdBexAWY4EdQAK/fCKnA8dW1YQhxTZym6UFw2
    Dft2VqTF7AgdGRWQ1hWGKDrjuXVjg9nFkww1x3tfoT7Rvsb6NExqNgWgGY2qW4Kwxo76NT
    DJFMLZTU1BAfOTLbK8BLMzkdGexY4wLvdh+BjaMOV3LgYlCS53i5Gd6TYH0g
X-ME-Proxy: <xmx:TpYFazRTbWOVpr4HJPoEDtEjiLJXoT9Qr7lWP_kcCc8zC1eJ4AZI7w>
    <xmx:TpYFa2TBHh0H4DSamR_JLhXP5Ja3D5bD42zQhjeOjE5vfPiB8S5i9w>
    <xmx:TpYFa2cIrioyKWRStKVarpAUCWt0Tj4JVyfHAHqZb7lmPCiiLOwlww>
    <xmx:TpYFa6fQWaVwHO7_BE6lIqfj3Ac7mLyCkrrun4yBSrMrB08LVdr1Vw>
    <xmx:T5YFa3Hj5GuoO_IfSI0PrZKYoRkEIVEEccQBLsAv_rKZFYqhF2WY6LDs>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 08:51:06 -0500 (EST)
Date: Tue, 24 Nov 2026 22:51:03 +0900 (JST)
Message-Id: <20261124.225103.2152350984946270550.tomo@flapping.org>
To: mbkchelofficialdev@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, liam@infradead.org,
 rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] rust: bug: add warn_once! macro
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>
References: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>
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

On Tue, 24 Nov 2026 15:27:07 +0200
Ivan Tverdokhleb <mbkchelofficialdev@gmail.com> wrote:

> Add a Rust counterpart of the C WARN_ONCE() macro. It behaves like
> warn_on!(), but additionally sets BUGFLAG_ONCE, so the warning is
> reported only the first time a given call site triggers.

C WARN_ONCE() takes a format string. This macro is the Rust version
of WARN_ON_ONCE().

> The macro returns the evaluated condition, like warn_on!(), so it can be
> used directly in an `if`.
> 
> Use it in Vma::zap_vma_range() to report an invalid range, which
> resolves the pending TODO there.
> 
> On configurations where warn_flags!() ignores the flags (UML, ARM and
> LoongArch), the macro behaves like warn_on!() and warns every time.

C WARN_ON_ONCE() warns only once on these architectures too. I have a
local warn_on_once!() patch that does the same on all architectures.
I can post it if needed.

Also, this patch does not build on UML, and test_warn_once fails on
x86_64.

> --- a/rust/kernel/mm/virt.rs
> +++ b/rust/kernel/mm/virt.rs
> @@ -115,8 +115,7 @@ pub fn end(&self) -> usize {
>      #[inline]
>      pub fn zap_vma_range(&self, address: usize, size: usize) {
>          let (end, did_overflow) = address.overflowing_add(size);
> -        if did_overflow || address < self.start() || self.end() < end {
> -            // TODO: call WARN_ONCE once Rust version of it is added
> +        if crate::warn_once!(did_overflow || address < self.start() || self.end() < end) {

Miguel said that "Erroneous Behavior" cases like this should use
debug_assert!() plus pr_warn_once!() [1]. Also, the C side uses
VM_WARN_ON_ONCE() in __zap_vma_range(), which warns only with
CONFIG_DEBUG_VM.

[1] https://lore.kernel.org/rust-for-linux/CANiq72=tKVD13GD2Bzmt_LnC4SiOX1nkHQPcz2BS=P=b23e0Yw@mail.gmail.com/
