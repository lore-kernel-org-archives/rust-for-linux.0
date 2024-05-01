Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9457323
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714578402; cv=none; b=Hu4NsF0cgAqlmWYcPQb8RmZlwndWsaIQFdL8DHm9avbeOevuterNtAE57+C89MpQk47B1KBeHUdqRMKuSH5cwxEmczjE18qdgmpD8Ryvjd7ibL/4y3SePV8fz81vFMvU6KsaSQBQEdd4eEF+DPmVJjI4BegM+sUcUzOyF5qMkY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714578402; c=relaxed/simple;
	bh=kuxQLUnxMe6t5s0FD6NtEu4wYcIffdCva/kEe8zyoxo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GW5R6MW8WmuR/vvyIDJT/xVz2urOX86wBfKkPjX8bIX3neMRaPI4WhYt4OVee/ncB09m7CYL5zEUbo6uC6oHtE1HDEOqlQ5CTll/5+XwWdn1pIeqg+7pvEzyF7c9SfCIcNKtmGbkos3lyvqlr+TyX0KkUpUv1MnTYqDFmkUXXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JNxat6GH; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JNxat6GH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714578398; x=1714837598;
	bh=CA5zIsJrcwRTkA1qqktg8bZAxrg1B3c4cY6/+ASEjcg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JNxat6GHrLao4hV+5FTIEagGeSYi+ow78B8iztUFB0fnWSw9GoU3/uQ0JFiDdI9wN
	 Qg5r983iFbJ1EC6mlk4zOD0wmtb0Mo8uU8Ev09TAnLnlLQ6mJ+aWDmUs0UeN57gVth
	 g6VATTuPzqG79aaNyygbTQIS6MKn7lDswnMoozTc+4xe14DumT1iDbq/SIO3xs6zdt
	 cQi/CtcQP1m7RErtDFtL4ljFyIgDxWKB5mLC+LKzEMCF9xvAWS8m40gsPEDz5k8xYu
	 +aOPgvUu8wm3rfmDDFUnrxz+Bchdycpkxq7AMquZXTtH3jKHv5SSK7x8HXlgj2kqVx
	 FOvbDeI1sc1FQ==
Date: Wed, 01 May 2024 15:46:31 +0000
To: Danilo Krummrich <dakr@redhat.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 6/8] rust: alloc: implement BoxExtAlloc
Message-ID: <45f53c48-efa5-4f97-9fb2-72aaded3c260@proton.me>
In-Reply-To: <ZjI-XkWfMfozaQ4F@pollux>
References: <20240429201202.3490-1-dakr@redhat.com> <20240429201202.3490-7-dakr@redhat.com> <2324d22f-984d-4f92-8302-5c866f3387ac@proton.me> <ZjI-XkWfMfozaQ4F@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4657223d7875e93fb5311b7264392b379190f000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.05.24 15:06, Danilo Krummrich wrote:
> On Wed, May 01, 2024 at 08:53:51AM +0000, Benno Lossin wrote:
>> On 29.04.24 22:11, Danilo Krummrich wrote:
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   rust/kernel/alloc/box_ext.rs | 40 +++++++++++++++++++++++++++++++++++=
-
>>>   1 file changed, 39 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/rust/kernel/alloc/box_ext.rs b/rust/kernel/alloc/box_ext.r=
s
>>> index 76653d6f4257..74d6bb24e965 100644
>>> --- a/rust/kernel/alloc/box_ext.rs
>>> +++ b/rust/kernel/alloc/box_ext.rs
>>> @@ -2,7 +2,7 @@
>>>
>>>   //! Extensions to [`Box`] for fallible allocations.
>>>
>>> -use super::Flags;
>>> +use super::{AllocatorWithFlags, Flags};
>>>   use alloc::boxed::Box;
>>>   use core::alloc::AllocError;
>>>   use core::mem::MaybeUninit;
>>> @@ -21,6 +21,19 @@ pub trait BoxExt<T>: Sized {
>>>       fn new_uninit(flags: Flags) -> Result<Box<MaybeUninit<T>>, AllocE=
rror>;
>>>   }
>>>
>>> +/// Extensions to [`Box`].
>>> +pub trait BoxExtAlloc<T, A: AllocatorWithFlags>: Sized {
>>
>> I think it would be better to put all of this stuff into the `BoxExt`
>> trait. Otherwise we will end up with even more extension traits...
>=20
> That was my inital idea as well, but it wasn't quite obvious for me how t=
o make
> this happen.
>=20
> I think for BoxExt<T>, it's rather easy, since we don't need an implement=
ation
> for Box<T, A>. What do you think about this [1]?

In the `.._in` functions you're not passing the allocator to the `Box`.
This will lead to problems, since it will use the global allocator to
deallocate the value when you drop the `Box`.

> For VecExt<T>, I'm not quite sure how this can work though, since we'd ne=
ed to
> implement VecExt<T> for both Vec<T> and Vec<T, A>.
>=20
> For instance, VecExt<T>::reserve() needs to be implemented for both Vec<T=
> and
> Vec<T, A>, but VecExt<T>::with_capacity() can only be implemented for Vec=
<T> and
> VecExt<T>::with_capacity_in() can only be implemented for Vec<T, A>. But =
we have
> to implement all trait functions for both types.
>=20
> Do I miss something here?

You're right, we need two traits for that...

--=20
Cheers,
Benno

> [1] https://gitlab.freedesktop.org/drm/nova/-/snippets/7784

