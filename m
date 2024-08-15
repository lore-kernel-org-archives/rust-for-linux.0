Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB31714D0
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723728298; cv=none; b=SJXmnkVihubjpCA/1YxpE87KJmIc0O+TChfQbPk3m4wYvyAx0lrRJfr1TTz89+85nIA1lIPHSCQLUO8n+EHdoblF5dbYzAMAQ5XRtVpE2GiXjXY6g0TTq6K8/2xU8/WoEzWEUKMS7RgUZv4FB6S31/fLb5e0JpqwlM5Clkg++KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723728298; c=relaxed/simple;
	bh=FMUGOuajKyHTFH9u5tNpnNSvmkR75tGzNAEVW81ZOIQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbXcVxU4Nurb9vgMBOdu59eSZSbkX3Lz403PG4bZn6D0QV1BmRCD/++bh+eO5tH64EDe+A4He+OXgzqv+4yR2/pgqoxL+3NXr/cq4E10uJs/CxXFTKDougMwodL5U2/UyQiNZxrN6/ObmHpCtjojhSimKtjNeCYzSNqD6JNF7Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nu0Nu4Ec; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nu0Nu4Ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723728293; x=1723987493;
	bh=FMUGOuajKyHTFH9u5tNpnNSvmkR75tGzNAEVW81ZOIQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nu0Nu4EcX121OuyUu+gqX57ZxpaD89GsTOG4XArgK727k+VNKjJqxG34JjvM/fMox
	 QljUM54jYei8hmVzvt5c5RdSKtCCmMpdeG9CZEO7DKC1J17CZ7sFD3T7X/mhfahPno
	 fsHQJf1qeDfREd1GZJqL7TEFhK9IbH8ODmbtk/+8LNPaCzMFiDQlC8se04Kw77F+B0
	 fJM2qGIAmZWY4Fcqc1oUtuSjM7cVfv831bRHdpBT/3NV7OqMVuYHtL3Gq1eTD3Uljg
	 z969O7zZIaWwAfYmNV5wvcxdOyDK0rCfka4/fgJsfE2dn61RXtg1yu4Hvoopteu3ii
	 rzPeCzHL7ai/w==
Date: Thu, 15 Aug 2024 13:24:47 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org, daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 09/26] rust: alloc: implement kernel `Box`
Message-ID: <56ebda7b-c570-4dc6-8456-ab768d3a4b77@proton.me>
In-Reply-To: <Zr0ocI-j3fZZM7Rw@cassiopeiae>
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-10-dakr@kernel.org> <a69e7280-7291-49f7-a46f-1ad465efce04@proton.me> <Zr0ocI-j3fZZM7Rw@cassiopeiae>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a4f9b902f88d07b334aa99c53ec0e419bff8c295
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14.08.24 23:58, Danilo Krummrich wrote:
> On Wed, Aug 14, 2024 at 05:01:34PM +0000, Benno Lossin wrote:
>> On 12.08.24 20:22, Danilo Krummrich wrote:
>>> +/// The kernel's [`Box`] type - a heap allocation for a single value o=
f type `T`.
>>> +///
>>> +/// This is the kernel's version of the Rust stdlib's `Box`. There are=
 a couple of differences,
>>> +/// for example no `noalias` attribute is emitted and partially moving=
 out of a `Box` is not
>>> +/// supported.
>>
>> I would add "But otherwise it works the same." (I don't know if there is
>> a comma needed after the "otherwise").
>=20
> There are more differences we don't list here, and probably don't need to=
.
> Hence, saying that it otherwise works the same isn't correct.
>=20
>> Also I remember that there was one more difference with a custom box
>> compared to the stdlib, but I forgot what that was, does someone else
>> remember? We should also put that here.
>=20
> Obviously, there are also quite some API differences. For instance, `Box`
> generally requires two generics, value type and allocator, we take page f=
lags
> and return a `Result`, where std just panics on failure.

Oh yeah that's true. The things listed above don't really refer to API
stuff, so I didn't consider that. How about changing "couple
differences" to "several differences"? Also adding that the APIs are
different would not hurt.

>>> +///
>>> +/// `Box` works with any of the kernel's allocators, e.g. [`super::all=
ocator::Kmalloc`],
>>> +/// [`super::allocator::Vmalloc`] or [`super::allocator::KVmalloc`]. T=
here are aliases for `Box`
>>> +/// with these allocators ([`KBox`], [`VBox`], [`KVBox`]).
>>> +///
>>> +/// When dropping a [`Box`], the value is also dropped and the heap me=
mory is automatically freed.
>>> +///
>>> +/// # Examples
>>> +///
>>> +/// ```
>>> +/// let b =3D KBox::<u64>::new(24_u64, GFP_KERNEL)?;
>>> +///
>>> +/// assert_eq!(*b, 24_u64);
>>> +///
>>> +/// # Ok::<(), Error>(())
>>> +/// ```
>>> +///
>>> +/// ```
>>> +/// # use kernel::bindings;
>>> +///
>>> +/// const SIZE: usize =3D bindings::KMALLOC_MAX_SIZE as usize + 1;
>>> +/// struct Huge([u8; SIZE]);
>>> +///
>>> +/// assert!(KBox::<Huge>::new_uninit(GFP_KERNEL | __GFP_NOWARN).is_err=
());
>>> +/// ```
>>> +///
>>> +/// ```
>>> +/// # use kernel::bindings;
>>> +///
>>> +/// const SIZE: usize =3D bindings::KMALLOC_MAX_SIZE as usize + 1;
>>> +/// struct Huge([u8; SIZE]);
>>> +///
>>> +/// assert!(KVBox::<Huge>::new_uninit(GFP_KERNEL).is_ok());
>>> +/// ```
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// The [`Box`]' pointer always properly aligned and either points to =
memory allocated with `A` or,
>>
>> "pointer always properly" -> "pointer is properly"
>>
>>> +/// for zero-sized types, is a dangling pointer.
>>
>> I think this section would look nicer, if it were formatted using bullet
>> points (that way the bracketing of the "or" is also unambiguous).
>>
>> Additionally, this is missing that the pointer is valid for reads and
>> writes.
>>
>>> +pub struct Box<T: ?Sized, A: Allocator>(NonNull<T>, PhantomData<A>);
>>
>> Why no `repr(transparent)`?
>=20
> I wasn't entirely sure whether that's OK with the additional `PhantomData=
`, but
> I think it is, gonna add it.

Yes it is fine, `repr(transparent)` requires that at most one field is
non-ZST, but the type can have as many ZST fields as it wants.
Otherwise the compiler will complain (there is no `unsafe` here, so just
adding it is completely fine).

>>> +
>>> +/// Type alias for `Box` with a `Kmalloc` allocator.
>>
>> I think we should add that this is only designed for small values.
>=20
> I don't want duplicate the existing documentation around kmalloc and frie=
nds
> [1].
>=20
> Maybe we can refer to the existing documentation somehow.
>=20
> [1] https://www.kernel.org/doc/html/latest/core-api/memory-allocation.htm=
l

Oh great! With the C docs, I never know where to find them (is it in the
code and do they exist?). Yeah let's just link it.

>>> +///
>>> +/// # Examples
>>> +///
>>> +/// ```
>>> +/// let b =3D KBox::new(24_u64, GFP_KERNEL)?;
>>> +///
>>> +/// assert_eq!(*b, 24_u64);
>>> +///
>>> +/// # Ok::<(), Error>(())
>>> +/// ```
>>> +pub type KBox<T> =3D Box<T, super::allocator::Kmalloc>;
>>> +
>>> +/// Type alias for `Box` with a `Vmalloc` allocator.
>>
>> Same here, add that this is supposed to be used for big values (or is
>> this also a general-purpose allocator, just not guaranteeing that the
>> memory is physically contiguous? in that case I would document it
>> here and also on `Vmalloc`).
>=20
> Same as above, I'd rather not duplicate that. But I'm happy to link thing=
s in,
> just not sure what's the best way doing it.

I took a look at the link and there is the "Selecting memory allocator"
section, but there isn't really just a vmalloc or kmalloc section, it is
rather stuff that we would put in the module documentation.
What I would write on these types would be what to use these boxes for.
eg large allocations, general purpose etc. I don't think that that is
easily accessible from the docs that you linked above.

---
Cheers,
Benno

