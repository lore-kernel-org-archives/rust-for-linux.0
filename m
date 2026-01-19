Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F6B357A28
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820689; cv=none; b=BfiZqsxYl29vWVI0dvCeTdrBqI2IX2zK3BakXPzOvPUunHfhd/aB40XKj9NN3G4d9Hmt2Izg9gXIlzUlkH95I8smrSInD+X0+r2Zs6NX55TR3QgTSThjp54RpOwE949pFRXESTQpepgqg9MUbXIKdMxMi/7om2TT8/YK4DlAZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820689; c=relaxed/simple;
	bh=5fl6rZz1BBPL/G0EJ0WuNJuKG4+iiaRVSL6J8cbZ8ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Drqw8ukhnQDBrlISAMYdL9II0QyYHsIopDrZzodrbvyiqtsSy6yepPx0a7oqzfMRMmBEgTCeD4TOoesb/rLAUsCws6wR0U9ZMAcPKfrRx/Wpipc7fGSlVxX4yf3kvlljKe4FzIFzPRv90cQKSNITKQ4wzSfsVUHbgV1QSC5BGO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXmRNCTM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXmRNCTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354C5C116C6;
	Mon, 19 Jan 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820686;
	bh=5fl6rZz1BBPL/G0EJ0WuNJuKG4+iiaRVSL6J8cbZ8ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kXmRNCTMzELsZr69EeidAqnT4Hk1f571GnjSK2htyYvw1MDXNeJ+P7dgtJcST7EQY
	 RGozCKcvX2EbetHLhKj6IPL0cCuWpON57ZcMfXqVtszORaaMYS3V6rF9gnAOeH5Mdq
	 pxviCPIPIqAQJBgfSPGHBwHD2GnbB5ZZoNg9FwNzwMAdQl/XWrVVZ+G4hrBZRzde8f
	 16H2pDehZLM0BSIbhph5bqc2fffEoX6CQ5k7FCCGn14hqJQG6Yb5DO/rLPfa7//a54
	 AlhY7O4ZTtTO4BuG9bHfPUAzwCp5ylJbiZxNa8esGh8ITEu+ArzIqpgt/zphZYDDXe
	 OKeOjtRk2I+0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Ke Sun <sunke@kylinos.cn>, rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v1 3/7] rust: block: mq: use pin_init::zeroed() for tag_set
In-Reply-To: <20260119065859.1914178-4-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
 <QJrOKf511_qMc036mdL72rXp0CsXOGBuY9y66noEOWvj3EMdDpLiNQlGVWCFK2NLpPckzgJnJv0NJK7EzKxQdw==@protonmail.internalid>
 <20260119065859.1914178-4-sunke@kylinos.cn>
Date: Mon, 19 Jan 2026 12:04:25 +0100
Message-ID: <87h5shq2x2.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ke Sun" <sunke@kylinos.cn> writes:

> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
> blk_mq_tag_set initialization.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/block/mq/tag_set.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
> index c3cf56d52beec..6de72b7f61b38 100644
> --- a/rust/kernel/block/mq/tag_set.rs
> +++ b/rust/kernel/block/mq/tag_set.rs
> @@ -38,9 +38,9 @@ pub fn new(
>          num_tags: u32,
>          num_maps: u32,
>      ) -> impl PinInit<Self, error::Error> {
> -        // SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
> +        // `blk_mq_tag_set` only contains integers and pointers, which
>          // all are allowed to be 0.
> -        let tag_set: bindings::blk_mq_tag_set = unsafe { core::mem::zeroed() };
> +        let tag_set: bindings::blk_mq_tag_set = pin_init::zeroed();

Same here, I think we can remove the comment.


Best regards,
Andreas Hindborg



