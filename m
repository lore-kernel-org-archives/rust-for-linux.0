Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C4619D8B3;
	Thu, 25 Jul 2024 18:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721931185; cv=none; b=VviFhqJdwNwLWgJRhYAoyg+VhlfL8ZahN6Gg83vQNZmJEAUdjZFRHZeG4rMczI5cHUpAgiHP6w3YucTDq+YEHiGZpVLCIscjueU8ydvyTW1gq970/aQ2Qpr1fm6vXk4mp32eqAEGFfdXvbhMZR3xLok0/oXkKqYRu+R78gYys3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721931185; c=relaxed/simple;
	bh=mbTVa3LSHPYgZ1dA/8R3Zms6EE3ELVsHnZ3DOAJ/xhw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcca0coORAz7N2z+jHYFPImYV5OOKBJPXOmokrMwj3/eT0+IUVuNhWRSuYHvYqxFp1nWaCKYbSetj9HYI6pvZWEYrCLMaLZFt0jaJT6wNgwi63FNMWu8P4whSUh3+ethvV83DaJvOyojxAffWC85rGr9SexUVttvLNiaVF7Y41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XUoJZM4e; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XUoJZM4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1721931181; x=1722190381;
	bh=0x67cehCeX2dhRh4luC1Hzr4+U3FEqzuaZRSYX3Gz5U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XUoJZM4eB3pMFfpxj30O1NRQOmgMv6796wIOcL3IUUmLBWYywwUTLTMFTB5TbuPJf
	 ZU2D4MB2dJIyTU64/EzkNT3ZdUyuH/Tkk9xnRo+Y8SChwVpncwREzm69VXYcCBDbCF
	 H7Q9siL4bkJisLqnui/NLNTEUi8yZhAOmeYgTn4+w7Zr0+1DmfjdnD/1p/+Dz41nE4
	 VobFR5xVt3EkcCrdq6FM70MWWj5BqI3of6YgXiUlcDukzg5nBKdQ/1sFtIjamW7g7m
	 ax/0CQvFt5XUqconjPBql2nDeW03q1tUrjhQzOltm+v4mUnIHosfHw6qtLrNxjpb53
	 uH2Kv4l/SPdbQ==
Date: Thu, 25 Jul 2024 18:12:56 +0000
To: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Jonathan Corbet <corbet@lwn.net>, Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@redhat.com>, Trevor Gross <tmgross@umich.edu>, gregkh@linuxfoundation.org
Subject: Re: [RFC PATCH] rust: types: Add explanation for ARef pattern
Message-ID: <bcdd74f3-d0c0-4366-976a-5a935081a704@proton.me>
In-Reply-To: <ZqE9dzfNrE3Xg3tV@boqun-archlinux>
References: <20240710032447.2161189-1-boqun.feng@gmail.com> <CAH5fLgjat2Y6RT957BhdOjJHt7rPs0DvZYC6JZ+pHFiP=yDNgA@mail.gmail.com> <ZqE9dzfNrE3Xg3tV@boqun-archlinux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ef62ec175a333e5f6fbf726ab823a1ebb2c8d9ce
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 24.07.24 19:44, Boqun Feng wrote:
> On Tue, Jul 23, 2024 at 11:14:29AM +0200, Alice Ryhl wrote:
>>> +/// However `&Self` represents a reference to the object, and the life=
time of the **reference** is
>>> +/// known at compile-time. E.g. the `Foo::as_ref()` above.
>>> +///
>>> +/// ## `impl Drop` of an `impl AlwaysRefCounted` should not touch the =
refcount
>>> +///
>>> +/// [`ARef`] descreases the refcount automatically (in [`ARef::drop`])=
 when it goes out of the
>>> +/// scope, therefore there's no need to `impl Drop` for the type of ob=
jects (e.g. `Foo`) to decrease
>>> +/// the refcount.
>>>  pub struct ARef<T: AlwaysRefCounted> {
>>>      ptr: NonNull<T>,
>>>      _p: PhantomData<T>,
>>> --
>>> 2.45.2
>>>
>>
>> I think this is missing some basic information related to `&Self` ->
>> `ARef<Self>` conversions. We should explain that these conversions are
>> possible, and that you usually don't want `raw_ptr` -> `ARef<Self>` to
>> increment the refcount - instead provide a `raw_ptr` -> `&Self` and
>> convert the `&Self` to `ARef<Self>`.
>>
>=20
> I could be more explicit on this, but could there be a case where a `T`
> only wants to return `ARef<T>` as a public API? In other words, the
> author of `T` doesn't want to expose an `-> &T` function, therefore a
> `-> ARef<T>` function makes more sense? If all the users of `T` want to
> operate on an `ARef<T>` other than `&T`, I think it makes sense, right?

You can always get a `&T` from `ARef<T>`, since it implements `Deref`.

> Overall, I feel like we don't necessarily make a preference between
> `->&Self` and `->ARef<Self>` functions here, since it's up to the users'
> design?

I would argue that there should be a clear preference for functions
returning `&Self` when possible (ie there is a parameter that the
lifetime can bind to). This is because then you get the two versions of
the function (non-incrementing and incrementing) for the price of one
function.

---
Cheers,
Benno

