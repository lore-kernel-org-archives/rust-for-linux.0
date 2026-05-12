Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451538331A;
	Tue, 12 May 2026 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575212; cv=none; b=ipLRFlhlfmYH+M/m7kJViSEEHzosRRgWjaQzZewkIgqjVRh62ajvJ16dVx/Yp/4jFsZZ9T+eooJsK8E/Y+Vh17nRedH8IEA2i3IUnP4q1iZdEWF/3s0jUwkLZGhB7lLg76WU/OSjyfKCwj39GEKdaHhsKAnrF1k+Hu4tdS3QT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575212; c=relaxed/simple;
	bh=tRyx0K8UxO8YDZf+aOuyK1pfCfp906aRWfN/RtLD+mk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s4ZWCGp4doH8di8S4syDeucfTrJ7di4B9JW/dux0i7YGb9ru9x5gXn8pmpQ/aYPoqZAdeLB2KKl97gsqn/L89GRBPNYv+ktsQWFeEhRMhZ0k1o1PYS72b12JZSKJvlOeZlLvhaOVOq4CMtZdgQ0m/i1EjW3PsFZBJX0fBt8l5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPDWvz2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPDWvz2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76DEC2BCB8;
	Tue, 12 May 2026 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778575211;
	bh=tRyx0K8UxO8YDZf+aOuyK1pfCfp906aRWfN/RtLD+mk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PPDWvz2X8FGEJALezSnRnb2Wwo4y4NHw3g01ckPU7HJQADNDrCffzI3YuJ2g4X6XD
	 qK8fDR3wNBXWaZpIiUUuujye1NlYuToR/W9VTaPsmHrtKP4zBdOF36s962IrljWaj5
	 cBvMicQcbMuhZnUovaSfS9S7OstRZS8/SOjVXhqmORw0X5F9TxgI9ezEtEL6LEDNnN
	 5QRJatAHKUZDKCLqpPPkqvz+xvARvMQXR7p1/HiCaJubF6WhGiArnC90LMcqIfg+vW
	 n13E2E520xNPwZbBQhiKNjtkWagRRwqQptQ9cxmkiT+KOsAMG7FqmJVu7IjAUg1UVK
	 EpQy2jyfXsngw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com>
 <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com>
 <edX-2eKbEyxxHPE4iAz6_QOunvlvPdtIDaR0dbj7h40wJ4YAgtoTnyNVEN2MzXcGwBtnqfpkuodzBLt9pnkLpg==@protonmail.internalid>
 <aZMA_3CBEnV1Sg68@google.com>
 <87zf58ddad.fsf@t14s.mail-host-address-is-not-set>
Date: Tue, 12 May 2026 10:39:57 +0200
Message-ID: <875x4t58de.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Alice Ryhl" <aliceryhl@google.com> writes:
>
>> On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
>>> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
>>> > "Alice Ryhl" <aliceryhl@google.com> writes:
>>> >
>>> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
>>> > >> Add methods to get a reference to the contained value or populate the
>>> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>>> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>>> > >> allowing for lazy initialization that may fail. Both methods spin-wait
>>> > >> if another thread is concurrently initializing the container.
>>> > >>
>>> > >> Also add `populate_with` which takes a fallible closure and serves as
>>> > >> the implementation basis for the other populate methods.
>>> > >>
>>> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> > >
>>> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
>>> > >> +    /// with the value returned by `callable` and return a reference to that
>>> > >> +    /// object.
>>> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
>>> > >> +        if !self.populate_with(callable)? {
>>> > >> +            while self.init.load(Acquire) != 2 {
>>> > >> +                core::hint::spin_loop();
>>> > >> +            }
>>> > >
>>> > > We should not be implementing our own spinlocks.
>>> >
>>> > That is a great proverb. I'd be happy to receive a suggestion on an
>>> > alternate approach for this particular context.
>>>
>>> You can add a spinlock to SetOnce. Like I mentioned previously [1],
>>> support for waiting will require the addition of extra fields.
>
> Thanks, I'll be sure to take a look again.

I took a look at this again. I think the structure will be less
efficient if we use a spin lock.

Initialization is now
 - cmpxchg lock relaxed
 - store pointer
 - store lock release

With a spin lock it will be
 - lock acquire
 - test pointer
 - store pointer
 - lock release

All the other tests for initialization is now:
 - load lock acquire
 - load pointer

They will become
 - lock acquire
 - load pointer
 - test pointer
 - lock release


bit_spinlock does not make this any better. It just gives us 64 locks in
a u64. It does not help us store state of the data structure
(empty/populated).

Do we want a less efficient data structure in order to gain benefits of
lockdep and friends?

>> By the way, back then I suggested renaming it from OnceLock to SetOnce
>> because you did not support waiting for the value to be populated, and
>> you said you didn't need that. If you add that feature, then we should
>> rename it back to OnceLock, or create a new type OnceLock for users who
>> need that additional feature.
>
> That is fair. This is a different use case than the original one though.
> I think we should keep this as one type for code reuse, but I am fine
> with renaming to something that describe the usage better.

Please note that even though it could be added, we do not have a `wait`
method now. What we have are blocking initializers.

I personally have no opinion on the name. Is everyone in favor of
renaming to OnceLock?


Best regards,
Andreas Hindborg


