Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B52D052
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726246180; cv=none; b=pgQafifBthQDe8CwOidOX6WJP0oHkXUHYccv6TUBW16/pwqzdo8Qqp+6rDbUQwJiW0ILctqKsTnAElwvZRF0uFmlbw7OEgvMp0sSScwghZgCAuGza72oUgq4nlO/TW/tNYcemtF91Z/X0Fgb12pyRuy1rZ7++iC0010Pamv+PcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726246180; c=relaxed/simple;
	bh=moULEsrJQkvyc0ao4f8yWfuJAnkUBhVn6jC7upOWJ2I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckodB4YnXMnayfkKEYPR5FbaOnyAnN0GSH/fBmkc3EVkvPnA8FhF/LWufNTR5EdSRgA4OXw01qPKH8AeNWnNSNP+vP63tjpdC2kPMx88/3KiiKk2LdheaYAUdHaXWG4f2rE5HImdatizzhHt2KVSRLERqATPMQAvK4tY0ZQOHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=m1XEho8L; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="m1XEho8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726246173; x=1726505373;
	bh=Q05nX5pHAPD+6gobXXQq1lz/UDzujdifPFIy8iyoDJs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m1XEho8LPacfPu6q/+OznlnYJk8+rKt5Ee3lmaRs2Zm9Cj7tm8GyhxT6yr6FxVKOy
	 cSXNj9kveRLm8CW1qtPwynb5HMwsq9b4yGrzIEIB+cjQ21uuP1ntURiX8BNcyi++MX
	 EE18L93/7GFMWJGKp2PmkmF3aMNiDDiB/KJBnP2JS4E1TFsPzTAfND+wHoxf3W7srY
	 ixOhkPS+XUM0idXLMNrYE56iDR/v6c8hmjcbFziVVqCg7UpnHBxRoL69WK9P05eh7/
	 0te9zp7E8BsYRaJa+FKPDeexwd2PE7oCqZCE42/yZzcZ9asnn4p5y0z2IsqId3k03V
	 VPdz6vPp7bziA==
Date: Fri, 13 Sep 2024 16:49:29 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: add untrusted data abstraction
Message-ID: <cf0d6189-e81c-4b7c-ab50-7a297c69b132@proton.me>
In-Reply-To: <ZuRbSxwlz1xWT1pG@phenom.ffwll.local>
References: <20240913112643.542914-1-benno.lossin@proton.me> <20240913112643.542914-2-benno.lossin@proton.me> <ZuRbSxwlz1xWT1pG@phenom.ffwll.local>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: c7894f4c5f4d2df8accefc84d3e0f8e9b33d5ac3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 17:33, Simona Vetter wrote:
> On Fri, Sep 13, 2024 at 11:26:57AM +0000, Benno Lossin wrote:
>>  /// Used to transfer ownership to and from foreign (non-Rust) languages=
.
>> @@ -532,3 +533,248 @@ unsafe impl AsBytes for str {}
>>  // does not have any uninitialized portions either.
>>  unsafe impl<T: AsBytes> AsBytes for [T] {}
>>  unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}
>> +
>> +/// Untrusted data of type `T`.
>> +///
>> +/// When reading data from userspace, hardware or other external untrus=
ted sources, the data must
>> +/// be validated before it is used for logic within the kernel. To do s=
o, the [`validate()`]
>> +/// function exists and uses the [`Validator`] trait. For raw bytes val=
idation there also is the
>> +/// [`validate_bytes()`] function.
>> +///
>> +///
>> +/// [`validate()`]: Self::validate
>> +/// [`validate_bytes()`]: Self::validate_bytes
>> +#[repr(transparent)]
>> +pub struct Untrusted<T: ?Sized>(T);
>=20
> I think we could make this a bit more strict and instead of encouraging
> people to put all their validation code into a Validator<T>, force
> them to. Which means assuming apis wrap all untrusted stuff in
> Untrusted<T> reviewers only need to look at validate implementations and
> nothing else.
>=20
> If I'm not too wrong with my rust I think this would work with slitting
> Untrusted<T> into two types:
>=20
> - Untrusted<T> is just a box you can't access, and the type returned by
>   apis for untrusted data. It doesn't have any of the functions except
>   validate and new_untrusted so that you can't get at the data at all.
>=20
> - UntrustedUnsafe<T> does have all the accessors needed for validation,
>   but you can't construct that outside of this module. Maybe simplest to
>   just nest this within the Untrusted<T> box.
>=20
> - Untrusted::validate does the unboxing and passes a reference to
>   UntrustedUnsafe<T> to Validator::validate, to guarantee that all the
>   validation code is in there and nowhere else. Similar for
>   validate_bytes.
>=20
> Of course people can still bypass this easily, but it gets a bit harder t=
o
> do so, and easier for reviewers to verify everything.

This is a great idea!
I think we should also remove `validate_bytes`, then you really must
implement `Validator`. If we figure out later that people need it, we
can add it later again. I added it because I thought that implementing
`Validator` for something very small might be very annoying, but it
seems like you actually want to force people to implement it :)

I think we should discuss the name `UntrustedUnsafe` though, I don't
really like the `Unsafe` although I understand why you used it. What do
you think of renaming the current `Untrusted` (and the one that only
exposes `validate`) to `Unvalidated` and using `Untrusted` as the
parameter for `Validator::validate`?
Alternatively, we could use `Unverified`/`Untrusted`, because
unvalidated is not a "real English word". But then I think we also
should rename `Validator` to `Verifier` etc.

>> +    /// Gives direct access to the underlying untrusted data.
>> +    ///
>> +    /// Be careful when accessing the data, as it is untrusted and stil=
l needs to be verified! To
>> +    /// do so use [`validate()`].
>> +    ///
>> +    /// [`validate()`]: Self::validate
>> +    pub fn untrusted(&self) -> &T {
>> +        &self.0
>> +    }
>> +
>> +    /// Gives direct access to the underlying untrusted data.
>> +    ///
>> +    /// Be careful when accessing the data, as it is untrusted and stil=
l needs to be verified! To
>> +    /// do so use [`validate()`].
>> +    ///
>> +    /// [`validate()`]: Self::validate
>> +    pub fn untrusted_mut(&mut self) -> &mut T {
>> +        &mut self.0
>> +    }
>> +
>> +    /// Unwraps the data and removes the untrusted marking.
>> +    ///
>> +    /// Be careful when accessing the data, as it is untrusted and stil=
l needs to be verified! To
>> +    /// do so use [`validate()`].
>> +    ///
>> +    /// [`validate()`]: Self::validate
>> +    pub fn into_inner_untrusted(self) -> T
>=20
> I don't like the above two since they could be easily and accidentally
> abused to leak untrusted data. And at least in your example I think
> they're fallout from being a bit too eager with annotating data as
> untrusted. The Folio and Mapped itself are just kernel structures, they
> better be correct. So I don't think it's useful to annotate those as
> untrusted and rely on Deref to also annotate the actual data as untrusted=
,
> because it forces you to peak behind the box a few times.

As I wrote in patch 2, I have no idea if I added the `Untrusted<T>` in
the correct places, as I don't know folios. I would disagree, that these
methods are necessary because of marking the entire folio as untrusted,
they are needed to access the data from within the `Validator::validate`
function, but with your above suggestion, we can move them to the
internal type.

> Instead I think we only want to annotate the Folio Deref:
>=20
> impl<S> Deref for Mapped<'_, S> {
>     type Target =3D Untrusted<[u8]>;
>=20
> Now there will be folios that we trust because they're kernel internal
> data and not file cache, so we need more flexibility here. No idea how to
> best make that happen, but in either case it's only the Deref data itself
> we don't trust, not any of the structures around it. One example would be
> gpu page tables. One way to implement this would be to make the Target
> type a generic of the folio, or well an associated type of the existing
> generics folio paramater:
>=20
> pub struct Folio<S: FolioType>
>=20
> pub trait FolioType {
> =09type Data;
> }
>=20
> impl<T> FolioType for PageCache<T> {
> =09type Data =3D Untrusted<[u8]>;
> }
>=20
> And gpu pagetables would use a something like this instead:
>=20
> impl FolioType for GpuFolios {
> =09type Data =3D [struct GpuPTE];
> }
>=20
> All extremely untested.

What I would like to avoid is having to do this for every possible data
source. Ideally we could just wrap trusted data sources with `Untrusted`
and be done with it.
If the wrapped type is not plain data, but rather a smart pointer or
other abstraction, then only the underlying data is marked untrusted
(otherwise how would you even know that the pointer can be used?). So
for example one might have an `Untrusted<ARef<[u8]>>`.

What I think we should do instead is make our APIs that return untrusted
data just return `Untrusted<Folio>` and implement the following method:

    impl Folio {
        pub fn read(self: &Untrusted<Self>) -> &Untrusted<[u8]>;
    }

I think that is the best of both worlds: we don't need to do excessive
type shenanigans for every type carrying potentially untrusted data and
we get to have methods specific to untrusted data.

However, I think implementing this method will be a bit difficult with
the `Untrusted`/`Unvalidated` split. Maybe we can have some `pub(crate)`
methods on `Unvalidated` to perform some mappings?

> Now I think there are cases you can't cover with just validate, where you
> have multiple input data which needs to be cross-checked to ensure overal=
l
> validity. But I think that we can cover that by implementing a Validator
> for tuples and making Untrusted a trait so that we can either Accept
> Untrusted<(A, B)> or (Untrusted<A>, Untrusted<B>) interchangably when
> calling validate().

I could imagine us adding conversion functions that can combine
untrusted values. Additionally, we should probably add a `Context` type
to `Validator` that is an additional parameter.

> At least with an hour of theorizing and your one example I couldn't come
> up with anything else.

Yeah, we need more users of this to know the full way to express this
correctly. I would like to avoid huge refactorings in the future.

>> +impl Untrusted<[u8]> {
>> +    /// Validate the given bytes directly.
>> +    ///
>> +    /// This is a convenience method to not have to implement the [`Val=
idator`] trait to be able to
>> +    /// just parse some bytes. If the bytes that you are validating hav=
e some structure and/or you
>> +    /// will parse it into a `struct` or other rust type, then it is ve=
ry much recommended to use
>> +    /// the [`Validator`] trait and the [`validate()`] function instead=
.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # fn get_untrusted_data() -> &'static Untrusted<[u8]> { &[0; 8]=
 }
>> +    ///
>> +    /// let data: &Untrusted<[u8]> =3D get_untrusted_data();
>> +    /// let data: Result<&[u8], ()> =3D data.validate_bytes::<()>(|untr=
usted| {
>> +    ///     if untrusted.len() !=3D 2 {
>> +    ///         return Err(());
>> +    ///     }
>> +    ///     if untrusted[0] & 0xf0 !=3D 0 {
>> +    ///         return Err(());
>> +    ///     }
>> +    ///     if untrusted[1] >=3D 100 {
>> +    ///         return Err(());
>> +    ///     }
>> +    ///     Ok(())
>> +    /// });
>> +    /// match data {
>> +    ///     Ok(data) =3D> pr_info!("successfully validated the data: {d=
ata}"),
>> +    ///     Err(()) =3D> pr_info!("read faulty data from hardware!"),
>> +    /// }
>> +    /// ```
>> +    ///
>> +    /// [`validate()`]: Self::validate
>> +    pub fn validate_bytes<E>(
>=20
> I think this is a special case of a somewhat common in-place validation
> pattern. For example in in complex syscall or ioctl we need to copy
> structures from userspace anyway and doing yet another copy to put them
> into a rust structure isn't great, instead we validate in-place. So I
> think we need something like
>=20
> impl Untrusted<T> {
> =09pub fn validate_inplace<E>(
> =09=09&self,
> =09=09validator: impl FnOnce(&T) -> Result<(), E>,
> =09=09) -> Result <&T, E> {
> =09=09...
> =09}
> }

I had thought about in-place validation as well, but I first wanted to
get a feel for how to do it, since I felt that in-place might make it
significantly more complicated.
In your proposal, you give a reference back, but maybe the data started
out as a `Box<[u8]>` (or how do you usually copy from userspace?), so it
would be better to be able to also handle owned data.

Also, it might be a good idea to just make the copy to kernel and
validate a single step.

> Eventually we might want a _mut version of this too, because often uapi
> extensions means we need to correctly fill out default values for
> extensions when being called by old userspace, and that requires
> mutability. And it really is often an integral part of input validation.

I see, will have to think about how to include this as well.

> Also I think we might need an Iterator for Untrusted<I: IntoIterator> so
> that we can validate Untrusted<[T]> and things like that with standard ma=
p
> and collect and do it all inplace.

Hmm, so a general iterator for `Unvalidated` might be a bad idea, but
for the `Untrusted`, it should be fine.

>> +pub trait Validator {
>> +    /// Type of the input data that is untrusted.
>> +    type Input: ?Sized;
>> +    /// Type of the validated data.
>> +    type Output;
>=20
> So I think the explicit Output makes sense if you have multiple different
> untrusted input that validate to the same trusted structure, but I'm not
> sure this makes sense as associated types. Instead I'd go with generics
> and somethign like this:
>=20
> pub trait Validator<Input: ?Sized> {
>     type Err;
>=20
>     fn validate(untrusted: &Untrusted<Input>) -> Result<Self, Self::Err>;
> }
>=20
> That means you can't implement validate for types from other modules
> directly but need a newtype (I think at least, not sure). But I think
> that's actually a good thing, since often that means you're validating
> some generic state plus whatever your own code needs (like the
> inode::Params<tarfs::INodeData> in your example), and both pieces need to
> be consisted overall and not just individually (otherwise why does the
> that other module not do the parsing for you). And so explicitly treating
> the validated output as an explicit new type just makes sense to me. Plus
> with derive(Deref) it's trivial to unbox after validation.

There might be the need to validate the same piece of data with
different ways and I am not convinced adding a newtype for every single
case is a good way to achieve it.
Although it would simplify the `Validator` trait... I will think a bit
about this.

> Cheers, Sima

Thanks a lot for taking a look!

---
Cheers,
Benno

