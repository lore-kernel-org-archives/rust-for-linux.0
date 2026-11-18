Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042305;
	b=1KY0yFwOORPbEMzsucJBXsKLN1yScS8ODnSPw/rVFWEPYgzchh1WNW++xU+jPav/+rUU
	 SLPczDxXc+DCduCr3wV5fQo/8GrwKMhP2/qCkzthR7xcn3HBdKBICHUKy6hNCHKFfF8dh
	 cYO8PnvItlIyFhg1BkB6Rvcm+SbwNlOxatzvU91FEQtFgG/xNn8I2pvwdrtbqtgHgcFrH
	 fi188TOJFoI5XDla+A/WPNWTJRc1mYmUUcpSI6qzyUH9WHHoMiUjtUMqYtDQfk9li/zpq
	 NPEFw5cMUvqAxyyhp+CV/LQlBVOm/wK+0ugtBebyxO/SCgxKAMUFbapI++aWya3Roqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042305;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5+XtuorylhonqXeUImWVMGAIX8lmQG3o0bBLIzEVaN8=;
	b=U0oax8By8W4GwAozJPtv8dLlfc6gcmbJkUejdAqVPSr28QGbSRyBX7nUIcChg1T+vmes
	 kBVwOzjo0bnd44vyltqWN+iyzt3oHlDvOVMBTiOSrbwI5VsqC3O8wVAKPAGzJdPxI1WpL
	 UO2KSGSGZ+tGs8Ezj2uGVY2iq5+7I+M/pLnOEwQlxCV9ZVmU7egj7ItLMu+zYJ5/GrNz1
	 ogRcz84tCtvebK9e+mkBWrQggo0sdEBVUPyxDds9UtfQWa+/AQjnV58DnE2hQz+d7XVfh
	 dYd0l6p/yKDrmZNrtfSoFc9zbHqmMfrvO2uPj1bInnPvuu0sw0UP5gv4ddR8lpZsqMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b="t2zp4o//";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="tk/gCUx3";
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE2606A325
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 22:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACE2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=t2zp4o//;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tk/gCUx3
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C6E577A0250
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 17:51:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 18 Nov 2026 17:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795042301;
	 x=1795128701; bh=5+XtuorylhonqXeUImWVMGAIX8lmQG3o0bBLIzEVaN8=; b=
	t2zp4o//Z6EkDAhYI3tosB3KAxQXYYhzXR7wHXajp6Ymcw8aWuCY9h51DJ9WP22r
	mm2haldNeLLWCWquQ3jqjdrjV21nx1SS6Mj3z6ZXf+aT8DUrXC0e0b9PPDfW7eLM
	ioJXgNc4uEbzkmA9HCGLf4E6UGHiTl/gn1L2dPADYo0SFYd1DR+RDqTSh26jFxyl
	BWHarFe3qtNUjdCWwn6Wu7vqqWp4K7dcjxd6yzo4acjOM0kZZCBNe82JkAoNPUgz
	Ldori2L1j3X8kRje1JP7SDB9/lQ9/4isbOP72YXFx7UhxEc6Q0Svcr/qeczXLHeB
	Jlv3AEC3OpZ3bdW6rPlx3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795042301; x=
	1795128701; bh=5+XtuorylhonqXeUImWVMGAIX8lmQG3o0bBLIzEVaN8=; b=t
	k/gCUx380TGoR0BqFrM8Q9RPUriUvwdEbB1VhBNS6OMTZiaEqrrP6x8BzwW0P08C
	0Snil+J4c5xd761dvtzO3lCxssWwHCM/y21p3LOkyTxlhFUJK2olNwbsj5B2eRVp
	BU9NKEq+QqPRXClF7SrHMNECyVxxWABsJhj+Ldu9ZLEhKokzKVVy9pnWut36W6BD
	CnVtyJQviz5blD7GbhszX+jTBmLL+jWz85MbUNhY5ljoZfRrX/pI8KMGbm5Mnof7
	1yBYRABFHBcVIJZIA7Lwo5Ht5ALQ3K2D6YVouYxNa2HpT1WyTDRuFTx0a9zcsIFm
	JLtIhwrFWnJpcAJK6daug==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795042301; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:jeBRI90Vbh75UedZujnGTXELRVQQWkrjJf7uVuFvBCfdulU
	dGzy2xpjBA4m/6rokfzZyrTPYr9XQSXe4tE6yGKefz+2dH78ZdHyL+kk5ZSvwwna
	lvcdDRzhe60vLTeULqpfvfaLq+JjAROU7SCJUHjKdSTV+RSS7s6GIQl4pEHIvpQh
	fMhRmBR5I8QTd91jbhb0K/mI3pkphe+NPJWgpNdVe7knel5XydnrgI6VkYmihX13
	LNfQX00lRcao4/iAaao18u7At0VzVh0CkLx1L+SrPeUcoyvl5wH3069DIfeEHp+g
	7EhxhUzjd5krCLOcnoapmF4o15vPlozxHoT+C9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gwT+p8kA7L84lFFCIpLSyCi9PmiCPy5KF0kAnTVsOyY=:1FBlag0FukFNRxAPA6u1bOZGR6svMgeErrUIKxOpl2w=;
X-ME-Sender: <xms:_Sv-aoUZB_vszS2GIIfPYPLHd7NZK5Y_MQhuJMFPUd6lSW7ahRtZ6A>
    <xme:_Sv-aoQrMiz-WB-d8ji59PcTi_caej1n2yv3EG9Clt0Qp5Siz8iSeJEBqnirfyyJR
    S00UYLI1DKfk4LF-oYB7fZYPrLJW8dm9tHa9xwHLpA6bEOV-Tdob5pO>
X-ME-Received: <xmr:_Sv-anF4bRblPsSl1aVOGZRc0tRo-4pSGRUTCF1tKjq_b5BMjls2x15CYZPk3ReAiPmYuGL4Jseroq58ayM>
X-ME-Proxy-Cause: dmFkZTFhpCaxkrSdjl1bmMJJH+/ejCFr/GqQbJXvXr6UlOIRW2lZZvZP/KmdXAvHUIGyyz
    85TDz7C0/Xb54ijhMfZSKvt45T37yo/K2raDnJEqf9J5UuZK2dagcIqyohcmW9xWXmOwUe
    +4gPxStnhvqvL2tBuq2htXg+XD34Oko58lA4EJv2yXj6gHPsdlcW/Cj+pvvSS+gUR/6CEr
    B8OynZaxZ7qkpVUK570tvkJbqwwnbeKMDuUw2cV/y6j0X6tTg6ntTWYmGXTRxa/YorI8cw
    rQ1L3NyLdYDcxz4IT6re/HcFeAek69CMRarEGPAxn/+6ZUQT6BYi6217KYFUG2kd/9ZURQ
    6g9FJbDw4vvXAkfkC6yLrnmgYU+Dzb4EgyNVc6M9RFizLw7kxcUtxjOjis41aL72147tzG
    JsHUuYZ00K/3PDBEZtNez1CutzNImiNrlrWenYDiE/MoXJIMsGOz2igtxgTuBitbWw3Dex
    zbvdsr3egpnjXSBFVfPG8tNtHLgI90UzOATzb8IJdyyPBE5MA7FVb7MvGssc3z84zZdSnn
    mfo+F+5iON5dgC+vVYjGW6nIduITfpy+S3u/SQoFiHU/lmUdWKBe1DXIoRAko98qVwNQmm
    nAnD0CVlN8CDw+EEviWcmQjhhn7Q2Or86QXKYSfqEaFfVfsKa14nE17qvsJw
X-ME-Proxy: <xmx:_Sv-aoQVKLsWu56hL7EcYlAaIwVOqRvWFGwy2usdAqGsUWQZ8TlHbw>
    <xmx:_Sv-ahoB00kGA5ALynm7ceTiTJq-0yWX9tvcN1UXUkB35Gzk3pDWTg>
    <xmx:_Sv-aurkqAMMjd0xC9J9M0eaTBi54SII-yk6s_phdb2bblRa6fWqHw>
    <xmx:_Sv-ak0GFA8DqmYFGxKqTF51v4feGnZUf3c9yFfIaCj-8hQsIRG1Ew>
    <xmx:_Sv-an17hJfeug1QClumL922umJqTmZ9AQlmscuyGtM-2EoZY0iSl87F>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 17:51:36 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	chenhan0017.work@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v4 2/2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
Date: Thu, 19 Nov 2026 07:48:26 +0900
Message-ID: <20261118224826.2491684-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118224826.2491684-1-tomo@flapping.org>
References: <20261118224826.2491684-1-tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Fix the following build error on 32-bit ARM with COMPILE_TEST:

  ERROR: modpost: drivers/pwm/pwm_th1520.ko: symbol '__aeabi_uldivmod' undefined!

The driver divides u64 values when it converts between nanoseconds and
clock cycles. On 32-bit ARM, these divisions are compiled to calls to
__aeabi_uldivmod, which the kernel does not provide.

Use div64_u64() and div64_u64_round_up() for these divisions, in the
same way as C drivers use div64_u64() and DIV64_U64_ROUND_UP(). The
results do not change.

Fixes: 3c180003dffb ("pwm: th1520: Fix missing Kconfig dependencies")
Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/64bit.20division.20in.20.60pwm_th1520.2Ers.60/near/626825599
Suggested-by: Uwe Kleine-König <ukleinek@kernel.org>
Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/pwm/pwm_th1520.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 728993998446..bd05fe49650e 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -31,6 +31,10 @@
         mem::DevresIoMem,
         Io, //
     },
+    math::{
+        div64_u64,
+        div64_u64_round_up, //
+    },
     of,
     platform,
     prelude::*,
@@ -68,13 +72,13 @@ const fn th1520_pwm_fp(n: u32) -> usize {
 fn ns_to_cycles(ns: u64, rate_hz: u64) -> u64 {
     const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;
 
-    ns.saturating_mul(rate_hz) / NSEC_PER_SEC_U64
+    div64_u64(ns.saturating_mul(rate_hz), NSEC_PER_SEC_U64)
 }
 
 fn cycles_to_ns(cycles: u32, rate_hz: u64) -> u64 {
     const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;
 
-    (u64::from(cycles) * NSEC_PER_SEC_U64).div_ceil(rate_hz)
+    div64_u64_round_up(u64::from(cycles) * NSEC_PER_SEC_U64, rate_hz)
 }
 
 /// Hardware-specific waveform representation for TH1520.
-- 
2.43.0

