Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2347F1DC1AB;
	Fri, 14 Nov 2025 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133870; cv=none; b=cq2yAq3AP/+IQ5zVwyhPqYumXOJH4xIGZqzBWBddbGdBWghODpoyW4J4frGohxoLSUoT02sBRpCUNVcCkujb7V4sR3Zlre7xAkddUpLG2YBP8GDDIshdaTGuRL1uSxqJameSpByXIH0sFD0HMeYNnIR8TDmk9Mlnbz6jPV13HVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133870; c=relaxed/simple;
	bh=QBSnPvSO1GNVbt+v4ouKlCcxmuLb1PsUsCj+WCfoziA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XCiNDxekOUXVfelOld5bzzN4ZRuu1sgHWlviZKmIQH8/e44krXuYN7eYzzKItaQ29nAaF8dl0QeirpXa3E8dd58F9fFleia0EKrtz2iDXpG7f1nZBRUkr9RJrOWV8DhLRMWvKSrBTZgGEHZPRvIRY7GtwDm+qADMSYU4eAxmmUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfMf1lEE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfMf1lEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B65C116B1;
	Fri, 14 Nov 2025 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133869;
	bh=QBSnPvSO1GNVbt+v4ouKlCcxmuLb1PsUsCj+WCfoziA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DfMf1lEEs2cqFcQ7RTwcJNZB4afx8bxgA1C+4hrJF1QRTh5F8m4fX2UbUFXOnNrmV
	 DtlzLSCbubbaKxYigDV3/8WZmjOtdrp4ffKdTKPaZEgsb+2PomIQpNnz4OP418GJgF
	 XU0UK8VTHK0p2jusTvvzsA5Lx9YC9zH+Rhk+bOQEOV7DXFfn2HxnaKixAG5YcmMyvZ
	 XD985/x5+9w9KVOou+md6yTNlZJ3/nu1Es1KfAig2rriaYqs3hIREXyuCCPHVtb0Bo
	 JBLH8XAswkzNabET3ueqDRX6gzI5EO/VwpGt8FtT1xe7K5uLO/HmLBzZvsmWHT24Pv
	 dThWV7yWlWedg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mitchell Levy <levymitchell0@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph
 Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin
 <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, Viresh Kumar
 <viresh.kumar@linaro.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
Subject: Re: [PATCH v4 5/9] rust: percpu: introduce a rust API for dynamic
 per-CPU variables
In-Reply-To: <20251105-rust-percpu-v4-5-984b1470adcb@gmail.com>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
 <9HWB8ewzZ5ZFApS4ggvpeoZmA-oRMmwXv2XOy_c_Ck7HkH7QOR0EaFmGnjNTmk22baplRPX3UcbWj9WnXw0r-A==@protonmail.internalid>
 <20251105-rust-percpu-v4-5-984b1470adcb@gmail.com>
Date: Fri, 14 Nov 2025 16:24:16 +0100
Message-ID: <87jyzs3ae7.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mitchell Levy" <levymitchell0@gmail.com> writes:

> Dynamically allocated per-CPU variables are core to many of the
> use-cases of per-CPU variables (e.g., ref counting). Add support for
> them using the core `PerCpuPtr<T>` primitive, implementing the
> `PerCpu<T>` trait.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/helpers/percpu.c         |  10 ++++
>  rust/kernel/percpu.rs         |  30 ++++++++--
>  rust/kernel/percpu/dynamic.rs | 130 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+), 4 deletions(-)
>
> diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
> index a091389f730f..35656333dfae 100644

<cut>

> diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
> new file mode 100644
> index 000000000000..1863f31a2817
> --- /dev/null
> +++ b/rust/kernel/percpu/dynamic.rs
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//! Dynamically allocated per-CPU variables.
> +
> +use super::*;
> +
> +use crate::alloc::Flags;
> +use crate::bindings::{alloc_percpu, free_percpu};
> +use crate::cpumask::Cpumask;
> +use crate::prelude::*;
> +use crate::sync::Arc;
> +use core::mem::{align_of, size_of, MaybeUninit};
> +
> +/// Represents a dynamic allocation of a per-CPU variable via `alloc_percpu`. Calls `free_percpu`
> +/// when dropped.
> +///
> +/// # Contents
> +/// Note that the allocated memory need not be initialized, and this type does not track when/if
> +/// the memory location on any particular CPU has been initialized. This means that it cannot tell
> +/// whether it should drop the *contents* of the allocation when it is dropped. It is up to the
> +/// user to do this via something like [`core::ptr::drop_in_place`].
> +pub struct PerCpuAllocation<T>(PerCpuPtr<T>);
> +
> +impl<T: Zeroable> PerCpuAllocation<T> {
> +    /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`,
> +    /// initially filled with the zero value for `T`.
> +    ///
> +    /// Returns [`None`] under the same circumstances the C function `alloc_percpu` returns `NULL`.
> +    pub fn new_zero() -> Option<PerCpuAllocation<T>> {
> +        let ptr: *mut MaybeUninit<T> =
> +            // SAFETY: No preconditions to call `alloc_percpu`; `MaybeUninit<T>` is
> +            // `#[repr(transparent)]`, so we can cast a `*mut T` to it.
> +            unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) }.cast();
> +        if ptr.is_null() {
> +            return None;
> +        }
> +
> +        // alloc_percpu returns zero'ed memory
> +        Some(Self(PerCpuPtr::new(ptr)))
> +    }
> +}
> +
> +impl<T> PerCpuAllocation<T> {
> +    /// Makes a per-CPU allocation sized and aligned to hold a `T`.
> +    ///
> +    /// Returns [`None`] under the same circumstances the C function `alloc_percpu` returns `NULL`.
> +    pub fn new_uninit() -> Option<PerCpuAllocation<T>> {
> +        let ptr: *mut MaybeUninit<T> =
> +            // SAFETY: No preconditions to call `alloc_percpu`; `MaybeUninit<T>` is
> +            // `#[repr(transparent)]`, so we can cast a `*mut T` to it.
> +            unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) }.cast();
> +        if ptr.is_null() {
> +            return None;
> +        }
> +
> +        Some(Self(PerCpuPtr::new(ptr)))
> +    }
> +}
> +
> +impl<T> Drop for PerCpuAllocation<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: self.0.0 was returned by alloc_percpu, and so was a valid pointer into
> +        // the percpu area, and has remained valid by the invariants of PerCpuAllocation<T>.
> +        unsafe { free_percpu(self.0 .0.cast()) }
> +    }
> +}
> +
> +/// Holds a dynamically-allocated per-CPU variable.

Can we place an example here? It was a bit difficult for me to figure
out how to use this from browsing the documentation. Perhaps we can lift
some of the sample out and add it as a documentation example here?


Best regards,
Andreas Hindborg


