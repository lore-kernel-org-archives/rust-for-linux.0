Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575430;
	b=NmGjm/MIAWWcGFalTnOfhYsw3u3z/pLhzjE6xuUr8HNqIapBY4kFmQMuTMOOQBxusbjy
	 XCjhtGc7EwZ0gZxEr0embU8JrCImNtE5737SW5VHK+mb/xww0shQHaH6evX1cRo4EbncX
	 mJhycwVhT+iav4OBcVO2xvatJ6tuR7HspTga+k9O3MPvNScI9mRMxRrR9uQ2IrW/IDX9O
	 8airEhQy7H4TU09TUieIbxgJ4mIkjlr8eX9cO1bQjxJP3RE2yeB8z+TlYgUZefuindHwh
	 buyJ5wq3FKjWoAND0eIV1oFtpGsBMuMDhZyqMNz0Y4sxq3C99ANu6zpte+tgjNCewgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575430;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=8heTw56+56MtWgyiyJVoY9nFbneoWRtwTFW2KanxM/I=;
	b=5FomNJfrMrCAPbBiadrqE+4vLWBLaMjsJf0f0LC6+LObAexSaVZqIBY66xb6Blex4NPa
	 ccWa76BlnYnjc8m1o5MnW/lZ/9Bgj2+dYZoVWfTkK3Cw8TeMaU1zpmSNfY2wEaCGP6Cp3
	 e/OnFWFYTk6dqn24FC6IHCB3oqRdmQ5/G08RFO1P3rtcTGKupKxbsvUiDkefDbG9bz8PI
	 1Kqb6lvIPpuyD36yA6d1M7WuBXAzkUWIyivuD10nkW+BQjGO/Ul4gCo1PrLXJegSQ5OnK
	 6ZZCcaoIFwPER6mHTUDpeOPmvnGo+9Oz/kc4sB8e82NH1qLW2P9n7sviys7OgC1kRqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=dGO3wKCC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=vGKoi2wj;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0A606A31B
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=dGO3wKCC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=vGKoi2wj
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 006441400108
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 05:37:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 21 Oct 2026 05:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792575427;
	 x=1792661827; bh=8heTw56+56MtWgyiyJVoY9nFbneoWRtwTFW2KanxM/I=; b=
	dGO3wKCC4EXAhuS66Bxn9f60R/sWDyw7UIfHXqjGoVa1Ah0ELM9tSFhkQg/HIr13
	41B0ckDrTzMV3PZGqEh9dy8fqCccvPiiKmAVNKOwiR+At4yhEQoyiq0j5Ft470e6
	Cqy5OGOA/MSMxfk0h1OI8onDEDBZLJjm4IqnkEcOFLtT15iI6MNN5dcd4t/cn5ir
	AyGpbOrsHfqqLTul8FyEDQB7EhacULcpukfBnfFDs4jw9+vDHmpovuZU1wRl6t+f
	VbjCUceK3nqAOM4XMjcNaziy2HhgJnsbJpdy18buP8/1vPjgXbaV9NRxtoBmMNAs
	0+0pIoymYRyQLF3mI5yjFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792575427; x=
	1792661827; bh=8heTw56+56MtWgyiyJVoY9nFbneoWRtwTFW2KanxM/I=; b=v
	GKoi2wjdM9yOWaw/oMGpwg9z87QbnAQzP5aYQL9f0tj03vjxeOh99sp7o+eXpMiQ
	nTrYXbZkZtRPpKdPJrMNYF5dbzy+Se640ZJ7633jtSc12NTFPmENIMLrmu0HmsVw
	SpQUMbdg3vOk8RZ8BVSXgRKUkQMeIlK5lV6tie/1186jkIgRxvWKXl1WtZ9TQtog
	ETWZoohT9cxWd3aYI4z9tcs1rZo+QqOJjd2IUoHMc9K6HrlphDEYLNhBX8dhdqBB
	iOiaO6i21+Lkoffi83YW+GVOgsKDUoJhlzucm6hw44Zyazo7Oz2N3AG4dGpzm2sF
	eEZf/iDFYc48XGZBaCboQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792575427; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:fcZFIloF+2T7ibW3rSzoXULxupGWGwAIkzYMTn6AhJ7ZJEX
	8pCKTF2xp6uxIzAqGb+mUIkxigvoBUTPo720GVoe1DsnI4wayXdxoDgsraQL2lFQ
	iZbI3sA/50pih1deY0LifNJxFMpkWTifRbLt86jg/+ghJFn8EUw3qj9eFEPBJRHJ
	bPQdT+rRQ/VB7UplhsopEbeT7ZTLJRJEgMdtwELfvOPF7cdnP9UjXZmcfADuN8xY
	EzudOeSkzCzGFDow9eX3J2BCcxZCIz4/AqXCuroi49onX/wFfywpSOc23idIX3Z3
	+cOIh0ay5ALrEYHNo23FyNbYQK5nRb5QGN0kgIQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:6XO1KeyWU3i2v78yzLgczQa0EBpcmSBqmiOBqd1U+oA=:qqvF6PieulX8dhtkAMmeXWW60A263BnuwhSiiJOX7Xw=;
X-ME-Sender: <xms:w4fYatASLkIOFanZStNTUlWDmPfdKykhBfbOEs0o3-S1YaFci_yphw>
    <xme:w4fYatN9od2E_5QyeGSJThGSUOg-jOS96vqCRKj-_EwgkegdKOUlLxc3aDCSOsMht
    1-tZOUcLA87nftTI0MHEb4_hKoRDwla3u039ki1db5VUTGMg5c1TA7Z>
X-ME-Received: <xmr:w4fYasDVUGrT8DTZDDv9IOSif5Zy-MQhLLL0HKEVE5at3SPBI-QWhueqUAjkCs0TjQKAzUs9MKaeEv9lR-mUCq1v>
X-ME-Proxy-Cause: dmFkZTGBPO6HAytZQzbZu7Pl5RKMdqLuhU8DfonQ0oW+zWKecnh1F/BjYXZDcNC1LpCSWh
    sKW7hXfvc6MDZzlLB1ZQzq3eDt2kXWCsfOLEB99gf/K4h4fumRBdyHeATmC7R0AhFjYrBM
    N4LT5PDoMIH6Dpx7GgbTK1lQ9m+KIy88Wd8pOxS7IVzYGq+sA7cPhZlDDy13mhx98vC9mO
    7zlR8+1tEm0KcuQguPkcEvA/Q5GqshUCgN1aZYiR8GOb2Pyr2x08E0P53fti5d5OpkIncH
    6GTTcLtqiP4YDrHJK3kQkg1p0Om5n9HY7+diIqn8UmFwVsLuImkL7buVhamZl9hRwxKDa2
    oHuf+sHvBUG+lwrzXxqIqZpm0rH3pSOJkvNqyRalZGvY/+XP05+GqX3BoME/LlTgDf7knw
    CVTfJFXMnAkBbk+jqVMOho7PgnkkXPAIEbtYRD0MXBq8V7IDY47l8za2VCDnwLpLMpWRH2
    KMx2nT6iv5tT1FhT+5d/vSHBWN9q4dIHe25lthrCV7WtfBbNjIgWt8w2xG1/VTZTcdc6SO
    p2/Z56synrAHb9Rw2b4e7jtZ9e1LZbiuZyWtJDBC7AIOpvlqgEuVvNp3NJjqzSP6h9e9m3
    BeVJjoYJsqnYTCs6OxRhIjnQUD7cTQ6bSjXupkO051NqntsgtCMlyHdBjz+g
X-ME-Proxy: <xmx:w4fYanl45Mq66htDCk8rsZXNNlXb-u2QdxgGYrjiXU15dffVXloXrQ>
    <xmx:w4fYaopefKkyMH4ELNDkM1as-N_0AxIXuvokEuID5JPe2t5Pn6vv8Q>
    <xmx:w4fYaui7_tqEKyUtymSNDjNWgJqpK4yb7fBEtmwNBpX0647zZIHJyA>
    <xmx:w4fYaqh4ANxi5YVquDW3ZcGhmpSPW7PfZOJo0P6aHme-Qfn0UE2nBQ>
    <xmx:w4fYavS51Z-FTtC03bqwGXjrOjkcwtV9V4-4c1b3x9B7wlplYZ9y7rnl>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 05:37:02 -0400 (EDT)
Date: Wed, 21 Oct 2026 18:37:00 +0900 (JST)
Message-Id: <20261021.183700.735437784476089878.tomo@flapping.org>
To: chenhan0017.work@gmail.com
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org,
 boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 miguel.ojeda.sandonis@gmail.com, tomo@flapping.org,
 georgeandrout13@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: math: add signed division and remainder
 helpers
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261017111134.22546-4-chenhan0017.work@gmail.com>
References: <20261017111134.22546-1-chenhan0017.work@gmail.com>
	<20261017111134.22546-4-chenhan0017.work@gmail.com>
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

On Sat, 17 Oct 2026 19:11:34 +0800
chenhan <chenhan0017.work@gmail.com> wrote:

> Delta's division and remainder implementations operate on integers and
> do not depend on time units. Move them into a math module to provide a
> common home for arithmetic helpers, with Delta as the initial user.
> 
> Expose div64_s64() and rem_s64() so driver crates can use these operations
> without constructing time values. The division helper takes two i64
> operands; the remainder helper takes an i64 dividend and an i32 divisor
> and returns an i64. Both keep Rust's signed operator semantics, including
> the unconditional panic checks, and use the existing C helpers on 32-bit.
> 
> Keep the Delta API and its panic documentation unchanged. This is separate
> from the preceding behavior fix so that introducing the math module is
> not required for a backport.
> 
> Assisted-by: LLM
> Signed-off-by: chenhan <chenhan0017.work@gmail.com>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/math.rs | 64 +++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/time.rs | 49 ++++------------------------------
>  3 files changed, 70 insertions(+), 44 deletions(-)
>  create mode 100644 rust/kernel/math.rs
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..60c2af705b47 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -98,6 +98,7 @@
>  pub mod kunit;
>  pub mod list;
>  pub mod maple_tree;
> +pub mod math;
>  pub mod miscdevice;
>  pub mod mm;
>  pub mod module;
> diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
> new file mode 100644
> index 000000000000..34ca097caac9
> --- /dev/null
> +++ b/rust/kernel/math.rs
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Integer arithmetic helpers.

//! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).

?

> +/// Returns the remainder of an [`i64`] dividend divided by an [`i32`] divisor.
> +///
> +/// A non-zero remainder has the sign of `dividend`.
> +///
> +/// # Panics
> +///
> +/// Panics if `divisor` is zero, or if `dividend` is [`i64::MIN`] and `divisor` is `-1`.
> +#[inline]
> +pub fn rem_s64(dividend: i64, divisor: i32) -> i64 {

How about matching the C function? Something like:

    pub fn div_s64_rem(dividend: i64, divisor: i32) -> (i64, i32)
