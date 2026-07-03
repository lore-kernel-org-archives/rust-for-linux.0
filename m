Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC93002B9
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047719; cv=none; b=nr3XK+homMqJCFs0mRn+EE7DvcNNsKPEw9Jbq/cV9YjATR6LO5XMZiIVLgm/zYganvBwY39THA1WIutUdjR5uocd3FH7O/5KoiMwFybd+sdmNZWdSOXMuu74stJk+WdT4+jd9aAZYtkQv8hSFY+VeYPqGF1C4nmboIXhuokZbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047719; c=relaxed/simple;
	bh=lnvII2yDl/xZ/dtWSIY0wkLB+CFKzpqekK5mKWkSzEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSNamLXGAaKBPnhnswZxute1JxVhRb6pNt9ChmqAIOc2pJ5Xx9irMUBey58RWVDfpZ7Xcr+COjxwxjEmg443S+eCNT5WmYWCctbBrwpuWAKUb2xpV1KMye2/iyH81vVyjdRekF9W1a0Fkkyr0uyHDLXNZmFsoIJxsN4UhepdAR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=q7QB4W8t; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="q7QB4W8t"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-475417f010dso40519f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047716; x=1783652516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQKoTdpL3C59oAuYFMvqcsWz7tbnOArYDM8BYFAHWQk=;
        b=q7QB4W8thongzpXno0epGF5tIr/tVfB4BG6j5y6sxPoS6Fdyf1vazRX8rMZMahoBUn
         YWDja1t8a7+pQa4FGEGR68m5vhxlUudRLcDMa+ngvo+dbKqwP5Ubk6Y1YxlllwVHpLYj
         wFWvSvp7Gx3hjixoJehSN9OYC18kekYDIn222xWGQ6f9TyXnx3sXG2FjO1MG1cpn9hq3
         /Gf7F03sQjgyDnwy8cq5mNezD9kbNKmpFq4rwnYrIv8cLmNndaYbXaD3J0lEisAulCGH
         z7dUnSfCgRZEzkGQ2HJbYF0ohhM2+gDFMQvt4aKRTtvSENz5MDsKo9iWUr6v4TXHyu9e
         XI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047716; x=1783652516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aQKoTdpL3C59oAuYFMvqcsWz7tbnOArYDM8BYFAHWQk=;
        b=rEpIXdKzO7Jsjpv/pEcirEW1CA6AXflZdBY43LAF3qMHQxpaRRBTYwi8MAv9oaMjBT
         SStgMHcue1mJ840YrI2dY8jfAJSPexxmQjuJv84rI5aKEdkfIbVzokE8ZjKhapCu4Vl4
         MzxyPBz13goaWQITY8rYi44D5r8tcKultVhcP2fw9KW87LArkAJjdses1KD/L6CsmRLb
         2n4rjQPRrtXkhl6wxOhIzwnBkEa0nLkObxPrzED2neToI0phkCBIoz+yOOT3m6lkPEfw
         hrPvrdnykuWm6/jA4BfxoeCP3n0pAC7WxYBSk3HFhsN13W+dyFVU8Mi8CAGPYgpHF4MA
         UFLw==
X-Gm-Message-State: AOJu0YxR9gd8gxgWdusDUkVbfbMCLbDiYL1EpbFjWVAPP+ephCDykqA3
	d5cB/RPfSX/l4H3X9Epk6D9XpP72UAxgAG/CI+h3BYbnN3xQvJPrklzaYLR1NjVfhpj8+eOSxX5
	DfI6mMyQ4
X-Gm-Gg: AfdE7cm/GHE0T+u41BkJpcZJJuwSX9gWY12ukKFqxHZBWmYDzkLmY/qGeLzFZIXthxs
	E6fphaI9LMW9i76lRahQ787yXRWvVFlkRMhkv34oEnOlSV3Y6Hg2ZFYAsmerWPSCctAeQFazzla
	vgHTBztMmniqbcEG93eOJJQWhTW6nA1h/DGN+eQ2mXtjKMX0DoCT+3496mtuCKQ5ppFMnWTHsFM
	r6CDY0bCu9zBhEXSuAzsyo3u4h7emy6LVsboGRMtHm+Exniwc5X8gNjwVumm78tsZoEd24JZpgS
	sLg8265c9k1om2BLw7mibZ3bCqVucvTVSYLneVt1+74/xiv11AJ3T3RXgQ8oyEHMfgJ1rxVHYvy
	lWvekPM5/8WP+/sgM3XRdu4aolY3QYTTLf/JHhNR1NjG5xSXQZJ7OGxPX/NBGKcRf07kv7lmSW0
	V4FM+wNgWSqNmJzHuMm83qcoYAOndGkOFj7Kdubmon7ARMPsndrXY3MiOD
X-Received: by 2002:a05:6000:604:b0:476:504f:788 with SMTP id ffacd0b85a97d-4775a4e3e69mr12347740f8f.61.1783047716282;
        Thu, 02 Jul 2026 20:01:56 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbacbsm14466500f8f.4.2026.07.02.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:54 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 10/18] rust: drm: allow drivers to declare ioctls from their own uAPI module
Date: Fri,  3 Jul 2026 04:00:57 +0100
Message-ID: <20260703030123.2814-11-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030123.2814-1-mike@fireburn.co.uk>
References: <20260617150232.2210-1-mike@fireburn.co.uk>
 <20260703030123.2814-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

declare_drm_ioctls! resolves each ioctl's argument_type and DRM_IOCTL_* number
from the in-tree kernel::uapi crate. An out-of-tree driver with its own private
DRM ioctl range (e.g. DisplayLink's evdi) cannot extend kernel::uapi, so it
cannot use the macro at all.

Add declare_drm_ioctls_ext!, which takes the argument type and the fully-formed
ioctl number directly per entry:

    (handler_name, argument_type, ioctl_number, flags, user_callback)

so a driver can keep its own #[repr(C)] uAPI mirror in its own crate and pass
crate::uapi::Foo / crate::uapi::DRM_IOCTL_FOO. The callback prototype, the
compile-time argument-size assertion against the ioctl number, and the
drm_dev_enter/exit critical section are identical to declare_drm_ioctls!, which
is left untouched (a caller-provided :path module cannot be glued to ::* / ::Ty
in a macro transcriber, so the two macros do not share an implementation).

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/kernel/drm/ioctl.rs | 86 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 181918303f2f..78169798bbbc 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -176,3 +176,89 @@ macro_rules! declare_drm_ioctls {
         };
     };
 }
+
+/// Declare the DRM ioctls for a driver whose uAPI lives outside `kernel::uapi`.
+///
+/// [`declare_drm_ioctls!`] resolves each `argument_type` and `DRM_IOCTL_*` number from the
+/// in-tree `kernel::uapi` crate, which an out-of-tree driver with its own private ioctl range
+/// cannot extend. This variant takes, per entry, the argument **type** and the fully-formed ioctl
+/// **number** directly, so the driver can keep its own `#[repr(C)]` uAPI mirror inside its own
+/// crate. Each entry is:
+///
+/// `(handler_name, argument_type, ioctl_number, flags, user_callback)`
+///
+/// `handler_name` is any identifier (used to name the generated trampoline and as the debug name);
+/// `argument_type` is the `#[repr(C)]` argument struct (any path, e.g. `crate::uapi::Foo`);
+/// `ioctl_number` is the full command number (e.g. `crate::uapi::DRM_IOCTL_FOO`, typically built
+/// with [`IOWR`]/[`IOR`]/[`IOW`]/[`IO`]). `user_callback` has the exact same prototype as for
+/// [`declare_drm_ioctls!`], and the handler still runs inside a `drm_dev_enter/exit` critical
+/// section (returning `ENODEV` if the device has been unplugged).
+///
+/// The ioctl array is indexed by the DRM core as `number - DRM_COMMAND_BASE`, so entries must be
+/// listed in ascending, contiguous order starting at the driver's command base.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::declare_drm_ioctls_ext! {
+///     (EVDI_CONNECT, crate::uapi::DrmEvdiConnect, crate::uapi::DRM_IOCTL_EVDI_CONNECT,
+///         0, evdi_connect_ioctl),
+/// }
+/// ```
+#[macro_export]
+macro_rules! declare_drm_ioctls_ext {
+    ( $(($cmd:ident, $arg_ty:ty, $num:expr, $flags:expr, $func:expr)),* $(,)? ) => {
+        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
+            const _:() = {
+                // The argument struct size must match what the ioctl number encodes, so the DRM
+                // core copies exactly `size_of::<argument_type>()` bytes to/from userspace.
+                $(
+                    ::core::assert!(::core::mem::size_of::<$arg_ty>() ==
+                                    $crate::ioctl::_IOC_SIZE($num));
+                )*
+            };
+
+            let ioctls = &[$(
+                $crate::drm::ioctl::internal::drm_ioctl_desc {
+                    cmd: $num as u32,
+                    func: {
+                        #[allow(non_snake_case)]
+                        unsafe extern "C" fn $cmd(
+                                raw_dev: *mut $crate::drm::ioctl::internal::drm_device,
+                                raw_data: *mut ::core::ffi::c_void,
+                                raw_file: *mut $crate::drm::ioctl::internal::drm_file,
+                        ) -> core::ffi::c_int {
+                            // SAFETY: The DRM core keeps the device alive across the callback and
+                            // only dispatches here on a registered device.
+                            let dev = unsafe {
+                                $crate::drm::device::Device::from_raw(raw_dev)
+                            };
+                            let guard = match $crate::drm::device::unbind_guard(dev) {
+                                Some(g) => g,
+                                None => return $crate::error::code::ENODEV.to_errno(),
+                            };
+                            // SAFETY: The ioctl argument has size `_IOC_SIZE($num)`, asserted above
+                            // to match `size_of::<$arg_ty>()`; `drm_ioctl()` guarantees the buffer
+                            // is valid and exclusively owned for the duration of this call.
+                            let data = unsafe { &mut *(raw_data.cast::<$arg_ty>()) };
+                            // SAFETY: This is just the DRM file structure.
+                            let file = unsafe { $crate::drm::File::from_raw(raw_file) };
+
+                            match $func(dev, &*guard, guard.registration_data(), data, file) {
+                                Err(e) => e.to_errno(),
+                                Ok(i) => i.try_into()
+                                            .unwrap_or($crate::error::code::ERANGE.to_errno()),
+                            }
+                        }
+                        Some($cmd)
+                    },
+                    flags: $flags,
+                    name: $crate::str::as_char_ptr_in_const_context(
+                        $crate::c_str!(::core::stringify!($cmd)),
+                    ),
+                }
+            ),*];
+            ioctls
+        };
+    };
+}
-- 
2.55.0

