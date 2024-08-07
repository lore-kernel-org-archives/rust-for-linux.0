Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF371C7B82
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723015674; cv=none; b=dkRNUU6oA8V3jj1oM/BOWW+/dc/IyA2A4yuEWwEhSVaNSp0YJaZ6T/tn+HT9lCt/DB8xRgN39moi7ouJUw1o5DCfxWhe9Z55m/80TDOb9izG2D90m8D+5zMpm24vFyg6e+bd3By3XUJ1ueJ6WcZjH/JpDuZjrKlUE0ZNUpCaN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723015674; c=relaxed/simple;
	bh=xpcdVMCOMS6ZEUxGHrLtt6WYnma8jov+VO8vTgPH3Lw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WF3Hq0+2ytcxg57QXecmK/ZiMWgnjlBXalC5BuUrcb+0lLcQuoU+of58Lpb8sxZoJH514qHRpcxyiZVnU1pMTjmzAVEir90WvlxFJD43Z+ymv0ShMbRTG3hlGlep2RY0DIsHv2JQD3v+twKNJBiwxP9FmZqYrylFfJu9noeyWbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aPurxjKR; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aPurxjKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723015670; x=1723274870;
	bh=INMG5HrhyREBaOaaWbYVtgtotk53aCP+1xHBSxmczYI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aPurxjKRvSEaRucKuZ7JFILRNT/3RTNud9f4LmE/jkxnZFtWpKFgq+kawQZh80BNW
	 U8/Q24+n7rc9dwUMx5mC+ua2PKyuuIuct5ARNqEzj4UMYTVjztugcBz/EpCcoy7N3j
	 2UtWpqFIVVemoF6ldD+pu8wTA+fGTlUkV2YxcmkHSvOmPm027O7pbD4OP7aCdRqA5H
	 nupogAy0AAa+uWjfCMZ3eXWPoYWZwh0AGQ+RZTb5Gstql+ufw7yrzigkwP1MX5IFTT
	 F8zUZV0aFNZS9GWe9zWSPk/mNenjyENT1cH9lizbhXe+0nSZMl8hGkh5kcBDe0nPrn
	 ZKHUgQppFXN+g==
Date: Wed, 07 Aug 2024 07:27:43 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org, daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 08/28] rust: types: implement `Unique<T>`
Message-ID: <f3457432-dc83-4a19-b75a-88b914430733@proton.me>
In-Reply-To: <ZrKt7K68W1Jh6nhr@pollux>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-9-dakr@kernel.org> <ff0826af-9430-4653-abe8-25fb80cd0e97@proton.me> <ZrKt7K68W1Jh6nhr@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 76ed0ca302491360577dc6e8f86574c9d2d01ecb
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07.08.24 01:12, Danilo Krummrich wrote:
> On Tue, Aug 06, 2024 at 05:22:21PM +0000, Benno Lossin wrote:
>> On 05.08.24 17:19, Danilo Krummrich wrote:
>>> +impl<T: Sized> Unique<T> {
>>> +    /// Creates a new `Unique` that is dangling, but well-aligned.
>>> +    ///
>>> +    /// This is useful for initializing types which lazily allocate, l=
ike
>>> +    /// `Vec::new` does.
>>> +    ///
>>> +    /// Note that the pointer value may potentially represent a valid =
pointer to
>>> +    /// a `T`, which means this must not be used as a "not yet initial=
ized"
>>> +    /// sentinel value. Types that lazily allocate must track initiali=
zation by
>>> +    /// some other means.
>>> +    #[must_use]
>>> +    #[inline]
>>> +    pub const fn dangling() -> Self {
>>> +        Unique {
>>> +            pointer: NonNull::dangling(),
>>> +            _marker: PhantomData,
>>> +        }
>>> +    }
>>
>> I think I already asked this, but the code until this point is copied
>> from the rust stdlib and nowhere cited, does that work with the
>> licensing?
>>
>> I also think that the code above could use some improvements:
>> - add an `# Invariants` section with appropriate invariants (what are
>>   they supposed to be?)
>> - Do we really want this type to be public and exported from the kernel
>>   crate? I think it would be better if it were crate-private.
>> - What do we gain from having this type? As I learned recently, the
>>   `Unique` type from `core` doesn't actually put the `noalias` onto
>>   `Box` and `Vec`. The functions are mostly delegations to `NonNull`, so
>>   if the only advantages are that `Send` and `Sync` are already
>>   implemented, then I think we should drop this.
>=20
> I originally introduced it for the reasons described in [1], but mainly t=
o make
> clear that the owner of this thing also owns the memory behind the pointe=
r and
> the `Send` and `Sync` stuff you already mentioned.

I would prefer if we make that explicit, since it is rather error-prone
when creating new pointer types (and one should have to think about
thread safety).

---
Cheers,
Benno

> If no one else has objections we can also just drop it. Personally, I'm f=
ine
> either way.
>=20
> [1] https://docs.rs/rust-libcore/latest/core/ptr/struct.Unique.html

