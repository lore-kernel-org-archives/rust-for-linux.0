Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AFA400963
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762275; cv=none; b=BZRu/7i3kjfuCmdl+iz/oE4NLn20Wz3H4cmlT3Ber5YYqhpXeJPkcyhSH1pANb+fg/7WzpB5b4KOvFILX7ixSW4MizPUA6qYT3AiG0Wyw+gYSbaXUmv3noZMrjXuIZn6OgG5kAsg3CxEmmSfxiiiccLzhOWewRPw4+ByTTdCPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762275; c=relaxed/simple;
	bh=qIcM5y3Hb6kSUN2B7nsjh8Y4Ancfrv4Lu71gNXejc54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmH/MDezGP7+sSXqC7ZOktGDi1+3MT8erR1LXkW/KUA9/S37MC4qGAt2hsvnZJlOzPYCFvmxeJtxIiggMVLczCnvf/oXOnPBqdP3gGSJbQvaYaVz5V2yPXoj+9TO9Xu0GOJKKb23xnR48fKK6kq9JDG2y6l9d6zz0W1v3+NJ3o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ynKI5xRl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ynKI5xRl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1167065e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762248; x=1788367048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1HpPd4ylLTuKYL4oCpnHBVRKXPxKbcynFiK+teZyII=;
        b=ynKI5xRlcNR7pmyDAv8VTP7Wg0eWJwJa336tr03j1EPUxIYrurhlkUM3LT6VKTC6sk
         37oFUKEnetaRU65SXjrcia5F5SrNPoh/rQLaNDP8W33QmDJn/Cp7Y0zf6882NRt3beV1
         Xdq5xa0EpfLW9zaH9GC5BKpdNPtnBEJXF8FNPnolDc4O00JTpWtrY+3NKyNFDypYVSoc
         gjupH8UtBAclbksCiKlq0u4K0MkASsWLf7RfPo3PzhvUAD5nfk8dpV4PayXV/ESSCZYq
         Vc1rTXbpX4U00eKnASBXcoCvnMnQY2UaAof/nEYaWvREVxf2bQp4s1zjXvuEgTYbixVj
         HmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762248; x=1788367048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1HpPd4ylLTuKYL4oCpnHBVRKXPxKbcynFiK+teZyII=;
        b=m9ooDVI2t804QuC1pihPUceDr7CXj93LuKZ3TDT9uVBRi7dAoT22eVEtwKsRmsA4nT
         Cwmn97WZD6SNY4Mz3oocMLvipW5UAYb8jntN03jDXMHf/m34OJq//eZ/YFdi5/zBNOvB
         EARwH2iEzS45HyhD8+pAjVWU/tlB4Q+aHiC64bAj600f0VFN02GhMC+5laYX/hCrAc6Y
         e4ioBr7XgcZsVkNjmYlQTLBNSJkwOtVCOUC76Xi4u30sIe9RUF5N+Ris+ARJHwPDF0eQ
         8Q94W0imfyt4QTEXMk06hj8UBMpb8YitNCYBG6q1B/K3QlTjAjjILBW/Wfd56yI4tS2n
         juVg==
X-Forwarded-Encrypted: i=1; AHgh+Rrxcvzz4ApJ3R3vazICYVk1C9hEvUVBArITk+/t5Zw6TFghOzxJiH00ZclxBpDxBRBmol1zipU2ZXWng3bKvg==@vger.kernel.org
X-Gm-Message-State: AFuF++mP4PEi8kGu/8+NUA6sy/Y4+T2p3b6jP+AX/4ucjtxVQsi25z72
	lf2p4OdDhdRmacRcTX8+crG0cqTkfF/AmxNw6d/6XqrFO7oFF6t92ZDWogcMgdPm9Q==
X-Gm-Gg: AR+sD137CKtEIcl8ZGrGidfS89u+vTZfZ6XpCp0QzGIjxr7QVNcYazB6t5UeeXb0+4o
	S2Sqidy7LHZ/RG3NZwjPJtPAGe19BaXyAU1JACAcrQEwb2E+fE6qvTjWSuAfnpCd7BMvN7pyJrx
	40z3yBnNVfl5G7uqCOBR5IqjPnUlAZF9TnyE9EghoSmdw8+3QmMsOGazKlvAc1jI7p7QmuBh4Mk
	A8r1nB+Pl/NhLEqBO8UzwbuDaHn1cMkTIVUPDKjFjeLAeXYtRmhBUeO4wFf8qpoDV+ZMjyHyEMF
	fVkigv7XDbEf20kNYLdN4vs2LwcF+FC5ynSvPx0O1JlGxYToFbipN2wAp/fFh86k6leL+rDyeni
	KHC+EY599cQtm7lCJA4PEOMk8m0cWZnQ5QMNrF2EnZST6doT03S00gDMjbfK1KEQ+0/9JNGl9Kc
	Bo4djaXT6nXAey6LkhqRaLyCpxT5QAuxbT7A+pbWQzIvQLJlHmvH3CYYtwXBEOhaDWM2JFAWvmu
	HP7rKw0XTMZjO9xYw0MjMHV7/i/SB9HHGzbwGny4CDwFro=
X-Received: by 2002:a05:600c:5491:b0:499:a4d1:d7d9 with SMTP id 5b1f17b1804b1-499dc717e32mr74023185e9.9.1787762247721;
        Wed, 26 Aug 2026 09:37:27 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm3350111f8f.8.2026.08.26.09.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:37:26 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/1] rust: firmware: add the firmware upload abstraction
Date: Wed, 26 Aug 2026 17:37:15 +0100
Message-ID: <20260826163716.6274-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163716.6274-1-mike@fireburn.co.uk>
References: <20260826163716.6274-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

request_firmware() covers "pull an image from /lib/firmware"; the other
half of the firmware loader, firmware_upload_register(), covers "userspace
hands the driver an image to write". It publishes
/sys/class/firmware/<name>/ with the loading/data handshake plus status,
error, remaining_size and cancel, and is what a driver uses when an image
has to be written on demand rather than only when a newer one appears.

Add an Upload trait mirroring struct fw_upload_ops, a Registration that
unregisters on drop, and an Error enum whose values are the fw_upload_err
codes userspace already reads back out of the error attribute.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/firmware.rs | 237 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 237 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 6a6b392ffc4e..a6fa565421d7 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -385,3 +385,240 @@ pub const fn build_length(self) -> usize {
         self.n + 1
     }
 }
+
+/// Firmware upload: let userspace hand a driver an image to write to its device.
+///
+/// Registering creates `/sys/class/firmware/<name>/` with the `loading`/`data` handshake plus
+/// `status`, `error`, `remaining_size` and `cancel`, which is the counterpart to [`Firmware`]:
+/// the same image works either way, but this one is pushed by userspace rather than pulled from
+/// `/lib/firmware`. Drivers use it when an image has to be written on demand -- a re-flash, or a
+/// deliberate downgrade -- rather than only when a newer version appears.
+pub mod upload {
+    use super::*;
+    use crate::types::ForeignOwnable;
+
+    /// Why an upload step failed. `None` means success.
+    ///
+    /// The values are the `enum fw_upload_err` the core reports back through `sysfs`, so a driver
+    /// says what went wrong in the vocabulary userspace already reads out of `error`.
+    #[derive(Clone, Copy, PartialEq, Eq)]
+    #[repr(u32)]
+    pub enum Error {
+        /// The device reported a failure; see the kernel log.
+        Hardware = bindings::fw_upload_err_FW_UPLOAD_ERR_HW_ERROR,
+        /// A handshake with the device timed out.
+        Timeout = bindings::fw_upload_err_FW_UPLOAD_ERR_TIMEOUT,
+        /// Userspace wrote `cancel`.
+        Canceled = bindings::fw_upload_err_FW_UPLOAD_ERR_CANCELED,
+        /// Another upload is already running.
+        Busy = bindings::fw_upload_err_FW_UPLOAD_ERR_BUSY,
+        /// The image is not a size this device can take.
+        InvalidSize = bindings::fw_upload_err_FW_UPLOAD_ERR_INVALID_SIZE,
+        /// A read or write to the device failed; see the kernel log.
+        ReadWrite = bindings::fw_upload_err_FW_UPLOAD_ERR_RW_ERROR,
+        /// The flash is wearing out; wait and retry.
+        WearOut = bindings::fw_upload_err_FW_UPLOAD_ERR_WEAROUT,
+        /// The image is not one this device accepts.
+        InvalidFirmware = bindings::fw_upload_err_FW_UPLOAD_ERR_FW_INVALID,
+    }
+
+    /// A driver's side of an upload.
+    ///
+    /// `prepare` runs once with the whole image, which is where a driver rejects one that is not
+    /// for this device; `write` is then called repeatedly until every byte is written.
+    pub trait Upload: Sized {
+        /// Shared driver state, handed back to every callback.
+        type Data: ForeignOwnable + Send + Sync;
+
+        /// Validate the image and get the device ready. Runs before any write.
+        fn prepare(
+            data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+            image: &[u8],
+        ) -> Result<(), Error>;
+
+        /// Write `chunk`, which starts at `offset` in the image, returning how much was written.
+        ///
+        /// Called repeatedly until the image is consumed, so a driver may write less than it was
+        /// offered and be called again with the remainder.
+        fn write(
+            data: <Self::Data as ForeignOwnable>::Borrowed<'_>,
+            image: &[u8],
+            offset: u32,
+            chunk: &[u8],
+        ) -> Result<u32, Error>;
+
+        /// Report whether the device has finished programming what it was sent.
+        fn poll_complete(data: <Self::Data as ForeignOwnable>::Borrowed<'_>) -> Result<(), Error>;
+
+        /// Asked to stop, from another thread: set a flag the other callbacks observe.
+        fn cancel(data: <Self::Data as ForeignOwnable>::Borrowed<'_>);
+
+        /// Undo whatever `prepare` set up. Runs on success and on failure alike.
+        fn cleanup(_data: <Self::Data as ForeignOwnable>::Borrowed<'_>) {}
+    }
+
+    /// The C vtable for `U`, built once at compile time.
+    struct Vtable<U: Upload>(core::marker::PhantomData<U>);
+
+    impl<U: Upload> Vtable<U> {
+        /// Turn a driver result into the `enum fw_upload_err` the core expects.
+        fn err(r: Result<(), Error>) -> bindings::fw_upload_err {
+            match r {
+                Ok(()) => bindings::fw_upload_err_FW_UPLOAD_ERR_NONE,
+                Err(e) => e as bindings::fw_upload_err,
+            }
+        }
+
+        /// # Safety
+        ///
+        /// Called by the firmware core with a valid `fw_upload` whose `dd_handle` is the pointer
+        /// [`Registration::new`] passed it, and `data` valid for `size` bytes.
+        unsafe extern "C" fn prepare(
+            fw: *mut bindings::fw_upload,
+            data: *const u8,
+            size: u32,
+        ) -> bindings::fw_upload_err {
+            // SAFETY: the core owns `fw` for the duration of the call.
+            let handle = unsafe { (*fw).dd_handle };
+            // SAFETY: `handle` came from `into_foreign()` in `Registration::new` and outlives the
+            // registration; `data`/`size` describe the image the core is holding.
+            let (d, image) = unsafe {
+                (
+                    <U::Data as ForeignOwnable>::borrow(handle.cast()),
+                    core::slice::from_raw_parts(data, size as usize),
+                )
+            };
+            Self::err(U::prepare(d, image))
+        }
+
+        /// # Safety
+        ///
+        /// As [`Self::prepare`]; `written` is a valid out-parameter.
+        unsafe extern "C" fn write(
+            fw: *mut bindings::fw_upload,
+            data: *const u8,
+            offset: u32,
+            size: u32,
+            written: *mut u32,
+        ) -> bindings::fw_upload_err {
+            // SAFETY: as above.
+            let handle = unsafe { (*fw).dd_handle };
+            // SAFETY: as above; `data + offset` is within the image the core holds.
+            let (d, image, chunk) = unsafe {
+                (
+                    <U::Data as ForeignOwnable>::borrow(handle.cast()),
+                    core::slice::from_raw_parts(data, (offset + size) as usize),
+                    core::slice::from_raw_parts(data.add(offset as usize), size as usize),
+                )
+            };
+            match U::write(d, image, offset, chunk) {
+                Ok(n) => {
+                    // SAFETY: the core passes a valid pointer for the result.
+                    unsafe { *written = n };
+                    bindings::fw_upload_err_FW_UPLOAD_ERR_NONE
+                }
+                Err(e) => e as bindings::fw_upload_err,
+            }
+        }
+
+        /// # Safety
+        ///
+        /// As [`Self::prepare`].
+        unsafe extern "C" fn poll_complete(
+            fw: *mut bindings::fw_upload,
+        ) -> bindings::fw_upload_err {
+            // SAFETY: as above.
+            let handle = unsafe { (*fw).dd_handle };
+            // SAFETY: as above.
+            let d = unsafe { <U::Data as ForeignOwnable>::borrow(handle.cast()) };
+            Self::err(U::poll_complete(d))
+        }
+
+        /// # Safety
+        ///
+        /// As [`Self::prepare`]. Runs on a different thread from the rest.
+        unsafe extern "C" fn cancel(fw: *mut bindings::fw_upload) {
+            // SAFETY: as above.
+            let handle = unsafe { (*fw).dd_handle };
+            // SAFETY: as above.
+            let d = unsafe { <U::Data as ForeignOwnable>::borrow(handle.cast()) };
+            U::cancel(d)
+        }
+
+        /// # Safety
+        ///
+        /// As [`Self::prepare`].
+        unsafe extern "C" fn cleanup(fw: *mut bindings::fw_upload) {
+            // SAFETY: as above.
+            let handle = unsafe { (*fw).dd_handle };
+            // SAFETY: as above.
+            let d = unsafe { <U::Data as ForeignOwnable>::borrow(handle.cast()) };
+            U::cleanup(d)
+        }
+
+        const VTABLE: bindings::fw_upload_ops = bindings::fw_upload_ops {
+            prepare: Some(Self::prepare),
+            write: Some(Self::write),
+            poll_complete: Some(Self::poll_complete),
+            cancel: Some(Self::cancel),
+            cleanup: Some(Self::cleanup),
+        };
+    }
+
+    /// A live `/sys/class/firmware/<name>/` upload interface, unregistered when dropped.
+    pub struct Registration<U: Upload> {
+        fw: *mut bindings::fw_upload,
+        data: *mut core::ffi::c_void,
+        _p: core::marker::PhantomData<U>,
+    }
+
+    // SAFETY: the C side is internally locked, and `U::Data` is `Send + Sync`.
+    unsafe impl<U: Upload> Send for Registration<U> {}
+    // SAFETY: as above.
+    unsafe impl<U: Upload> Sync for Registration<U> {}
+
+    impl<U: Upload> Registration<U> {
+        /// Publish an upload interface named `name` under `parent`.
+        pub fn new(
+            module: &'static crate::ThisModule,
+            parent: &Device,
+            name: &CStr,
+            data: U::Data,
+        ) -> Result<Self> {
+            let handle = data.into_foreign();
+            // SAFETY: `parent` and `name` are valid for the call; the vtable is 'static; `handle`
+            // is kept alive by this registration and released in `drop`.
+            let fw = unsafe {
+                bindings::firmware_upload_register(
+                    module.as_ptr(),
+                    parent.as_raw(),
+                    name.as_char_ptr(),
+                    &Vtable::<U>::VTABLE,
+                    handle.cast(),
+                )
+            };
+            let fw = match crate::error::from_err_ptr(fw) {
+                Ok(fw) => fw,
+                Err(e) => {
+                    // SAFETY: registration failed, so nothing else observes `handle`.
+                    drop(unsafe { <U::Data as ForeignOwnable>::from_foreign(handle) });
+                    return Err(e);
+                }
+            };
+            Ok(Self {
+                fw,
+                data: handle.cast(),
+                _p: core::marker::PhantomData,
+            })
+        }
+    }
+
+    impl<U: Upload> Drop for Registration<U> {
+        fn drop(&mut self) {
+            // SAFETY: `self.fw` came from `firmware_upload_register` and is unregistered once.
+            unsafe { bindings::firmware_upload_unregister(self.fw) };
+            // SAFETY: the core no longer holds `dd_handle` after unregistering.
+            drop(unsafe { <U::Data as ForeignOwnable>::from_foreign(self.data.cast()) });
+        }
+    }
+}
