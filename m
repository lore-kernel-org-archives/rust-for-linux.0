Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3E3BBFD0
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360279; cv=none; b=N72GQqRm+GFZurvSdFYcISwRWFGASoHDP4g1DhEXsJEmuwNReymVoWvuMA+dUo3/PBNSOwtOkkmFhQnI98J76ZB/O4u84fUgcBc1kJ15YzYNuaiKQxnGRCWbqAeg0ott0EtQZV91SX56961uvPnlXM9//flnvhoHyW8K7wI3vXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360279; c=relaxed/simple;
	bh=vSjWP08xbUV8y/ztIqe7Ju1AHKbcH7wENQUyZIwUpa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l7fTEfC28wPyeqTmuPmYX34+dPx8qxcNpgBZ7faGpyBvr1mPSLf2vQnfdcxQ4jMnCHVikqdyQHrB8IJ7FT7cXWL92YRi5gG0uzd6knrcMyOJZ/4d2mVLd/pU/vDnVDWRlmr8XcLSr+rpOseXg1OVW+ryvshEZYzZ/9CzIzwvipY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSj89ecK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSj89ecK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6931F00A3A;
	Mon, 10 Aug 2026 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360277;
	bh=vSjWP08xbUV8y/ztIqe7Ju1AHKbcH7wENQUyZIwUpa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KSj89ecK4ILtljQs1VzBM7F5OJBzty9MUW5SUZkWO4J+0enG0WaNZFvcceZstub2z
	 EPkNjPoTAN3oL8Ay2L2FIagzlN6JQ0hoO3Z7VUnbuUCesuNwANPiCNDEVUFc5mp317
	 gwWbXD58/fukrR/QV1buWP8ifLoj8QvYuD66NI9Tl0HevpgiVoebU7vQCsvIKJhzwP
	 vzTfeqgl+obvSfF5aafrrHpqPA0xihbSqw6aavxz7ggZ91bPdNNULBlzbDv/7vQnpV
	 9pKcxg733NQErH65/l7fbKd8U8tcsus3UwhnZGRkKsh4CMUgYkOyUTMw5ElAFgnTWB
	 ss4/5zYfs7g2g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 1/2] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260807233039.1091842-1-tomo@flapping.org>
References: <gaVV23pVoQuUbm5qsnhQShsVZfOivBkIjMB8yfwrQCi7DeMizBafFVFI0bol4_aolii89peid2LdkWIBA9nMig==@protonmail.internalid>
 <20260807233039.1091842-1-tomo@flapping.org>
Date: Mon, 10 Aug 2026 13:11:00 +0200
Message-ID: <87h5l22ptn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> HrTimer::expires() previously read node.expires via a volatile load, which
> can race with C-side updates. Rework the API so it is only callable with
> exclusive access or from the callback context.
>
> Introduce expires_unchecked() with an explicit safety contract, switch
> HrTimer::expires() to Pin<&mut Self>, add
> HrTimerCallbackContext::expires(), and route the read through
> hrtimer_get_expires() via a Rust helper.
>
> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

This looks good to me now.

@Miguel, can you take this through rust or rust-fixes? Please add the
missing bullet in the invariant on patch 2.

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


