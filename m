Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974377;
	b=i2IORhO8BJunlATUDrjOYTGalNIozPDQOOjeO7/7FTgBIl2XiUClYRuMk1cX8efyYKxW
	 dQVxFdAbod4Pz+QyRet/GcpYop5El4nZZANHFlHFHytCitu1c8i0sF9sEbMAbMOF7Dp1L
	 yzTuPNigrvcNRx6xbe0wBaDzVbozJfO4/KT5OSHRotUtIkfDg8qsVdTU7GWaaV6/6BEsR
	 SYH28pdUvT1LgRDLysmLojpmu9h3XyTk9iLstPeAm+7tysyJmmLJdXhN6xz0JK2cFEzHP
	 N8GWIhOQjY6JMmU2NlHip1j6L0zHSybZ0GE5kKOPMChykpDbTDqBPfoYthaAUCSVdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974377;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FEP50rDlw1zIs+7qxxIO59ZtePOkthBY66LDXVHjxrc=;
	b=E8xTnxsuS1nR1FTYjE0EC0uO5qs49xeEKETbx/3MzfJWukMcSk5kbZ8w3UaVVUlbjs8r
	 YJX1sAulBPLB3dVZt14TXp7gYw6DI9NhryRfR1pvt4nDAlCI4x1DV0zluu38UtiMm+j0A
	 6Rj6ubQ/+FL+pQ3ZHGs8/dUvDxcRsyw0zWz4DJqIHeZWyz0A+o+djUbPw7YKOV4Wqf/ds
	 M0LWcZ+5Rl2uVMSjbTinMvwKLdkAQEg8os6u2uLHcoeSuKDlqpUHuK7DdblfPA5ZiopVK
	 bfFKMR3jOTF9ns5iKXJ8nlq1sSEH8O+X+KFyKx2uE/BD8mg9qHYZjBeQMQNvRX2wcHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=jS0xgwEy;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nDa2jgBE;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97419606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97419606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=jS0xgwEy;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nDa2jgBE
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C060114001B9
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 22:59:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 17 Nov 2026 22:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1794974375; x=1795060775; bh=FEP50rDlw1zIs+7qxxIO5
	9ZtePOkthBY66LDXVHjxrc=; b=jS0xgwEy5zAyQhlfxAp7VGZrJc+BkQTbc5SmX
	LIEsF9sEso5NJHt5OpThI7UAozmJINjuLnwokH+84JNw6cz8EpYShG+xYroUkt3E
	MHBcssu9sOWNjlFkrFT4mhbN24RmI0lWeZkEWsh1AKtsYVtitWowDOBnOtM6Kesp
	/DqSoLDLtrHl18Y8sEfqKzgFE28jLPa2GKv6/m/USMqVBgTDNqpB+sD9SlKR2Jto
	SYliFAztBF7cMORlwJznPFgjSwFMpM1bukq9N+HR5d6HvgFwt1/D93HUjxBBq28y
	wIlGSE7EXgtskYHUYK2NL0EOlr8wvuzE4kt/BRJgyGrknx6WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794974375; x=1795060775; bh=FEP50rDlw1zIs+7qxxIO59ZtePOkthBY66L
	DXVHjxrc=; b=nDa2jgBExtV9ii5rXZTdMV5LSKzNk8eSiGnowvGWvelzBDjLMoe
	PQV6P4YKCVZUsxIiU52rQcH9VpB8PnavM1pdNro7LBG8zy+tvQfgBHx5dLpVuH3Z
	0QgB+pekme+8P7xx3H5vGJfZjOKwrme4HreeX0WRkt1frJqA9JyuiR/BrtXTFDsg
	IQn15sBPN5GpRoCWNpljvSmxwvuVa+IrRprGvq5wDaHDMqaGlSFaknR6wZxf/fBq
	1srDmIFwZqFzmwjhk2KTk68+501lUm+Gsg4wj4YwlxLNtVQa6boJcBs1bV7au6bQ
	+WeY44voRtJ4OQToA3tTw8mImBkMuZywiTw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794974375; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:BM4Zo33c/iaLbW5+tUB632qtbA9ZZeuqBMRtCMD8Z2EEoVG
	UgDOG+J3xTWRDeCGkN7THocznhT69M7HEmcqtdfcU2Nqjl1ynWmMpdo8jmhExiqZ
	/Wy3WDSNPC+3wcaXvYg1361rDSr53AAcavZ4IGROFrB1Fft2jN9Zw3l/lcp7eYSY
	8xhSAzEvpnkpxXmzWKxCTosf/4g3X1GF+vHQsmTu2S0MVRFmU4e8xGzACMaYVQyw
	S4hS9B8/OX3sKh+M8cS+dj9Cc5m98l8V2SmJpffoMlEHlu6KG1ImQmqcfJcRU0Y/
	DoFidcimIrPj2xiCjuIMC0fqKxoubZhoiNUdVVA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ChYoELqcDEdvEb0Ydy+w+80oBKr0LYIcZD7be1c/ALM=:8Y6CiBSGqecVEHHwU6US83xY9SMIPGx7SG/KmNTlkr0=;
X-ME-Sender: <xms:pyL9avHfmj9q6gTKsZOJ-bAMY-fWLcdOI3YITDwiN0NgJdfOz4yDoQ>
    <xme:pyL9aoMuU4ZClrdGL2_f3CNjGATFra174xsHRtMm_6GJPJPIjMqaw2oS763K-9vje
    BB0I4xVjQZLNtPB4jcRnMcO8h_nCj9B6y2PaZjYISuSk2RrYZaZeeIe4Q>
X-ME-Received: <xmr:pyL9aspmDHFOS9YUG-dgvqYslczEsHdTm3V2sTmg2YMH_YBUX5CBP5Zh_e5yn2jloAPUAfhNnWRP6UaCqe0>
X-ME-Proxy-Cause: dmFkZTFOZ2+7D9Aqzv+fMjR1XB5LxSsJf57c6J3Ij3yw4qA9IIv/4n7J8zOIrDap7zcmE2
    Xr5uLbb9tiC3E/WG7WACy+jtCHxEi4I1YvizTFZYqGQQrTAzBuifH1x3w0Ux3nWbGrxnbs
    3gghvOBNz2kDl7ipPS+iPl0xWxMlSPokFvYF2zvYBKPfjcKOW5Ta9NUFeY3EbjT94bR2+N
    8xVF7868VUfgRkLNMniZLcMTqifxtFGalfbhDwX4t0MOpFsqY1Sn8Kg3I/M4jMXG0c8hCQ
    +W8sBJLPCgECDEVlkaIOJ/DWwEN02qb5UA98zxd9sneZSJPxkeIAVXLIRBdnRL3GsoPJZv
    +s+/XpRqX+ygjMepJoMQMGxQV/sCrpMwpkhffXzL/1sXdb5QoKWLi6ZFAduPSTxg91OuT8
    luY+WOoSWUlvgwob57u7hAiXcSKoK2nAA6aw9qhONcx0dPULCVZ9VaMbcGvpnjCy9OYOHg
    s8a2RNNRzT2ziHjxZ7cXKPQr8tNfIqbSbuRZ7ErE8gMHqLU22OrhpSQ9aIiVeP6XORepuo
    9TaH0jDY0lmd04QM3p9Vo491DsVhTqk4IGp6ZijfQAUm37iGvYwSvn8J5+mPIZwcUJRefS
    QpkztbRhJagAaGVZZxFCQYn4utBlGILeZhhELQeZnkGB5AhDENNka5n+v93Q
X-ME-Proxy: <xmx:pyL9ahAqTIgNumYKDUrwfBPAeHIDikz7vIxPd05axDQXExAwCKgqmA>
    <xmx:pyL9atMBZJiUeeyU217BAOtSAORjMSOKQtCrAnIt3HjMN1e9qQZuqg>
    <xmx:pyL9anDvFyW6C6LjmNefKaPWx8nOjyLWzHWdUuTBTU7FYwRUJEHc7Q>
    <xmx:pyL9aj-0WTF5iQjOfbia6rSnzsuL4BUQxH-SBepVkeUt8IwwE38QYA>
    <xmx:pyL9avh_8liLsoKqhTxRlzEOLM1cycNvdPR9CZA2znO1itnLtWLaflLF>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 22:59:30 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 0/2] rust: time: add examples and tests for Delta
Date: Wed, 18 Nov 2026 12:57:21 +0900
Message-ID: <20261118035723.2380960-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This adds the examples and tests for Delta that I promised in the
as_micros_ceil() fix thread [1].

As agreed in that thread [2], the examples show positive and negative
values and how the methods saturate or round, without the boundary
values. The boundary values are tested with KUnit instead, using
constants in the test module.

[1] https://lore.kernel.org/rust-for-linux/20260723.212025.1180359605820107933.tomo@flapping.org/
[2] https://lore.kernel.org/rust-for-linux/874ihxgxy0.fsf@kernel.org/

FUJITA Tomonori (2):
  rust: time: add examples to Delta methods
  rust: time: add KUnit tests for Delta boundaries

 rust/kernel/time.rs | 147 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)


base-commit: 6b391eec2ddeb3ab2681cc5dee16d29e00202438
-- 
2.43.0

