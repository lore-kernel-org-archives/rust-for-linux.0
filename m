Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA9412BF6
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804391; cv=none; b=OLvxon/EkEzzui+awngH6UeHBT0X12avxz2YamyjYPEu8JDSRSe4jbeTPHFG5eoDcvVeSR7WswbZO1FucyTVlQC5liveTX/sh97oQzWmTB3cwMHCNxx4VLw/6eTlyoEzq+HEo8kgINI/fmDQFMfNRvrm6TYrQjoIbEJO7S9O+J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804391; c=relaxed/simple;
	bh=iNQ8+XVKs+RMuYtiB4GG2GKmNm2BwYkMuRV0zjxyTn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyZRB06v7sV1L2gqFR+svxRLpYd2PhONTt7/v8mkcpEjJ3yB05Fl5xE/UIY4doHd08NvIgsLsuabOw4CVUoRCyygfpg+FoHfJcdUsVc/+gpx+BRp7jWvxF+dx8L4GHHZAflhMS1um7334GEDJUJoSd5fPy55LvmZjEkS7DMgGms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=RHwQL3f+; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="RHwQL3f+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791804382; x=1792063582;
	bh=cjjgbCgzk5NqtjG3CWsRjsi/rmbbixtdGzVGnDY5LkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RHwQL3f+TOULefKgdG25+i6/dJwvMidO99pWwgzi7SoAlK0VsbQ7lacU9iEUvuZ10
	 5Kf8QYE0NVuF9vUkPtR9jBokBOz7nQtRnSZLdqsxpXoDGC4DyUFVfb0onctulLPFzC
	 pYMgyPMNd/3OP7mq3V+4hpkSNOGAshoLHkhoKUlGz+I/GwEe1XRGfvBdVwNm9GmH2N
	 Ej9143tf0KxrtT3bVu999SOEQSUGaqARwCGzck6InSx4Upn519ryiXOFEu5kXwkH73
	 oqbPHCR7zkHDFvhaAWhi3TJ1FaiNf9uq6Vp+Pctkj8a8wzVBXiBn3GzwuakngL3uCT
	 aOzqznKiWGiUQ==
X-Pm-Submission-Id: 4j3FXT30m1z2ScPZ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
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
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/6] rust: implement Class for ww_class support
Date: Mon, 12 Oct 2026 14:26:13 +0300
Message-ID: <20261012112616.301108-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DM2T5BE41CL9.2EH0NAWUKDC4L@garyguo.net>
References: <cover.1791799751.git.work@onurozkan.dev> <ba8ea8e2e2b5027e446261d323e88d2d8696d0a6.1791799752.git.work@onurozkan.dev> <DM2T5BE41CL9.2EH0NAWUKDC4L@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026 12:03:04 +0100=0D
Gary Guo <gary@garyguo.net> wrote:=0D
=0D
> On Mon Oct 12, 2026 at 11:26 AM BST, Onur =C3=96zkan wrote:=0D
> > Adds the Class type, the first step in supporting ww_mutex in Rust.=0D
> > Class represents ww_class, used for deadlock avoidance for supporting=0D
> > both wait-die and wound-wait semantics.=0D
> >=0D
> > Also adds the define_ww_class and define_wd_class macros for safely=0D
> > declaring static instances.=0D
> >=0D
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>=0D
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> =0D
> Reviewed-by: Gary Guo <gary@garyguo.net>=0D
> =0D
> With some nits below.=0D
> =0D
> > ---=0D
> >  rust/kernel/sync/lock.rs                |   1 +=0D
> >  rust/kernel/sync/lock/ww_mutex.rs       |   7 ++=0D
> >  rust/kernel/sync/lock/ww_mutex/class.rs | 151 ++++++++++++++++++++++++=
=0D
> >  3 files changed, 159 insertions(+)=0D
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs=0D
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs=0D
> >=0D
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs=0D
> > index 10b6b5e9b024f..f509250822c55 100644=0D
> > --- a/rust/kernel/sync/lock.rs=0D
> > +++ b/rust/kernel/sync/lock.rs=0D
> > @@ -15,6 +15,7 @@=0D
> >  =0D
> >  pub mod mutex;=0D
> >  pub mod spinlock;=0D
> > +pub mod ww_mutex;=0D
> >  =0D
> >  pub(super) mod global;=0D
> >  pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLoc=
kedBy};=0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/=
ww_mutex.rs=0D
> > new file mode 100644=0D
> > index 0000000000000..727c51cc73af8=0D
> > --- /dev/null=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex.rs=0D
> > @@ -0,0 +1,7 @@=0D
> > +// SPDX-License-Identifier: GPL-2.0=0D
> > +=0D
> > +//! Rust abstractions for the kernel's wound-wait locking primitives.=
=0D
> > +=0D
> > +pub use class::Class;=0D
> > +=0D
> > +mod class;=0D
> > diff --git a/rust/kernel/sync/lock/ww_mutex/class.rs b/rust/kernel/sync=
/lock/ww_mutex/class.rs=0D
> > new file mode 100644=0D
> > index 0000000000000..58a4467552700=0D
> > --- /dev/null=0D
> > +++ b/rust/kernel/sync/lock/ww_mutex/class.rs=0D
> > @@ -0,0 +1,151 @@=0D
> > +// SPDX-License-Identifier: GPL-2.0=0D
> > +=0D
> > +//! Provides [`Class`] to group wound/wait mutexes to be acquired toge=
ther=0D
> > +//! and specifies which deadlock avoidance algorithm to use (e.g., wou=
nd-wait=0D
> > +//! or wait-die).=0D
> > +//!=0D
> > +//! The [`define_ww_class!`] and [`define_wd_class!`] macros provide s=
afe=0D
> > +//! ways to create classes.=0D
> > +=0D
> > +use crate::{=0D
> > +    bindings,=0D
> > +    prelude::*,=0D
> > +    types::Opaque, //=0D
> > +};=0D
> > +=0D
> > +/// Defines a static wound-wait [`Class`].=0D
> > +///=0D
> > +/// # Examples=0D
> > +///=0D
> > +/// ```=0D
> > +/// use kernel::define_ww_class;=0D
> > +///=0D
> > +/// define_ww_class!(SOME_WW_CLASS);=0D
> > +/// ```=0D
> > +#[macro_export]=0D
> > +macro_rules! define_ww_class {=0D
> > +    ($name:ident) =3D> {=0D
> > +        static $name: $crate::sync::lock::ww_mutex::Class =3D=0D
> > +            // SAFETY: This is `static`, so address is fixed and won't=
 move.=0D
> > +            unsafe {=0D
> > +                $crate::sync::lock::ww_mutex::Class::new_unpinned(=0D
> > +                    $crate::c_str!(::core::concat!(::core::stringify!(=
$name), "_acquire")),=0D
> > +                    $crate::c_str!(::core::concat!(::core::stringify!(=
$name), "_mutex")),=0D
> > +                    false,=0D
> > +                )=0D
> > +            };=0D
> > +    };=0D
> > +}=0D
> > +=0D
> > +/// Defines a static wait-die [`Class`].=0D
> > +///=0D
> > +/// # Examples=0D
> > +///=0D
> > +/// ```=0D
> > +/// use kernel::define_wd_class;=0D
> > +///=0D
> > +/// define_wd_class!(SOME_WD_CLASS);=0D
> > +/// ```=0D
> > +#[macro_export]=0D
> > +macro_rules! define_wd_class {=0D
> > +    ($name:ident) =3D> {=0D
> > +        static $name: $crate::sync::lock::ww_mutex::Class =3D=0D
> > +            // SAFETY: This is `static`, so address is fixed and won't=
 move.=0D
> > +            unsafe {=0D
> > +                $crate::sync::lock::ww_mutex::Class::new_unpinned(=0D
> > +                    $crate::c_str!(::core::concat!(::core::stringify!(=
$name), "_acquire")),=0D
> > +                    $crate::c_str!(::core::concat!(::core::stringify!(=
$name), "_mutex")),=0D
> > +                    true,=0D
> > +                )=0D
> > +            };=0D
> > +    };=0D
> > +}=0D
> > +=0D
> > +/// Used to group mutexes together for deadlock avoidance.=0D
> > +///=0D
> > +/// All mutexes that might be acquired together should use the same cl=
ass.=0D
> > +///=0D
> > +/// # Examples=0D
> > +///=0D
> > +/// ```=0D
> > +/// use kernel::{=0D
> > +///     define_wd_class,=0D
> > +///     define_ww_class, //=0D
> > +/// };=0D
> > +///=0D
> > +/// define_ww_class!(SOME_WW_CLASS);=0D
> > +/// define_wd_class!(SOME_WD_CLASS);=0D
> > +///=0D
> > +/// # Ok::<(), Error>(())=0D
> > +/// ```=0D
> > +#[pin_data]=0D
> > +#[repr(transparent)]=0D
> > +pub struct Class {=0D
> > +    #[pin]=0D
> > +    pub(super) inner: Opaque<bindings::ww_class>,=0D
> > +}=0D
> > +=0D
> > +impl Class {=0D
> > +    /// Creates an unpinned [`Class`].=0D
> > +    ///=0D
> > +    /// You should prefer using [`define_ww_class!`] and [`define_wd_c=
lass!`]=0D
> > +    /// macros. This function is `pub` only so that those macros can u=
se it.=0D
> > +    /// The alternative would be to expose the private fields of [`Cla=
ss`]=0D
> > +    /// which is less desirable.=0D
> =0D
> Replace the paragraph with `#[doc(hidden)]`?=0D
=0D
Good idea.=0D
=0D
> =0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// Caller must guarantee that the returned value must be pinned b=
efore=0D
> > +    /// its first use.=0D
> > +    pub const unsafe fn new_unpinned(=0D
> > +        acquire_name: &'static CStr,=0D
> > +        mutex_name: &'static CStr,=0D
> > +        is_wait_die: bool,=0D
> > +    ) -> Self {=0D
> > +        Class {=0D
> > +            inner: Opaque::new(bindings::ww_class {=0D
> > +                stamp: bindings::atomic_long_t { counter: 0 },=0D
> > +                acquire_name: crate::str::as_char_ptr_in_const_context=
(acquire_name),=0D
> > +                mutex_name: crate::str::as_char_ptr_in_const_context(m=
utex_name),=0D
> > +                is_wait_die: is_wait_die as u32,=0D
> > +                // TODO: Replace with `bindings::lock_class_key::defau=
lt()` once=0D
> > +                // stabilized for `const`.=0D
> > +                //=0D
> > +                // SAFETY: This is always zero-initialized when define=
d with=0D
> > +                // `DEFINE_WD_CLASS` globally on C side.=0D
> > +                //=0D
> > +                // For reference, see __WW_CLASS_INITIALIZER() in=0D
> > +                // "include/linux/ww_mutex.h".=0D
> > +                acquire_key: unsafe { core::mem::zeroed() },=0D
> > +                // TODO: Replace with `bindings::lock_class_key::defau=
lt()` once=0D
> > +                // stabilized for `const`.=0D
> > +                //=0D
> > +                // SAFETY: This is always zero-initialized when define=
d with=0D
> > +                // `DEFINE_WD_CLASS` globally on C side.=0D
> > +                //=0D
> > +                // For reference, see __WW_CLASS_INITIALIZER() in=0D
> > +                // "include/linux/ww_mutex.h".=0D
> > +                mutex_key: unsafe { core::mem::zeroed() },=0D
> =0D
> Does `..pin_init::zeroed()` work in this case?=0D
=0D
It does.=0D
=0D
Thanks,=0D
Onur=0D
=0D
> =0D
> Best,=0D
> Gary=0D
> =0D
> > +            }),=0D
> > +        }=0D
> > +    }=0D
> > +=0D
> > +    /// Creates a [`Class`] from a raw pointer.=0D
> > +    ///=0D
> > +    /// This function is intended for interoperability with C code.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must ensure that `ptr` points to the `inner` field =
of=0D
> > +    /// [`Class`] and that it remains valid for the lifetime `'a`.=0D
> > +    #[inline]=0D
> > +    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class) -> =
&'a Self {=0D
> > +        // SAFETY: By the safety contract, `ptr` is valid to construct=
 `Class`.=0D
> > +        unsafe { &*ptr.cast() }=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +// SAFETY: [`Class`] is immutable except for its atomic stamp. It's fi=
ne to share it across threads.=0D
> > +unsafe impl Sync for Class {}=0D
> > +// SAFETY: Doesn't hold anything thread-specific. It's safe to send to=
 other threads.=0D
> > +unsafe impl Send for Class {}=0D
> =0D
> =0D
