Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239881;
	b=hL/gewJFGVMwglEKkrGmo/1ET7PT7kQpQ2I1aVZuT8/EH2BLvI4tUhg6xwizeyWQfdYd
	 dhvCSrLZqmUVRrrpAUwA9BGPJL3ADk7h+pdEFclg2AByoplpiuQmS63CIj3iGhlSwUE3C
	 D1gJlJbAb2UJ+I8gpc58rE0QBLYYkw0KAuX/Hi3CgZ2Yo1TpLxh3iPmqDftPZ3vdbAhSI
	 T7oL8KOgYOFYWV4QcMOUxMmrIC3axXdPHCFf0dzKwvhW6GXxZvHX4UgX6NrcOUFTV4pjq
	 yRx6lO+j6TDGRzYQzDVKg87RpGhHa0s+1JkX9OrOSgAo4X+wE3soboPVsgsgSrsagmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YcUWxm4+i8v6MB/f3qiLFhXyjp5WzDz6iCDXkVjGzug=;
	b=A8wo1QkfF4WchNDnJ8RqJOgz4bWBubzRvNd8vq9d/OUF9kSVUzoMCaXU/LG9rC82B7a4
	 8rx8zrRib8DgbZMaXpCZInQnRaisTASqNkpQqYbjiXqdOc+hiAxM96oDLC+o6WPyuuG+l
	 IabQZ4vJFnmAVT41Cdzq+iNsbiM+pObMXtYy9b4neXFbu2ZR/IaE6n8rMwo0DDaboufEu
	 bt4FQpyHL5ZFR4HInwtl3Xvw6GY+VXHeTpxZHoJ0Dv64e/Z4p00dCCbvCQfj9QXPmlvK6
	 CTNLcLtxD0U7p6m5PuAPhp72/XUY2DfaULkTN1g5kX39IQdknfjcBdLZ4pbK0co83/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDSiRMKj;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E2606A331
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 15:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054E2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDSiRMKj
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so1434505c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 07:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239880; x=1794844680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YcUWxm4+i8v6MB/f3qiLFhXyjp5WzDz6iCDXkVjGzug=;
        b=VDSiRMKjEGqA+Huh1eSJ+Iljd1OCpz5o7eBgiaTbwTb2Zep/bPUdabILMwlFJ5hjh4
         jnJ1jp5agFksp/pEmgIgSTRmy5i00bNGXHqL2H+cVaKKWlpa/yBvsnUeaQyGB8wzRQHY
         801mypsaNsTasXj7bqHLPxcJr0ClxmDNEEiK1bNMKH5ZLsxcSaZ/xRWDarfMBeCxTnQs
         MkPGfdJQtbSfTvVYno4fxIE8WJsKGKQ42ejXGOMcYooQviSX8C9lWEXdp5rquN/f/0YT
         WD8HLM28SnetqieNFkhkQFmNf5Q2VVQ52IbP171squD6P/MLZH8Aw08tN9qRwPtKHHSs
         tesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239880; x=1794844680;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcUWxm4+i8v6MB/f3qiLFhXyjp5WzDz6iCDXkVjGzug=;
        b=AcbgxYYac9CcJPZofATIb+yRh1diVkO85mLDyZ9tmH4Uqt9m2VGCIwBbSu8YnNWYcD
         tGBYrBJPR9lVDUlps8UP+0k/OQW/X5qSDZdcuIL/GW0KIPVz8iLeIMB5spKd7Tk9nhOu
         L0vBbGtT+5xcGyW0j/UJnwjZQIXXPc+Y569BPkXZRyABsZkLDoaDFVGXs2CVrdvrUygD
         9ieRkGoBEp9MAXTGapAHw31coV1nsYPqs5iRJJEaYajEF4AjRLNIH0S3dQzJkFF09iJe
         BiqsGkInQt4jMm9b7mzLCovCTiQQ+DD0KLtAmvPu2SaD0kIsoatClsL9075Z6IbmT7Mq
         y10g==
X-Forwarded-Encrypted: i=1; AL+hErHNyk/UZZx2jeiW/KmbFrXbo/WUtvfPqJ+BT4mi3ZzX1FfY9lqVC6Q7lbHEXGCGlxU0166kKV3Ar9vdy4Wvpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V2sRaKAUraB3G2Mf3f8h18kd8qI2M0Trc7hR3+CZ/yEH3xqD0
	C33SFUGahIjMQ6X+ceM1yjOIYRGUONtGbsshVn6tO+uwNtaMNnPBpSJ7
X-Gm-Gg: AYBFou3IRE+G+9DQ1ZvHIsk2SGH5RluDwaAx5ZjQGs2iW4CU6ULgky5pZzbCIdirMYA
	whB5M5ZF+ERDc19i2H0W5Qj7UBWUKi4JfAV6D2lFPTGxuCwA2kNtojEt+WXwsOdr+uGn3OBsnrp
	pMp4N07T8hKeGyrZng0FDTkIUrd7kXYGl0Xj8N+K/3Qb6HXPzSFqhvetsFzBuMLBTyAsehMQYiC
	16NueTayYFo3USWJd2Nu74MJFrUmxjc2QDI1DYiygmPR7qMCsgFI60+5Fd+9m5Q/hHBPe2RyJaL
	GArvFgiq4NjoofuSyls/9vL+ojgDH/xf6rrGNFe0jXsNXczhMSmo0D8Gg/FrfEc0x8R/lmnKogP
	mWwzRXxzWU70G4Jv4pzQ5jrRahxTV6psRFNZlRKWchr6EDnlpuTVfcdABMQVY47Vs0FN0+Kjxl2
	gFybSkSqbIq18uOjyCuZbUZsab9GjzEnRGouulnATeKI9ZtK9tXme436tYEPvoQUmXjm6H24bKX
	XSfLbDe+vrZ1s11Da3CwsvfeoWOesFevDrwAEINHNHexNODrDKDYlrHEbWd/DVwFP279tglWX4i
	nuHHPWgLNcFO+st9iBBuaoYXSD9xix5NjONo+KW1t0N8rKvA2CUiZqFM15vL58/SNZbbD7Ol599
	Vrj7+MEiEQZqiV4RO
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr6035678c88.10.1794239879928;
        Mon, 09 Nov 2026 07:57:59 -0800 (PST)
Received: from localhost.localdomain ([125.166.179.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm13020828c88.13.2026.11.09.07.57.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 07:57:59 -0800 (PST)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shuai Liu <847807867@qq.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
Date: Mon,  9 Nov 2026 22:57:41 +0700
Message-ID: <20261109155743.83740-3-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement fallible SMBus byte and word access for bound I2C clients
using the generic I/O backend infrastructure.

I2C transactions may fail due to NACK, arbitration loss, or timeout, so
use FallibleIoCapable rather than the infallible IoCapable interface.
Propagate errors returned by the I2C core to callers.

Provide smbus_io() for byte-addressed register access and standalone
word helpers for layouts not represented by the Region-based view.
Also provide smbus_read_word_swapped() for devices that transmit the
high byte of a multi-byte value first.

Restrict these operations to I2cClient<Bound> so bus I/O is only available
while the client remains bound.

Keep the raw SMBus FFI calls and errno conversion in safe bound-client
methods. Include a generic no_run example for the word-read helper.

Suggested-by: Shuai Liu <847807867@qq.com>
Link: https://lore.kernel.org/all/tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com/
Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/i2c.rs | 235 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..6f63bb8c6f93 100644
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
@@ -594,3 +601,231 @@ unsafe impl Send for Registration {}
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
+        view.client.smbus_read_byte(reg)
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u8>, value: u8) -> Result {
+        // `io_view()` ensures `offset + 1 <= 256`, so `addr()` is at most 255;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+        view.client.smbus_write_byte(reg, value)
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
+        view.client.smbus_read_word(reg)
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u16>, value: u16) -> Result {
+        // `io_view()` ensures `offset + 2 <= 256`, so `addr()` is at most 254;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+        view.client.smbus_write_word(reg, value)
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
+    #[inline]
+    fn smbus_read_byte(&self, reg: u8) -> Result<u8> {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_byte_data` accepts any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(self.as_raw(), reg) };
+        to_result(ret)?;
+        Ok(ret as u8)
+    }
+
+    #[inline]
+    fn smbus_write_byte(&self, reg: u8, value: u8) -> Result {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_byte_data` accepts any u8 command byte and value.
+        let ret = unsafe { bindings::i2c_smbus_write_byte_data(self.as_raw(), reg, value) };
+        to_result(ret)
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
+        to_result(ret)?;
+        Ok(ret as u16)
+    }
+
+    #[inline]
+    fn smbus_write_word(&self, reg: u8, value: u16) -> Result {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_word_data` accepts any u8 command byte and u16 value.
+        let ret = unsafe { bindings::i2c_smbus_write_word_data(self.as_raw(), reg, value) };
+        to_result(ret)
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
+    /// # Examples
+    ///
+    /// ```no_run
+    /// use kernel::{device::Bound, i2c::I2cClient, prelude::*};
+    ///
+    /// # fn test(client: &I2cClient<Bound>) -> Result<u16> {
+    /// // Read a word from a device that transmits its high byte first.
+    /// client.smbus_read_word_swapped(0x0c)
+    /// # }
+    /// ```
+    #[inline]
+    pub fn smbus_read_word_swapped(&self, reg: u8) -> Result<u16> {
+        self.smbus_read_word(reg).map(u16::swap_bytes)
+    }
+}
