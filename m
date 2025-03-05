Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AE17B401
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741195938; cv=none; b=pdRFxABs/Iup9ujqmyqg20sss/vfTlCk+OPQDbdZwQJF65cz8r1+oxoD/hGUu0mmpL7svgGDdzDRICSRiIgUN8sOendAxHqL3wcxb0ykXMvV1dLJTl7kD4OhAcIqQ4jQMOIf09t0SSLHnfhlxplLNxEc7KCKhsLZLyiOn6j80qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741195938; c=relaxed/simple;
	bh=YUt6lHj0zRfqghSI6cSCtOlYAt4wJALD2t5N6ptV2fo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EyIY1jlOfnSg7IrbvggTBfK/R1BqnY0GWTHMwxe6gBiym2Kxy138ElDWkMHwQTs942kvYK6Uc8iFaWYitdHYmQCPqBJzoF2VaiydW6uBOrg556mfY7B56nWuPtltNGFCwjA8qr9Yetnbo3AuV9hBPnJho7UQZayDxHFIIY9iE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnPWqDrk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnPWqDrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF41AC4CED1;
	Wed,  5 Mar 2025 17:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741195937;
	bh=YUt6lHj0zRfqghSI6cSCtOlYAt4wJALD2t5N6ptV2fo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SnPWqDrkZv9gyh196BASRZOEiWm+cDQaB/uG/KdtFRfDAsfkLZX35KN24yJNxkxIO
	 LSP/HfeSLZ93oikIp3piNrHtTp03C6JsR25In2WlSd1GAc0B55mbluV5ZhIkVQZxIQ
	 pFa1m8KQ7T544D+ib0KEiXWQNUKD8rZYNhwZaE1v55ZGBwESEy7vh6gaXcaFkOjbEp
	 8RgCB7d6iJyYYQfo5kJmgjDLEh57LrmCSMkT5HUfDy+WpFKo7lXjUm2YzapyCWFCsy
	 CMFC0Iod0otWS6oHOn3YLPD4n+nAkFjT5kxMWzP7/3stvNAnyRb6bIxPhoR1hX24Nr
	 FJyNspke5vw4g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>,
  <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>,
  <daniel.almeida@collabora.com>,  "Gary Guo" <gary@garyguo.net>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor
 description
In-Reply-To: <Z8hwGGn9huDjyDWN@tardis> (Boqun Feng's message of "Wed, 05 Mar
	2025 07:39:04 -0800")
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
	<hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
	<20250305053438.1532397-2-dirk.behme@de.bosch.com>
	<871pvbhqap.fsf@kernel.org>
	<eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
	<Z8hwGGn9huDjyDWN@tardis>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 18:32:11 +0100
Message-ID: <87v7sn759g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Wed, Mar 05, 2025 at 08:47:42AM +0100, Andreas Hindborg wrote:
>> "Dirk Behme" <dirk.behme@de.bosch.com> writes:
>>
>> > In the discussion [1] some `Opaque` documentation updates have
>> > been proposed. In that discussion it was clarified that `Opaque`
>> > is intended to be used for (partial) uninitialized or changing C
>> > structs. And which consequences this has for using raw pointers
>> > or the destruction. Improve the `Opaque` documentation by adding
>> > these conclusions from that discussion.
>> >
>> > Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> > Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/ [1]
>> > Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> >
>> > ---
>> > Changes in v3:
>> >    * Add the "terse" proposals.
>> >    * Move the non-linkage artifact from patch 1/2 to here.
>> >
>> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
>> >  1 file changed, 21 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> > index af30e9c0ebccb..f370cdb48a648 100644
>> > --- a/rust/kernel/types.rs
>> > +++ b/rust/kernel/types.rs
>> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
>> >
>> >  /// Stores an opaque value.
>> >  ///
>> > -/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
>> > +/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
>> > +/// by using [`UnsafeCell`]:
>> >  ///
>> > -/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>> > -/// It gets rid of all the usual assumptions that Rust has for a value:
>> > +/// * Initialization invariant - the contained value is allowed to be uninitialized and
>> > +///   contain invalid bit patterns.
>> > +/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
>> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.
>>
>> This last one is wrong (I know it's probably my fault, sorry). It should be:
>>
>>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive** references.
>>
>
> Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
> noalias" here? If so I feel the wording might be confusing. I would
> suggest we don't use "uniqueness" here. Maybe something like:
>
> * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessarily a
>   unique pointer, and thus the compiler cannot just make aliasing
>   assumptions.
>
> (I use the wording from UnsafePinned[1], maybe there could be better
> wording)
>
> [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summary

I like my wording better. It says the same with fewer words, and we have
a more wordy section below anyway. We could combine:

 * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusive**
   references. That is, `&mut` [`Opaque<T>`] is not necessarily a unique
   pointer.


How is that?


Best regards,
Andreas Hindborg


