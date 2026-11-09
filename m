Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232292;
	b=cLq2NcOS8qK0vIPw3pCllrJob2GvCsfZIGvTiJ7LV8SATOjLnkrNjcKq+WYX/Qw3KOrM
	 E+4qKnKbiGB0WJ6QnoWVnGXTNWupEliGzoFiSH/Xd4M+e8y/WNUGrt+/yxucv9thplp2N
	 trXeVNFRyv6BlM2co/6qZFkWt2d8vUVhQjX+Mm2i0yPXn0mWFKzCj79tJPCaT8uh1i/7c
	 bocjkxKIzF+oEVQboDzRTopQFo27GxaQMsEeXh4Zcj0lnjNKIQJrXR1vMT5b/hi9yrEQp
	 2dtrLxhve3rt8mumLarmnpfn7LmwvR3oqbIfMoanUNUJQq8erkBTHzLOTBgwi/xW0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232292;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=6YcYOdC7iHosICJsNPvA6c1/PmSp5VhjSW9aX6UnLmo=;
	b=XoltVphPrJ7NAY1kaL++XALoj5h0lRTAB1CxKKh6NIi62KEfEutDvpvSSF1zcyaybSzh
	 caRarHzWU+ZS06QI2cljM+Ecn6X/9xMgFmzhhltGGzu0kJQGfw/yjfJOL60psSrba88F3
	 wOPsZE4iI8yvmiPNhqFBo+LaZZcSwA8hJVLDrWFaB42jWbJy+1IWZIenvdwWX1+GUxSi2
	 lhjPMVGw4V4xcLDGwFv3jlZlGCpxMJ/kkRRMGgdnenPGwfNc8LXzIzw8OmVV3ugq9RhQ4
	 FNn2if49qZOoaOwjq2M7/mCv8vMZOX11aDriS088bZq8qPaRitHAoYqyLrAl2vK4oVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAyxcFZx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9E606A31C;
	Mon,  9 Nov 2026 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAyxcFZx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C791F0089F;
	Mon,  9 Nov 2026 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794232292;
	bh=6YcYOdC7iHosICJsNPvA6c1/PmSp5VhjSW9aX6UnLmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aAyxcFZx4CjOcZ9lwqhVvPvhAJ9SWod3FcQZMUQhUdwuQjNS/yhPOF8u894Qxd/Q4
	 EglLqS7QJBn0G01aZn2nlWw6k0rpgMY1GwD/ce50b/82D6OayUUcv9KW2gc+x02ee3
	 dAJfStZMCyQkgHtAR8aSKWPSo8cymgby0XFYMkIPsTnK3boYWaKmj9Y9neWRQxaOV2
	 JR1NpakwROrC+QXRgxlLXusTIb93xnw9NAalDFvgKw1CQu8ADzRMmbnhPvwU+M3Xdn
	 dmNaYtSAp4/GVxpjcWerxnVYzkoAd3Kk+TYXhvoOyDo9Vl3YDEuWvQCfuq30LPq8BD
	 eYYWPHfQSg6Uw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Uladzislau Rezki <urezki@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3] rust: alloc: add per-task memalloc scope abstractions
In-Reply-To: <DMQOAI3KE9UD.3KOEVJO02ENM4@garyguo.net>
References: <20261109-gfp-noio-v3-1-a573e7be9c44@kernel.org>
 <DMQOAI3KE9UD.3KOEVJO02ENM4@garyguo.net>
Date: Mon, 09 Nov 2026 14:51:22 +0100
Message-ID: <87v766qfj9.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Mon Nov 9, 2026 at 10:37 AM GMT, Andreas Hindborg wrote:
>> Add an abstraction for the per-task allocation policies exposed by
>> the kernel through paired save/restore helpers in `linux/sched/mm.h`:
>> `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
>> `memalloc_pin`. Each pair sets a bit in `current->flags` and returns
>> the bits it added, which the restore call clears again. The pairing
>> assumes strict LIFO nesting; restoring out of order corrupts the
>> per-task state.
>>
>> Expose each pair as an implementation of a `ScopeKind` trait on the
>> tag types `NoIo`, `NoFs`, `NoReclaim` and `MemallocPin`. The trait's
>> provided `with` method saves the policy, runs a closure and restores
>> the policy before returning.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> Changes in v3:
>> - Rebase on v7.4-rc1.
>> - Replace the pinned `Scope` guard and `memalloc_scope!` macro with a
>>   closure-based `ScopeKind::with` entry point (Alice, Gary).
>> - Make the doctests compile and run under KUnit instead of `ignore`.
>> - Document that `NoReclaim` has no effect in hard interrupt context.
>> - Link to v2: https://msgid.link/20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org
>>
>> Changes in v2:
>> - Rewrite the patch to use scoped allocation flags instead of exposing
>>   a `GFP_NOIO` flag constant.
>> - Link to v1: https://lore.kernel.org/r/20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org
>> ---
>>  rust/bindings/bindings_helper.h |   1 +
>>  rust/helpers/mm.c               |  40 ++++++++++
>>  rust/kernel/alloc.rs            |   1 +
>>  rust/kernel/alloc/scoped.rs     | 171 ++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 213 insertions(+)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>> index 3791af0aadc7..df21b5b129a4 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -86,6 +86,7 @@
>>  #include <linux/refcount.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/sched.h>
>> +#include <linux/sched/mm.h>
>>  #include <linux/security.h>
>>  #include <linux/serdev.h>
>>  #include <linux/slab.h>
>> diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
>> index b5540997bd20..1e490b57057e 100644
>> --- a/rust/helpers/mm.c
>> +++ b/rust/helpers/mm.c
>> @@ -48,3 +48,43 @@ __rust_helper void rust_helper_vma_end_read(struct vm_area_struct *vma)
>>  {
>>  	vma_end_read(vma);
>>  }
>> +
>> +__rust_helper unsigned int rust_helper_memalloc_noio_save(void)
>> +{
>> +	return memalloc_noio_save();
>> +}
>> +
>> +__rust_helper void rust_helper_memalloc_noio_restore(unsigned int flags)
>> +{
>> +	memalloc_noio_restore(flags);
>> +}
>> +
>> +__rust_helper unsigned int rust_helper_memalloc_nofs_save(void)
>> +{
>> +	return memalloc_nofs_save();
>> +}
>> +
>> +__rust_helper void rust_helper_memalloc_nofs_restore(unsigned int flags)
>> +{
>> +	memalloc_nofs_restore(flags);
>> +}
>> +
>> +__rust_helper unsigned int rust_helper_memalloc_noreclaim_save(void)
>> +{
>> +	return memalloc_noreclaim_save();
>> +}
>> +
>> +__rust_helper void rust_helper_memalloc_noreclaim_restore(unsigned int flags)
>> +{
>> +	memalloc_noreclaim_restore(flags);
>> +}
>> +
>> +__rust_helper unsigned int rust_helper_memalloc_pin_save(void)
>> +{
>> +	return memalloc_pin_save();
>> +}
>> +
>> +__rust_helper void rust_helper_memalloc_pin_restore(unsigned int flags)
>> +{
>> +	memalloc_pin_restore(flags);
>> +}
>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>> index 68d80f3fa6c8..5e4c142b5682 100644
>> --- a/rust/kernel/alloc.rs
>> +++ b/rust/kernel/alloc.rs
>> @@ -6,6 +6,7 @@
>>  pub mod kbox;
>>  pub mod kvec;
>>  pub mod layout;
>> +pub mod scoped;
>>  
>>  pub use self::kbox::Box;
>>  pub use self::kbox::KBox;
>> diff --git a/rust/kernel/alloc/scoped.rs b/rust/kernel/alloc/scoped.rs
>> new file mode 100644
>> index 000000000000..6745c06d6725
>> --- /dev/null
>> +++ b/rust/kernel/alloc/scoped.rs
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Scoped allocation policies for the current task.
>> +//!
>> +//! The kernel exposes several per-task allocation policies through save/restore pairs in
>> +//! [`include/linux/sched/mm.h`]: `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
>> +//! `memalloc_pin`. Each pair sets a bit in `current->flags` and returns the bits it added, which a
>> +//! later call clears again. The save/restore APIs assume strict LIFO nesting; restoring out of
>> +//! order corrupts the per-task state.
>> +//!
>> +//! This module exposes each policy as a [`ScopeKind`] implementation. [`ScopeKind::with`] saves
>> +//! the policy, runs a closure and restores the policy before returning.
>> +//!
>> +//! [`include/linux/sched/mm.h`]: srctree/include/linux/sched/mm.h
>> +//!
>> +//! # Examples
>> +//!
>> +//! ```
>> +//! use kernel::alloc::scoped::{NoIo, ScopeKind};
>> +//!
>> +//! // Every allocation inside the closure behaves as if `GFP_NOIO` were set, even though the call
>> +//! // site passes `GFP_KERNEL`.
>> +//! let b = NoIo::with(|| KBox::new(42_u32, GFP_KERNEL))?;
>> +//! assert_eq!(*b, 42);
>> +//! # Ok::<(), Error>(())
>
> I think this usage looks a bit strange, especially that you have to import the
> `ScopeKind` trait which is a bit awkward API.
>
> Any reason to not just have API like this?
>
>     memalloc_flags_scope(MemallocScopeFlags::NO_IO, || KBox::new(42_u32, GFP_KERNEL))
>
> Added benefit is that you can just define different scope kinds as bitflags:
>
>     impl_flags!(
>         #[derive(Clone, Copy)]
>         pub struct MemallocScopeFlags(u32);
>
>         #[derive(Clone, Copy)]
>         pub enum MemallocScopeFlags {
>             NO_IO = PF_MEMALLOC_NOIO,
>             NO_FS = PF_MEMALLOC_NOFS,
>             NO_RECLAIM = PF_MEMALLOC,
>             PIN = PF_MEMALLOC_PIN,
>         }
>     );

Sure, we can do that. It's a bit long to write, but I guess that is OK.

Best regards,
Andreas Hindborg



