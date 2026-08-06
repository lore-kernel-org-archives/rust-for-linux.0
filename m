Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA153FBB4D
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006750; cv=none; b=gcp779RdNjIaACWz4hm8Fbgd8Ixgdqdan4kiIhoItuRnuHc3qtB/wLXJB4ti2VpZUaDqm3lsz41u6Dz/MOxhguvsr9YvBQUbLHeme6R7NVRMwqxKfG21APCol2KtISIiBSEQ7vXBFbHQqf8a/QkfM9I/3mkhZTTEnugVZbDxvao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006750; c=relaxed/simple;
	bh=0KZJa/xdu9XeiRLpB5IPbHBO2SVMpSwgVa1hUG0MkOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ofQmZWo91kTKC3T5AXnyiCjurzeZA/37doQG0pdKR4y48IW/gyFmOEQXkxZioqCSY9xyOoHMiPKuUYhyEOyn5JBmn4ThwKpPROyudn5R/uBUKr92Oj36GDdyaX7fyhQkxNue3m/BXXcgFEARU/bhbevz/opzw6MuUWKDEHbWfrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkdoduJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkdoduJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920DC1F000E9;
	Thu,  6 Aug 2026 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786006748;
	bh=0KZJa/xdu9XeiRLpB5IPbHBO2SVMpSwgVa1hUG0MkOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=IkdoduJFlzuv3+f18h7K1jkaPdTYzNNe055KWG7JmvetVeoQsByLnbOp+2mSizUaD
	 87weL1aHSV2dJq+vOJ3mOLgkWm4i2HLXlOENsA9W8XPawWA0y8QrgtUvMjODfnTBGI
	 HH77gwVOygrBkPCV4BbxL/65Gv8WrLdi4QLm0AFNk7VqOMBY6K2XKmsnzUR6AH1WxQ
	 gZgTRGvMGw1GkUzFKLyITkkOtDPRVbs7vfewnTAxKtDq8CqFTh0oZBU5Km/uJ6x6ZO
	 S0rK+FM9jbAhtIlHXabt8QLngzhSWA0FcSIRABCKBwhystwQWDQBWajHj2WrjLfBRp
	 JOVADzXESJkgg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, ojeda@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com,
 miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() rounding near i64::MAX
In-Reply-To: <20260806.172319.1970353690506890750.tomo@flapping.org>
References: <pnFuloASX9OPRE4rxnDZmJLS4_GaTn6IAT2OPZgNSvUK8JSWvobnoTZr6EifpDauCqMlUcmFmi6zeLTeBxsYsw==@protonmail.internalid>
 <20260723120907.209643-1-tomo@flapping.org>
 <87a4r094ow.fsf@t14s.mail-host-address-is-not-set>
 <xmgXpLeIWJFLUmY87yO6GRUJIsmtdLNWduv1daKl87Kxb5GFwNFolMcDnnT58_tQZm9lxrwd4W3P3b7cuYGi7A==@protonmail.internalid>
 <20260806.172319.1970353690506890750.tomo@flapping.org>
Date: Thu, 06 Aug 2026 10:58:47 +0200
Message-ID: <87ecgb4oc8.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> On Wed, 05 Aug 2026 13:39:43 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>>
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> The ceiling adjustment used saturating_add(NSEC_PER_USEC - 1) before
>>> dividing. Once the nanosecond value gets within NSEC_PER_USEC - 1 of
>>> i64::MAX the addition saturates to i64::MAX, which drops the ceiling
>>> bias and yields a result one microsecond too small.
>>>
>>> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
>>> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>>> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> It took me a little while to understand this one. Perhaps a few comments
>> explaining the boundary conditions could be warranted here?
>
> I added the comments for as_millis_ceil() [1]. You want the similar
> comments for as_micros_ceil() too?
>
> Or we could add a small helper for _ceil() and keep the explanation in
> one place.

Let's add the comment to this one, as it will go in with rust tree fixes
asap. Then you can extract to reduce duplication in your other series.
Ok with you?


Best regards,
Andreas Hindborg



