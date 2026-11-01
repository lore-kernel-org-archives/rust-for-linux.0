Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575984;
	b=cvbgxbQQtoJD3dMOY7fieyxYyEFAGN5OTCHf9oLDyOlFWBtFe1qrfq3EQYLcxAbgOvtz
	 aMrbCPs3K4uicYBXyUWh53Jfsiia1pWPtz1A9jioj6MISCDB2ULR+c0VJSFDDTo8FNkY7
	 6DIDak8rpdAmxhEt0m4GFDFCUPTM1PzTs7cM1is3s2EAoSPuI36Hp5czY3aW4/Jo4onO5
	 c9Q8wY7jnoT5+MidgfV8xQnLwy1H/RgtpKbll1IdewPZjd/ucZxnf2QOzyjHzgcFVejYb
	 JHmzh38ONa9BKu6sdz9QIxCaBmz4CIo1GoZ9wlRqXyt6vJKgAffLUde5Ymp1w9xIYKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575984;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QSLh3tDgf+UO2VbPvGHueD1hNyph2JTi/4qbDhaCBDw=;
	b=zS9MybuBOJ7cwv1q6ck0w5i+TxP6tDmgorbfMJoQwIOhs7TDedAGLBXsaLTF3DmvI+Ok
	 HZzRheMHtkV918GWmPdZEzSClP1xpcS0NGpd6cQq312yEzSvO0bkRX8TcQkVqTsMvjJ/j
	 xhquViTSKF/J3cZYDl2uBZUiVvrBXAAQp/vJzZAHqKdKHMx5VnQv3MpBmofKJWM/fj1UH
	 bweBGr4ROxdkH6uI0sbuZ/lqU9bGmcuJkz7rox25olkUMWDssu/puQEvhR4b0+2qmymIi
	 7w5/lD6RjcWb779QRpAqcUR+FRfsWTjDwqgjF6VmgMOh2SDvuh+eb9HtZhJAAM5eJug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WHz69DzH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WoSpoV++;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A519606A32D
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Nov 2026 23:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A519606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=WHz69DzH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WoSpoV++
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id AEAFBEC0664
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Nov 2026 18:33:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 01 Nov 2026 18:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793575982; x=1793662382; bh=QSLh3tDgf+UO2VbPvGHue
	D1hNyph2JTi/4qbDhaCBDw=; b=WHz69DzH+gBfjU0x++/09HHhzNepZk3oKEJ/M
	hA4A6nXcnHcYIJbDGcvoTAvtBhMzN6wam7ozzlsbPh8Wk4iuZEQlO/oW9Ep/gE73
	EyE5kyMXUxpblZfIOqaLSmvU3CKKEOLNa6tromXRbR2t2gMS9xKtHUVaRrj6VzGL
	VgTJq3FFrJZuZt3VYiny/TIyfvflu3+VhHZkULXlN9VP1t9kLn23RuXKNboJ9wf7
	hpLjM5fFWNoNxpAIN330vHY7IIYfsBFvCVvMH5r0qjbyL8EvwRfKLtKaPxmNyHL3
	lvsByHEi7JyldbgVfLavzPI1IHzkRtKVgagEWmzl0T17Re+GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793575982; x=1793662382; bh=QSLh3tDgf+UO2VbPvGHueD1hNyph2JTi/4q
	bDhaCBDw=; b=WoSpoV++cIMpLUnfyBWaoVKDMsO8Gv4fUL0m1e+lnlzD/dJ7Jgz
	a67gh+G/dlceffmtEqhyw7cwSkn/1AA4RSFlMTy8Z5bWaKXE/XlzyOOkSpNegpRY
	mxi3QpHmKfWMBU2wcQ7m+29P13zBu3snRRseqLqHouZI8VQ9v2L07U0GX2/AF9ne
	rRu3jGw5TEJ/NIoDWkWX7xtRHBqKQ78Efw9K7X01eAjsNtAEFlsNrfY0m3NqeyiA
	Gi91/23Vh6KOcRsAYn15OKra4qFX4/zITDwo7QW8wiHJE/136Yyb+TciXJX0s5zm
	4/YFu+uH2gXPy/NMDr1OEALPcJlhg7mTOGg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793575982; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:MYHze/+ESIFqzP8vFmvqZhikrE22Buhui5mC4H1SR/XciNf
	8DUiNgv+USEZ79gkBJtEbdju6qDH1BLlGgvt4xuv8Oqk2dc+Z5l5NkATHb+hltZr
	r5HyQIi3ILNU9ONBS2jMdhIq2cBToUTK6plv5jkN9loe8sAPnrR4c0af/f8tQX0I
	2NlWRqIUzmdfqzeInmpr+8uhfPkVbqYfn5W+MmAjzlJURYdwe/r7aJjQEVH4sZ1C
	Setw3UNqigb/4VZKiTsS4+PUptkhMlkOgt8SWMR6y470V8lf1jt6AZD5WqQ0/YxT
	RcoHqwI5R2gcnSB4aWymhid9s803x1/KKgbJteA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ZMJbov8JuNSIqCHKXpucecxq3AQucTYHUURh31DVQlo=:l0dmLBO2hFFplbUBvVLQcMNvCDDH0si9qJ44zyYnnlU=;
X-ME-Sender: <xms:LcznaiQMzwtXnpV3h4MMKgNDkUAg7-AvE2eBnfVQtai6FYSRtL8KGA>
    <xme:LcznapE0EhOiBY_7eGf3GsNP2TU0EkDb4iT4YDzRMaltg55N3wZNbxHpOa7TNXlO6
    HA3UnSSEo5vrteHrsmaOHKclflb68XCuc3jXnWXP318PEfuVl4Vh96m>
X-ME-Received: <xmr:Lcznakes1UjcXHp1P5OllDFrgvdS9ZaVw6DuUOgiJZvEybXgDYWoUmKKlL4XGYHpqWE-iZXAbwCpAxofVc8>
X-ME-Proxy-Cause: dmFkZTFpN6cLuvQKoAKCx5jz9voSAJeR9s7tpZ9sxXPKgVaVrUL8JZW/cW3sWX51kAxmWN
    CUKFe+OsJK0mC5ws13OYOpN8CgDgPqNZ5bsgPBeCgq57LsYKOheODPq6tG7uOuFWsC2jA8
    xMbqyccghezmyZRVZv0dQJBPYtlFpAu6fowqjeWqjdY/hdM1obSKLSpRspNtqjPpgD0l/T
    DIqJSqsU7csgSwosPXNsQCMXgfYFCoxoXpLNRlfPKuQyk2qR8BCoSKm/WfFhQZ0xDy9zuW
    zegaptOJyYvWLDEMrz2Y3yPG9ygGs3rCoOIPKDiLLu/LaxvtLG+LYEQob4q7XJawP/8iR8
    4XhLWyQKU9L4iiEDAe3MTV4xaN5xEnrbVor//8TBV94eh7M1aj5j1QBM4GbEtG2Hi3dlxL
    slNFjNqA7OXIjgIwE4gGsVbDLf9T66KjTiqhdpZcbfL8U99UD3cSFTvt9bbHtFJ3hD3iIB
    aHf0mX0zrnFrGXqxylwE0mLqQQ7Y5SKsOOHb2DDTUyEYp6s4SQ98JmipHOBHprvptOgbFp
    kvF1H78p5vWIhPc7g0SSZDvluNU0B+JpLOtYsk+csHG1UpyRD0zp5fFTp3+fqE+G1th9HT
    Kayn0A18QXl8MO46v8ehKHv8l+wULZx1IPESfVynMWgjgIy2MnK5qZUZ52HA
X-ME-Proxy: <xmx:LcznagvM8QmMbuNZNsvpdCyiSofzw6xBVhVaKpxG2mqzfT_BZIcziA>
    <xmx:Lcznaidgj2NH0nrJsIiXpCqqi5ixBGSUR56gjQuMMZDAFQ3iWoq7dw>
    <xmx:LcznasrBz8WLSLxXse11-BMWBxkuRWrT1jJSVzKRFa2CTSF584H_kQ>
    <xmx:Lcznao9Ch4iY5jH7SdwF4jlIXBET08KPRKQe01COHgYnid5S9QOhBw>
    <xmx:LsznagwOdPhpce0ZRVhfBpKIsKtvZi2zTfYauEqgOIxeROnzFIRAiwZg>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 18:32:56 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	tglx@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 0/2] hrtimer: Add hrtimer_forward_safe_from_callback()
Date: Mon,  2 Nov 2026 08:28:27 +0900
Message-ID: <20261101232829.593680-1-tomo@flapping.org>
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

Safe Rust code can arm a timer while its callback is running, so the
Rust abstraction cannot offer hrtimer_forward() from the callback as a
safe API.

Thomas suggested a helper that does the check and the update with the
base lock held [1]. Patch 1 adds it. Patch 2 makes the Rust callback
context use it.

The helper is not Rust specific. As Thomas noted, it can be used for
i915_pmu too. null_blk can use it as well. I can send those
conversions after the helper is merged.

[1] https://lore.kernel.org/all/877bk3ixp5.ffs@fw13/


FUJITA Tomonori (2):
  hrtimer: Add hrtimer_forward_safe_from_callback()
  rust: hrtimer: Use hrtimer_forward_safe_from_callback()

 include/linux/hrtimer.h     |  4 ++++
 kernel/time/hrtimer.c       | 30 ++++++++++++++++++++++++++++++
 rust/kernel/time/hrtimer.rs | 25 ++++++++++++++++++-------
 3 files changed, 52 insertions(+), 7 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

