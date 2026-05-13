Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155227FB3C;
	Wed, 13 May 2026 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685198; cv=none; b=N0kVKmJXHDItChPrH9vFAj0AwjleMfZ+EIaV2hC+bhOsyNIlKMLPn58FtfDbF3DbhtNCnqm43B5z/nGTt8DdoqQO+bcUIiP9XG4vOnitrwUTJOcDrIsnEYSjDk7/OCY5bw2s4dOIoPSksNATAE/wDW0ARtTKvLuk+4gP5Oejj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685198; c=relaxed/simple;
	bh=f53eQMNw1MXLx49knw3IyvrGRfcBx+4ofVicsi31l+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=czVIgm2wpBz1Tv3DfpCYtXBrBveeHrbUEgkDI8zBDrjLaQ+z/jil3ht9RTnJ88VA1d6xQM06S0j0JJGCxb8phUMZ29NMc7Jb2vr9CFtgMkmypzwcOuX+AOIZsPL7jHXZKNrlYE0/bc8BgUEYZse/PrA6btoGukMDjJs0D3naNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGPk2lew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGPk2lew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0172C19425;
	Wed, 13 May 2026 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778685198;
	bh=f53eQMNw1MXLx49knw3IyvrGRfcBx+4ofVicsi31l+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AGPk2lewGXI6a5gdUg6OSufv0tOdlrBq7FdOMHJ1/wJIL6dduCgAk19PUUXtUp4fM
	 /McIU9hHfLsPzSYdUJsFHZaeqnC7k4EYjroX18FF8xneTdDKtNREAIZPFYqIGFDvDx
	 tFNsFrkqSFN//lQCBZCCqo2lOj2nUy8b/KtENtXzMvCEM0Yb/tR+f86b8ct3iYiZSv
	 okXYa3GrKjhSMJj+JmDALImZz4bShzOoETztykQrh7sni23Vin8nsNo5wjVB84SD+i
	 fWH0AbCgWsU5/C6iEWbfzOrrQJRHaBjzSeV3dOQLbWPzn5CZskytHRcuE+CUJNyA0h
	 zU7meXtNRzfcw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Akinobu
 Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] fault-inject: rust: add a Rust API for fault-injection
In-Reply-To: <DGPTFSM1EK7V.1VEG57EE9DT6K@garyguo.net>
References: <20260215-rust-fault-inject-v1-1-6ec459cb5ccb@kernel.org>
 <DGPTFSM1EK7V.1VEG57EE9DT6K@garyguo.net>
Date: Wed, 13 May 2026 17:13:08 +0200
Message-ID: <87pl2z4a2j.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sun Feb 15, 2026 at 9:30 PM GMT, Andreas Hindborg wrote:
>> Add a way for Rust code to create fault-injection control points. The
>> control points can be attached to a configfs tree as default groups and
>> controlled from user space. On the kernel side, provide a `should_fail`
>> method to query if an operation should fail.
>>
>> Cc: Akinobu Mita <akinobu.mita@gmail.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> This patch is a dependency for the rust null block driver fault
>> injection feature.
>> ---
>>  rust/bindings/bindings_helper.h |  1 +
>>  rust/kernel/fault_injection.rs  | 88 +++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs              |  2 +
>>  3 files changed, 91 insertions(+)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>> index a067038b4b422..87cbaf69d330e 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -54,6 +54,7 @@
>>  #include <linux/errname.h>
>>  #include <linux/ethtool.h>
>>  #include <linux/fdtable.h>
>> +#include <linux/fault-inject.h>
>>  #include <linux/file.h>
>>  #include <linux/firmware.h>
>>  #include <linux/interrupt.h>
>> diff --git a/rust/kernel/fault_injection.rs b/rust/kernel/fault_injection.rs
>> new file mode 100644
>> index 0000000000000..e9afa3ca6cf31
>> --- /dev/null
>> +++ b/rust/kernel/fault_injection.rs
>> @@ -0,0 +1,88 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Fault injection capabilities infrastructure.
>> +//!
>> +//! This module provides a Rust API for the kernel fault injection framework.
>> +//! Fault injection allows simulation of failures in kernel code paths to test
>> +//! error handling.
>> +//!
>> +//! [`FaultConfig`] represents a fault injection control point that can be:
>> +//!
>> +//! - Attached to a configfs tree as a default group, allowing userspace control
>> +//!   of fault injection parameters.
>> +//! - Queried via [`FaultConfig::should_fail`] to determine if an operation
>> +//!   should be simulated as failing.
>> +//!
>> +//! Please see the [fault injection documentation] for details on configuring
>> +//! and using fault injection from userspace.
>> +//!
>> +//! C header: [`include/linux/fault-inject.h`](srctree/include/linux/fault-inject.h)
>> +//!
>> +//! [fault injection documentation]: srctree/Documentation/fault-injection/fault-injection.rst
>> +
>> +use crate::{prelude::*, types::Opaque};
>> +
>> +/// A fault injection control point.
>> +///
>> +/// This type wraps a `struct fault_config` from the C fault injection
>> +/// framework. It provides a way to create controllable fault injection points
>> +/// that can be configured via configfs.
>> +///
>> +/// When attached to a configfs subsystem as a default group, userspace can
>> +/// configure fault injection parameters through the configfs interface. The
>> +/// kernel code can then query [`FaultConfig::should_fail`] to determine
>> +/// whether to simulate a failure.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `self.inner` is always a valid `struct fault_config`.
>> +#[pin_data]
>> +pub struct FaultConfig {
>> +    #[pin]
>> +    inner: Opaque<bindings::fault_config>,
>> +}
>> +
>> +impl FaultConfig {
>> +    /// Create a new [`FaultConfig`].
>> +    ///
>> +    /// If attached to a configfs group, this [`FaultConfig`] will appear as a directory named
>> +    /// `name`.
>> +    pub fn new(name: &CStr) -> impl PinInit<Self> + use<'_> {
>> +        pin_init!(Self {
>> +            // INVARIANT: `self.inner` is initialized in ffi_init.
>> +            inner <- Opaque::zeroed().chain(|inner| {
>> +                let ptr = inner.get();
>> +                // SAFETY: `ptr` points to a zeroed allocation and the second argument is null
>> +                // terminated string.
>> +                unsafe { bindings::fault_config_init( ptr, name.as_ptr().cast()) };
>> +                Ok(())
>> +            }),
>> +        })
>> +    }
>> +}
>> +
>> +impl kernel::configfs::CDefaultGroup for FaultConfig {
>> +    fn group_ptr(&self) -> *mut bindings::config_group {
>> +        // SAFETY: By type invariant, `self.inner` is valid.
>> +        unsafe { &raw mut (*self.inner.get()).group }
>> +    }
>> +}
>> +
>> +impl FaultConfig {
>> +    /// Query for failure.
>> +    ///
>> +    /// Returns true if the operation should fail.
>
> #[inline]

Ok.

>
>> +    pub fn should_fail(&self, size: isize) -> bool {
>
> What is the meaning of a negative `size` here?
>
> I did a quick grep on the C codebase and cannot find a case where negative
> number is used here. It is either number of bytes for allocations, or `1` for
> when injecting based on number of operations performed.

It looks like you can increase the resource amount before failures
happen by passing a negative number:

		atomic_sub(size, &attr->space);

>
> I think it's also worth explaining about the meaning of size here a bit more in
> the doc comments.

I'll add some docs and link to Documentation/fault-injection.


Best regards,
Andreas Hindborg


