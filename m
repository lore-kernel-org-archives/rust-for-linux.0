Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A8323183F;
	Tue, 25 Nov 2025 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087203; cv=pass; b=Yr0AqdJQwmXB3nh7WgdkyyKceGPqGDUBYeDTO/PWb1dhK99mRfekojpMyfuwH05ycsZ+aRFhcz9tvGITFDdMy2gi6JuLNNFHudp4yCoNrBFuyM5Ih6ZiOJMCTSr2I0rZNwg7DCa2ocOJmGtilkXLm746gr90RtKqIvQh+ghNH2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087203; c=relaxed/simple;
	bh=CJbQAT0ng6MDQw4JpoPLbrxpkK7+sXfEUCnP+ZXF9sg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pCkKd2He/AUsPB19/J4H583heNIUmIIKAH7nd+DgSFQ/ydfJPGwoxLeFlbCm8oWvbwmm+SsoSRDMOiAQodE7zJi2qUlVJEy7rE8JwhNZKei78EfmSUeqlrWJNyK4inM2nCLOWRtyGj8ZnPdDc0X1dp9njFmx4dC2U64ZaZfSs6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=iD8cU2vN; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="iD8cU2vN"
ARC-Seal: i=1; a=rsa-sha256; t=1764087166; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ve+QzZKDUlOKbpCF3ENJqUl5LwPbdnaG9r/nyTK8KT4PSIFOU92se39ouzw8aqfQWtualSdKltKHzDPmNVV00nGWTcpsPmCg0Y6eij/vY19UQKCTutMrroCKtFg1vhM6JToi0ppiCuUsbzsYAYOhrE3LTtJcG/kLYm2yDaKIre8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764087166; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9Ej0ZQGTkcqQMO6w7sm5scQ+5o7WU+t/t+F414/0/n4=; 
	b=PTZZXpKZqUo2me9XtYS8GwgRWm9oVbSajkU/B7/1X0ntLcgblhknxGOTUpNeAY/6cDshUxziSTZ6hwPulQwutnPegcK+Cto2Ugd9TYbydmT2ojBjMgRDu289GoUtheCken8IlGQwjJPNNlfKOAWj99MZnsqZbKeJ++tIBJO5Ssk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764087166;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=9Ej0ZQGTkcqQMO6w7sm5scQ+5o7WU+t/t+F414/0/n4=;
	b=iD8cU2vNBqPWdcQ/XMYT4sO8oYQx6nLJYO6mQXY/R5SFAf0dzrhMiA3up6r/SnvS
	mht6qgkB62zaJO83dRP+tXxRh3dPVtyygGzerK+0MniGlscd/t7uByARTTkJRbofMVB
	4n+QRSg/HyXusWIZ/oDVBMJ+OGQkgT5ARgFt42Io=
Received: by mx.zohomail.com with SMTPS id 1764087163200500.7337392976698;
	Tue, 25 Nov 2025 08:12:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 2/6] rust: implement `Class` for ww_class support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251101161056.22408-3-work@onurozkan.dev>
Date: Tue, 25 Nov 2025 13:12:27 -0300
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
 bjorn3_gh@protonmail.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <45CD97A1-F3CF-4B26-9DEC-3A2694A1FFF6@collabora.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
 <20251101161056.22408-3-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Nov 2025, at 13:10, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Adds the `Class` type, the first step in supporting
> `ww_mutex` in Rust. `Class` represents ww_class, used
> for deadlock avoidance for supporting both wait-die
> and wound-wait semantics.
>=20
> Also adds the `define_class!` macro for safely declaring
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
> +
> +pub use class::Class;
> +
> +mod class;
> diff --git a/rust/kernel/sync/lock/ww_mutex/class.rs =
b/rust/kernel/sync/lock/ww_mutex/class.rs
> new file mode 100644
> index 000000000000..d10db5da01d2
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
> +}
> +
> +// SAFETY: [`Class`] is set up once and never modified. It's fine to =
share it across threads.
> +unsafe impl Sync for Class {}
> +// SAFETY: Doesn't hold anything thread-specific. It's safe to send =
to other threads.
> +unsafe impl Send for Class {}
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
> +    /// Creates a `Class` from a raw pointer.
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

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

