Received: from mediconcil.de (mail.mediconcil.de [91.107.198.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1261F9F67
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.107.198.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129909; cv=none; b=G/azl2QUGN53j/L9AP29aFDQs+TZOyZpb8OC6OpxZzdHtmMx0MWqkBL0yAwZ7tSFmX4OqGzWHrOddCIaz/qX4pW+GTP1GbomOfp2WQgGeFr2rIIvndW8RtiiP9CQ+C2Oun34g1oNnvXOdqR6TvMo7lwtxVSZOggPkd+0NxnhRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129909; c=relaxed/simple;
	bh=wn433au1SCK12/sg+hPbdKPMM6/7yDT7k+m1UGqHbAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEMavSej6HLjOdqOkRKG9zdGvrtT71xUGSGv75A72OF3YZMBHxBLM2xueCfA03X6ia2IMXY/AhsiJKLIPucqb9Yqsj6/UOwOC+BZOn0992A4Jn1GTsLdR924XGIrQpqUTnn2WpRBpsKvok1X7IzFZZoKC6WTF4l6KaDIXKYcoI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpico.io; spf=none smtp.mailfrom=silver.spittel.net; arc=none smtp.client-ip=91.107.198.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpico.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=silver.spittel.net
Received: from [10.42.0.1] (helo=silver)
	by mediconcil.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <kauer@silver.spittel.net>)
	id 1tI2Fs-00DwdZ-1s;
	Mon, 02 Dec 2024 09:58:08 +0100
Received: from kauer by silver with local (Exim 4.98)
	(envelope-from <kauer@silver.spittel.net>)
	id 1tI2Fs-00000000HVy-0LRP;
	Mon, 02 Dec 2024 09:58:08 +0100
From: Bernhard Kauer <bk@alpico.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	Bernhard Kauer <bk@alpico.io>
Subject: [PATCH] rust: introduce KVec::pop()
Date: Mon,  2 Dec 2024 09:57:58 +0100
Message-ID: <20241202085758.67319-1-bk@alpico.io>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provides a simple stack together with push().

Signed-off-by: Bernhard Kauer <bk@alpico.io>
---
 rust/kernel/alloc/kvec.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ae9d072741ce..ba6c265ad5c5 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -302,6 +302,34 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         Ok(())
     }
 
+    /// Removes the last element from the [`Vec`] instance.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// assert_eq!(Some(2), v.pop());
+    /// assert_eq!(Some(1), v.pop());
+    /// assert_eq!(None, v.pop());
+    /// assert!(v.is_empty());
+    /// ```
+    pub fn pop(&mut self) -> Option<T> {
+        if self.len() == 0 {
+            return None;
+        }
+        self.len -= 1;
+
+        // SAFETY:
+        // - `ptr` is valid because there is at least one entry stored.
+        let ptr = unsafe { self.as_mut_ptr().add(self.len) };
+
+        // SAFETY:
+        // - `ptr` is properly aligned and valid for reads.
+        Some(unsafe { core::ptr::read(ptr) })
+    }
+
     /// Creates a new [`Vec`] instance with at least the given capacity.
     ///
     /// # Examples
-- 
2.45.2

