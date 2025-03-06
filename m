Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8314311185
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257920; cv=none; b=PGP4HELRv68NCj1PuZerFeJTgXfhTRpJXjJrjpkTb0UAQo01f3WPWANyCbPjCo8CoNhGHp/pCQYO8R/4AEtpHTf28r1lTr30ft12TnJyOAP2DD99FFlxQKHSjJ9h+CutY2AyvClUfFdtwhrVzWVivVtx0BOXYqFieMwp7NLF9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257920; c=relaxed/simple;
	bh=wix6JvrXb9ZUMa3J1QAKbun2rdy970JoDYt9jdzMmi0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2HLloBouGKOlI0sB36oT14Af63byuMQrcv0ZQgp7nwKCCz1LHVUH+0p+lZALJ6+HPGSd0SdRJgC5Ck2HmaDDG43h8xq6u8aqtAEc8IgLAWSrzpoUZlVoV/OLhKvtBpH/ShsTyfL59gEAaUeTfj++I894KIZ2cdNEoyfwttgU3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=QADrgFg1; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="QADrgFg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=eoauvfnxonen7gvdiilrlijr5u.protonmail; t=1741257909; x=1741517109;
	bh=QCxYvszXgrxZyxHbl1HWPNQL1TkXoC8quLRdHuky13g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QADrgFg1bxAFucoTD18itXxuNK9ielk2B2ldqaiCXFkxQpe6T7rOkuhctk5TrcSjA
	 7Um2nuW74OxNNkuYsoGiMk7O2Edl/3VnN9HzzG2ZzSjX2t950JPMR6X95XFZ0JBXhH
	 5oyxbDBuF8a33V0jGN1XSZfbgw4LgADWiYaBVuwWDs0KqEg1xURm2OhIPzdYo65yN4
	 4Sw6QVxMrV9vuCKJbSxrsYTJYpXjjEegNuPohzoXKBjOyBShxD8b/rr2nJpcX4a9nq
	 5/7gFEj/8gmmswwOJVxyTOl8yNZwGvrcMyAzkmrKYBFMwT9suQu21Om+zakGWUKS86
	 XK4qIqroLzisw==
Date: Thu, 06 Mar 2025 10:45:00 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, ojeda@kernel.org, daniel.almeida@collabora.com, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor description
Message-ID: <D894EPDF6Q5H.38KZS9M7T6HEI@proton.me>
In-Reply-To: <87o6ye5wbs.fsf@kernel.org>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com> <Z8hwGGn9huDjyDWN@tardis> <87v7sn759g.fsf@kernel.org> <n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid> <Z8icwtIpZ3PO9YcZ@boqun-archlinux> <87zfhz5gq2.fsf@kernel.org> <DJwmmXRi4oxEM1aRRHh2SekW5eo0beS5JIfsvphgxDldFDRtXNG_2GDvuV5u5Yxj0Tfi4wau55m44VjbhTTCyw==@protonmail.internalid> <Z8k6J-rLXUp9y-o1@tardis> <87o6ye5wbs.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b46cc86491162951202f00dc313de2d1a04d2501
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 6, 2025 at 10:42 AM CET, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
>
>> On Wed, Mar 05, 2025 at 10:07:33PM +0100, Andreas Hindborg wrote:
>>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>>
>> [...]
>>> >> >> >  rust/kernel/types.rs | 26 +++++++++++++++++++++-----
>>> >> >> >  1 file changed, 21 insertions(+), 5 deletions(-)
>>> >> >> >
>>> >> >> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> >> >> > index af30e9c0ebccb..f370cdb48a648 100644
>>> >> >> > --- a/rust/kernel/types.rs
>>> >> >> > +++ b/rust/kernel/types.rs
>>> >> >> > @@ -271,17 +271,33 @@ fn drop(&mut self) {
>>> >> >> >
>>> >> >> >  /// Stores an opaque value.
>>> >> >> >  ///
>>> >> >> > -/// [`Opaque<T>`] is meant to be used with FFI objects that ar=
e never interpreted by Rust code.
>>> >> >> > +/// [`Opaque<T>`] opts out of the following Rust language inva=
riants for the contained `T`
>>> >> >> > +/// by using [`UnsafeCell`]:
>>> >> >> >  ///
>>> >> >> > -/// It is used to wrap structs from the C side, like for examp=
le `Opaque<bindings::mutex>`.
>>> >> >> > -/// It gets rid of all the usual assumptions that Rust has for=
 a value:
>>> >> >> > +/// * Initialization invariant - the contained value is allowe=
d to be uninitialized and
>>> >> >> > +///   contain invalid bit patterns.
>>> >> >> > +/// * Immutability invariant - [`Opaque<T>`] allows interior m=
utability.
>>> >> >> > +/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of =
shared references.
>>> >> >>
>>> >> >> This last one is wrong (I know it's probably my fault, sorry). It=
 should be:
>>> >> >>
>>> >> >>   /// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of *=
*exclusive** references.
>>> >> >>
>>> >> >
>>> >> > Hmm... are we trying to say "`&mut Opaque<T>` still cannot mean
>>> >> > noalias" here? If so I feel the wording might be confusing. I woul=
d
>>> >> > suggest we don't use "uniqueness" here. Maybe something like:
>>> >> >
>>> >> > * Always aliased invariant - `&mut` [`Opaque<T>`] is not necessari=
ly a
>>> >> >   unique pointer, and thus the compiler cannot just make aliasing
>>> >> >   assumptions.
>>> >> >
>>> >> > (I use the wording from UnsafePinned[1], maybe there could be bett=
er
>>> >> > wording)
>>> >> >
>>> >> > [1]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#summ=
ary
>>> >>
>>> >> I like my wording better. It says the same with fewer words, and we =
have
>>> >> a more wordy section below anyway. We could combine:
>>> >>
>>> >>  * Uniqueness invariant - [`Opaque<T>`] allows aliasing of **exclusi=
ve**
>>> >>    references. That is, `&mut` [`Opaque<T>`] is not necessarily a un=
ique
>>> >>    pointer.
>>> >>
>>> >>
>>> >> How is that?
>>> >>
>>> >
>>> > I think my biggest problem is the word "allows", the phrase "allows
>>> > aliasing" sounds like Opaque<T> provide something *optional*, however=
,
>>> > as I understand it, Opaque<T> here just disallows certain optimizatio=
n
>>> > from compiler, in other words, programmers want to use `Opaque<T>` to
>>> > forbid something, hence "allows" may not be the good word to use here=
?
>>> >
>>> > How about:
>>> >
>>> >   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
>>> >     made by compiler on an *exclusive* references.
>>>
>>> I don't object, but I feel like we should be able to define this within
>>> the context of the Rust language, without going into details about
>>> compiler internals.
>>>
>>> Without `Opaque` it is illegal to have aliased `&mut T`. With `Opaque`,
>>> it is legal to have aliased `&mut Opaque<T>`. Or at least that is my
>>> understanding.
>>>
>>
>> Oh, I see. That's why you used "allows", however, allow me to explain
>> why it looks confusing to me. For `&mut T`, we can still have an
>> aliasing pointer (a pointer that points to the same variable as the
>> mutable reference):
>>
>> =09let mut x =3D ...;
>>
>> =09let mut_ref =3D &mut x;
>> =09let aliased_ptr =3D mut_ref as *mut _;
>>
>> it's just that if we dereference the pointer while the `&mut T` exists,
>> it's UB, e.g.
>>
>> =09unsafe { *aliased_ptr =3D ... };
>
> Right.
>
>>
>> and `Opaque<T>` allows above to be not a UB (there still are rules like
>> we cannot have data races, violating these rules would still be UB).
>
> Yes.
>
>> So to me "aliasing" can mean "having an aliasing pointer", and that as
>> shown above can be provided by both non-Opaque and Opaque cases. I
>> wonder whether "allow aliased/aliasing accesses" is better than "allow
>> aliasing" here.

I disagree, to me "aliasing pointer" means having two pointers that
point to the same value and that you can use in an interleaved fashion
for writes and reads.

> Yes, I think that would be better.
>
> I had another thing in mind when I wrote the text, and I am wondering if
> it is incorrect. As far as I know it is normally illegal to have more
> than one `&mut T` to the same `T`, even if no access occur through these
> references.

The rules aren't completely set and IIRC you *can* create multiple
references as long as the value they point to is not read or written to
while they exist. But I wouldn't bet anything on that...

> With `Opaque<T>`, is it still illegal to have two `&mut Opaque<T>` to
> the same `T` in existence? I thought it was not illegal in this case.

Yes it is legal to have multiple `&mut Opaque<T>` pointing to the same
value (and writing/reading through the `get` method or directly by
having another `Opaque<T>` value).

> At any rate, your wording is probably the most accurate:
>
>   * Uniqueness invariant - [`Opaque<T>`] disallow alias assumptions
>     made by compiler on an *exclusive* references.
>
> Alternatively, if we do not want to refer to compiler assumptions:
>
>   * Uniqueness invariant - [`Opaque<T>`] makes aliasing accesses to the
>     underlying `T` well defined.

This wording doesn't sound right to me, since it's still illegal to have
multiple `&mut T` that point to a value inside of an `Opaque<T>`.

---
Cheers,
Benno

