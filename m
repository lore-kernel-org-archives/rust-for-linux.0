Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018244;
	b=5mXhUMZzy6C+gCSxDicmM7jRqLoceM+FYOKhZBBon7uzssNJUTCf45E1KQx9IZTGgF/9
	 Yl60NvZnBVLCkb59GFR9YMkEDl3FOD7lErN0xpbhU7uP9YUyrRqzdD94RkBWEUvZTR7Xy
	 oBL2YPiAgiNOcI/pcY77xHJ8X3kxzpO2SAn4phxba03zsK9acPlKcYUr7tRRP9DJ8lWgN
	 yh/3w2ctAaCRiRHpgbuKCSn5QZft65955lMf8L0+zfY2WrtRMh2XJBcWiOVnFKzWYcu4z
	 UeLXTMh8dHOZftKujnAHx0N05WGT9RKcBPPvgc+L4Tc9VGE0lqCtqN0l4tLcIEj48Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018244;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=fZqCPTLTRWjDgsjvFjAIcVWHHfMJtrtuvz6U2uvn448=;
	b=2ud79hKJiDZPMTLnf8HdJrkNFaSHufMu+N+lYMa4ywxxOeYV/OJrzgLxdZd4VNoPvnqd
	 vFBRV+pyKtkwrE1TyE7ses98uxnVpJZY0Uh+QCCi0MCkLp/MKq031EZ8iDFSzPFXVVDTv
	 NplSRmGSodtM8c6toHk4vGQ234Rnjpz+54z1e74gjRZ/gNi9ES0daEgrCTiksMJ0O8qJ3
	 X5DgDFGiuvsebGnw15wydlZqKoBjyJfI+RQ8+VuiMbO8XUTW255KEa95XkfGB5b3U3cIy
	 ghTgDICsc70Y7AX4gCrG346U+hy7YZ6QlGweLDjKueNEvIbhjivsi72P+ih0vIooz+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="exiUM/qC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E96F606A31B
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exiUM/qC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC231F01828;
	Mon, 26 Oct 2026 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793018243;
	bh=fZqCPTLTRWjDgsjvFjAIcVWHHfMJtrtuvz6U2uvn448=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=exiUM/qCojYpk3ZB+rkytfMWewmEIaRXLWBtyNz9FwJi+gJu+w8daqxDqi10CkUP/
	 JkroqqUOdq4ZwckNl6MhrycdpwrF7D4N/56gh4T09VVdFbjGHjrsdiGh3U0ihplpEy
	 zXVsraUeX1wsxeQYe2i/eEDhj8X+4ARbHXAib6kfK+99VhHSmgRe8OXrY+u7rxQ0fm
	 ondPGOUObjRHsVEHdQwIKx0KM5WvviD8q81enSVV3iJ7bnYH0WvgVPoQSVnl1ATCbs
	 HZf4SaPa52aM0qf2wdwrCDUQ1O2Gu6b7YZqVGq/0IAQwtWW6uYuO+U23nPUZtZasaB
	 RsLd2P17BJz1w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu, pgovind2@uci.edu
Subject: Re: [PATCH] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
In-Reply-To: <687438f7767b2c65d9782d92a6e96387e63adc99.1791501243.git.pgovind2@uci.edu>
References: <cover.1790981219.git.pgovind2@uci.edu>
 <687438f7767b2c65d9782d92a6e96387e63adc99.1791501243.git.pgovind2@uci.edu>
Date: Mon, 26 Oct 2026 13:37:04 +0100
Message-ID: <87ecdcocy7.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Priya,

Priya Bala Govindasamy <pgovind2@uci.edu> writes:

> When a configfs attribute is written and then read through the
> same open file, the read reuses the buffer allocated for the write.
> This buffer is not zero-initialized. Writes to the attribute go
> through `fill_write_buffer()`, which allocates
> the buffer with `kmalloc`, and initializes only the input bytes
> and a trailing NUL byte.
> The read in `Attribute::show` callback creates an `&mut [u8; PAGE_SIZE]`
> to the buffer. This is unsound because the reference may include
> uninitialized bytes.
>
> Fix this by initializing the contents of the buffer to 0 in the
> `Attribute::show` callback before creating a
> reference to it.
>
> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
> Reported-by: Dylan Zueck <dzueck@uci.edu>
> Assisted-by: LLM
> Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>

Please check if this patch would solve the issue:
https://lore.kernel.org/r/20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org

Best regards,
Andreas

