Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D41EE7AD
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208878; cv=none; b=hh09nLAc3AWi5enBJVcSlJ87+fzR64+ySXFxz8iCS7OfwVcmFfO0IurT+H8mQUsvgYyDsUUJ1y/W8os3rSDwaJGJERwgJnzKHKS1AdXP2LIxeldiDABA1kzrSZYJHFoYP0nUsFll2IcOl0ZbLrgkIvd1UW8dkURLcLihMpZY6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208878; c=relaxed/simple;
	bh=27TKBLVqvmk3OjPcYoB4b67c2iTmLEcq1jS2S1mD4+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RKr80hHWKU+VdFPj4LYWVQz1WWsVWhtrVm2FBHsgLsW4SdGem/1knde0wBBHo+DhxzHPXcxWSAvGc46p1fQ1nYmElt/jt503NPOJV1Lf9AAVJQCZVkic9e1o8b+/Mqcx9NnvjrHSN9K1HbKTVnDCxSYb+xYRKueVWh5vDsFN5Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLx0wFVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLx0wFVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C925FC4CED1;
	Wed,  5 Mar 2025 21:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741208876;
	bh=27TKBLVqvmk3OjPcYoB4b67c2iTmLEcq1jS2S1mD4+o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tLx0wFVYSrlbLu8DOP7OooS00piK0dJ+jlM3xEafgGWefk1qoVf3xv21YOQHqf2mR
	 0oDkN+BJqH4BjUmxXdBrmXBjDp3TgAzsQuiiUWijhmZzDaDRNo9NRb74Y9dMpeHx7R
	 kUAFEp4k2hwWWHaJISI3nUoPmokF4I0ztp/0j3JYWpMPDGaY19mqnJQKeZaAvc0XZE
	 1sGtPPdNUL+XlrDh86sntkiFay/03Ra3UW/xHyGkVVu1PEIFGpTuNkymF9DLksuBnA
	 xl7BRof/8N+Kgv/8xdkG8aT8Q7TqnOk3p1f3HXKW7BwSFiX+tNF00Ggrxef9ahoIUQ
	 DNv0qQ7fQERFQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>,
  <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Gary Guo" <gary@garyguo.net>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <Z8icwtIpZ3PO9YcZ@boqun-archlinux> (Boqun Feng's message of "Wed,
	05 Mar 2025 10:49:38 -0800")
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
	<hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
	<20250305053438.1532397-2-dirk.behme@de.bosch.com>
	<871pvbhqap.fsf@kernel.org>
	<eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
	<Z8hwGGn9huDjyDWN@tardis> <87v7sn759g.fsf@kernel.org>
	<n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
	<Z8icwtIpZ3PO9YcZ@boqun-archlinux>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 22:07:33 +0100
Message-ID: <87zfhz5gq2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Wed, Mar 05, 2025 at 06:32:11PM +0100, Andreas Hindborg wrote:
>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>
>> > On Wed, Mar 05, 2025 at 08:47:42AM +0100, Andreas Hindborg wrote:
>> >> "Dirk Behme" <dirk.behme@de.bosch.com> writes:
>> >>
>> >> > In the discussion [1] some `Opaque` documentation updates have
>> >> > been proposed. In that discussion it was clarified that `Opaque`
>> >> > is intended to be used for (partial) uninitialized or changing C
>> >> > structs. And which consequences this has for using raw pointers
>> >> > or the destruction. Improve the `Opaque` documentation by adding
>> >> > these conclusions from that discussion.
>> >> >
>> >> > Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> >> > Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/ [1]
>> >> > Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> >> >
>> >> > ---
>> >> > Changes in v3:
>> >> >    * Add the "terse" proposals.
>> >> >    * Move the non-linkage artifact from patch 1/2 to here.
>> >> >
>> >> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
>> >> >  1 file changed, 21 insertions(+), 5 deletions(-)
>> >> >
>> >> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> >> > index af30e9c0ebccb..f370cdb48a648 100644
>> >> > --- a/rust/kernel/types.rs
>> >> > +++ b/rust/kernel/types.rs
>> >> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
>> >> >
>> >> >  /// Stores an opaque value.
>> >> >  ///
>> >> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>> >> > +/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
>> >> > +/// by using [`UnsafeCell`]:
>> >> >  ///
>> >> > -/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>> >> > -/// It gets rid of all the usual assumptions that Rust has for a value:
>> >> > +/// * Initialization invariant - the contained value is allowed to be uninitialized and
>> >> > +///   contain invalid bit patterns.
>> >> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
>> >> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.
>> >>
>> >> This last one is wrong (I know it's probably my fault, sorry). It should be:
>> >>
>> >>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive** references.
>> >>
>> >
>> > Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
>> > noalias" here? If so I feel the wording might be confusing. I would
>> > suggest we don't use "uniqueness" here. Maybe something like:
>> >
>> > * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily a
>> >   unique pointer, and thus the compiler cannot just make aliasing
>> >   assumptions.
>> >
>> > (I use the wording from UnsafePinned[1], maybe there could be better
>> > wording)
>> >
>> > [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary
>>
>> I like my wording better. It says the same with fewer words, and we have
>> a more wordy section below anyway. We could combine:
>>
>>  * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive**
>>    references. That is, `&mut` [`Opaque<T>`] is not necessarily a unique
>>    pointer.
>>
>>
>> How is that?
>>
>
> I think my biggest problem is the word "allows", the phrase "allows
> aliasing" sounds like Opaque<T> provide something *optional*, however,
> as I understand it, Opaque<T> here just disallows certain optimization
> from compiler, in other words, programmers want to use `Opaque<T>` to
> forbid something, hence "allows" may not be the good word to use here?
>
> How about:
>
>   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
>     made by compiler on an *exclusive* references.

I don't object, but I feel like we should be able to define this within
the context of the Rust language, without going into details about
compiler internals.

Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
understanding.


Best regards,
Andreas Hindborg


