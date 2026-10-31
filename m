Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447917;
	b=MQ9aqbcyqGNR8btLxN0MlKtuDnbq+yZkI5vzBLpHVizmNRxCEXKL1Vc2V2iUD3Vmi5iv
	 KU3KKkyg5e0rbujO5qsQRvfPJUAWvXn7XiU1vHDMNTDQj4ryXWlU5TaWH1sbADA8H4i6k
	 AZDT00eWgIN3749WzudNwn1KjSyDi0yuWiO3Gio8kEudc1gcLmE+P9I6TFeZsYoC/5gZp
	 YkVKP8f9MictRsmC2wjWKNXlYrDrjhWR/wBse90tHg1PLFcZMkvkAJi6v/HbO442XG/xN
	 vzhY3V08YMtfHc2fJW6wFqW4PDb0JxwXk/gzTfQBaFhlEtSODC9BN/GwboASLkFRr0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447917;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=T4qze5VSpz23dq9HuoM32wDACsLEARxT5J0RoHXE1Aw=;
	b=j5lYI5UTCmsCJYTwkvkwRonlxaLoatUcWe1aUHxTwQJ8hGi4+oiPdmi8zTo5un36i2kk
	 BmWxvq7Zl0D/46vvZ6uozyTjstHLWBX7949K5uUXG60hTTEczTzl6sZ9U0FPwii3ZiUkz
	 6uTnkTiSkkLEXkAxgGQ5ETTsPJLtWTIGTxDXJz1Mi0rDth1CrLHo09EAqaZBaJDpf51Ve
	 rwUpzMcd3qQ0eY40I00MWojqtTV4thvh3Z5sJgdS9yxb1lg7fDxGUSX7cYspvZC8yp5TK
	 veS2r/43tKtevPtwW6F811rhzU3TJDILKhS8c648VWfYTAb7m9pd3VmfJfqfzXBNBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=CNrc6Pkj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="l3nuD/7L";
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D00606A31A
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 11:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=CNrc6Pkj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=l3nuD/7L
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1359314001D7
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 07:58:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 31 Oct 2026 07:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793447916;
	 x=1793534316; bh=T4qze5VSpz23dq9HuoM32wDACsLEARxT5J0RoHXE1Aw=; b=
	CNrc6PkjuFNyLCyB9pnGowHCvumED7e1L1qjaj34WuQRV8nn2LdEKm4YiKIv1daw
	AAJ3eb9plHJKzsK7L+SLSGOZxvuao6QyTs+UKETrXfouHm/atbxzDdgZMIDTv3r1
	hB1mIgQAiFoC+nrs84HkxHmeLrwKDcwVD5mqB33IwRz+UoBnJWdlshXVWp+hqC7m
	YZpSGRYWR1U49mnOOGA4YQQi9sBb92yIy09soUF9TME/qDneQ6CdQ/joNiXDy/JS
	RMCLGlVSe5G6ouhDUFkx1K7Y0fANOobOD4HJ7b5W2jbVyCzG1aLVTmPoNDo+YRUb
	mHgoUryyh6d01qAZ53HPWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793447916; x=
	1793534316; bh=T4qze5VSpz23dq9HuoM32wDACsLEARxT5J0RoHXE1Aw=; b=l
	3nuD/7Lof8Gyu9KqBGb4nU5Zc1DZfWGLRy9631iax0OOKKOmYv6rAEt5pDzn6AhG
	cd9k8P+NuriyV21q5x5Uxu1RgTq8SDlUJhKOqyfnx8UFcisue3aFXWgE2Brw5J/i
	hxN0q5d6UKyhim/Zi0vYFLBvfxT4ylDza08WB7CQhc04fTjadGNU00V70bPuHmWo
	uTrmfBq+IE2JoO5Zd/tYBPxGjDhiM12j3p4raLERlz3gs6rfQg1Fn8N1IX/rBtQ+
	Nz1/9ctzssBkM2TzhwVJmOfqytWfiT4HfrqCzfNamXnJvo6LiUM7u+3GdO4x/kSJ
	dsT2aiXi5xHOUUhAhKN0w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793447916; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:qbhGfjHZ+hOAKt3kcuNFwty9xJ8zAaThjTZsKJCabwAiJ//
	Gc4mlXksFbq/9nuAYsuisuffDyRolMDcmsHXLMHbv2k3zOUIPam295ggP07zD6K8
	zNADoHW6yZWSYqbPgW0MYQS2ykg/RPdrSkpOHqcRarGcL4mwuqjkkankjkJAeSRq
	OR4QNQvzoPNYldRAkXGH27SK0X7S81jnLjBr30/QezkeEo4h8nLUAf5yENPBaJDu
	VbKytWD6mzQud/4NzpEDfbXbRTHW1MjNfSy9ebt3dAr/DB5y8Fhg/Mus0EaR6guI
	M6WP5dhsV0fF5v6CNNpi0Fo014vQZS1uCZyo/aA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VJYM+D9543YL6hsMs4Jt7GhTyHfgiNDiVAYL3BgXuHU=:3O/P6hGlJNBTCdQTT+Hkcc81psQFXA1j9SFRqK/YVs4=;
X-ME-Sender: <xms:69flateGHvCBNLPClSMWeTxNuXStylmOxD3mXba7Jhkd1nS2ufDw2w>
    <xme:69flas4utf2juNGUPqrqb5qCijFPkbPpa5l8lzC460-z5CFnILi_SX4ERxYl74waA
    0QHzLqBKl3uyHv-QGjZ9IWFKmsaNv-yTrqzBZhqK0q016ig8nRZhLY>
X-ME-Received: <xmr:69flap-yGJWlgmU6W_yhoHUPws9pZVnliF53HBkNdX2FTgAXce2LTXXWPWy5Oz8a8djQu1IXL80vXzoOiy3DBq7n>
X-ME-Proxy-Cause: dmFkZTGq8+YELFxLT5Zm31AtHM8dN5rUjJM/n2TnQf+pFP64BiN2koafITX34Fi+of7xR2
    usZMBHnpD9LJoUXZw3uvBmbcv7iR5dV4tYWTip4JNGfdcWjfbIZLrpPqPva6xTMbX6v3fr
    Z2glcHWN7Fr6tsvBXC+xs0JePBaM1+7sBnE5z0aPq2Qw24C+A5sPE4Ya5Qdl/meXilZQPV
    v0WKNioLx7adryoQ84rfS4i2rE8G0l4ukLj/2AA/XJRLQm1rRblvCkiwuTD06cYE/i2J1u
    BLpSk4a4LIBVmAuvnLL2+qFYmKzaE35qmmYhRY1QBckgdZpt8AUJ3BoixOsItj1EqbMKra
    YFDgBrUHgr+IDiD7HfzV79yDcalyzjnVv1utF9w5q5Rw2rIjoWn5GMSHzpLEfNRmhoGgqN
    CEx1XEp7CLpBMxbXtN2vizEM4+YvaZG9LGdLt7mnFJ9uMSBmSl8POuEcS36BjoHUU7IiHF
    J5P1A9CC85Fct2f6ZCHj5LaOakxmnxz9zFUicnpkzvs23GD/TO7OOqIyiUeG+UK8eo81Vs
    IhyTxLUa4mM4C2CRbo6uteXMuqeFgXhKH4hBkWyQTRfVKFgOPinS/JQkazF1a+cjTT5WTB
    15MmtkPhLMa6fcTYIYLG8hIdMLuKVGBPI4u0f7YPXbUjE3FnzrPIYkrOcLRg
X-ME-Proxy: <xmx:69flamzdAZKZpzrJYLZq7FfhZ5pb5mNhAaqx4mWf8i-7f55aGZSvfw>
    <xmx:69flagGstqOuOXLVkg3GzGvarifhxajvW1lT5a3liyS6J7RyMz7qiQ>
    <xmx:69flapOhHmPn2oUQhnYjuSlWsLyOh2CfEVQCfd8qzQqyoTlgDkvcXw>
    <xmx:69flanfkkH2CYu8QskM94zFfPMjjNB5jC0rt2aCDq7o1JuJiDZvKcw>
    <xmx:7NflapvMwtXVbAjI4tCtBEJDvFn23rZSg6wSManYKzqvDmyKfgeEOhc3>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Oct 2026 07:58:29 -0400 (EDT)
Date: Sat, 31 Oct 2026 20:58:27 +0900 (JST)
Message-Id: <20261031.205827.850721536535565586.tomo@flapping.org>
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
Subject: Re: [PATCH v5 3/3] rust: math: add signed division and remainder
 helpers
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261031103206.24051-4-chenhan0017.work@gmail.com>
References: <20261031103206.24051-1-chenhan0017.work@gmail.com>
	<20261031103206.24051-4-chenhan0017.work@gmail.com>
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

On Sat, 31 Oct 2026 18:32:06 +0800
chenhan <chenhan0017.work@gmail.com> wrote:

> Delta's division and remainder implementations operate on integers and
> do not depend on time units. Move them into a math module to provide a
> common home for arithmetic helpers, with Delta as the initial user.
> 
> Expose div64_s64() for an i64 dividend and divisor, and div_s64_rem()
> for an i64 dividend and an i32 divisor. The latter returns an i64 quotient
> and an i32 remainder, matching the results of the C helper without
> exposing its output pointer. Delta's rem_nanos() uses the remainder and
> converts it to i64. Both helpers retain Rust's signed operator semantics
> and unconditional panic checks, using the existing C helpers on 32-bit.
> 
> Keep the Delta API and its panic conditions unchanged. Document the
> quotient and remainder semantics and link to the corresponding C header.
> This is separate from the preceding behavior fix so that introducing
> the math module is not required for a backport.
> 
> Assisted-by: LLM
> Signed-off-by: chenhan <chenhan0017.work@gmail.com>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Two nits, only if you respin for other reasons:

The second sentence of the SAFETY comment in div_s64_rem() could be
shorter. The old comment in time.rs said enough:

    // SAFETY: `rem` is in the stack, so we can always provide a valid
    // pointer to it.

The helpers have no examples. A doctest for each would also run as a
KUnit test for the valid inputs on both 32-bit and 64-bit.
