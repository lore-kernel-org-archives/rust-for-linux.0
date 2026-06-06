Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1726929B78F;
	Sat,  6 Jun 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780733687; cv=none; b=pTZ3IYxpF4FUpHk8wbymONd787hsRXJjfUvYky0q9/EAsX+rRDJ4wHXNcQ6kc1MKGQO2FhsMDOw5mTeDjYch/jw4exZNfuIiRfSbu063HUPfsh/x3hkol6juSLGBzCBzkCQPrGIgaZYQGODJloeJRdI1MM3NSzyFitY7YBSBWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780733687; c=relaxed/simple;
	bh=tcgygUk3gCCNsi5SG13XOdtpiS+uaaHKK/pIa3Ar3EY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QPJGjOHfvIYjlPKNQxoqg7l6217pUDvA77HCiZzuJXfEAJokA9rNNqrCiqgYNQDyQIEZTx98/YY0tVPC6xjWalJRna1HjNsYw1F/4+ShmjRs0T8mBgTTEbM2yoAkC6DsMBBZift871L/o05SXl4O/zXl21AXm63pgoDtQTQdvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8U2GTfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8U2GTfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159A11F00893;
	Sat,  6 Jun 2026 08:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780733685;
	bh=fr6szU5JrgZeoEMxPVTiNKODySIrvXOrHp4spLaAgmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=k8U2GTfhHYwFr++KszIsCZK1krSuJaFk3fhELgPqkF6jmWZefSKerAWd1MFqAZRgW
	 Ig5RkK6/sCmCQgO1dwRlkkm0p8A5VJ5XdZGeNFdTlGFZhRy/aq8dZygy1UkfAg2/fk
	 u7CaDWv5xPsBCQeDndGiNpzScC30PhqW+xWY5jg5vZiX+Jl8woYcJhkQftUREvSYEg
	 DbMPyfGn5ld06+EtaZOT0KywJvGpzTQROjH5TdRTutLNkGEmtaCrdi/7QyOhl2KV84
	 bNoA2wVQxJ9ovnJmOW03WsEJIeXdIHhH7rfgx7JvKbEj+ZDeS8qV66HPn98ItWwadi
	 6j63WQvs0ogZA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Uladzislau
 Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] rust: alloc: add per-task memalloc scope abstractions
In-Reply-To: <aiK3R1yRHj8zcGuh@google.com>
References: <20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org>
 <aiK3R1yRHj8zcGuh@google.com>
Date: Sat, 06 Jun 2026 10:14:38 +0200
Message-ID: <87ecikhyq9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alice Ryhl <aliceryhl@google.com> writes:

> On Fri, Jun 05, 2026 at 12:54:41PM +0200, Andreas Hindborg wrote:
>> Add an abstraction for the per-task allocation policies exposed by
>> the kernel through paired save/restore helpers in `linux/sched/mm.h`:
>> `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
>> `memalloc_pin`. Each pair toggles a bit in `current->flags` and
>> returns the prior state for a later restore. The pairing assumes
>> strict LIFO nesting; restoring out of order corrupts the per-task
>> state.
>>=20
>> Wrap the four pairs as a generic `Scope<K>` guard with a sealed
>> `ScopeKind` trait. Tag types `NoIo`, `NoFs`, `NoReclaim` and
>> `MemallocPin` select the underlying save/restore pair. `Scope` is
>> `!Unpin`, `!Send` and `!Sync`, and is only constructed through the
>> `memalloc_scope!` macro, which binds it via `core::pin::pin!` to a
>> hidden stack slot and hands out a `Pin<&Scope<K>>`. Safe code
>> therefore cannot move the guard across tasks, drop it ahead of its
>> lexical scope or otherwise violate the LIFO save/restore discipline.
>>=20
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> Changes in v2:
>> - Rewrite the patch to use scoped allocation flags instead of exposing
>>   a `GFP_NOIO` flag constant.
>> - Link to v1: https://lore.kernel.org/r/20260128-gfp-noio-v1-1-9a808fc49=
b44@kernel.org
>>=20
>> To: Miguel Ojeda <ojeda@kernel.org>
>> To: Boqun Feng <boqun@kernel.org>
>> To: Gary Guo <gary@garyguo.net>
>> To: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
>> To: Benno Lossin <lossin@kernel.org>
>> To: Andreas Hindborg <a.hindborg@kernel.org>
>> To: Alice Ryhl <aliceryhl@google.com>
>> To: Trevor Gross <tmgross@umich.edu>
>> To: Danilo Krummrich <dakr@kernel.org>
>> To: Lorenzo Stoakes <ljs@kernel.org>
>> To: "Liam R. Howlett" <liam@infradead.org>
>> To: Vlastimil Babka <vbabka@kernel.org>
>> To: Uladzislau Rezki <urezki@gmail.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: rust-for-linux@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> ---
>>  rust/bindings/bindings_helper.h |   1 +
>>  rust/helpers/mm.c               |  40 +++++++
>>  rust/kernel/alloc.rs            |   1 +
>>  rust/kernel/alloc/scoped.rs     | 231 +++++++++++++++++++++++++++++++++=
+++++++
>>  4 files changed, 273 insertions(+)
>>=20
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_he=
lper.h
>> index 446dbeaf0866..1931b131345f 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -83,6 +83,7 @@
>>  #include <linux/refcount.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/sched.h>
>> +#include <linux/sched/mm.h>
>>  #include <linux/security.h>
>>  #include <linux/slab.h>
>>  #include <linux/sys_soc.h>
>> diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
>> index b5540997bd20..b8e7492512e8 100644
>> --- a/rust/helpers/mm.c
>> +++ b/rust/helpers/mm.c
>> @@ -48,3 +48,43 @@ __rust_helper void rust_helper_vma_end_read(struct vm=
_area_struct *vma)
>>  {
>>  	vma_end_read(vma);
>>  }
>> +
>> +unsigned int rust_helper_memalloc_noio_save(void)
>> +{
>> +	return memalloc_noio_save();
>> +}
>> +
>> +void rust_helper_memalloc_noio_restore(unsigned int flags)
>> +{
>> +	memalloc_noio_restore(flags);
>> +}
>> +
>> +unsigned int rust_helper_memalloc_nofs_save(void)
>> +{
>> +	return memalloc_nofs_save();
>> +}
>> +
>> +void rust_helper_memalloc_nofs_restore(unsigned int flags)
>> +{
>> +	memalloc_nofs_restore(flags);
>> +}
>> +
>> +unsigned int rust_helper_memalloc_noreclaim_save(void)
>> +{
>> +	return memalloc_noreclaim_save();
>> +}
>> +
>> +void rust_helper_memalloc_noreclaim_restore(unsigned int flags)
>> +{
>> +	memalloc_noreclaim_restore(flags);
>> +}
>> +
>> +unsigned int rust_helper_memalloc_pin_save(void)
>> +{
>> +	return memalloc_pin_save();
>> +}
>> +
>> +void rust_helper_memalloc_pin_restore(unsigned int flags)
>> +{
>> +	memalloc_pin_restore(flags);
>> +}
>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>> index e38720349dcf..8ebb8c9f3e67 100644
>> --- a/rust/kernel/alloc.rs
>> +++ b/rust/kernel/alloc.rs
>> @@ -6,6 +6,7 @@
>>  pub mod kbox;
>>  pub mod kvec;
>>  pub mod layout;
>> +pub mod scoped;
>>=20=20
>>  pub use self::kbox::Box;
>>  pub use self::kbox::KBox;
>> diff --git a/rust/kernel/alloc/scoped.rs b/rust/kernel/alloc/scoped.rs
>> new file mode 100644
>> index 000000000000..0251792c9f3c
>> --- /dev/null
>> +++ b/rust/kernel/alloc/scoped.rs
>> @@ -0,0 +1,231 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Scoped allocation policies for the current task.
>> +//!
>> +//! The kernel exposes several per-task allocation policies through
>> +//! save/restore pairs in [`include/linux/sched/mm.h`]: `memalloc_noio`,
>> +//! `memalloc_nofs`, `memalloc_noreclaim` and `memalloc_pin`. Each pair
>> +//! sets a bit in `current->flags` and returns the prior state, which a
>> +//! later call restores. The save/restore APIs assume strict LIFO
>> +//! nesting; restoring out of order corrupts the per-task state.
>> +//!
>> +//! This module exposes the policies as a generic [`Scope<K>`] guard,
>> +//! parameterized over a [`ScopeKind`] tag. The type is `!Unpin` and
>> +//! constructed only through the [`memalloc_scope!`] macro, which binds
>> +//! it to a hidden stack slot via [`core::pin::pin!`] and rebinds the
>> +//! handle as a shared pinned reference. Safe code therefore has no path
>> +//! to either move the guard or drop it ahead of its lexical scope, so
>> +//! nested scopes always restore in LIFO order.
>
> Your scope trick only works in normal fns, not in generators such as
> async fn.

Could you elaborate what would happen when this pattern is applied in a
generator? I don't immediately see how the LIFO drop order can be broken
when this is combined with a generator.

Would a closure based approach have the same problem?

Best regards,
Andreas Hindborg


