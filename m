Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0C43254B4
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404485; cv=none; b=rtxC2j3YIz38P32ZWveM8VHZpiJIym74y55bRuUQUtwU75LeC4jrtXuDOHxEq06ZKc7G0E6Qy1AZyppsEzLL5FT2nTjg2a/MiDR05TOrLX9HX17QRca7GKjEBJLn4UBFNPjkfV8H6JrHBT6WoYKHDOFv6A672qaFe4F2lxF7JuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404485; c=relaxed/simple;
	bh=k9PqqN5H5le5fCu01Yp11wurKO3JlCjDqu0u+gfwrdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AmELGbjCqxyz3j/AJOC6jSmSzvjgszQ+z1x3cGu3DSS5zYZPPJBN3IWM3INvpDRoqcCj3B6SDkEUxw+BWViwyyAGJSzvqzmZbutrUCsZ530Wd5vGAZxkA6K3rX1CFe/1vgOsvVMzIOzzT16TWyDVtcioO1eq31C9NT3dJ5TkeuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLyKHTN/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLyKHTN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18396C19421;
	Wed, 18 Feb 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771404485;
	bh=k9PqqN5H5le5fCu01Yp11wurKO3JlCjDqu0u+gfwrdc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QLyKHTN/WcYxDps1vUTTG/pvRsmR1zHm4LrOU2+MVlj3Egjy7iUD0yuVIeKYgeGM1
	 2C10zi9i/kF4lUTnwl/KD2xWGYZd7vlZr1udS67y85oUeDIKVUnLQtbnqBV9nux8yR
	 yymvgmWkvtxUeK3Z7JYun6SHJEQfEdMjSwEgLZqF93thhCUPFjhaOIROefxEwYwaTu
	 QHSldpty3bvTX5G7R/QD52f/wb5KX1FlfHv+du+xqmU5wznk6Mi9AogVeANhQIXgGm
	 awjSU7ctNGxiA2gQGHIdkySgII/JpYJQ/wDtcP/dVlrVZdaQPiSznTVrrVA8D/ASoK
	 xRcxGJhRihHOw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Daniel Gomez
 <da.gomez@kernel.org>, linux-mm@kvack.org,
 lsf-pc@lists.linux-foundation.org, Alice Ryhl <aliceryhl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Daniel Gomez
 <da.gomez@samsung.com>, gost.dev@samsung.com, Greg KH
 <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@inria.fr>, Kairui
 Song <kasong@tencent.com>, Luis Chamberlain <mcgrof@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, Tamir
 Duberstein <tamird@gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Evaluating Rust for XArray
In-Reply-To: <CANiq72nTOpGw6JhrMLK47+7TCJjrLRdNebctrmj5xO6yqAqSuQ@mail.gmail.com>
References: <aZRncP-sKLLS2K1U@macos>
 <ix0mR76G9a_ieuQUUkkfHMJIviAsrFaO859172fuFx9Goj7QdIfz1jtnv3ptubGEC7uEFCvVfEoWxcisUnTi1g==@protonmail.internalid>
 <aZR-ItMBkiqyBdKd@casper.infradead.org> <87bjhncl7j.fsf@kernel.org>
 <-MAJTecRs9k_Y3XGSFfdzJ3acTO2nemK8gQMmbYlAc40NjtX0hr75PYmNqNA9rA8QmGOtvZw8oIsyQzpmPxf9g==@protonmail.internalid>
 <CANiq72nTOpGw6JhrMLK47+7TCJjrLRdNebctrmj5xO6yqAqSuQ@mail.gmail.com>
Date: Wed, 18 Feb 2026 09:47:26 +0100
Message-ID: <87y0kqbfq9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Feb 17, 2026 at 6:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> We can, and should, start evaluating if we
>> can deploy Rust in this area now. We might find that we are lacking
>> something from the Rust language to do what we want. We can work with
>> the Rust developers to make sure that the Rust language gets all the
>> bells and whistles that it needs, to support the use cases we have for
>> the Linux kernel.
>
> To clarify for others that may not have the context...
>
> We are already working with upstream Rust (and have been for years
> now) on improving the Rust language for the Linux kernel. We have
> regular meetings with them every two weeks, and have a shared roadmap.
>
> To give a sense of the collaboration status, some major language
> features are getting developed with/for/by the Linux kernel and the
> kernel is even built in their pre-merge CI.
>
> In terms of discovering features needed, I don't think there will be
> big surprises there, given all the work done so far. But if the plan
> is to expose a C API, then we may actually find we want new things
> from the C language instead! :)

I can lead with an example of what I mean.

The C xarray uses a few different node types internally. Pointers to
these nodes encode information about how to decode the pointee, in the
lower two bits of the pointer. This is possible because of alignment
guarantees of the pointee. It's a neat trick, basically implementing the
pointer as a tagged union, without requiring extra memory for the tag.

In Rust, enums are tagged unions implemented by the compiler. This is
necessary to provide memory safety and avoid type confusion bugs. The
compiler will usually implement the discriminant as an extra word.
Sometimes it is able to optimize the encoding of the discriminant to
avoid this extra word. This is the case for the `Option<NonNull<_>>`
type for instance. The compiler knows that `NonNull` never uses the bit
pattern of all zeroes, and it assigns that bit pattern to be the `None`
variant of the `Option<_>` type. All bit patterns that are not all zero
will be the `Some(NonNull)` variant.

But the rust compiler is not currently able to utilize knowledge about
alignment to encode tagged union discriminant in the lower order bits of
a pointer. So when we implement xarray internal node pointers in Rust
today, we do so the same way the C code does it; by manipulating a
pointer value and injecting metadata into the lower order bits. This is
of course an unsafe operation, because dereferencing a pointer that has
been manipulated in this way can lead to loads or stores to arbitrary
places, if done wrong.

We talked to our contact points with upstream Rust about this, and they
believe the compiler and language could be made able to do this in a
safe way.

We will try to push for this optimization to be available in the
compiler, because it gives everyone a safe way to access this trick. And
it would allow us to cut a big chunk of unsafe code from our Rust XArray
implementation. Memory safety is one of the reasons for looking into
this work, after all.

Not having this optimization does not mean that Rust is not ready. But
if we can get it, it would be great.

I can't tell if we will run into more situations like this one when we
try to apply Rust in various places in the kernel. And this is one of
the reasons that we should do this work.


Best regards,
Andreas Hindborg


