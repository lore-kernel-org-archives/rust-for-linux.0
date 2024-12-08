Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320A139566
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733665456; cv=none; b=Wj9sNOgtmA+h/5AEAq0Wv6+mpHrGuiDH22peqFWnY5ljxX4zgE6Y4MiYNdOzIuXm8UfSa3b9QdzRK0QyRmp49D5UeIA/+luqkj1zSD3NzdXB6OcROpvbBmYVA5TKQIXe2eYHG1BHj54Yqyp7MoilYS8YL9UEvqRAZDA84yonoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733665456; c=relaxed/simple;
	bh=OpakwC+AxKeq8UXNkKWGakEU/Xc/8sQzPrpu64E5QRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmg5fdvxPg0UOu0tiuC0CsK/09heQ364EyVZN2c25zPVje06gu6iyWdQTT2OpIKbFuiCJRDiM/KeBPbqA2q76LjmJ90uJBsWixjqgY3TGKxK7+if3e7cBQGnsxT7NrmjVhnWZQiKvRMIhXUwSQtHNEt3cTUaeu5G/W5XPYILDj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AWQ18+vy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AWQ18+vy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF85DC4CED2;
	Sun,  8 Dec 2024 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733665454;
	bh=OpakwC+AxKeq8UXNkKWGakEU/Xc/8sQzPrpu64E5QRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWQ18+vyqHNjsp1qrcllbBsMaBNCIdzgVFGdfdteY7GFxx6GYS/b91TjDVg7cLTjr
	 alQI/WHG1D7umDBhh3z5eBHFnuM482DX65pILkwyO6EjKBjl3ykfS6tVshq+CWRwA8
	 bJLkNS8V3JVuyKSix5U+uJhLI1ItYpEBn1DwpajY=
Date: Sun, 8 Dec 2024 14:43:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] rust: kernel: kobject: basic sysfs implementation
Message-ID: <2024120849-mumbling-lucrative-006d@gregkh>
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <20241208131545.386897-3-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208131545.386897-3-daniel@sedlak.dev>

On Sun, Dec 08, 2024 at 02:15:44PM +0100, Daniel Sedlak wrote:
> Implement initial support for interacting with sysfs
> via kobject API from the Rust world. Rust for now does
> not expose any debug interface or interface for tuning
> knobs of the kernel module. Sysfs is used for exporting
> relevant debugging metrics or it can be used for
> tuning module configuration in the runtime (apart from
> module parameters).

sysfs is NOT for debugging, it's for system parameters of devices or
other things.

debugfs is for debugging, if you want debugging interfaces, use that
please!

> This patch builds on a prior work [1] by Martin RR, which
> is listed in the old patch registry [2]. However the [1]
> seems to be only focused on exposing devices to the sysfs,
> where this patch tries to be more broad, not only specific
> to the devices.
> 
> Link: https://github.com/YakoYakoYokuYoku/linux/commits/sysfs-support [1]
> Link: https://github.com/tgross35/RFL-patch-registry [2]
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> ---
>  rust/kernel/kobject.rs | 271 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   2 +
>  2 files changed, 273 insertions(+)
>  create mode 100644 rust/kernel/kobject.rs
> 
> diff --git a/rust/kernel/kobject.rs b/rust/kernel/kobject.rs
> new file mode 100644
> index 000000000000..9fcc026c83db
> --- /dev/null
> +++ b/rust/kernel/kobject.rs
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// TODO: Add unsafe doc documentation.
> +#![allow(clippy::undocumented_unsafe_blocks, clippy::missing_safety_doc)]
> +
> +//! KObject wrappers.
> +//!
> +//! TODO: Write more
> +
> +use bindings::PAGE_SIZE;
> +use core::marker::PhantomData;
> +use core::marker::PhantomPinned;
> +use core::mem;
> +use core::ptr;
> +use kernel::c_str;
> +use kernel::container_of;
> +use kernel::error::code::*;
> +use kernel::prelude::*;
> +use kernel::str::{CStr, CString};
> +use kernel::types::Mode;
> +use kernel::types::Opaque;
> +
> +/// Reference to the subsystems from the non Rust world.
> +pub mod subsystems {
> +    use super::DynamicKObject;
> +
> +    macro_rules! declare_kobject {
> +        ($name:tt, $subsystem_ptr:expr, $($doc:expr),+) => {
> +            $(
> +            #[doc = $doc]
> +            )*
> +            pub static $name: DynamicKObject = DynamicKObject {
> +                pointer: kernel::types::Opaque::new(
> +                    core::ptr::addr_of!($subsystem_ptr).cast_mut(),
> +                ),
> +            };
> +        };
> +    }
> +
> +    declare_kobject!(
> +        FIRMWARE_KOBJECT,
> +        bindings::firmware_kobj,
> +        "Firmware subsystem dynamic KObject."
> +    );
> +    declare_kobject!(
> +        KERNEL_KOBJECT,
> +        bindings::kernel_kobj,
> +        "Kernel subsystem dynamic KObject."
> +    );
> +    declare_kobject!(
> +        MM_KOBJECT,
> +        bindings::mm_kobj,
> +        "Memory management subsystem dynamic KObject."
> +    );
> +    declare_kobject!(
> +        POWER_KOBJECT,
> +        bindings::power_kobj,
> +        "Power subsystem dynamic KObject."
> +    );

Please don't export these unless you have a real user.  I doubt rust
code will be placing stuff in the power of mm kobjects (and if so, the
maintainers of those subsystems MUST review that.)  Same for the other
kobjects as well.

> +
> +    // TODO: Add rests of the exported Kobjects.
> +}
> +
> +/// DynamicKObject is same as [`KObject`], however it does not have any state.
> +pub struct DynamicKObject {

Why the funny name, why not just Kobject?

> +    // The bindings export `extern static *mut bindings::kobejct`, however
> +    // we need to have double pointer because rustc complains with
> +    // `could not evaluate static initializer`.
> +    pointer: Opaque<*mut *mut bindings::kobject>,
> +}
> +
> +unsafe impl Send for DynamicKObject {}
> +unsafe impl Sync for DynamicKObject {}

All kobjects should be dynamic, so why is this needed?

Yes, a few are not, but I really really really do not want any rust code
to follow the mistakes of C code where that happens if at all possible.
Let's take the chance to fix the mistakes of our youth when we can.

> +/// KObject represent wrapper structure enables interaction with
> +/// the sysfs, where the KObject represents directory.
> +///
> +/// TODO: Add examples?
> +pub struct KObject<K> {

Why the "O"?

> +    data: K,
> +    pointer: Opaque<bindings::kobject>,
> +
> +    // Struct must be `!Unpin`, because kobject pointer is self referential.
> +    _m: PhantomPinned,
> +}

So that's all?  Where is the kobject_get() call?

> +impl<K> Drop for KObject<K> {
> +    fn drop(&mut self) {
> +        // SAFETY: This KObject holds a valid reference, because it was allocated
> +        // through kobject API.
> +        unsafe { bindings::kobject_put(self.pointer.get()) }
> +    }
> +}
> +
> +#[doc(hidden)]
> +struct KObjTypeVTable;
> +#[doc(hidden)]
> +impl KObjTypeVTable {
> +    unsafe extern "C" fn release_callback(kobj: *mut bindings::kobject) {
> +        unsafe { bindings::kfree(kobj.cast()) }
> +    }
> +
> +    pub(crate) const KOBJ_TYPE: bindings::kobj_type = bindings::kobj_type {
> +        release: Some(Self::release_callback),

Note, release callbacks are REQUIRED for a kobject, can we enforce that
here somehow?

> +        sysfs_ops: ptr::addr_of!(bindings::kobj_sysfs_ops),

Why would you allow access to a kobject's sysfs_ops?  What needs that?

> +        ..unsafe { mem::zeroed() }

What does this do?

> +    };
> +
> +    pub(crate) fn kobj_type(&self) -> &'static bindings::kobj_type {
> +        &Self::KOBJ_TYPE
> +    }
> +}
> +
> +unsafe impl<K> Send for KObject<K> where K: Send {}
> +unsafe impl<K> Sync for KObject<K> where K: Sync {}
> +
> +impl<K> KObject<K> {
> +    /// Attaches KObject to the sysfs root.
> +    pub fn new_in_root(name: CString, data: K) -> Result<Pin<KBox<Self>>> {
> +        Self::new(name, ptr::null_mut(), data)
> +    }

Please never create a kobject in sysfs's root.  Let's let C code only do
that for now.  If this does come up in the future, talk to me and we can
reconsider it.

> +    /// Attaches new KObject to the sysfs with specified KObject parent.
> +    pub fn new_with_kobject_parent<L>(
> +        name: CString,
> +        parent: &KObject<L>,
> +        data: K,
> +    ) -> Result<Pin<KBox<Self>>> {
> +        Self::new(name, parent.pointer.get(), data)
> +    }

Where is the parent dropped?  And these function names are not matching
up with the C api, why not?

> +
> +    /// Attaches new KObject to the sysfs with specified **dynamic** KObject parent.

All kobjects are dynamic.  If not, please point them out to me (hint, I
know a few but we really should fix them.)

> +    pub fn new_with_dynamic_kobject_parent(

You should never know, or care, about the lifetyle/cycle of your parent
kobject, so why need two different functions?

I'm going to stop here, let's see a real example please.  Wrapping a
kobject is only a last-resort for me, I really want to see proper users
of the in-kernel apis we have already before resorting to "raw"
kobjects.

Note, the one big offender right now is filesystems, and I will push to
finally get a "real" filesystem kobject api created so that filesystems
in rust do NOT have to deal with raw kobjects, but can instead use a
correct api instead, which will prevent all of the current problems that
filesystems have when dealing with raw kobjects (see the mailing list
archives for loads of examples of this.)

Also, a final nit, why didn't you cc: the kobject maintainer on all of
this?  You're lucky I'm on the rust mailing list and happened to noice
this series to hopefully save you some time :)

thanks,

greg k-h
