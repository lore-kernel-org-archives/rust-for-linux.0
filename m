Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334059;
	b=UtZlrIkcphS+tW7PPL6DZOZTQVhvM1i1Ul0M8/7lfBqOjUKeDB5izq/0Q/b9/M9j8dxE
	 BcsrPWUjp/K8l4FldaiIQ8nzRwFWVWW6wdmHQdhoNNUGUy3DtAKBLSzrN4/KDGHRYl5yq
	 P6AHjMeIWtRMxchOCvTMaY9EE4tdbHqpfvZZxHXcftvOl9o/2kpFyEGNWFaVMk/Pem+4s
	 OCuWpA+qcBrI26PW2agfgbTbwmJi1PVH/Uq+ktQx4aFkYNX7KoM+/f4Ix7ntptcnREbSK
	 51KW1E4E6euaFEIlMqKLxPltLspvc9Ilarb1Ss3Za/+I+9w14xIFCFYfLqCKKLPa0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334059;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=SgfaLAEJipaZojdXYf5hMJ3An/ojkrfF1c8wLLQ2dwE=;
	b=KG7AF2shzGiLMC4ycDl/7xTOzzcnNqVwFQ2sjoBupE/PYVT4pUnTA5fHJN0cM/+qn6qW
	 a9dzjp5bW28nzPeVg/ClrRWE3XfBYG0RDRmdPhFDRI5nm2N8mRSw7L+yvDYH8hsZAFX0/
	 aXAzCKw6Hj6VVWb44w3Nssq/p0sDqxYGxcqAYTQTjY8/fVtQgTtCc8TG0djAJomVgwu2C
	 NJwHA8Ys9yFVRXbGXLUfYqsigPBd/gpGbUMm6dDFvM5/nW0klohy47uMK5zZBWJEGHVli
	 5T8l0NS0551w69RwXE+w+Ferdp0dESxkAQVTMzKxXoCNLsFV4KNyqas+WEW5e3qWHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=Mygc7kLV;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YdHh+88e;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94247606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 04:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94247606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=Mygc7kLV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=YdHh+88e
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 94BCBEC020C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 00:20:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 30 Oct 2026 00:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793334057;
	 x=1793420457; bh=SgfaLAEJipaZojdXYf5hMJ3An/ojkrfF1c8wLLQ2dwE=; b=
	Mygc7kLVDlE1q37NZ3RKvKx/InrF+7Rao0tHS0D8M8520Fj3vR79ksFhizQEjIeb
	pwkcdHYYeW8TR86rupt74nOimQOfYivuQnkc8cVF6dRSFsvta8mT5wjRA1T9QQTj
	2VC175VIKztyjhN/2n3hSw3uA5pBgwhYoxQ+qoCKWtOlb69JSyswUzgtA/KheHf4
	9kroH158nKXkJ42C9kRYnbRk9sZjkLVFWMR1AR+XhhddfUMA9LV0yOC4Rqmd1aQ9
	A1hTHjCfFOu7aLDYxkdu6ckMSE9bjsEjpgrmv2vsTBKXz+n6m1u8hpd/bbesGbv2
	nhY8UoMCy+Fwn3PVj9PDAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793334057; x=
	1793420457; bh=SgfaLAEJipaZojdXYf5hMJ3An/ojkrfF1c8wLLQ2dwE=; b=Y
	dHh+88eZoV7jq/W4XfzF+N2H6MfotgYDnUEmzK9aq37yiLuRVvEu1jAQmW6RIILE
	xp90YL/qIDUqMKt3uAKA4SsEtqgYhk2nqg1HvWLjdSQPh3vIXdolEvUuOexUEqbB
	c4bpWwy/gQaEh81H43y9zDhTq6CcHGF2ONHLNnU8Hzw7pUKHutYdZ+TJ6+haz7rt
	mClPYA7vrXo6KirQIsAaBjWiYWpB7hhqqthXtgepGGpEA+A2fsraMyUiUI9h9tKw
	q/R012heU1UvrunWqcTyaG/QGCv9NpmAXsQdhLJpNsKh1eSjPKVghjd9fLVNr3Q8
	K+a7kSpj5Dp1P7AoH2PfA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793334057; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:LlK9VGYafZbS3d30yEpP08+Jvgg8LrB27wOcZW2QLELQ1yp
	qf8vngUyMNtiTaglCbQpwcnu+Z6thwX3kTIpBGJc3PN3yLv7hzbz8TkLrGIANGGh
	0C1y4Jt/KtZv+qzMVQNfjQShEt3THh1JvNonqmAPL0VrbWAihZ0Nedc5m0TlYbXt
	VsAFTlU6UOdfrPS+4/Y4MWrM5tpVgA6ReeqmYTh8di2kt1sn9xIgT1o7xZY0SAvy
	9CR+dkqCtrynU0jzjQqUSEtir0U/hBJbQSkHRVjGYyThJL4c2S5So8m5VykiZJJh
	sNP0hTQbhLVVBxYXkvuFyQ9eVo6UyU06VgsJaig==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ANkmN+Z+cfE14vpTmTzf/k2mVycys36gLZ85jvUWI8s=:MPBOjThr+Sz+Jse608olElcwYNgm0reIcl5grbW7qvA=;
X-ME-Sender: <xms:KBvkakchKb4x69ofweyK_h8LnWdBULdMtKf1aSYZb_VzHVmHVaWFIg>
    <xme:KBvkakd7VY2uA4UTmdo2mvn8wgS8U3od_eGaDqTZH_YpIWPXPQPx-GYsPkKOhMUyE
    8uc4hqbEsORPau8pRKj86inbPNqxLmopTULee59GiVvbctpVh82BXgp>
X-ME-Received: <xmr:KBvkau2K6SjTTk-OYihK0jVajtlAVfQjlH2cwMpgQ9P5ROhpKG2loK5wifBigE9VssvH7igZ-26fiDlLhjrK0a0F>
X-ME-Proxy-Cause: dmFkZTFJGuJanFV1p1Fyeg4Hf5UsIxrAK3FgOFoQ5e9XAeqYCHALtchFPDvx0aO1rCViDz
    5Ilg1eW2lGJ7K5vLF4e+NpwnTVwC8pOfAlJ2KaTWmirz6JeIuCmGFbteiuMBJpgEDrY+K6
    9eSVTymeK6W78GqCIbu/jQ3g/y6rdq3fPkJBoYkI8lGIWiSy8j4DqzcTFMN/kpC7ltdUQs
    qyooRtq5/kEYvQ/gttQK7IDrCPy60kODU4cUIavKrdvphuEEfEtlnBasLUsKWpA4ErpBSv
    KsLBAqcwB0pqkQNRAqsZe+/vtFIqCCPb42qAaiZyhMmo9Wi9KmfVGFmrmCmhdSII0PP/C/
    NI/P/nIs9qVXLPd02wqXGitgETpNLeyvS9+m7R1pcxd58aK9CqNB3G7geR0GZdodT+P/pv
    q7etuAahjL8gLeHOt9BZPbSp538RbHS2oGbnUoQ9Ep2iMhw4nEO7Y9ZWNyO5CpGGqYCGoe
    gnxe5URSEAC04UO+6NWKZyDURUgqHrARnRiBy8FnNcYeyKyHMfYeuWOLfop/VkLyAREvul
    nn3fq6Nf4ZyaDtEY7aLacdLoRkEU440FdDRnmNM76vU4ug4+iYa76SDw6IsFL3qMjjbnD8
    IvV1Vxe82utQVUUQcLFnsKZF5k25ynRHybo2kEhSCbHt5DRCas5+lrDnRxPg
X-ME-Proxy: <xmx:KBvkas_noc04ML2TiOsO_d01yZmzwlopxFOsU_5tpsrX6At0jj6s4Q>
    <xmx:KBvkaj7I0ghlO-BtWhQa09FYoYy8gWrlpA57GnLRFMGBjD822Vfr6w>
    <xmx:KBvkakthADzMEudz5-8UgGoO_6rNRejkr-C7-pSWpGmGMiHr4-w58A>
    <xmx:KBvkal0ICGduKGrj-ALbGrLjzsLxDVOlOuTFUBTOAVv8WoLE7yxhcg>
    <xmx:KRvkal6EHv112y4JiX95Pk7YCqZVZM7xRTahq2PpIkCdcanXuv3TMGxo>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 00:20:54 -0400 (EDT)
Date: Fri, 30 Oct 2026 13:20:52 +0900 (JST)
Message-Id: <20261030.132052.748733250677976413.tomo@flapping.org>
To: dakr@kernel.org
Cc: devnull+airlied.redhat.com@kernel.org, airlied@redhat.com,
 a.hindborg@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com,
 lyude@redhat.com, gary@garyguo.net, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev
Subject: Re: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
	<20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
	<DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
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

On Mon, 26 Oct 2026 20:04:05 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> There's also other HW that works similarly (e.g. a bunch of net devices), which
> share a common abstraction through struct cyclecounter / struct timecounter.
> 
> Having similar Rust infrastructure seems reasonable for use-cases as the nova
> one.

Agreed. Making Delta and Instant work with a timecounter is
reasonable. If there is a driver which needs timecounter abstractions,
I'll make the changes, such as splitting the ClockId trait so that
Instant can take a clock that has no clockid_t.

