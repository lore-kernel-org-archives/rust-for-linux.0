Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113904DC551
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165727; cv=none; b=bf+77yQD5ljPJVQ2URhskbr9f9yF0xhHtpWg0bpZq0pDHnAp+Ge0EFEd1mhGNFQfofbeJBLLEzt/4sFa91nzXPmQvJBPege3ZCs8sigJmm8YNjB+g9COxBZ6XxKwd2NiNy7UxEDMHrNb3LI9YDVvU3F/4iPFg31uCTztwNwDDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165727; c=relaxed/simple;
	bh=f/LlaXwpgISPLIkAh4D0bO0JxYhqdGLGuejPAOTGjYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOlKEFWyKjRw9jtmUoCbPMotq5BCwBzxdsdJaAPUx/P57u+44yJGFUR6R0EndwUEUYx9p7H6y1PKXHqGRnKgm4WzXDyX8wKcE8FHmi4e/JOc1cPiI2c2XzrLEEzQ6uV0DGzPBHkMMi60iGZ4bWlbwOeCa/wxZtV/+4I+neajGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBPKv5gi; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBPKv5gi"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8565d77c277so603437b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165721; x=1792770521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UcXcjmdbD4zGGAO+RVCCm8PFVCmkKLDPCn8GWidFdVc=;
        b=kBPKv5gipxkJ38MBp5BKL1VIaDZjGM8jR0Va7Jq7704edQYjbNixXFuGJCC8hbQpjt
         tdSCBYTL11M4Ef/vpLJy6LCHeCwFtOj/gT5q4ujV+OHBzrL7y0Xqhn/30qNo4vOSwNr9
         r61eV9soZUqSKh9XbmdrgqIs+Kg8NoBaCzbwtTmuaStZruYTje2o/nhskAcB7HvMEt4w
         gKgLmWdCJrsWm0BiVLN6Gd1D0whjLVSN6l+zuvVxCpUMa6SJZ71xsX73FFLBfIv7Iy7A
         5ox82lh+ZsmGzJBszl7Ulqkyjy2FGFbgNtkoxHwVQw/1SAGUEmucfO0oel5v6XEJAKpe
         qlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165721; x=1792770521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcXcjmdbD4zGGAO+RVCCm8PFVCmkKLDPCn8GWidFdVc=;
        b=ZDj0DZXas/l/+2qJt2faS8JbJbQ/5wkhFtrFXotwfwS5halcLGIkbZWPOZ9GA1WOtZ
         3wXpsMldVgcBmdwc6cQrTjjUB5L3I+M7n2EXzNs0Z2yaV5bXt/XYHZvUh9q+fRcb3fSN
         432ck0b0RtdlezZrf45qx9i2i8XaBwJ217ZtQRlOoMqSzcZtPTWDoguChJ1O2TC6YZxF
         3WssP63d9CWj4+M4+u6dPmgyyeIdEhtodJ59+KcjcrmcAVEPGCcQNkSkdhAA27UFpD3O
         OBswrFpTOXJ5YFLno9LWYZR2XA3dZDynSns4gMxoLXxa6sJXhP/ebwKuCnnBRMqUw9jJ
         0w+Q==
X-Forwarded-Encrypted: i=1; AKwUvByY9FGLUYctTBcJCg7742Ngs0D7AAR9zTUWZjXybz7sLG6r8UZvcgldYtHlAgk5joC0V5ydIaFxaNm7r2nDlw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGJ4LuZqJXii7b2OcwbmEK4YapVsGz0IqxVPXMK2s1jSdW33Yb
	OYe1hhwsm77zC4ZZUKfAQxfokfNnjMMZXlKYdu/+VSFPjO+TsTCYkz2W
X-Gm-Gg: AYBFou3YDixxjlXE6S/tcT4iFTO53w3oVbOaZVS/NXUwBg284Nmnric8jczgPCpihnK
	1DCb1+VFcupFlZIpP/Vb+CIAqLOkbWwYH7j6TvFlc50on1HKgUcNFxM4+3gpZ4s8DDqpJCCk2Q7
	3pOZ/uqmqpwDpBulUI3r7Vu0wcILyxI9p/1rC9Lk8EJQb0JJW1+MCXNjGpFaXTv/fiN8hD9rChq
	X26+opEjNwOveMOoW+Q015ogTvgRol8Ok+H1R7FLdn00j1n+Kanmk0E3DpK+vUiw5jTfPf54cKH
	hDR1K6XGNzizS+O2wBH2Cb9fzFbzrDF5Gqdt0vs+Y+NrofXuLczpSkthyciOZ/j92jxVnelE6SH
	IuVASXqqGTmWIEHRIcPo6DYzM5ZLN3BV9AU0L4PLJsdQB+wgsbQJWWXQ9PvTBCc3wrZGSZun4Z7
	iYiOT8HFw0OyYKO5epqV2zfaYzTsdVWkqAHN81jcUrNBB4gGafr7JEsvqToCAUbyrXF8NPjg7yp
	mY0k3r7AnNsap3fyGDTasQM7LekVndV0YjCO7o=
X-Received: by 2002:a05:690c:6203:b0:8b0:ad62:19c0 with SMTP id 00721157ae682-8b0f21b9343mr1466717b3.39.1792165720564;
        Fri, 16 Oct 2026 08:48:40 -0700 (PDT)
Received: from localhost.localdomain ([180.243.241.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e593c65bsm10882167b3.38.2026.10.16.08.48.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 08:48:38 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Brandon StJohn <branstj@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 2/4] i2c: rust: implement SMBus access via IoBackend
Date: Fri, 16 Oct 2026 22:48:17 +0700
Message-ID: <20261016154819.17936-3-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement fallible SMBus byte and word access for bound I2C clients
using the generic I/O backend infrastructure.

I2C transactions may fail due to NACK, arbitration loss, or timeout, so
use FallibleIoCapable rather than the infallible IoCapable interface.
Propagate errors returned by the I2C core to callers.

Provide smbus_io() for byte-addressed register access and standalone
word helpers for devices whose word register starts at an odd offset.
Also provide smbus_read_word_swapped() for devices storing the high byte
at the first register address.

Restrict these operations to I2cClient<Bound>, ensuring that bus I/O is
only available while the client remains bound.

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/i2c.rs | 248 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 624b971ca8b0..a53f7ee42b13 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -14,8 +14,15 @@
     devres::Devres,
     driver,
     error::*,
+    io::{
+        FallibleIoCapable,
+        IoBackend,
+        IoBase,
+        Region, //
+    },
     of,
     prelude::*,
+    ptr::KnownSize,
     sync::aref::{
         ARef,
         AlwaysRefCounted, //
@@ -601,3 +608,244 @@ unsafe impl Send for Registration {}
 // SAFETY: `Registration` offers no interior mutability (no mutation through &self
 // and no mutable access is exposed)
 unsafe impl Sync for Registration {}
+
+/// I/O backend for SMBus register access via I2C.
+///
+/// This backend implements only [`FallibleIoCapable`] and not
+/// [`crate::io::IoCapable`], because I2C/SMBus transactions can fail
+/// regardless of address validity. The infallible [`crate::io::Io::read`],
+/// [`crate::io::Io::write`], and [`crate::io::Io::update`] methods are
+/// therefore unavailable for this backend.
+pub struct I2cBackend;
+
+/// An SMBus view associated with a bound I2C client.
+///
+/// The pointer encodes a command offset and is never dereferenced as
+/// memory. Its type and, for dynamically sized targets, metadata describe
+/// the extent of the view.
+///
+/// # Invariants
+///
+/// The view is derived from the client's SMBus command region.
+/// Projections preserve the bounds of the source view.
+/// `client` remains valid and bound for the lifetime of the view.
+pub struct I2cView<'a, T: ?Sized> {
+    client: &'a I2cClient<device::Bound>,
+    ptr: *mut T,
+}
+
+impl<T: ?Sized> Copy for I2cView<'_, T> {}
+
+impl<T: ?Sized> Clone for I2cView<'_, T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl IoBackend for I2cBackend {
+    type View<'a, T: ?Sized + KnownSize> = I2cView<'a, T>;
+
+    #[inline]
+    fn as_ptr<'a, T: ?Sized + KnownSize>(view: Self::View<'a, T>) -> *mut T {
+        view.ptr
+    }
+
+    #[inline]
+    unsafe fn project_view<'a, T: ?Sized + KnownSize, U: ?Sized + KnownSize>(
+        view: Self::View<'a, T>,
+        ptr: *mut U,
+    ) -> Self::View<'a, U> {
+        // INVARIANT: Per safety requirement.
+        I2cView {
+            client: view.client,
+            ptr,
+        }
+    }
+}
+
+impl FallibleIoCapable<u8> for I2cBackend {
+    #[inline]
+    fn io_try_read<'a>(view: I2cView<'a, u8>) -> Result<u8> {
+        // `io_view()` ensures `offset + 1 <= 256`, so `addr()` is at most 255;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_byte_data` is safe to call with any valid client pointer
+        // and any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(view.client.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u8)
+        }
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u8>, value: u8) -> Result {
+        // `io_view()` ensures `offset + 1 <= 256`, so `addr()` is at most 255;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_byte_data` is safe to call with any valid client pointer
+        // and any u8 command byte and value.
+        let ret = unsafe { bindings::i2c_smbus_write_byte_data(view.client.as_raw(), reg, value) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+/// The `Region<256>` view is byte-addressed. Consequently, its generic
+/// 16-bit operations reject odd command bytes and command byte `0xFF`.
+/// Devices whose command bytes each select an independent 16-bit register
+/// should use [`I2cClient::smbus_read_word`] or
+/// [`I2cClient::smbus_read_word_swapped`] directly.
+impl FallibleIoCapable<u16> for I2cBackend {
+    #[inline]
+    fn io_try_read<'a>(view: I2cView<'a, u16>) -> Result<u16> {
+        // `io_view()` ensures `offset + 2 <= 256`, so `addr()` is at most 254;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_word_data` is safe to call with any valid client pointer
+        // and any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_word_data(view.client.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u16>, value: u16) -> Result {
+        // `io_view()` ensures `offset + 2 <= 256`, so `addr()` is at most 254;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_word_data` is safe to call with any valid client pointer
+        // and any u8 command byte and u16 value.
+        let ret = unsafe { bindings::i2c_smbus_write_word_data(view.client.as_raw(), reg, value) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl<'a, T: ?Sized + KnownSize> IoBase<'a> for I2cView<'a, T> {
+    type Backend = I2cBackend;
+    type Target = T;
+
+    #[inline]
+    fn as_view(self) -> I2cView<'a, T> {
+        self
+    }
+}
+
+// SAFETY: The bound client borrow remains valid when the view is moved
+// between threads. The view exposes only SMBus transactions, which use
+// the I2C core's bus locking, and pointer projections that never
+// dereference the encoded address as memory. `T: Sync` preserves the
+// shared-view restriction.
+unsafe impl<T: ?Sized + Sync> Send for I2cView<'_, T> {}
+
+// SAFETY: Sharing a view permits concurrent SMBus transactions, which
+// use the I2C core's bus locking. The bound client remains valid for
+// the view's lifetime, and the encoded pointer is never dereferenced
+// as memory. `T: Sync` preserves the shared-view restriction.
+unsafe impl<T: ?Sized + Sync> Sync for I2cView<'_, T> {}
+
+impl I2cClient<device::Bound> {
+    /// Returns an I/O handle for SMBus register access on this I2C client.
+    ///
+    /// The returned handle provides fallible read and write methods for the
+    /// SMBus command byte range (0x00–0xFF). A command byte is a data byte which
+    /// often selects a register on the device. The 7-bit device address is handled
+    /// separately by the I2C core.
+    ///
+    /// [`crate::io::Io::try_read16`] and
+    /// [`crate::io::Io::try_write16`] on the returned handle reject
+    /// odd offsets because the [`Region`]-based bounds check requires
+    /// `offset % 2 == 0`. This model does not cover every SMBus register layout,
+    /// including layouts where auto-increment or auto-decrement results in command
+    /// bytes that appear unaligned. Use [`Self::smbus_read_word`] or
+    /// [`Self::smbus_read_word_swapped`] for word access at an odd command byte.
+    #[inline]
+    pub fn smbus_io(&self) -> I2cView<'_, Region<256>> {
+        // INVARIANT: The view borrows this bound client and covers the 256-byte
+        // SMBus command region.
+        //
+        // The provenance-free pointer encodes a command offset rather than a
+        // memory address. Its initial address is zero, and the region metadata
+        // supplies the length used for bounds checks. Projections select command
+        // offsets; SMBus accessors extract those offsets without dereferencing
+        // the pointer.
+        I2cView {
+            client: self,
+            ptr: Region::<256>::ptr_from_raw_parts_mut(core::ptr::without_provenance_mut(0), 256),
+        }
+    }
+
+    /// Reads the 16-bit SMBus word value returned for a command.
+    ///
+    /// Wraps `i2c_smbus_read_word_data`. The `reg` parameter is the SMBus
+    /// command byte (0x00–0xFF), a data byte which often selects a register on
+    /// the device. SMBus transmits the low byte first.
+    ///
+    /// Use [`Self::smbus_read_word_swapped`] for devices that transmit the
+    /// high byte of a multi-byte value first.
+    ///
+    /// Returns `Err` if the bus transaction fails, for example because of a
+    /// NACK, arbitration loss, or timeout.
+    #[inline]
+    pub fn smbus_read_word(&self, reg: u8) -> Result<u16> {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_word_data` is safe to call with any valid client
+        // pointer and any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_word_data(self.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
+
+    /// Reads a 16-bit word from an SMBus command and swaps its two bytes.
+    ///
+    /// Wraps `i2c_smbus_read_word_data` and applies [`u16::swap_bytes`] to the
+    /// result. The `reg` parameter is the SMBus command byte (0x00–0xFF), a data
+    /// byte which often selects a register on the device.
+    ///
+    /// SMBus transmits the low byte first. This method swaps the returned bytes
+    /// for devices that transmit the high byte of a multi-byte value first.
+    ///
+    /// Returns `Err` if the bus transaction fails, for example because of a
+    /// NACK, arbitration loss, or timeout.
+    ///
+    /// # Example
+    ///
+    /// ```ignore
+    /// // AS5600 stores the 12-bit raw angle at command byte 0x0C with its
+    /// // high byte first.
+    /// let raw = client.smbus_read_word_swapped(0x0C)?;
+    /// let angle = raw & 0x0fff;
+    /// ```
+    #[inline]
+    pub fn smbus_read_word_swapped(&self, reg: u8) -> Result<u16> {
+        self.smbus_read_word(reg).map(u16::swap_bytes)
+    }
+}
-- 
2.50.0

