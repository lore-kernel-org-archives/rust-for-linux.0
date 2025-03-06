Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D6199935
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254176; cv=none; b=cUK6kAUCqBejKVLn+JPRp2iOqILMBXnY27f/UXsb96M5+OvpI+TD80OwOmOC3RubPiL2xJ/dXVDFX/O1DxMUDyD7kmD1b5YFgFGlNQl+nrs2gM7WNuNGvrDBTIZ85F5g36nr6OR6i9McNiL48zOBOGV6qr3zjZkMpXEkaSRVdTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254176; c=relaxed/simple;
	bh=Fq9SaQI/2OwWEr4YhcIiVOcqvPahsrSawmfqFeBO4iQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AV8fvq2Nk7sAk0CCw9kd7X1LeB3QVLdG8jOqWNqnqxs+XKaWL5+LCy//VOuxi+NKjycWgtotRr4852k8QEMF10u3p+HLSrd608yfOEJrIO7TFieL+rQa0r/20S2onneCPHysTtsGaFurSyj6c2jB6C1392TaTPKqKTjk8nTJLY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8vwI+h7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8vwI+h7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8BFC4CEE0;
	Thu,  6 Mar 2025 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741254175;
	bh=Fq9SaQI/2OwWEr4YhcIiVOcqvPahsrSawmfqFeBO4iQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m8vwI+h7T1Ym/gCpsabcvlO+ydhH/GIaiHmMr18ATW8bnrTRRN0e0zLCm+xzfKDYu
	 Q6VQ8Gaaclu+5K6gRFIm13/kk5lJqW2VYSmDQQO8tB4Hmijn1nx5jvv9GEf3+i2QKE
	 6dkQZRMMnQFNo2KJZcpuylsQugY8+CAaqKMvpw3BtOLd8seu2xM5Fsjon5uIyFLIRN
	 OS5006wc0f1QM4buXUjK5kXLrWdgLwdL5QVRH6JrQV5GS/C6zCSZ84EZ0yXQOS9Whr
	 wTAtFX91fJ20Z/a4vSt2WzEyMsUZYpxxBB4We+REMUPqL6NUwQyCGL5v15KaguwGCA
	 kqKhSo7mgMunw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>,
  <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Gary Guo" <gary@garyguo.net>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <Z8k6J-rLXUp9y-o1@tardis> (Boqun Feng's message of "Wed, 05 Mar
	2025 22:01:11 -0800")
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
	<hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
	<20250305053438.1532397-2-dirk.behme@de.bosch.com>
	<871pvbhqap.fsf@kernel.org>
	<eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
	<Z8hwGGn9huDjyDWN@tardis> <87v7sn759g.fsf@kernel.org>
	<n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
	<Z8icwtIpZ3PO9YcZ@boqun-archlinux> <87zfhz5gq2.fsf@kernel.org>
	<DJwmmXRi4oxEM1aRRHh2SekW5eo0beS5JIfsvphgxDldFDRtXNG_2GDvuV5u5Yxj0Tfi4wau55m44VjbhTTCyw==@protonmail.internalid>
	<Z8k6J-rLXUp9y-o1@tardis>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Mar 2025 10:42:47 +0100
Message-ID: <87o6ye5wbs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Wed, Mar 05, 2025 at 10:07:33PM +0100, Andreas Hindborg wrote:
>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>
> [...]
>> >> >> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
>> >> >> >  1 file changed, 21 insertions(+), 5 deletions(-)
>> >> >> >
>> >> >> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> >> >> > index af30e9c0ebccb..f370cdb48a648 100644
>> >> >> > --- a/rust/kernel/types.rs
>> >> >> > +++ b/rust/kernel/types.rs
>> >> >> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
>> >> >> >
>> >> >> >  /// Stores an opaque value.
>> >> >> >  ///
>> >> >> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>> >> >> > +/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
>> >> >> > +/// by using [`UnsafeCell`]:
>> >> >> >  ///
>> >> >> > -/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>> >> >> > -/// It gets rid of all the usual assumptions that Rust has for a value:
>> >> >> > +/// * Initialization invariant - the contained value is allowed to be uninitialized and
>> >> >> > +///   contain invalid bit patterns.
>> >> >> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
>> >> >> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.
>> >> >>
>> >> >> This last one is wrong (I know it's probably my fault, sorry). It should be:
>> >> >>
>> >> >>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive** references.
>> >> >>
>> >> >
>> >> > Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
>> >> > noalias" here? If so I feel the wording might be confusing. I would
>> >> > suggest we don't use "uniqueness" here. Maybe something like:
>> >> >
>> >> > * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily a
>> >> >   unique pointer, and thus the compiler cannot just make aliasing
>> >> >   assumptions.
>> >> >
>> >> > (I use the wording from UnsafePinned[1], maybe there could be better
>> >> > wording)
>> >> >
>> >> > [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary
>> >>
>> >> I like my wording better. It says the same with fewer words, and we have
>> >> a more wordy section below anyway. We could combine:
>> >>
>> >>  * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive**
>> >>    references. That is, `&mut` [`Opaque<T>`] is not necessarily a unique
>> >>    pointer.
>> >>
>> >>
>> >> How is that?
>> >>
>> >
>> > I think my biggest problem is the word "allows", the phrase "allows
>> > aliasing" sounds like Opaque<T> provide something *optional*, however,
>> > as I understand it, Opaque<T> here just disallows certain optimization
>> > from compiler, in other words, programmers want to use `Opaque<T>` to
>> > forbid something, hence "allows" may not be the good word to use here?
>> >
>> > How about:
>> >
>> >   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
>> >     made by compiler on an *exclusive* references.
>>
>> I don't object, but I feel like we should be able to define this within
>> the context of the Rust language, without going into details about
>> compiler internals.
>>
>> Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
>> it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
>> understanding.
>>
>
> Oh, I see. That's why you used "allows", however, allow me to explain
> why it looks confusing to me. For `&mut T`, we can still have an
> aliasing pointer (a pointer that points to the same variable as the
> mutable reference):
>
> 	let mut x = ...;
>
> 	let mut_ref = &mut x;
> 	let aliased_ptr = mut_ref as *mut _;
>
> it's just that if we dereference the pointer while the `&mut T` exists,
> it's UB, e.g.
>
> 	unsafe { *aliased_ptr = ... };

Right.

>
> and `Opaque<T>` allows above to be not a UB (there still are rules like
> we cannot have data races, violating these rules would still be UB).

Yes.

> So to me "aliasing" can mean "having an aliasing pointer", and that as
> shown above can be provided by both non-Opaque and Opaque cases. I
> wonder whether "allow aliased/aliasing accesses" is better than "allow
> aliasing" here.

Yes, I think that would be better.

I had another thing in mind when I wrote the text, and I am wondering if
it is incorrect. As far as I know it is normally illegal to have more
than one `&mut T` to the same `T`, even if no access occur through these
references.

With `Opaque<T>`, is it still illegal to have two `&mut Opaque<T>` to
the same `T` in existence? I thought it was not illegal in this case.

At any rate, your wording is probably the most accurate:

  * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
    made by compiler on an *exclusive* references.

Alternatively, if we do not want to refer to compiler assumptions:

  * Uniqueness invariant - [`Opaque<T>`] makes aliasing accesses to the
    underlying `T` well defined.



Best regards,
Andreas Hindborg


