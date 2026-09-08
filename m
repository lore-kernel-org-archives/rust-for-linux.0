Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E8545D9C;
	Tue,  8 Sep 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872496; cv=none; b=Ipuz69+ut3dW2QhPDcJH5Yfv7nlcLRfIh6+DkJvOGnmpq3YUUO2ryS5AXupkTyqyBH4Ki2Q+XU11V7BTlEUi6zMgjTTSgv4ZsI4Y9QEbG1lKnCrNQ16WReUsJsQZlcVrYho221yMjfJBTDGwHm1te+jEI3mIIwlTKnQnhJnWL9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872496; c=relaxed/simple;
	bh=pMOeSHDsKYOFYtRkwyrxDfhYHYauuOrZj3XIdzDVfQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oLOsu/gCsjgYDZ99joe+A2Jb3txgj6uusw9l6i/oP747IJpYsY1TfCuONKoaL04JtptLFPHbMVErM8ginAe2btaozeJcAPCS2WJeKysuxMDmCNNq8BnuFDaLK+2bHojylXEgT0TqR8v81wjRyshbaoOPGMO2nGqI8PhwNlrZv74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRd6atRC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRd6atRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33821F00A3A;
	Tue,  8 Sep 2026 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788872487;
	bh=3u4ZSLNpLujPiLXkQss3Ht8ENjBNQXFRpeFDq/oPqNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PRd6atRCTm+SjLj1CMxt5r0hmkntJIe53psxy8H11SDbkuRR6D6AnVUjRQysFz4o6
	 NDImWAU+7EqogEioRdAppPMovRGhOoyzSs0fVH7rmrI1Hn1C5ADfqa5/W4U43ny54V
	 4SQyX7vf0aLhIL7UEvN1t1bP+8V3BIBuh3VmoeDHTTPP9nwCu41zkVxXADo48QAjOs
	 6H86pgxuM7LM05yCGgETfGse671dEdBKZokv5G9XL8ioJbEk9zgVi2OFhNcHnwENBD
	 /uHBbUBPwC8/TSg6TWgWPNjNt3uyDVYeXE73lPeivhHez0UQN9it6rY0tXwnhVVqR7
	 xuoTixWsepxmQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: mike@fireburn.co.uk, rust-for-linux@vger.kernel.org, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
In-Reply-To: <20260908.201400.2113025819273270637.tomo@flapping.org>
References: <-MGvfW7sYYLrXTWvmTSX5lTwjEMfK97Q5QgNWBrHikC8aI_fyF3Sa3qzN4A9Th5lK46jMOYU4KjO59m00z4P9A==@protonmail.internalid>
 <20260826162851.2497-10-mike@fireburn.co.uk> <877blb1y3a.fsf@kernel.org>
 <20260908.201400.2113025819273270637.tomo@flapping.org>
Date: Tue, 08 Sep 2026 15:01:16 +0200
Message-ID: <87h5jzx5gj.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Thu, 27 Aug 2026 15:39:53 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "Mike Lothian" <mike@fireburn.co.uk> writes:
>> 
>>> Reading an `Instant<RealTime>` is the wrong tool for a caller that only
>>> wants a calendar time in seconds: it takes a full nanosecond timestamp and
>>> then needs a 64-bit division to get back to what the timekeeping core
>>> already maintains as a plain seconds field.
>>>
>>> Wrap `ktime_get_real_seconds()`, which is that field. Document the property
>>> that matters at the call site and that the type cannot express: the value
>>> follows CLOCK_REALTIME, so it is not monotonic and can move in either
>>> direction.
>> 
>> We recently added the concept of `TimeUnit`. For now it is exposed via
>> `Delta<U: TimeUnit>`. We could extend this to `Instant` as well to have
>> a seconds based `Instant`.
>
> I don't think that is a good idea.
>
> `Instant` is a point in time that exists to produce a `Delta`: `now()` is its
> only constructor,

`Instant` is a point in time. `ktime_get_real_seconds` return a point in
time. Whether the constructor is `Delta::now` or should be
`Instant::now` could be discussed.

> and what you do with it is `elapsed()`

I don't see the issue with `Instant<RealSeconds>::elapsed()`. You would
get a duration of seconds that has elapsed since the instant? Of course
you get all the inaccuracy that comes with using seconds resolution.

> or `Instant -
> Instant`.

Same.

> So a seconds based `Instant` has to define what `Instant - Instant`
> returns,

A `Delta<Seconds>` would be the obvious choice? I perfer `Seconds` and
`NanoSeconds`, but the abbreviated pattern is already prevalent, so
probably best to go with that.

> and `Delta<Sec>` would have no consumer.

True, but OK I guess.

> Every interface that takes a
> span takes a `Delta<Nsec>`: `fsleep()`, `udelay()`, `HrTimer::forward()`,
> `read_poll_timeout()`.

That is fine. Those APIs do not have to take `Delta<Seconds>`, they can
keep taking `Delta<Nsec>`

> `Delta` also already treats seconds as an input format
> rather than a unit, since `Delta::from_secs()` returns a
> `Delta<Nsec>`.

That is fine. In the context of `Delta::from_secs` the argument is a
duration. `Instant<Seconds>` is a logically different concept. It is a
point in time, not a duration.

> That is
> the difference from `Delta<Jiffy>`, which earned a type because the C side takes
> jiffies at the boundary and the conversion is lossy; `time64_t` is an `i64` and
> seconds to nanoseconds is exact.

Yes, we made `Delta<Jiffy>` from a need to pass a jiffy based duration
to C code. That should not prevent us from having a seconds based `Instant`.

If you are concerned about the dead code in a seconds based `Delta`, we
can gate the impls.

> And that is not how `ktime_get_real_seconds()` is used in the first place. Its
> callers need a calendar value in seconds because something outside the kernel
> fixes the format: an on-disk field, a value passed to firmware, or a userspace
> ABI field. Many of them compare it against an expiry time that came from the
> wire or from disk.

Again, sure, that is why we originally introduced these types. But I
don't think we should gate our time representing types on the rationale
of the first use case. We should represent points in time and duration
of time with a single set of types.

> Does that make sense?

I think I understand your concern, but I do not share it.

I would appreciate others to chime in on this - in either direction. How
should we represent time in general.


Best regards,
Andreas Hindborg

