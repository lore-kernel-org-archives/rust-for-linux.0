Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277DC1C6891
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723015210; cv=none; b=IwNEsECunxqbDKE84DcFvJjez9OT0+Llf5n4ihu5LA8HkqGqKVALUA2oq3h+i8pkDNIYWd4Tjif6X8u/6JylmK9cBcyn8PhqVe8hBtgMK81zhKdgowoq2wegOpABb3xPKBW2TKvD7dgTGA1Tec//ofpV/THadeW5jwj7zPrtPAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723015210; c=relaxed/simple;
	bh=RJwUJxfIBPMSut0rEHrV8tGIWbldPEe3N9S8MBuwf9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NWU7QT0XKc3ev1gQrUDYRjRS/yWOvTwNpHomJWJQ4bgwOy7qSuvBd6FBav2OkOKJjEA7ROH8/XxwiyiMKZTlxm9OfAx+6dkWk6k6OK2v2MvDmbvf3joh1rDAC0xmbpkQF7L45d9inwUuY7mj9gHd7LJiWJ2NcJ7ABAkq/bWSG+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I9dJ3ANn; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="I9dJ3ANn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723015205; x=1723274405;
	bh=d7WjM1fl0r5fOzo7wZwr2DKQdA65pFC6ffA5pNGPgWQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I9dJ3ANnSLpGw/HOT9sVnCXKTNJoIJmZqKLkrPRI9UAttGPCaF7hUFR+Dyrrw5DMg
	 9I95AezDf/DSYzgUVUlXjHFRXcXghgOF8nfODsHdI1eZeLnLHtufBdQ7wWiiXvJADY
	 bpRMNh9LRBNoSOP1BA4Y096otNWHiOGhTG05le++JfggUNGp6vBPr7tEYc01XMJiFX
	 oGfz+cKArS4NcXHY/KuVCZLb67Oij3hDrjQlX9N3FM/d2rVX0kH003Rs838rvLR3Qi
	 gCnXS+GwIsj9GbUsID6dDLV0/bdhiPqbl4wmuxO5ZaEgxM6hVo/vEFlSHOOw5G4HP7
	 dxrjqp2ukmdQg==
Date: Wed, 07 Aug 2024 07:20:03 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org, daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 05/28] rust: alloc: add module `allocator_test`
Message-ID: <6aaf4e2d-7968-4a7c-a522-73e6788ee0ee@proton.me>
In-Reply-To: <ZrJyaWhXHRciX51o@pollux.localdomain>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-6-dakr@kernel.org> <7f4b91e6-aae8-4e17-9fcd-4b1d0b2de9a0@proton.me> <ZrJyaWhXHRciX51o@pollux.localdomain>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 1491d30a83cf2a2f344e14d4e652da05c12a0258
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06.08.24 20:58, Danilo Krummrich wrote:
> On Tue, Aug 06, 2024 at 04:54:10PM +0000, Benno Lossin wrote:
>> On 05.08.24 17:19, Danilo Krummrich wrote:
>>> `Allocator`s, such as `Kmalloc`, will be used by e.g. `Box` and `Vec` i=
n
>>> subsequent patches, and hence this dependency propagates throughout the
>>> whole kernel.
>>>
>>> Add the `allocator_test` module that provides an empty implementation
>>> for all `Allocator`s in the kernel, such that we don't break the
>>> `rusttest` make target in subsequent patches.
>>
>> This is confusing, since you are talking about both our new `Allocator`
>> trait, allocators and the `alloc` crate `Allocator`.
>=20
> I never mention the `alloc` crate `Allocator` here.

Seems like I confused myself...

>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>> ---
>>>  rust/kernel/alloc.rs                |  9 +++++++--
>>>  rust/kernel/alloc/allocator_test.rs | 19 +++++++++++++++++++
>>>  2 files changed, 26 insertions(+), 2 deletions(-)
>>>  create mode 100644 rust/kernel/alloc/allocator_test.rs
>>>
>>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>>> index bc01a17df5e0..942e2755f217 100644
>>> --- a/rust/kernel/alloc.rs
>>> +++ b/rust/kernel/alloc.rs
>>> @@ -2,12 +2,17 @@
>>>
>>>  //! Extensions to the [`alloc`] crate.
>>>
>>> -#[cfg(not(test))]
>>> -#[cfg(not(testlib))]
>>> +#[cfg(not(any(test, testlib)))]
>>>  pub mod allocator;
>>>  pub mod box_ext;
>>>  pub mod vec_ext;
>>>
>>> +#[cfg(any(test, testlib))]
>>> +pub mod allocator_test;
>>> +
>>> +#[cfg(any(test, testlib))]
>>> +pub use self::allocator_test as allocator;
>>> +
>>>  /// Indicates an allocation error.
>>>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
>>>  pub struct AllocError;
>>> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/al=
locator_test.rs
>>> new file mode 100644
>>> index 000000000000..4785efc474a7
>>> --- /dev/null
>>> +++ b/rust/kernel/alloc/allocator_test.rs
>>> @@ -0,0 +1,19 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#![allow(missing_docs)]
>>> +
>>> +use super::{AllocError, Allocator, Flags};
>>> +use core::alloc::Layout;
>>> +use core::ptr::NonNull;
>>> +
>>> +pub struct Kmalloc;
>>> +
>>> +unsafe impl Allocator for Kmalloc {
>>> +    unsafe fn realloc(
>>> +        _ptr: Option<NonNull<u8>>,
>>> +        _layout: Layout,
>>> +        _flags: Flags,
>>> +    ) -> Result<NonNull<[u8]>, AllocError> {
>>> +        panic!();
>>
>> Does `build_error!()` also work? If yes, then I would prefer that.
>=20
> Probably, but it also probably doesn't matter too much. A later patch in =
the
> series replaces this with a `Cmalloc` implementation and type aliases all=
 kernel
> allocators (e.g. `Kmalloc`) to it.

What prevents you from doing the `Cmalloc` patch here? `build_error!`
probably doesn't work, since we probably allocate in rusttest, right?

---
Cheers,
Benno

