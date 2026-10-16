Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A337882A
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140649; cv=none; b=OJcczkuMNtBgXCvzO3npk5KyQuXMKLB6YJWPw0CdQSwp10zv58EDlil5FUcvZLriBcBMVBrLZfmWKRLxqdzKcHhr+8FrBPFDIQMB88Cf4UGdU1CgTmlAs2beQl1Rjbc/AMwT3FS+GyBo+aEinyZYNz1dx0MpQsBfGlQGh1Zofx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140649; c=relaxed/simple;
	bh=v3cVT4VRZtVSHr3ccC/StOZDkykK/u7xHqCfsu6zTjo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j9Ts5nPj0v/kMqMMGKPH1Z0ayCuXSwUeTEFpJkjX3rtbjLSgeFsmw/svAy1BGKiL+CUkGeQ3KFHwm59z/vpb0QyfAfHma4CrGLXgU6Dci5+u8PF9+naC0tmpI+e4JCh8jEmlcC3Gv4t0IeLRufIeIM9im2pfNAcxORo3nLyiRO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iu7leCJy; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iu7leCJy"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1c7025d8dso5006035e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792140646; x=1792745446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/UBdI9P0FC4JKA54j7nOy5LwjpD7g9ywzmZnD86QTg=;
        b=Iu7leCJy12KIhhXYHe6tH7TL3EGwFxSjn7PSgM9gsH56BkXJhdEguluu3jFDOJHyCx
         9X+EetlTuLDtw0vZ0RrZ8GIwA2pYMvx0uAtyewkgb+OucbRJuOhCRGbeRlh9ObVpj/Nd
         zuZkJ5PKZ0Gd31g3YUVPbX+CYcHHzxrTpZ/2yOY+hg8nyIsbIy22z3ZGhyWx+YZlI7G3
         JUSqulOZF1KuFH5ZoYqPsIK0dl2viRKDFQQRhJR2/UCGAWIy6+cQCZ5CQGIIy2hOi8/r
         yHqF9czw+zVTBkwF9Ksr9KBhawbD22clGEG+gb7oVDdWoZQdtL4E90L75Meo4kVJ0Ewq
         A2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140646; x=1792745446;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/UBdI9P0FC4JKA54j7nOy5LwjpD7g9ywzmZnD86QTg=;
        b=UzoW6NTX8Gk6f9UH1sxTT/pfuqsTqF2rDoiRd3AIQUY0G0y0euzQudXuDzAeogILi+
         o/Cy4bnSxFb8tCN9HvKKqgECSuZt9CZP3Idn25Gah65vzUYxb1G5IOVd2xXXFfP2JP1G
         rr4DPbtQcYN0Dj0QwQ3dJqjk6wwBj+KsRx89UNIZ51VdLCt8zxFzNMUfgGGzPAWBDtW1
         pGDDPG6SDnL36B05vql0Ji2ksZkD3AdWAxAJbfzPnReOY3EoiEHjhPbncQAOWaIq/Vr0
         vZsjTiT/s7TFrP8fLHQnoFQIKqRM463iLi2yzmkmP+ibsGlKLhffVdoWZC4ekZ8SDCDw
         6hag==
X-Forwarded-Encrypted: i=1; AKwUvBx0lvsWA6ePjnk14dqrZPQLBSd1OK5D2WusTUfVo2wz9lJQTmLbxFWz3GT8D+wS5BGog38mBJ62+pOohNrLhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJyYpURMSJUiALXcjnP/T4vX05trwyM2+qAdops162BHGZbPNon
	o+KzVzJ5ci8cjSr+uSSXjM9I0cD+X5LOlX/D/VPtMlKsbWrsomkcprzdxC29NVSTx6ZcJtDJlqA
	QEGw3e/1leEBAQ5LHNQ==
X-Received: from wmkz7.prod.google.com ([2002:a7b:c7c7:0:b0:4a1:9e7b:11b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr439668265e9.24.1792140645760;
 Fri, 16 Oct 2026 01:50:45 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:50:44 +0000
In-Reply-To: <20261001145940.1077801-5-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001145940.1077801-1-zhiw@nvidia.com> <20261001145940.1077801-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016085045.3517539-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 4/5] rust: print: add dynamic debug support to pr_debug!
From: Alice Ryhl <aliceryhl@google.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andrewjballance@gmail.com, 
	daniel.almeida@collabora.com, dakr@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, cjia@nvidia.com, 
	smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, kjaju@nvidia.com, 
	alkumar@nvidia.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 05:59:39PM +0300, Zhi Wang wrote:
> +/// A dynamic debug callsite descriptor.
> +///
> +/// The [`crate::dynamic_debug!`] macro places descriptors at stable add=
resses in `__dyndbg`.
> +#[repr(transparent)]
> +pub struct Descriptor {
> +    /// The C descriptor, exposed for static-branch field addressing.
> +    pub inner: bindings::_ddebug,
> +}

Should this be #[repr(C, align(8))] to match how C adds __aligned(8) in=20
DEFINE_DYNAMIC_DEBUG_METADATA_CLS?

> +impl Descriptor {
> +    /// Creates an initially disabled descriptor.
> +    pub const fn new(
> +        module: &'static CStr,
> +        file: &'static CStr,
> +        format: &'static CStr,
> +        line: u32,
> +    ) -> Self {
> +        // SAFETY: `_ddebug` contains raw pointers, integers and, with j=
ump labels, a static key.
> +        // All accept zero; the pointers and bitfields are filled in bef=
ore publication.
> +        let mut descriptor: bindings::_ddebug =3D unsafe { core::mem::ze=
roed() };
> +        descriptor.modname =3D as_char_ptr_in_const_context(module);
> +        descriptor.function =3D as_char_ptr_in_const_context(c"<unknown>=
");
> +        descriptor.filename =3D as_char_ptr_in_const_context(file);
> +        descriptor.format =3D as_char_ptr_in_const_context(format);
> +
> +        // C packs `lineno:18`, `class_id:6` and `flags:8` into an unsig=
ned int. Bindgen's setters
> +        // are not const, so encode the target's bitfield ordering expli=
citly. Truncate line numbers
> +        // as the C bitfield assignment does.
> +        let line =3D line & ((1 << 18) - 1);
> +        let class =3D bindings::_DPRINTK_CLASS_DFLT;
> +        let flags =3D bindings::_DPRINTK_FLAGS_NONE;
> +        #[cfg(target_endian =3D "little")]
> +        let bits =3D (line | (class << 18) | (flags << 24)).to_le_bytes(=
);
> +        #[cfg(target_endian =3D "big")]
> +        let bits =3D ((line << 14) | (class << 8) | flags).to_be_bytes()=
;
> +        descriptor._bitfield_1 =3D bindings::__BindgenBitfieldUnit::new(=
bits);
> +
> +        #[cfg(CONFIG_JUMP_LABEL)]
> +        // An all-zero key is `STATIC_KEY_INIT_FALSE`.
> +        static_assert!(bindings::JUMP_TYPE_FALSE =3D=3D 0);
> +
> +        Self { inner: descriptor }
> +    }

Two comments here:

1. Instead of hardcoding `c"<unknown>"` for `descriptor.function`, how
   about passing `$crate::c_str!(module_path!())` from `dynamic_debug!`
   (an idea from Thomas Wei=C3=9Fschuh's RFC series [1])? Even though Rust
   doesn't have a `function_name!()` macro, recording `module_path!()`
   makes the `+f` prefix flag useful and allows `func` queries in
   `/proc/dynamic_debug/control` to filter by Rust module path within a
   multi-file crate.

   [1] https://lore.kernel.org/rust-for-linux/20261011-rust-dyndbg-v1-8-832=
e4039b71f@weissschuh.net/

2. The inline bitfield manipulation and `unsafe { core::mem::zeroed() }`
   is pretty ugly. Please use the same strategy as `FamilyFlags` in
   `rust/kernel/net/netlink.rs` to handle bitfields in `const` context:

   - Move the bitfield construction into a dedicated helper struct with a
     `const fn into_bitfield(self) -> bindings::__BindgenBitfieldUnit<[u8; =
4]>`
     method.
   - Construct `bindings::_ddebug` directly using struct literal syntax
     with `..pin_init::zeroed()`, avoiding `unsafe { core::mem::zeroed() }`
     and field-by-field mutation.
   - Add a kunit test (like `test_family_flags_bitfield`) that verifies
     `into_bitfield()` against bindgen's generated `set_lineno`,
     `set_class_id`, and `set_flags` (or `bindings::_ddebug::new_bitfield_1=
`).

> +    /// Prints arguments with the crate's log prefix and the dynamic deb=
ug prefixes.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `descriptor` must point to an initialized descriptor valid for t=
his call, whose string
> +    /// pointers refer to valid NUL-terminated C strings. Concurrent acc=
ess must follow the C
> +    /// dynamic debug and jump label synchronization rules, without conf=
licting Rust accesses.
> +    pub unsafe fn print(descriptor: *mut Self, prefix: &CStr, args: fmt:=
:Arguments<'_>) {
> +        // SAFETY: The descriptor is valid by the caller's guarantee. Th=
e helper uses the C string
> +        // `prefix` and consumes `args` through `%pA` synchronously, so =
their borrows remain valid.
> +        unsafe {
> +            bindings::ddebug_print(
> +                &raw mut (*descriptor).inner,
> +                prefix.as_char_ptr(),
> +                core::ptr::from_ref(&args).cast(),
> +            )
> +        };
> +    }

`Descriptor::print` (and `Descriptor::dev_print` in patch 5/5) should be
marked `#[inline]`, just like `Descriptor::enabled`.

> +macro_rules! dynamic_debug {
> +    ($descriptor:ident, ($($arg:tt)*), $body:block) =3D> {{
> +        // Keep item names out of the user's scope, including implicit f=
ormat captures.
> +        let (descriptor, enabled) =3D {
> +            // `used(compiler)` avoids `SHF_GNU_RETAIN`, which the modul=
e loader interprets as
> +            // `SHF_RO_AFTER_INIT`.
> +            #[used(compiler)]
> +            #[unsafe(link_section =3D "__dyndbg")]
> +            static mut DESCRIPTOR: $crate::print::dynamic_debug::Descrip=
tor =3D
> +                $crate::print::dynamic_debug::Descriptor::new(
> +                    $crate::c_str!(env!("RUST_MODNAME")),
> +                    $crate::c_str!(file!()),
> +                    $crate::dynamic_debug_format!($($arg)*),
> +                    line!(),
> +                );

Is `#[used(compiler)]` needed here at all?

When the `pr_debug!` / `dev_dbg!` statement is reachable, `DESCRIPTOR`
is already referenced by `static_branch_unlikely!(DESCRIPTOR, ...)` and
by `&raw mut DESCRIPTOR` passed to `Descriptor::print`. And if the
callsite is optimized out (for example, inside an unused function or
dead branch), we *want* the static `DESCRIPTOR` to be deleted as well
rather than leaving an orphan entry in `__dyndbg`. This would match C's
`DEFINE_DYNAMIC_DEBUG_METADATA_CLS`, which does not use `__used`.

For instance, with `#[used(compiler)]` present, the uncalled `fn example`
in the `dev_dbg!` doctest still emits a dead `DESCRIPTOR` into `vmlinux`'s
`__dyndbg` section.

> +/// Stub for host doctests, matching [`crate::print_macro!`].
> +#[cfg(testlib)]
> +#[macro_export]
> +macro_rules! dynamic_debug {
> +    ($descriptor:ident, ($($arg:tt)*), $body:block) =3D> {
> +        ()
> +    };
> +}

If `dynamic_debug!` drops `$body` under `#[cfg(testlib)]`, any variables
used only inside `pr_debug!` or `dev_dbg!` will trigger `unused_variables`
warnings under `testlib`, and `$body` won't be type-checked. How about:

    if false {
        let $descriptor: *mut $crate::print::dynamic_debug::Descriptor =3D
            ::core::ptr::null_mut();
        $body
    }

Alice
