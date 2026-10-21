Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792541240;
	b=qGMsJq4Uuz5JOvF2DgROlbuSFYPqwhDvBZbabN0cQJn2EE2RrNi4xLBLxXz3SBOaZJJh
	 Ruf/FRFldnJ8o4XIepmpvxvfIHi0azZa9ikslpsAL5z4SDQUMj4Fe2ZVNYN/cH6mldkw3
	 9R98zyvTnPrTPNBu/YgZn5ewXH4LOgVGgVQ/sM3feghMhrpTbOVsHLi1caK3d0OdRl+HY
	 jWXaW3zhKFkq/IEWfbRBnuiRyDCTMtYFlzbK1A6QLlwk/m7F6M7eouSCkdaFNxaQtNOuD
	 6FnBqzdY1+E23hW7+2mGbMURUNzDEstCRVgq2Wm51HMR4vH2kfHkWtwwuxn+VS0TNJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541240;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2lDEC0DuiMPcWNbSfDdjSTczo+Sc4lF7TDFSyMLbmz4=;
	b=3bk8UGH8QbB3IU3A+oCGSP+h1U3Lqy+wUN07a+jQuY9hS1K7OtV6T2RpqOG5H5EiViA6
	 ypph8JLrwIorSLJ4eFTNkWxyxXkswyigACzxqyYcPMV2QlCZqmXwCAqNccdw+uX4t1AvQ
	 j85WL8dIppADTylx2vN3oOtpkRwqDXQ+rdA63T3fKSnaK4trsInuKgcpQZJ9vDxe2q4y0
	 R5Pnksk3cA2WdNiAK7YlTx19E3m5/hCaKemC6POdHFvIn5oZnf9N/oSDxRwBue8Sy4DM8
	 KZ990NUry5SvCkeJhBoYv8a4nKB4JDTEqtE0CeAE6hz0Dj2TGpusTzi1LwvVgn5p9Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PxwNPOQ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AB606A31C;
	Wed, 21 Oct 2026 00:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PxwNPOQ9
ARC-Seal: i=1; a=rsa-sha256; t=1792541210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G+3U0M//Gf6SjnFjXackPZD+hwSfuehH2KmsRUyiCh92lzVjIK5Xj/x0Nk/pusKBaPQ7gZEz4eja1vzJejHvav/EZ2etAoIU1hqYCWNz+rYk0q2DhzoOaGH6nIaHB6Z/k8gXTvqGHK4ovMx3CfOanrx8Hu1UNVg63IJtZCN+eVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792541210; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2lDEC0DuiMPcWNbSfDdjSTczo+Sc4lF7TDFSyMLbmz4=; 
	b=nAGiUTpdpdXzQpD80nr2YG89xBCptD0Y8Nd2g56JyhKKDRZrRmGDA5G1h5iD7B09ehfaBx7jmxEmqE0Gbii5gBY7fc87TMKR+k3hMq+t6jIBpKXi4Qj2nm4g/aUKEA1n54U2g0vuyXF82Q/0ZTH6ubzsa+dBxjW2g0YhwPqyFvI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792541210;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2lDEC0DuiMPcWNbSfDdjSTczo+Sc4lF7TDFSyMLbmz4=;
	b=PxwNPOQ9hDOm3OBvHhHVu/ywj4V0vRnFCSs++tasDkr7UCS8B3EGOq4QzxrXrnPq
	m06cSk0Z1B/qBNBLVT5O1msEderWI5pf0yFBRpEPx8lBB5DFyKqlcOdgYV1ZjIMAn/l
	QkCc/tZs9aOgvkzEQBxo9yf1Pl0PXf0HrqKMC8l0=
Received: by smtp.zohomail.com with SMTPS id 1792541208022378.16433192325917;
	Tue, 20 Oct 2026 17:06:48 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Tue, 20 Oct 2026 17:06:45 -0700
Subject: [PATCH v4 1/3] rust: uaccess: add UserSliceWriter::clear()
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-b4-dev_query_fixes-v4-1-df66b4c98bc6@collabora.com>
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
In-Reply-To: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
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
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFk3mES3aNlFc1y+0Hzz79LKz/JqV7/t5no6yVrl69sNL
 dcXTqk27yhlYRDjYpAVU2Q5a2/UI1713kh3/v9mmDmsTCBDGLg4BWAiE7czMjS8aLv2tct3ysQ1
 Emn3FqzeJ+Yao1Cyo0XN5nBGGPfDu+wM/+On/Dj7PShmoWfhblklT8lnpeZl/j4v+7nN17/f+dr
 iJwcA
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

