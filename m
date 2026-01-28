Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A426FD97;
	Wed, 28 Jan 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624615; cv=none; b=SsnOcRsYt9CsihtwyaCcCM08li6bif7LHjx/uBZBye2cghyutj/haLOP5F/ML7TkRwsWuiwtnpuAsp5g6QlESYDEDukN8aUKVkCwV9dvB460gJF5T1v2UH7xs/Lm/qfroDpVgJSk3ADaoLImtw4gAuRfcvRrjOFxxbfNAxxiTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624615; c=relaxed/simple;
	bh=qJL8DREn+o2MNIteb5I9nYt70XbcrKMpwtSIhuPAtQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JRcb4kM7LqFTjdQf9Ejfa8RgK0OZRDvpJce+4rI7Aeyw9wYIW07H4pn8tf+2+k3XwPwZcey19VtKoQZk9yVV0TTYw0BOZ0+uO1AyDAfWLH3cnoUEbwekgC37D5nmxvOAFN1WQxHUNyfuEWtVExqW8Rqk7YGfXFh4S8Ufdks5riI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4v3clsl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4v3clsl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA28C4CEF1;
	Wed, 28 Jan 2026 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769624614;
	bh=qJL8DREn+o2MNIteb5I9nYt70XbcrKMpwtSIhuPAtQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C4v3clslsjPnm1JXkVlLAsUFSj0XAX+vK299IcImAB5aqYeVMXDBbgtMhv4dtrRwY
	 W2qDvG8b680SkBcQI5d4Nc0RhltABzPE8Al8t0vOVqU1YCs5+CyB7Et5etjcHO9bJo
	 EkQpXcp4YZ1Vl4VbXnUA6fUNf36H4T6wy66Xu6QdzbGWF1n505unlCwPkoNhdGQacr
	 5sKx2iJHpmyFIRi98N2IkZLsCGlTbrgXO9jDTR0gjVXYffbX8MVUBZzbab8KGJX7ST
	 G9JlsXJEVE06xwShT6XT5j5+r4e3dy063OL5qRbqaRZP/xZ7HWjJb1A3IF4QWCabnC
	 IrAbXEbp9JVOA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
In-Reply-To: <CANiq72=nMQb_zKOngmKWQQeESGAovC+pE2wiD7Njxxix-BQ3Fw@mail.gmail.com>
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <HywJSfnz6Ic-AiaoIhW4WEsxI6joJea5UuRJqh_sqpDCeyEYZrOoM9ZKLgKz0V8Q00AENEnmwXATYQjlVbMEkA==@protonmail.internalid>
 <CANiq72=nMQb_zKOngmKWQQeESGAovC+pE2wiD7Njxxix-BQ3Fw@mail.gmail.com>
Date: Wed, 28 Jan 2026 19:23:27 +0100
Message-ID: <87fr7psijk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Jan 28, 2026 at 3:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> ---
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Something strange is going on with the tags.
>
>> +// SPDX-License-Identifier: GPL-2.0
>
> Please give a title to the module even if it is not public.
>
>> +use kernel::try_pin_init;
>> +use pin_init::{
>> +    pin_data,
>> +    pin_init,
>> +    PinInit, //
>> +};
>> +
>> +/// Wrapper type that alings content to a 64 byte cache line.
>
> Typo.
>
> More importantly, please add some docs and examples -- the commit
> message has more documentation than the code... :)
>
> Also, it would be nice to show a user in a second patch.
>
>> +#[repr(align(64))]
>
> Even if 64 bytes is common, wouldn't this depend on the system?
>
>> +    /// Creates a fallible initializer for `CacheAligned<T>` form a fal=
lible
>> +    /// initalizer for `T`
>
> Two typos and missing period at the end.
>
> Also just using [`CacheAligned`] would probably be simpler.
>
>> +        // SAFETY: by function safety requirements `ptr` is valid for r=
ead
>
>     // SAFETY: By the the safety requirement, `ptr` is valid for read.
>
>> +        try_pin_init!( CacheAligned {
>
> This and another one is formatted differently than we usually do.

Thanks for the comments, I agree with all.

>
>> +pub use cache_aligned::CacheAligned;
>
> It seems you want this short, in which case it should perhaps go in
> that case, but I think it is best to leave an extra level otherwise
> and let users import it.

I think I wrote this before `kernel::prelude`. I would put it in the
prelude today instead of here, what do you think about that?


Best regards,
Andreas Hindborg



