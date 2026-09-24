Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC34749D1
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292375; cv=none; b=lMacQoMoVaLnsiVvsngbKs/jKRYp3Pa4F071Sqaa/1FWkttCgGTqFUHERIsMo4yaxBicSD61jEeg3w8YkGqcRxfmtk3lP0a9o9pF8Av0QZPeTaDVUn2diEWG0pZGr5y3+PZNwVUnrKA/Pt4z0vtl4Kt5bgZY5/4IrBhGlmUaX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292375; c=relaxed/simple;
	bh=9/u6UINBlmRkr8HsG8536mNFsfc9d/6Dmt6jzvPoMHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsGKnS3y/iJ9vUHOyYOfjrX3DyHQXYc82pUTRC+mr6hVQ8Tkz7nm6aiMsFHUk8zhYPbgOmxgrkwalmXRj+m4lAvDMDzL1eDsxQoVIBiVR7GSZJ+vld9apEqfmpaRZ99TELogM0y6uT+UYndNCOxsvZpz4q05vyaW3ML9o+8z14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=l40MSbsg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xZLL3ewv; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="l40MSbsg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xZLL3ewv"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id ACAA51D0011E;
	Thu, 24 Sep 2026 19:26:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 24 Sep 2026 19:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790292371; x=1790378771; bh=ReZ44VNi25PH/GnqYflJx
	IQxb7G7Gtv/oUZ18ok8hyo=; b=l40MSbsgC0ehQcHq1Hv2u01CzDPfJkK8HtiDk
	vPW16j5Qa4wjZiyW8XG5fRd8FgBqQNdtRSln9jbLTvVXnjD3fj/AVc9RKUBHFmrP
	WjggOUIf4kbjoC8C63rjjh3k73xF5E+TO6gxxPDdf1t/bgpEW5aUctpBRAC2Y4ZW
	DpxqoK/05qLr+CS/DTol1NxAzL8Ajf1pQnzqhro1jm1Taeib6/VvbN133hH04S7o
	zgTsC7jVkoeDCPbDBpW7HYFX6Kc985ZTffZwBW8wVwqGc0BBJrhPqqSX1CGGILg0
	oqeLNBobus/qrxhFomPxIeNxQ20lmxWNbcvzhLYixZzDeZJNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790292371; x=1790378771; bh=ReZ44VNi25PH/GnqYflJxIQxb7G7Gtv/oUZ
	18ok8hyo=; b=xZLL3ewvMgG131I89lunelmG37hZR629gc4kxxTxBGM/8VuuZ/7
	fAxgYuoMNlXn8k/W9QRtrHIFZY59unxQhWS1ExNDj7TzX35YeFBS2/IIbEtyPevr
	grzacad25pqlcdnNQL9GjRlNAysB/FNco1jWx5oi3e40FTdBXbJggALJR0GhCzAB
	psGQO3V9sMTZsKpa0IG9AaTBMIwsXgC39KxLLpzfaojB+KrLBpRXAslnQMIaKjjb
	wLK7lxb3u+3j9pGzWi1g05C9O1OHbMZo2GY4XyP+tauvVqdT4FMKBNHg3j23BTwH
	KZqpYZdXiuWcLx/Yg4Hjctz6WDliOKQxFnw==
X-ME-Sender: <xms:k7G1atZKhyjA28LHwr3bo3kbyamAuw0tzA3xyQLojdL3-PAKNaC-uA>
    <xme:k7G1agRwIjwEciEFEFlezJFkRoK7kvTVx310b-l7_PRuf3Og4y9m3gCW_ivM0QPkm
    8fLdHu1iGn7ykIw1Mldidzz8Ts2tNs5W7MVaPyuMCmo8ZWIjvHEQ5vc>
X-ME-Received: <xmr:k7G1arcwEVB7yjGTCSLOwjr_H-jYN0u53dIu77OVv0U_GBbgtBGQNCZed_XrtgSKufD5mVBHiY_-EbHZwqQ>
X-ME-Proxy-Cause: dmFkZTFH+g/IRgDdgA92LjqhaqAD9/T/Ir1n6oeXkT1QrfJ30EsjmB3a/dPgJf20Bk+KT1
    8rajfIPciRmePbmWNYqUqO8KrN/rcNoyq+IHSSGViDCq773JsgwRtRz0vxl95GSXNQ5TS7
    iec5A64803F5TOcIxvlV+OBI4e7XXFT74ctCrYCIgBN/HsQ6ST/ymjGOL8RGHrR6vSVTLm
    rwC6/luaQ21o3r+iEuAmuaV5j1ZLCAyO/iBueS9O1zM6U+PKjkD83LhNnwm0+aJ8FjKqqr
    PqzCeBCUP0H2Dc7Xw50yx2GNkDmhY/maq2GXjuzehI/QsKWRH982crVFBeRD6O/nkbxFZz
    5drZ1HtmhgYs1KKb+rXMxSj62wx6hNzYIFZjsAq2hc+bEcbl5iA25jZzg92rt5FeH//+Dw
    co3wDabrdhXQ1Y/jPyHfkLPAv4PDYjeaXa0xswEWV9nKjH7LtJjLEjNwg0SpnYWu15wBfi
    JOgFNdp/fWKAsoI3U14rFMo5ORnsr/bI6QgM2h87n+R8nTQNjQMd+khR1RHQoZuzHhSUDR
    pCUmJnCQJV8HCzWkqNUXleVh4Hgs9g4d7zEDRLb74ldMZQLJb798HS9iOVzUL5A6wPsLPv
    Gc5V9xH7SICtO5Okep1GMEFqaOCurgsEvRhWHn1xh6SjZ6dAo3BXFZw/D+MQ
X-ME-Proxy: <xmx:k7G1avkRPXeNq5bsXe0yOiaKjyRHq1BAE7llnDTr5hgBp_V4fpL89Q>
    <xmx:k7G1aggWHp77LhSKfe4L-5qGI_yjH6LXrhzVBOjG6vpwWOPeGlAwCw>
    <xmx:k7G1agEoVlro7v4RLOSZh90sOlOu4cg_0g0IvAB9BIA3ndBMk9DwGw>
    <xmx:k7G1avwPVqeTFar_UO-UarCyg1l7nMpkyyHjakc7ryyZ308q2hKxOg>
    <xmx:k7G1anFAVpwmHswurSqtDaocYPtPH-ET-E1u9uBTtaltjpiML-2ep7RA>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 19:26:06 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
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
Subject: [PATCH v4 0/2] Add Delta::to_jiffies_timeout()
Date: Fri, 25 Sep 2026 08:25:28 +0900
Message-ID: <20260924232530.446588-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The first patch makes bindings::HZ resolve to CONFIG_HZ.

The second patch was previously posted as patch 4 of [1]; patches 1-3
of that series have been applied. It has been reworked.

[1] https://lore.kernel.org/rust-for-linux/20260808062839.1159990-1-tomo@flapping.org/

---
v4:
- Use i64::max() and u64::min() instead of the method call syntax (Gary)
- Add Reviewed-by from Gary
v3: https://lore.kernel.org/rust-for-linux/20260908230445.2430296-1-tomo@flapping.org/
- Add the first patch to set bindings::HZ to CONFIG_HZ.
- Drop the CONFIG_HZ workaround.
v2: https://lore.kernel.org/rust-for-linux/20260907123524.2332118-1-tomo@flapping.org/
- Use mul_u64_add_u64_div_u64() instead of __msecs_to_jiffies().
- Dropped the as_millis_ceil() example and KUnit test patch; the conversion
  no longer uses as_millis_ceil(). Will send it separately.
v1: https://lore.kernel.org/rust-for-linux/20260811150147.1360102-1-tomo@flapping.org/

FUJITA Tomonori (2):
  rust: bindings: set HZ to CONFIG_HZ
  rust: time: add Delta::to_jiffies_timeout() for timeout conversion

 rust/bindings/lib.rs     |   5 ++
 rust/helpers/helpers.c   |   1 +
 rust/helpers/math.c      |   8 +++
 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/time.rs      | 105 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 rust/helpers/math.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0

