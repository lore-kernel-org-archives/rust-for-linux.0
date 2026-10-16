Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD703D524E;
	Fri, 16 Oct 2026 20:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183499; cv=pass; b=LVuxuGhLAl0mEup2jn1Qt0XPVtrhbjQvB9Hcbh8ZIfvTpnBb9MTnfmiHFDW0Z0Gbk6ueF0K2MZTHKyD80OngAsDrwjTxFU8dOh7i9mEptdAdPYziVxAw/ZGA6moUmE/US2TGJT74O3f+SgyxwtuNIvazbjXNX6yo0caBI4h488k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183499; c=relaxed/simple;
	bh=BifXMQ3wf5nytHVx4Vm26QkPbWTrCBV8j2ShsC9B2/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZeMD10Bv1KlgQyBcZ4/3da5ovf7X3+LpXlJZESTTM/YWPJ2EuY7qN/Cxh3h5HRQeWdFA+zxR7RCldBoqQmDHkZmq+uny8PNRv8Dyq1T22sfusxMle7y+906tqfNu0rt3Q41Na/hX2+jx1fs2X8SiktV5rzgsq5vCnHyGg4rD94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=YH8L8swM; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="YH8L8swM"
ARC-Seal: i=1; a=rsa-sha256; t=1792183467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q9f3yoEF0dKAIVk73zsAHDKbbcuj2BtsbRtW8TjLT+bxWhFl1B8zBKeOYxENOMqeUOwAc5P2sX/tadGZ083YzJ0AYtMuh96wUynXwO8Dvl2vRqHoFX7Hp6pj4eoRcoD67Y2Ysi8ElLpmNP9G3zeZ7OwoT2PpTPB303vSLMNHgRc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792183467; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2lDEC0DuiMPcWNbSfDdjSTczo+Sc4lF7TDFSyMLbmz4=; 
	b=bBoyk4MNi/YlV2qYaJScr9J5Ikwhh0YLOBIFnGxisfDwjujML1+NTu5wHJ4JTn+/uvWr2ddeB/FVFUxx20ncDYgHKLPgDoOPb3K6WCXpTXObi4cSuknSK/c2xfB7UZ6ls5RPhaon8Q2KA9lJltEZ8oStrsZLzRR4qAhppUA2m0w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792183467;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2lDEC0DuiMPcWNbSfDdjSTczo+Sc4lF7TDFSyMLbmz4=;
	b=YH8L8swMvZt1BUzBcMKydth2Oe/Ivm9IDuSOZ2rFPCdB3X2bt7HkB/jLINneH24T
	mF/fTBPnLx4EoVX8wou+/LOYE3VhNSa22cf8mA799ZI8fVBfyKyA2Fvi4ebLlpImxwZ
	A/dupx48VbJYTilnRbD5bGg8T7lm6DJWd+BgECLI=
Received: by smtp.zohomail.com with SMTPS id 1792183464864553.6495366427025;
	Fri, 16 Oct 2026 13:44:24 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 16 Oct 2026 13:44:20 -0700
Subject: [PATCH v3 1/2] rust: uaccess: add UserSliceWriter::clear()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-dev_query_fixes-v3-1-f8071cda3515@collabora.com>
References: <20261016-b4-dev_query_fixes-v3-0-f8071cda3515@collabora.com>
In-Reply-To: <20261016-b4-dev_query_fixes-v3-0-f8071cda3515@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=BifXMQ3wf5nytHVx4Vm26QkPbWTrCBV8j2ShsC9B2/4=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmXepbNubeLLaNQquWpeeCDqdsf6M3e3JJ/OiN3RovxW
 9eihSfyOkpZGMS4GGTFFFnO2hv1iFe9N9Kd/78ZZg4rE8gQBi5OAZhI/leGf7YOPYv2rrn+L35/
 4kx5/ipNt827z3u9LdZqaLrFm7zI+Qgjw2bp13PM5L2s8vq2OvryLfGPT9YzulwdK/bC+GyVAMN
 HfgA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Add a method to zero the remaining bytes in a UserSliceWriter.

If userspace provides a buffer that is larger than necessary, provide
a method to zero out the remaining UserSliceWriter buffer. This avoids
userspace consuming potentially uninitialized memory and/or mistaking it
for data intentionally provided by the kernel.

Use the #[inline] annotation to make this clear() method available for
inlining outside of the kernel crate.

Since clear_user() is architecturally defined and may be a macro or inline
function, add a rust helper to make clear_user() callable from rust.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 rust/helpers/uaccess.c |  6 ++++++
 rust/kernel/uaccess.rs | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
index 6e59cc9c665c..e799d9ac9804 100644
--- a/rust/helpers/uaccess.c
+++ b/rust/helpers/uaccess.c
@@ -27,3 +27,9 @@ unsigned long rust_helper__copy_to_user(void __user *to, const void *from, unsig
 	return _inline_copy_to_user(to, from, n);
 }
 #endif
+
+__rust_helper unsigned long
+rust_helper_clear_user(void __user *to, unsigned long n)
+{
+	return clear_user(to, n);
+}
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f1aecda7a90c..8e18285ec44b 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -638,6 +638,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
     pub fn write_truncated<T: AsBytes>(&mut self, value: &T) -> Result<usize> {
         self.write_slice_partial(value.as_bytes(), 0)
     }
+
+    /// Zeros remaining bytes in the userspace buffer.
+    ///
+    /// Fails with [`EFAULT`] if the userspace memory cannot be cleared.
+    #[inline]
+    pub fn clear(&mut self) -> Result {
+        let len = self.length;
+
+        if len == 0 {
+            return Ok(());
+        }
+        // SAFETY: `clear_user` checks the userspace address and range and handles
+        // faults when accessing userspace memory
+        let res = unsafe { bindings::clear_user(self.ptr.as_mut_ptr(), len) };
+
+        if res != 0 {
+            return Err(EFAULT);
+        }
+
+        self.ptr = self.ptr.wrapping_byte_add(len);
+        self.length = 0;
+
+        Ok(())
+    }
 }
 
 /// Reads a nul-terminated string into `dst` and returns the length.

-- 
2.56.0

