Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406828;
	b=0D3AK8HVDbSL+cudXTXp6LcDgjaqgwIpBnV6759n/LnlZnKvaSddnAU6QHus7m+w1GNp
	 4ORYLw7s4VsVLI3Y+yjK8ZTvXW0tr8Yxlk4cTlduDgB/qT00k6AWURxUhCPQPUgyjYU8a
	 6REgGRmVJAW02lFoLQmLS+XBAU9xXkqdUDN6g4ekMXRau29YHwTl0nD42W4rhCyQNPv1d
	 dSmmrshJVb7wCZ6NQQ9mSb8oMB23VWLe+5c7+rJQRqEqSksakbM74UEq8b4YOZhMXHhsB
	 lGEjmcuoB2eIavz1s8UR9Yfcvszsxoxoq9QxTsZaN1wJe7sHySPo7DYJ3SjZ2a93gQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406828;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nxnBlJHqNTHFuJF+H66BLi08lA2Ub+6itTYiFUItUvg=;
	b=so0bJJAEv2O6Z37QJ+rVjNrf2/Faid7mU+uBGwvWoo0Rf4/DLYhsnwto+C1oxD94+/JK
	 SHbQbCPiANQX5MrX64KY9n4oLWgpvkww4yFuzdsBciwqx7GF06a1aRBNbjDmD2+/TwsFe
	 wNCNNqrwC+SyoiXmqkVWNEVOA7Vt9KZMBNNMkE6Qq9Cr37EGPedDBI3wLkyxKgMrt6tEH
	 aSvTli4p/U8Ab2QxKsWr2fb+DVzCjFvtMN+PPVNdWAGqkJiPhbNGqDVJgU7HrUyKQdlYF
	 w09G121ZFxGUt88P5HRVs6cyezLb9+dDIpTtCxWLtbwfZGIOFc1ru7t4pYqXEUDj0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=pCu9NdWm;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yhM+vocI;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40012606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 00:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40012606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=pCu9NdWm;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yhM+vocI
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D7721D000E0
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:33:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 30 Oct 2026 20:33:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793406824; x=1793493224; bh=nxnBlJHqNTHFuJF+H66BL
	i08lA2Ub+6itTYiFUItUvg=; b=pCu9NdWmH4u/wjUTcDdkpUtwn4PFQHsT5HWg1
	ViuETdGlxlsQ7ldwmIZ2AkkotzL5vkWlHupDtCSByBlVx2VVr5pCU4X7JWog5tb2
	pyGhko0j1c/qyyJs2E3FgUWHjwBEyI5m5FWLYVpd9hoblYACyoX0nzBzMkU9mzko
	XfIlqXVSqFcg79ywKKOn+T+Zluuas3Y/CHy1Ynx6u8K0OOCZp6P67UaDwBVFriC/
	J2mwWYOsJDtHx4SvVBOhwk7oelhr1QZdH18rA+2vdWB/LclMxdLS0j3EG6VosePl
	3YObi8c+w5cCK7ISEE1jb24TZLPk1gS0ARqKWZhJ0tYvjw2pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793406824; x=1793493224; bh=nxnBlJHqNTHFuJF+H66BLi08lA2Ub+6itTY
	iFUItUvg=; b=yhM+vocIKba/tj1Al/65eIkRihO4AtF+fWNIUUcswLmalueGet8
	20W5ZwiucVVVP8buFqQAkxWSdk8gewiO34bzhkLhqFvocywk/uzTemTQuFWOt6qs
	2xaCskTm/s1xrcTL+XoyeINhdBv3mG8HN8dh4ZP8Jrw3fz65/s1eGQZBwTugOyos
	Ki1HPMzzpi/NGkaxB2fEbI59VuSShURpVNJpzaR46uabUFYVRlCt8u4n1NLDCiDp
	D9dKJ7svBeetz358U7GEE8R0Pip5syiNsE96yIoEH3VJC5P/PKRtF2ZeGr7aZF0j
	BlHoL1ZOuH6UuPVhBHPT2i6WjF+K4k9tEsA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793406824; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:T41LyDiv5KkYEUqgPebhqtmGyh8x4F3h7wvx29bNnEk2qaA
	IC3e/4pdRNby0ChUSqxDm8wdWhvO6ZAebx3crokWthE+8egxrCk+dTIU1Ikw7zJT
	mpq47/ujtiT2mzfr8tRVJAw2LUIpHoRz0HoI3E8CaxDFN9Bet0xlND+ZTQDWkWcW
	B2dACMRGhfrmNQdxl8deOfmjj40p9x2DBbWWWboNtm4sS0bYywFI6Z2O40edUi9V
	D/x6RUATGhczJdhyXa51UKcoQn557UI0vOedS/bHexWJ3eNrjQg042f6kh7K1IGl
	NHMECzgZVIRnIRPTX1d+d6xvU2e/CLWvuo7Nm7g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:jfAFuIKDv67uaKsTsV4FheZHVJAvgQ2tX702GEfEnhA=:BA8MOxbkF4tSwLFogecKsKSBtFQHEDAWgm+sJ5Y1Gtg=;
X-ME-Sender: <xms:ZzflavSerw2GEM-jn2mSvnsBbxteL_G9NX_d_AqObfv2n2cyTDHS-w>
    <xme:ZzflaiGXV1t-YdkJN--QQumxO684Kh54CEYYbfIQmIIsxMzzKSkYT0CbmO0fNqUIt
    NNDEnr1diMN0YxfdIIEuYnKFsai59mUBoOwU19lyiYtB1KhnEEzZSKqDQ>
X-ME-Received: <xmr:ZzflapcDriHZexJ3aNxkAum6D7_xt-_0L9J_mQ6ieP4BJfHIDOhmHdaRtTa76zbdrt9Su_xUbIOiYcunOMw>
X-ME-Proxy-Cause: dmFkZTEw4wq5mLUAw6qsXQYo8vYI8/AhEULC5zsqKQ9t3Ff5Ji2iCtqiYaX6jG1NU8rfAR
    8BsUVQco1Rd0ie4zswy2fBOkam/LDkM/x2lM5ujO3AGctmr2AEWLtzbPibzcZeGrkVW70i
    /etANAwBX1UumYeOiHmIUcxsYyFSxXussINRwu04MzpqpVu1dA7qFxNxVT7gr1uXfNoQHb
    A4UDW7US8k9R5WOeP2PbMsKrRHxpkKRs/wnfnqs8qxVlQ7K3a+LuUMjSQlZhRd7Cyv5okv
    blQRz2TpYEfyLoK3y/sXKbwfNLgqke7QmeMofXXMu1bt+K395zLP8tCIBfXXhVSzXqeaoN
    DxijcH1i7Pj8MqIdANdQXx6EiF0fZ+D3HynktTKwhgr/88CWf2/cG249zVcNxhqUmwFSya
    BlhyYf3UjW+HwrGFIX4/B1T0mLhHGT5ydJfMvX6kHmHhBFMlD/EZ5NGSczRpWHUtGAlrdE
    oQMq6V7QHVwmw6mhIZQE7FMhxjCfd+opEd8WvmtmrDoR0hjkOO4O1XbXo9w+6k+vwYyJ3k
    h3x+qMYM/cGL27fwtD+fjbmbC7esa6OoRzvqTvQdCIBlUCP6Ejq4EpMyAVFJoIsz40SmPX
    idWS+OgUVyxdmqLb9qhntQL1JvZ+ZJbzGcN/+IEkPpelcks58tdO7Il0NjoQ
X-ME-Proxy: <xmx:ZzflahvZQJoaRAF6qcpdebGmoKTXOyjmBisM6mHFeotJ_ycCS0yuig>
    <xmx:aDflavdPtMWKJm0beaWhaiWF21__f-FLfahhuCARRK0plCxzDtVIGQ>
    <xmx:aDflalq9vjKvL5VBcwWpAgFo_j05OuoNg-z785Okl5EJ-TPtf-h-0Q>
    <xmx:aDflat--C2lYjQHgxrdfclKPEQncC9uqb8MIs8iRtCzg3hno4IwA7w>
    <xmx:aDflatsRWiLocQGngA-dMS2ip6jstsb8cvqJ5p-luEQucW8vkjVDQ4KH>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 20:33:39 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	boqun@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	mike@fireburn.co.uk,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 0/2] rust: time: seconds based Instant
Date: Sat, 31 Oct 2026 09:33:32 +0900
Message-ID: <20261031003334.4161188-1-tomo@flapping.org>
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

Mike's series added a free function `ktime_get_real_seconds()` [1].
Andreas and Boqun preferred a seconds based `Instant` instead. This
series does that.

1/2 adds a unit type parameter to `Instant`, with no functional change.
2/2 adds the `Sec` unit and `ClockId::ktime_get_seconds()`.
`Instant<C, Sec>` has only `now()` and `as_secs()`; there is no
`Delta<Sec>`.

The `now()` doc comment in 1/2 changes the same line as [2]. Whichever
is applied first, the other conflicts on that one line only.

Based on rust-next.

[1] https://lore.kernel.org/rust-for-linux/20260826162851.2497-10-mike@fireburn.co.uk/
[2] https://lore.kernel.org/rust-for-linux/20261030044803.3863267-1-tomo@flapping.org/

FUJITA Tomonori (2):
  rust: time: make Instant generic over the time unit
  rust: time: add Instant in seconds

 rust/helpers/time.c |  10 ++++
 rust/kernel/time.rs | 123 +++++++++++++++++++++++++++++++++++++-------
 2 files changed, 115 insertions(+), 18 deletions(-)


base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.43.0

