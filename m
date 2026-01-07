Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA0285419;
	Wed,  7 Jan 2026 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773700; cv=none; b=AjjW3iutfmevm9nRaVUNI6QKa42g/qwyegDuJ1o1UCj6vsnIdUYSdKDyi7pXhd3UkZIwNdjYWTFLTf1wtQvPtp0mBiINORu1CyFmdor7uazXl2JM/9MYOMtDBEtBRpgPIyvCoIh8x8fbTQi84hskqy3aVh+HJUjiyvASOf8nJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773700; c=relaxed/simple;
	bh=iAJnb9/rwV2jTlmCQSFf3nva6unTGQNGBsbITfZ85Hc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=og8aqA11IUp1JJFaK9alNIvFd32tQyCGyqWYxoguAJfmoLZ9N/CrqcjhDiDdstoaKPTOyOxaz57Lcaj9lS6PSmq5BIMvzXbZA6b+Qee/pz/j/FZi/MNm0oMBde8hJbm6HcApDQSYJuC/ziA4jeq1teKp4oaaSAFQMaPi78n/iTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=UEN+Od4k; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="UEN+Od4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1767773684; bh=YbRjhLpesLlZkgyVBDQ+2GNJl793w9sZpCAaFBN8/do=;
	h=From:To:Cc:Subject:Date;
	b=UEN+Od4kYwhKI+kkU0Bz4ad7nwkIgQPt5uRiqoOB1mpJz3WKJdQa9D9HYwDMQFmTI
	 q89FTnd3a7uvMCc5sUE5yKSDOtGapqVXzuUx8WETSSGvoTcyudk617fUnRz6UTDKSS
	 VkJNOvFrsrKqIMHSiA9LPDENQckcaE+mhGtVjFK0=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 3A989295; Wed, 07 Jan 2026 16:14:41 +0800
X-QQ-mid: xmsmtpt1767773681tdmzi2xe5
Message-ID: <tencent_63DD850B43CC086844717B73C574B8358F05@qq.com>
X-QQ-XMAILINFO: OATpkVjS499u1b/FTGUJDMtH0GWq6+Yu2oNB+ox+6f4fDCh2fkkqAi115ZAaR4
	 Ab5F9nxuhZPGmDRczpw5eX11rUE49XnV9sl/ti1H9PR9kd22yncsSDqsdL89W7KlJ2ETBautzSAk
	 xFlYPva76ZqURIWXbZf6se/irIuFR9xcr8Mv0wzwJnDKMHMWZ5Ek0uv7aZy18dlxMs3l+OoAtK5l
	 gt0mWCk8HkyQ16/GqcRcDweuJdvl1N4h+5sM4Kf9+eUL6KzU9jbcV1HESTYqvAJY8MfxWKeWUE/E
	 jzKmT0U3F/mf+GmjNSdqXrsiadTFfCl1+65fGb+XxrC2CyeNt+7MRwrySAfHKxUwVxRq5SOhNnqL
	 cxRgYPvbS6CpInVMHGennTxji48lOcYG8ZDdqj6Z7Fb2YFvY80cZB6yoTSbJui+Pwqi5OT4ILdKa
	 OOlkPdtpvAW6KQuHgYJUAXLbqM0YY8LtIaZf1Taeh1UqGweWRAstgU3+Xmxpv0DeFTSwt7LwYvz+
	 7c6rD9qg1FOei1hg/qLx2ABj/cXYJ1D0CBpVC0IMmb2YHY5SY8ObAjCZ71dB6TpFqDTZidQb708B
	 zUM3Wd8snGDaJbNqMwT7iqZ55EDXQU8SKRFHIrIrNCwhq9q9oOffL9QDypX5gPk+mMubTA6kVvTN
	 VorNOIE7LVcylpfzUDRgtH90QFWb7L/ldJp2B8fiThRRhie/TACNNRkVRSMtKAqTsluUEtb+vQER
	 Gz2mY1nFMjXXb7QoxJY6EaxIapDWm/ANEWTKaCIQJUWB2XmKkPbZZlyWnMIL+YiYjTLgeCe5k2fi
	 R8YtsCUK2i/X4LwOEX0XAHl+k3jh64bFVS2nqiK5tD4kesATj5O85Ex0RxfXdSVFHaxHgC533xPG
	 6hToYDLlUBT1ZR4pwqGGE+NihoVcbRNyYyxANf4/VNWUuywfPvmXIV1B9Wb3SZzb1csv6N4yc/WV
	 5hFHZaTjQzYvPEpqjt+waOjMKw8k2pgYTXU8cu+AdIuuSdM2dnPwQpiFKvCidWjMGaaXCr8p7h2r
	 dI9PlQxQLKMdd/9Ft7l91woO2ISZo=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: 1064094935@qq.com
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengfuyuan <pengfuyuan@kylinos.cn>
Subject: [PATCH] rust: io: mem: add ioremap_wc support
Date: Wed,  7 Jan 2026 16:14:40 +0800
X-OQ-MSGID: <20260107081440.173112-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: pengfuyuan <pengfuyuan@kylinos.cn>

Add write-combining memory mapping support to the Rust iomem abstraction.
This extends the existing IoMem and IoRequest abstractions to support
write-combining cache policy, which is essential for framebuffer memory
and other memory regions that benefit from write-combining semantics.

The implementation follows the same pattern as the existing ioremap and
ioremap_np support:
- Add rust_helper_ioremap_wc() in rust/helpers/io.c to wrap the C API
- Add IoMem::ioremap_wc() to perform the actual mapping with write-combining
- Add IoMem::new_wc() to create IoMem instances with write-combining policy
- Add IoRequest::iomap_wc_sized() and IoRequest::iomap_wc() methods
  for compile-time and runtime-sized mappings respectively

This enables Rust drivers, such as framebuffer drivers, to properly map
memory regions with write-combining semantics.

The API design is consistent with the existing iomap() methods, providing
both sized and unsized variants to match the pattern established by the
generic iomem abstraction.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 rust/helpers/io.c     |  5 +++
 rust/kernel/io/mem.rs | 71 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index c475913c69e6..6c9edf7f2233 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -13,6 +13,11 @@ void __iomem *rust_helper_ioremap_np(phys_addr_t offset, size_t size)
 	return ioremap_np(offset, size);
 }
 
+void __iomem *rust_helper_ioremap_wc(phys_addr_t offset, size_t size)
+{
+	return ioremap_wc(offset, size);
+}
+
 void rust_helper_iounmap(void __iomem *addr)
 {
 	iounmap(addr);
diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
index b03b82cd531b..94403d899bbd 100644
--- a/rust/kernel/io/mem.rs
+++ b/rust/kernel/io/mem.rs
@@ -149,6 +149,41 @@ pub fn iomap(self) -> impl PinInit<Devres<IoMem<0>>, Error> + 'a {
     pub fn iomap_exclusive(self) -> impl PinInit<Devres<ExclusiveIoMem<0>>, Error> + 'a {
         Self::iomap_exclusive_sized::<0>(self)
     }
+
+    /// Maps an [`IoRequest`] with write-combining cache policy where the size
+    /// is known at compile time.
+    ///
+    /// This uses the [`ioremap_wc()`] C API, which provides write-combining
+    /// semantics. This is useful for framebuffer memory and other memory
+    /// regions that benefit from write-combining, where multiple writes can
+    /// be combined and reordered for better performance.
+    ///
+    /// Unlike [`Self::iomap`], this method explicitly uses write-combining
+    /// mapping, which is typically needed for video framebuffers.
+    ///
+    /// [`ioremap_wc()`]: https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device
+    pub fn iomap_wc_sized<const SIZE: usize>(
+        self,
+    ) -> impl PinInit<Devres<IoMem<SIZE>>, Error> + 'a {
+        IoMem::new_wc(self)
+    }
+
+    /// Maps an [`IoRequest`] with write-combining cache policy where the size
+    /// is not known at compile time.
+    ///
+    /// This uses the [`ioremap_wc()`] C API, which provides write-combining
+    /// semantics. This is useful for framebuffer memory and other memory
+    /// regions that benefit from write-combining.
+    ///
+    /// Unlike [`Self::iomap_wc_sized`], here the size of the memory region
+    /// is not known at compile time, so only the `try_read*` and `try_write*`
+    /// family of functions should be used, leading to runtime checks on every
+    /// access.
+    ///
+    /// [`ioremap_wc()`]: https://docs.kernel.org/driver-api/device-io.html#getting-access-to-the-device
+    pub fn iomap_wc(self) -> impl PinInit<Devres<IoMem<0>>, Error> + 'a {
+        Self::iomap_wc_sized::<0>(self)
+    }
 }
 
 /// An exclusive memory-mapped IO region.
@@ -261,6 +296,33 @@ fn ioremap(resource: &Resource) -> Result<Self> {
         Ok(io)
     }
 
+    fn ioremap_wc(resource: &Resource) -> Result<Self> {
+        // Note: Some ioremap() implementations use types that depend on the CPU
+        // word width rather than the bus address width.
+        //
+        // TODO: Properly address this in the C code to avoid this `try_into`.
+        let size = resource.size().try_into()?;
+        if size == 0 {
+            return Err(EINVAL);
+        }
+
+        let res_start = resource.start();
+
+        // SAFETY:
+        // - `res_start` and `size` are read from a presumably valid `struct resource`.
+        // - `size` is known not to be zero at this point.
+        let addr = unsafe { bindings::ioremap_wc(res_start, size) };
+
+        if addr.is_null() {
+            return Err(ENOMEM);
+        }
+
+        let io = IoRaw::new(addr as usize, size)?;
+        let io = IoMem { io };
+
+        Ok(io)
+    }
+
     /// Creates a new `IoMem` instance from a previously acquired [`IoRequest`].
     pub fn new<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> + 'a {
         let dev = io_request.device;
@@ -268,6 +330,15 @@ pub fn new<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> +
 
         Devres::new(dev, Self::ioremap(res))
     }
+
+    /// Creates a new `IoMem` instance with write-combining cache policy from
+    /// a previously acquired [`IoRequest`].
+    pub fn new_wc<'a>(io_request: IoRequest<'a>) -> impl PinInit<Devres<Self>, Error> + 'a {
+        let dev = io_request.device;
+        let res = io_request.resource;
+
+        Devres::new(dev, Self::ioremap_wc(res))
+    }
 }
 
 impl<const SIZE: usize> Drop for IoMem<SIZE> {
-- 
2.25.1

