Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E272D0C7E;
	Tue,  2 Dec 2025 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764698449; cv=pass; b=HZxDuwrvsyiHxfcSV3q/KbaDjlmhlFpCNM9+AzaXSJtqW9cqMK9wYI9gsOw1vHP8gJrNj1fpvgVHSwc+ShqepRK66tZIcBoz+6lKGINMDZ0U0m+xz7Uuy8a0REkkVH8dqTtA8xeuK88JOJnnh83XjcUP+MQzjcQAeRnP3dnpA88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764698449; c=relaxed/simple;
	bh=u3O71JXtZ8RZcMvYuuG15zhd45/hiicLwocG2JNNgCY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sklIsDnqA6/4VpNvrpvq5RmaZ2l1JVylbVUzzX9oCohrY33znE/0TyXtTutbpVfrHiis1oOiUQx1t/MdKsJYyVSBpP1cp+LXo3xp82bcC2txumLYNiyiyt6PR7AMjQBd4yTvdEm8eD+jSao5qda9LGb2rLQdB8nLvOAwELlDAkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=FAuN1Pjq; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FAuN1Pjq"
ARC-Seal: i=1; a=rsa-sha256; t=1764698417; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eOwc3XaHwnKBAdWfTvdA/PrRn2hrAHsCzxUrblE0OmBT0gEpsEeihxHFHUli7EBb7xK8t3jLnHAIIAiwJGcPwD149X2aFjiZbpxJ9pNkaxDpBAlgLqE9JUrxRBOzy/OrLhyU08IiNnNqiOv8WptnAVD0i0cENL50BfH5KRNzNfs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764698417; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4SrLXjKyuya/cjV/WDSTmkpZ38WAd/RxXjY2O6Fo5s8=; 
	b=nFGVXY4iEb3vkvpK1F/bB1KQo55AD5mqenO733zjuhwes5/DnlVw0RrvjPZPeyqxjzLFiUBgleUiTVrZE9xd9XLZNyF3lOI+lLx1TFYjj9I3aPSQZwN+jHd+K8d2V/DrvHse7eQZ/R/3PtacvjXwlptyEPv0TFB4gqvxBt/HlMY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764698417;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=4SrLXjKyuya/cjV/WDSTmkpZ38WAd/RxXjY2O6Fo5s8=;
	b=FAuN1Pjq4zys9iSaEZt6mdigEfaG/+LUDmAoD3gKryG3SlIhjs0bw8RBSFgTDmJV
	nj7r0gTbG26sK8fdhnavCC8tRV7WkAjAMKl33bk06ypkkHRbsREKRkCaRa+2atNmG5V
	3z2P5iUZ7FpinkAP5UKlTuifvMeuzQcDkvaMrFqE=
Received: by mx.zohomail.com with SMTPS id 1764698415670477.5816350472362;
	Tue, 2 Dec 2025 10:00:15 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 4/6] rust: implement Class for ww_class support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201102855.4413-5-work@onurozkan.dev>
Date: Tue, 2 Dec 2025 14:59:59 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C57F6478-F365-4FCB-B4B2-7ADB6B4793E3@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-5-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

> On 1 Dec 2025, at 07:28, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Adds the Class type, the first step in supporting
> ww_mutex in Rust. Class represents ww_class, used
> for deadlock avoidance for supporting both wait-die
> and wound-wait semantics.
>=20
> Also adds the define_class macro for safely declaring
> static instances.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> rust/kernel/sync/lock.rs                |   1 +
> rust/kernel/sync/lock/ww_mutex.rs       |   7 ++
> rust/kernel/sync/lock/ww_mutex/class.rs | 156 ++++++++++++++++++++++++
> 3 files changed, 164 insertions(+)
> create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
> create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
>=20
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 27202beef90c..5b320c2b28c1 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -15,6 +15,7 @@
>=20
> pub mod mutex;
> pub mod spinlock;
> +pub mod ww_mutex;
>=20
> pub(super) mod global;
> pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, =
GlobalLockedBy};
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs =
b/rust/kernel/sync/lock/ww_mutex.rs
> new file mode 100644
> index 000000000000..727c51cc73af
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust abstractions for the kernel's wound-wait locking primitives.

Can you link to the docs here?

> +
> +pub use class::Class;
> +
> +mod class;
> diff --git a/rust/kernel/sync/lock/ww_mutex/class.rs =
b/rust/kernel/sync/lock/ww_mutex/class.rs
> new file mode 100644
> index 000000000000..b0753093f1e0
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/class.rs
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Provides [`Class`] to group wound/wait mutexes to be acquired =
together
> +//! and specifies which deadlock avoidance algorithm to use (e.g., =
wound-wait
> +//! or wait-die).
> +//!
> +//! The [`define_class`] macro and =
[`Class::new_wait_die`]/[`Class::new_wound_wait`]
> +//! constructors provide safe ways to create classes.
> +
> +use crate::bindings;
> +use crate::prelude::*;
> +use crate::types::Opaque;
> +
> +/// Creates static [`Class`] instances.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::{c_str, define_class};
> +///
> +/// define_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait, =
c_str!("wound_wait_global_class"));
> +/// define_class!(WAIT_DIE_GLOBAL_CLASS, wait_die, =
c_str!("wait_die_global_class"));
> +/// ```
> +#[macro_export]
> +macro_rules! define_class {
> +    ($name:ident, wound_wait, $class_name:expr) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::Class =3D
> +            // SAFETY: This is `static`, so address is fixed and =
won't move.
> +            unsafe { =
$crate::sync::lock::ww_mutex::Class::unpinned_new($class_name, false) };
> +    };
> +    ($name:ident, wait_die, $class_name:expr) =3D> {
> +        static $name: $crate::sync::lock::ww_mutex::Class =3D
> +            // SAFETY: This is `static`, so address is fixed and =
won't move.
> +            unsafe { =
$crate::sync::lock::ww_mutex::Class::unpinned_new($class_name, true) };
> +    };
> +}
> +
> +/// Used to group mutexes together for deadlock avoidance.
> +///
> +/// All mutexes that might be acquired together should use the same =
class.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::Class;
> +/// use kernel::c_str;
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let _wait_die_class =3D =
Class::new_wait_die(c_str!("some_class")));
> +/// stack_pin_init!(let _wound_wait_class =3D =
Class::new_wound_wait(c_str!("some_other_class")));
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +#[repr(transparent)]
> +pub struct Class {
> +    #[pin]
> +    pub(super) inner: Opaque<bindings::ww_class>,

Do you plan on ever extending this? A tuple struct might make more sense =
otherwise.

> +}
> +
> +// SAFETY: [`Class`] is set up once and never modified. It's fine to =
share it across threads.

> +unsafe impl Sync for Class {}
> +// SAFETY: Doesn't hold anything thread-specific. It's safe to send =
to other threads.
> +unsafe impl Send for Class {}

Please keep Foo and impl Foo together. The very next thing one wants to =
see after a
type definition is its implementation.

i.e.:

struct Foo;

impl Foo {=E2=80=A6}

impl Bar for Foo {=E2=80=A6}

> +
> +impl Class {
> +    /// Creates an unpinned [`Class`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// Caller must guarantee that the returned value is not moved =
after creation.
> +    pub const unsafe fn unpinned_new(name: &'static CStr, =
is_wait_die: bool) -> Self {

IMHO new_unpinned() would be a better name. Also, where is this used?

By the way, this will immediately move Self out of this function, which =
is
technically after its creation (i.e.: it=E2=80=99s after the Class {=E2=80=
=A6}
construct). Is this ok?



> +        Class {
> +            inner: Opaque::new(bindings::ww_class {
> +                stamp: bindings::atomic_long_t { counter: 0 },
> +                acquire_name: name.as_char_ptr(),
> +                mutex_name: name.as_char_ptr(),
> +                is_wait_die: is_wait_die as u32,
> +                // TODO: Replace with =
`bindings::lock_class_key::default()` once
> +                // stabilized for `const`.
> +                //
> +                // SAFETY: This is always zero-initialized when =
defined with
> +                // `DEFINE_WD_CLASS` globally on C side.
> +                //
> +                // For reference, see __WW_CLASS_INITIALIZER() in
> +                // "include/linux/ww_mutex.h".
> +                acquire_key: unsafe { core::mem::zeroed() },
> +                // TODO: Replace with =
`bindings::lock_class_key::default()` once
> +                // stabilized for `const`.
> +                //
> +                // SAFETY: This is always zero-initialized when =
defined with
> +                // `DEFINE_WD_CLASS` globally on C side.
> +                //
> +                // For reference, see __WW_CLASS_INITIALIZER() in
> +                // "include/linux/ww_mutex.h".
> +                mutex_key: unsafe { core::mem::zeroed() },
> +            }),
> +        }
> +    }
> +
> +    /// Creates a [`Class`].
> +    ///
> +    /// You should not use this function directly. Use the =
[`define_class!`]
> +    /// macro or call [`Class::new_wait_die`] or =
[`Class::new_wound_wait`] instead.
> +    fn new(name: &'static CStr, is_wait_die: bool) -> impl =
PinInit<Self> {
> +        pin_init! {
> +            Self {
> +                inner <- Opaque::ffi_init(|slot: *mut =
bindings::ww_class| {
> +                    // SAFETY: The fields are being initialized. The =
`name` pointer is valid for a
> +                    // static lifetime. The keys are zeroed, which is =
what the C side does.
> +                    unsafe {
> +                        slot.write(bindings::ww_class {
> +                            stamp: bindings::atomic_long_t { counter: =
0 },
> +                            acquire_name: name.as_char_ptr(),
> +                            mutex_name: name.as_char_ptr(),
> +                            is_wait_die: is_wait_die.into(),
> +                            // TODO: Replace with =
`bindings::lock_class_key::default()` once
> +                            // stabilized for `const`.
> +                            //
> +                            // SAFETY: This is always =
zero-initialized when defined with
> +                            // `DEFINE_WD_CLASS` globally on C side.
> +                            //
> +                            // For reference, see =
__WW_CLASS_INITIALIZER() in
> +                            // "include/linux/ww_mutex.h".
> +                            acquire_key: core::mem::zeroed(),
> +                            mutex_key: core::mem::zeroed(),
> +                        });
> +                    }
> +                }),
> +            }
> +        }
> +    }
> +
> +    /// Creates wait-die [`Class`].
> +    pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self> {
> +        Self::new(name, true)
> +    }
> +
> +    /// Creates wound-wait [`Class`].
> +    pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> =
{
> +        Self::new(name, false)
> +    }
> +
> +    /// Creates a [`Class`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` points to the `inner` field =
of
> +    /// [`Class`] and that it remains valid for the lifetime `'a`.
> +    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class) -> =
&'a Self {
> +        // SAFETY: By the safety contract, `ptr` is valid to =
construct `Class`.
> +        unsafe { &*ptr.cast() }
> +    }
> +}
> --=20
> 2.51.2
>=20
>=20

