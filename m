Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85661313E00;
	Tue, 16 Dec 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880444; cv=none; b=pLaznPS+pgxxKqmm/A48GM1I2dc25uBIuXMN0lwaRd0+9eOWnvbiuSfHHWUUyGPHeDGKaXjXIjWo3xf0BdM8JkI4x30qD/ioWiz8LSvEbRnbAcmUocAmeKY7EkFX20K7pud/GkeElUXWiYxU6Ognryf09MKWOWuh0tNTRJhY7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880444; c=relaxed/simple;
	bh=3aVCwSoZFtIeQo2I89KCit5XpgJ7Mbyf5LkP8iyCGJw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aHyS3ZVuWHW5ZUVei5FvDngnKgLB58S5GqEB2BkbfCww7xk8lDIRKf+/KMDxd8pwUMsMfYru7wdby70KiQQCulUS3ghJQhcAocb4O7gDLTlaDhZAgkiC4LQk9Ws5ZugFaXVY8p0/dxuBemSmpgz41M5OLDxA+w0zHmZcdC5hjjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0PeE4IU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0PeE4IU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA47C4CEF1;
	Tue, 16 Dec 2025 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765880444;
	bh=3aVCwSoZFtIeQo2I89KCit5XpgJ7Mbyf5LkP8iyCGJw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Y0PeE4IU7wct4fEb8AY1U3Sy93VQFZZ0LPh7KElQRjDgsnuu5GYx4p6sT7TuAO6ZX
	 J9+fnyN0EZ7Mdcal396LQxO3/BxPmS/3DCOmvUIZQ3w0A5WI2yQiTvNxfQRSD0lFsi
	 NP/UF2bueJk0qwf1rXkrhxCHZ2ei+tgEB+hy2M9WAMUpK82IN4W+SonmNd9awo9s3R
	 uVy1Z3EeX1gi+X+WJAjUbA0RqYFrtlF+r2KdoPo0yy5eljiMADYSp3AdRrKzy5HpED
	 8MJYEglSFfVagYfjG/AUMgGCiRj4TwKyBCQswL1FT5BpzmfKzCa4hSd+DWx1dQmhYh
	 RW95nO4FFW1uA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 11:20:39 +0100
Message-Id: <DEZKDEPMCQ7N.1VK1WNX9B1ZI7@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: Add soc_device support
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
 <20251216-soc-bindings-v2-1-1fb394cc921a@google.com>
In-Reply-To: <20251216-soc-bindings-v2-1-1fb394cc921a@google.com>

On Tue Dec 16, 2025 at 1:43 AM CET, Matthew Maurer wrote:
> +/// Attributes for a SoC device.
> +///
> +/// These are both exported to userspace under /sys/devices/socX and pro=
vided to other drivers to
> +/// match against via `soc_device_match` (not yet available in Rust) to =
enable quirks or
> +/// device-specific support where necessary.
> +///
> +/// All fields are freeform - they have no specific formatting, just def=
ined meanings.
> +/// For example, the [`machine`](`Attributes::machine`) field could be "=
DB8500" or
> +/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it should i=
dentify a board or product.
> +pub struct Attributes {
> +    /// Should generally be a board ID or product ID. Examples
> +    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc. SM8=
560 HDK".
> +    ///
> +    /// If this field is not populated, the SoC infrastructure will try =
to populate it from
> +    /// `/model` in the device tree.
> +    pub machine: Option<CString>,
> +    /// The broader class this SoC belongs to. Examples include ux500
> +    /// (for DB8500) or Snapdragon (for SM8650).
> +    ///
> +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be a=
 JEDEC JEP106 manufacturer
> +    /// identification.
> +    pub family: Option<CString>,
> +    /// The manufacturing revision of the part. Frequently this is MAJOR=
.MINOR, but not always.
> +    pub revision: Option<CString>,
> +    /// Serial Number - uniquely identifies a specific SoC. If present, =
should be unique (buying a
> +    /// replacement part should change it if present). This field cannot=
 be matched on and is
> +    /// solely present to export through /sys.
> +    pub serial_number: Option<CString>,
> +    /// SoC ID - identifies a specific SoC kind in question, sometimes m=
ore specifically than
> +    /// `machine` if the same SoC is used in multiple products. Some dev=
ices use this to specify a
> +    /// SoC name, e.g. "I.MX??", and others just print an ID number (e.g=
. Tegra and Qualcomm).
> +    ///
> +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be a=
 JEDEC JEP106 manufacturer
> +    /// identification (the family value) followed by a colon and then a=
 4-digit ID value.
> +    pub soc_id: Option<CString>,
> +}

Thanks for expanding the documentation!

> +struct BuiltAttributes {
> +    // While `inner` has pointers to `_backing`, it is to the interior o=
f the `CStrings`, not
> +    // `backing` itself, so it does not need to be pinned.
> +    _backing: Attributes,
> +    // `Opaque` makes us `!Unpin`, as the registration holds a pointer t=
o `inner` when used.
> +    inner: Opaque<bindings::soc_device_attribute>,
> +}
> +
> +fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {
> +    mcs.as_ref()
> +        .map(|cs| cs.as_char_ptr())
> +        .unwrap_or(core::ptr::null())
> +}
> +
> +impl BuiltAttributes {
> +    fn as_mut_ptr(&self) -> *mut bindings::soc_device_attribute {
> +        self.inner.get()
> +    }
> +}
> +
> +impl Attributes {
> +    fn build(self) -> BuiltAttributes {
> +        BuiltAttributes {
> +            inner: Opaque::new(bindings::soc_device_attribute {
> +                machine: cstring_to_c(&self.machine),
> +                family: cstring_to_c(&self.family),
> +                revision: cstring_to_c(&self.revision),
> +                serial_number: cstring_to_c(&self.serial_number),
> +                soc_id: cstring_to_c(&self.soc_id),
> +                data: core::ptr::null(),
> +                custom_attr_group: core::ptr::null(),
> +            }),
> +            _backing: self,
> +        }
> +    }
> +}
> +
> +/// # Safety
> +/// If a device is returned (e.g. no error), `attr` must remain valid fo=
r reads until the
> +/// returned pointer is released through `soc_device_unregister`.
> +unsafe fn register_device(attr: Pin<&BuiltAttributes>) -> Result<NonNull=
<bindings::soc_device>> {
> +    let raw_soc =3D
> +            // SAFETY:
> +            // * The struct provided through attr is backed by pinned da=
ta next to it, so as
> +            //   long as attr lives, the strings pointed to by the struc=
t will too.
> +            // * `attr` is pinned, so the pinned data won't move.
> +            // * If it returns a device, and so others may try to read t=
his data, by caller
> +            //   invariant, `attr` won't be released until the device is=
.
> +            error::from_err_ptr(unsafe { bindings::soc_device_register(a=
ttr.as_mut_ptr()) })?;
> +    // `soc_device_register` should not return NULL, but it doesn't hurt=
 to be paranoid.
> +    NonNull::new(raw_soc).ok_or(EINVAL)
> +}

I think it turns out cleaner without this helper function, inlining the
contained code directly into Registration::new().

> +#[pin_data(PinnedDrop)]
> +/// Registration handle for your soc_dev. If you let it go out of scope,=
 your soc_dev will be
> +/// unregistered.
> +pub struct Registration {
> +    #[pin]
> +    attr: BuiltAttributes,
> +    soc_dev: NonNull<bindings::soc_device>,
> +}
> +
> +// SAFETY: We provide no operations through `&Registration`.
> +unsafe impl Sync for Registration {}
> +
> +// SAFETY: All pointers are normal allocations, not thread-specific.
> +unsafe impl Send for Registration {}
> +
> +#[pinned_drop]
> +impl PinnedDrop for Registration {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: Device always contains a live pointer to a soc_device=
 that can be unregistered
> +        unsafe { bindings::soc_device_unregister(self.soc_dev.as_ptr()) =
}
> +    }
> +}
> +
> +impl Registration {
> +    /// Register a new SoC device
> +    pub fn register(attr: Attributes) -> impl PinInit<Self, Error> {

Let's just call this Registration::new() please. We usually use new() if we
return a Registration object (or an initializer as in this case) and regist=
er()
if we do not return a Registration object, but rather automatically clean u=
p the
registration silently, e.g. through devres.

> +        try_pin_init!(&this in Self {

You should be able to just access Self::attr directly, i.e. no need for &th=
is.
(When you access attr within the code block of soc_dev it will be Self::att=
r and
not the attr from the function argument.)

Please find a diff [1] below.

> +                    attr: attr.build(),
> +                    // SAFETY: We have already initialized attr, and we =
are inside PinInit and Self
> +                    // is !Unpin, so attr won't be moved and is valid. I=
f it returns success, attr
> +                    // will not be dropped until after our `PinnedDrop` =
implementation runs, so the
> +                    // device will be unregistered first.
> +                    soc_dev: unsafe {
> +                        register_device(Pin::new_unchecked(&(*this.as_pt=
r()).attr))?
> +                    },
> +        }? Error)
> +    }
> +}


[1]

diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
index fb9e46121878..242dcd09e7f5 100644
--- a/rust/kernel/soc.rs
+++ b/rust/kernel/soc.rs
@@ -89,22 +89,6 @@ fn build(self) -> BuiltAttributes {
     }
 }
=20
-/// # Safety
-/// If a device is returned (e.g. no error), `attr` must remain valid for =
reads until the
-/// returned pointer is released through `soc_device_unregister`.
-unsafe fn register_device(attr: Pin<&BuiltAttributes>) -> Result<NonNull<b=
indings::soc_device>> {
-    let raw_soc =3D
-            // SAFETY:
-            // * The struct provided through attr is backed by pinned data=
 next to it, so as
-            //   long as attr lives, the strings pointed to by the struct =
will too.
-            // * `attr` is pinned, so the pinned data won't move.
-            // * If it returns a device, and so others may try to read thi=
s data, by caller
-            //   invariant, `attr` won't be released until the device is.
-            error::from_err_ptr(unsafe { bindings::soc_device_register(att=
r.as_mut_ptr()) })?;
-    // `soc_device_register` should not return NULL, but it doesn't hurt t=
o be paranoid.
-    NonNull::new(raw_soc).ok_or(EINVAL)
-}
-
 #[pin_data(PinnedDrop)]
 /// Registration handle for your soc_dev. If you let it go out of scope, y=
our soc_dev will be
 /// unregistered.
@@ -131,14 +115,24 @@ fn drop(self: Pin<&mut Self>) {
 impl Registration {
     /// Register a new SoC device
     pub fn register(attr: Attributes) -> impl PinInit<Self, Error> {
-        try_pin_init!(&this in Self {
+        try_pin_init!(Self {
                     attr: attr.build(),
                     // SAFETY: We have already initialized attr, and we ar=
e inside PinInit and Self
                     // is !Unpin, so attr won't be moved and is valid. If =
it returns success, attr
                     // will not be dropped until after our `PinnedDrop` im=
plementation runs, so the
                     // device will be unregistered first.
-                    soc_dev: unsafe {
-                        register_device(Pin::new_unchecked(&(*this.as_ptr(=
)).attr))?
+                    soc_dev: {
+                        // SAFETY:
+                        // * The struct provided through attr is backed by=
 pinned data next to it,
+                        //   so as long as attr lives, the strings pointed=
 to by the struct will too.
+                        // * `attr` is pinned, so the pinned data won't mo=
ve.
+                        // * If it returns a device, and so others may try=
 to read this data, by
+                        //   caller invariant, `attr` won't be released un=
til the device is.
+                        let raw_soc =3D error::from_err_ptr(unsafe {
+                            bindings::soc_device_register(attr.as_mut_ptr(=
))
+                        })?;
+
+                        NonNull::new(raw_soc).ok_or(EINVAL)?
                     },
         }? Error)
     }

