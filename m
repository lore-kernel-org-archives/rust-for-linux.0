Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E9F17CA00
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846139; cv=none; b=Ohrl37N/qUd+FaaT6rN1Ubl4IHaLDxw/LOWnaJMRPA3MlbQSEjCi6Vt+6QBf4fVnTB2MKx3Fm4JldyVd/PEg/LZg0RY+Hgozx5CZvpd7idri80r8sG0epC/8vrfr7UU1CRhDsuK25QUm6mXyFWR9qG4ojKHuNAk4OPLJBEE5rL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846139; c=relaxed/simple;
	bh=Xru1Xw6EXxrCV55SOq8vDOrd/yHDyBJip3dmdKkU954=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZ9IpRs8Skem18uC/2j4HR2xvTcUn2/9KvRPEQQqARrx8L3YkiCe8rfPjQ55L5H9L4FR6D1XKITTnBXW0tXitqbIex9L53QLW3Wu025uCdiUQrHUWEi5KKReWcxJj2g8dchIefseF3CxSvLSQL0ReDZauCtKEl4QjJAMRA4d2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Op14Gnkx; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Op14Gnkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=en6br3hjingk7jsrrmzwetwexe.protonmail; t=1726846129; x=1727105329;
	bh=N7F0vlhEavmWrnMWcAbLj6GIz5oqybxOWyz+kMUkRoU=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Op14Gnkxt+QNcu+eSIg0ZO8dYWBZ3YxrUUDdBBQ3Wq39g/UGcOchQFj8LNxzYFXtq
	 fhvgf1Xj5k/6AuYso91nX7HypBNLNVITflI0RzG8Nbe9jeXk8COXuo5uksnzKQeGNc
	 hWvVOHNDil5M/1MEn10scdsL3CUwoof7hNOvOwPZb995bO1GIBswfSdIottsErZLo5
	 lMEie7uVZlSdi0/YAvJ12wKxUUYdF677VdwqmiVNYjtBjM0aMmJnjBoyy379tjxYHR
	 tJvQj5G41tAL/BQ8pXLyKoJDGT67EEX0rhW6G4l2LHyzqDh3l0Q+X/u1BwB0N/NWlN
	 N3+4jIA1zlyAQ==
Date: Fri, 20 Sep 2024 15:28:47 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH 1/3] rust: add untrusted data abstraction
Message-ID: <e9de0ead-2ab4-44c6-b7f5-8bf416799664@proton.me>
In-Reply-To: <Zu2Gs3zk-F2XIg8A@phenom.ffwll.local>
References: <20240913112643.542914-1-benno.lossin@proton.me> <20240913112643.542914-2-benno.lossin@proton.me> <ZuRbSxwlz1xWT1pG@phenom.ffwll.local> <cf0d6189-e81c-4b7c-ab50-7a297c69b132@proton.me> <ZuhTdwCqz61bQEgq@phenom.ffwll.local> <26534d80-989d-4b77-9720-84575275890f@proton.me> <Zu2Gs3zk-F2XIg8A@phenom.ffwll.local>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 899cc48ae97e3cd27dbaf4cbf3c6cf2d4d2f223c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20.09.24 16:29, Simona Vetter wrote:
> On Wed, Sep 18, 2024 at 03:40:54PM +0000, Benno Lossin wrote:
>> On 16.09.24 17:49, Simona Vetter wrote:
>>> On Fri, Sep 13, 2024 at 04:49:29PM +0000, Benno Lossin wrote:
>>>> What I think we should do instead is make our APIs that return untrust=
ed
>>>> data just return `Untrusted<Folio>` and implement the following method=
:
>>>>
>>>>     impl Folio {
>>>>         pub fn read(self: &Untrusted<Self>) -> &Untrusted<[u8]>;
>>>>     }
>>>>
>>>> I think that is the best of both worlds: we don't need to do excessive
>>>> type shenanigans for every type carrying potentially untrusted data an=
d
>>>> we get to have methods specific to untrusted data.
>>>>
>>>> However, I think implementing this method will be a bit difficult with
>>>> the `Untrusted`/`Unvalidated` split. Maybe we can have some `pub(crate=
)`
>>>> methods on `Unvalidated` to perform some mappings?
>>>
>>> The thing is, folios are just a pile of contig pages, and there's nothi=
ng
>>> in the rules that they only contain untrusted data. Currently in rust c=
ode
>>> we have that's the case, but not in general. So we need that associated
>>> type.
>>>
>>> But I also think Folio here is special, a lot of the other places where=
 I
>>> want this annotation it's the case that the data returned is _always_
>>> untrusted. So we don't need to place associated types all over the
>>> codebase to make this work, it's just that the rfc example you've picke=
d
>>> needs it.
>>
>> I think we should try to make just wrapping stuff in `Untrusted` work. I
>> don't see how the associated types would help you any more than just
>> implementing stuff on `&Untrusted<Self`.
>=20
> I guess you could wrap it as Untrusted in each use site when you get the
> data out of the Folio, but that makes the guarantees we get out of these
> annotations much less stringent. Which is why I think for Folio<> (well
> really for Pagecache) we need to go with the associated type or it's a bi=
t
> self-defeating.

Let's just implement both ways and see which one is better.

[...]

>>>>>> +pub trait Validator {
>>>>>> +    /// Type of the input data that is untrusted.
>>>>>> +    type Input: ?Sized;
>>>>>> +    /// Type of the validated data.
>>>>>> +    type Output;
>>>>>
>>>>> So I think the explicit Output makes sense if you have multiple diffe=
rent
>>>>> untrusted input that validate to the same trusted structure, but I'm =
not
>>>>> sure this makes sense as associated types. Instead I'd go with generi=
cs
>>>>> and somethign like this:
>>>>>
>>>>> pub trait Validator<Input: ?Sized> {
>>>>>     type Err;
>>>>>
>>>>>     fn validate(untrusted: &Untrusted<Input>) -> Result<Self, Self::E=
rr>;
>>>>> }
>>>>>
>>>>> That means you can't implement validate for types from other modules
>>>>> directly but need a newtype (I think at least, not sure). But I think
>>>>> that's actually a good thing, since often that means you're validatin=
g
>>>>> some generic state plus whatever your own code needs (like the
>>>>> inode::Params<tarfs::INodeData> in your example), and both pieces nee=
d to
>>>>> be consisted overall and not just individually (otherwise why does th=
e
>>>>> that other module not do the parsing for you). And so explicitly trea=
ting
>>>>> the validated output as an explicit new type just makes sense to me. =
Plus
>>>>> with derive(Deref) it's trivial to unbox after validation.
>>>>
>>>> There might be the need to validate the same piece of data with
>>>> different ways and I am not convinced adding a newtype for every singl=
e
>>>> case is a good way to achieve it.
>>>> Although it would simplify the `Validator` trait... I will think a bit
>>>> about this.
>>>
>>> Hm, but unless I misunderstand you already need a random type to attach
>>> your current trait too? So not worse if we require that for the
>>> less-common type of multiple ways to validate the same, and simpler for
>>> the common one.
>>
>> Yes, but you wouldn't have to unwrap the return type. For example with
>> your proposal we have:
>>
>>     struct MyINodeParams(INodeParams);
>>
>>     impl Validator<[u8]> for MyINodeParams {
>>         type Err =3D Error;
>>
>>         fn validate(untrusted: &Untrusted<[u8]>) -> Result<Self> {
>>             /*...*/
>>             Ok(Self(params))
>>         }
>>     }
>>
>>     impl MyINodeParams {
>>         fn into_inner(self) -> INodeParams {
>>             self.0
>>         }
>>     }
>>
>> And then you would do:
>>
>>     let params =3D untrusted.validate::<MyINodeParams>().into_inner();
>>
>> I find the `into_inner()` a bit annoying (one could just use `.0`
>> instead, but I also don't like that). I find specifying the `Output` a
>> bit cleaner.
>=20
> Hm right. But I guess with your new plan to only support validate, which
> gets the inner passed in explicitly and returns whatever the closure
> returns?

The only thing that changes with my suggestion is the parameter type of
`validate` (and the names):


    struct MyINodeParams(INodeParams);

    impl Validate<[u8]> for MyINodeParams {
        type Err =3D Error;

        fn validate(untrusted: &[u8]) -> Result<Self> {
            /* ... */
            Ok(Self(params))
        }
    }

    let params =3D untrusted.validate::<MyINodeParams>().into_inner();

And with the `Output` type on the trait we would have:

    struct MyINodeParams;

    impl Validate<[u8]> for MyINodeParams {
        type Err =3D Error;
        type Output =3D INodeParams;

        fn validate(untrusted: &[u8]) -> Result<Self::Output> {
            // ...
        }
    }

    let params =3D untrusted.validate::<MyINodeParams>();

I don't think that it's a huge difference, but nonetheless it is
probably useful.

But, I just remembered a probably more important thing: returning
`Result<Self>` will make it possible to use type inference in places
wehre you *do* want your custom type, so

    struct Foo { /* ... */ }
    impl Validate for Foo { /* ... */ }
    fn use_my_foo(foo: Foo) { /* ... */ }
   =20
    use_my_foo(untrusted.validate()?)

Should work (ie the `.validate()` call doesn't need the generic
argument).

So I think I will go for no `Output` type in the next version.

---
Cheers,
Benno

