Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6486E12B93
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891681; cv=none; b=mHH81hNF9wC9fSG+VnE610q4SKTg2TypxLXaaLAThpM/K+Jxqn0VkTnl0b8cWzT5KxlkF4AlcghlBubumDIqu0n4Koi3suli2q6L9O0UZ8+h7RMEErRCyyk8vntKahiQx5kpsWPfqj3cfB0U/pjQbpnawwRzBYndnJqptboNUJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891681; c=relaxed/simple;
	bh=+k7V2/G6e7IrrMrfxOhBFV0nKbZAHJ/r5dPLgdndTAM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXnWMJPVbn1zGDfFFQIuU3V6q9wREz0FOWYfM2utI5xqxQ1MM5pzsxQ7Lch+5s/XCSkyBBxcodCCfEJ+QB3mMuwwsJ6SEcZA9tcEKT2jMphz4SQJOLYkQKj1KMO5SPufZb0E0egAeQN8+5txgxwQjBejK5715bxEfLYnDEI4WHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mw2Yqirm; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mw2Yqirm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744891675; x=1745150875;
	bh=+k7V2/G6e7IrrMrfxOhBFV0nKbZAHJ/r5dPLgdndTAM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mw2Yqirm4QUNhpchRFtVaI4OjLMVMykF2CiktdQlmatdOFuQJCC7UW3NM4EwJMvZi
	 4Y51ejHXvW8x13jaLSOhktoEaXOtB+QsulfGxvbO8E5B9PH1ku/5IkBq3pvfq3p+EN
	 xl4osutYPEE7kfSGN00MI5fYye8Z/w8M/lAS96i+2tC2N5ZgAVswzZqqWOTtkFV4Ci
	 KalpHbsPbyNGDYHdLnNQhzxXzk3ICbipwhL4DDBNU1jzBr7uEX4hOFGQJROyoCF1NO
	 DkW7E4TNnO82KSAoLpKbpmi7/myGWBFKcKdxyxuWxrbTgdii9mJwq9r2JP/nIEDyy9
	 6FqMnyb+YbH4w==
Date: Thu, 17 Apr 2025 12:07:49 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
Message-ID: <D98WH0Q9TFKR.OJRQSF6F0WMQ@proton.me>
In-Reply-To: <D98EF3MYE7MJ.2B088TMY4FJU2@proton.me>
References: <20250414195928.129040-1-benno.lossin@proton.me> <20250414195928.129040-3-benno.lossin@proton.me> <Z_4mLRn-piSzuuf6@google.com> <D98EF3MYE7MJ.2B088TMY4FJU2@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 9223b07556a4f6ac7509f12399e18184f084b5f1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Apr 16, 2025 at 11:58 PM CEST, Benno Lossin wrote:
> On Tue Apr 15, 2025 at 11:26 AM CEST, Alice Ryhl wrote:
>> On Mon, Apr 14, 2025 at 08:00:20PM +0000, Benno Lossin wrote:
>>> `lint_reasons` is unstable in Rust 1.80 and earlier, enable it
>>> conditionally in the examples to allow compiling them with older
>>> compilers.
>>>=20
>>> Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/ec494f=
e686b0a97d5b59b5be5a42d3858038ea6a
>>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>>
>> Why not just always use #![feature] together with -Astable_features like
>> the kernel does?
>
> I'd like to know when a feature becomes stable, since I don't keep track
> of them like Miguel does.

Ah one more reason: `pin-init` must compile under stable (when not
enabling the `alloc` feature). And having `#![feature(..)]` is not
allowed under stable (even if the feature itself is stable).

---
Cheers,
Benno

