Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93791B041F
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952403; cv=none; b=DOWeZp+lKnboyluS+GI7DvDqYVajL5/9dolDIG1cy+FmOQLpB5NkTaVSvAD5TTT8+LUfPLom0uTxilkhlodZ0ABiYY8TkYVoUdQT3ODll5MZZ8V7pKP1mcjpZH3ZtQpmjYqO0+zNCSc9HEbGChh9lOK0cqAApHzJTtzXp1XyGa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952403; c=relaxed/simple;
	bh=sehgEn5MFULuwed4oCHT44wDHyKnMYzxVfU3Jc0gUnk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JTEF+eMdX/FlNTn5qOeU86Has0K/Mrw/NrdHCvBQkF6UTXv7dHWWg0xJDgNWDIIKXdFkVnfBtuZZ/IuKOaY1p6aVmu99GzgmE2C/vL0l9dc84kQ3EkaPXpp0ZOVhQPolI1Ti87CeAbCz5o1kgY6GbWpXRM37c9eXEz622hQ8QKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jkx2EqE+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jkx2EqE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E700C4CEE7;
	Wed, 19 Feb 2025 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952403;
	bh=sehgEn5MFULuwed4oCHT44wDHyKnMYzxVfU3Jc0gUnk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jkx2EqE+CEZa7BdYWQ/3XRolqzoYyUZRyPmwdT9QYvysljYacVv5wJIEN1Xkrh3SK
	 GkmOTfZYWHCI/HFzOw7IiwT0Zu3S3J8jodQUp2VcnSTF89IeDjNqrfrTBKJQYbuxXk
	 50Yd4kHoHZAq6ZbsnvQEkBWFdF2qoPY4bqkP/3VF7aIxvchbZBOxf07lgjpDeUQ5NN
	 pUuSRILnel4b/VLhMSxUhOImSS8c9wN24gCJ4Q56J3fFM71whiTct2OGhZ4+ADWtyT
	 UO97nxVdxzN6qi/m53pJXDx0wlX9F0vtfZgjhFhvMoUVDsdTZuMIHvpmM0faRex7jx
	 9wOgaDVJenjYg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v2 1/2] rust: types: `Opaque` doc: Add some intra doc
 linkage
In-Reply-To: <20250219055516.359454-1-dirk.behme@de.bosch.com> (Dirk Behme's
	message of "Wed, 19 Feb 2025 06:55:15 +0100")
References: <QD0GOJgCH2aX4JQuTDvwU-r5K8zcpSxD3eN6ixps2goHl3elDKOJFlkzUpSQSKaYDFls5CElJa-QXcoHLpInog==@protonmail.internalid>
	<20250219055516.359454-1-dirk.behme@de.bosch.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Feb 2025 08:59:38 +0100
Message-ID: <87y0y2e55h.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Dirk Behme" <dirk.behme@de.bosch.com> writes:

> Add some missing intra doc linkage `[...]`.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> Changes in v2:
>   * Split out this change into this extra patch (Miguel)
>
>  rust/kernel/types.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index c3dc798221dbc..8ed802444c594 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -271,10 +271,10 @@ fn drop(&mut self) {
>
>  /// Stores an opaque value.
>  ///
> -/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
> +/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>  ///
>  /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
> -/// It gets rid of all the usual assumptions that Rust has for a value:
> +/// It gets rid of all the usual assumptions that Rust has for a value of type `T`:

You yank the effect of this change in patch 2, so maybe just leave it
till then?


Best regards,
Andreas Hindborg


