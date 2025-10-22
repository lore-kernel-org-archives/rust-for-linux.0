Received: from sg-1-30.ptr.blmpb.com (sg-1-30.ptr.blmpb.com [118.26.132.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8613431F4
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761135993; cv=none; b=qVI4Jd4zi2L2/QPzoG36ZpIUqM2XNgc3CjLOwief8kSplp2ycAxu8mrN7IhcRMC18cSzCsdF+RA16tjJvT6F8dFfb8eD0lZq7vMilK3lgpGjCH+CU03V6Nnzv7G8zVGFrh3DPAHhNcYuWeI1lLJPLv031cslfDnUVpwIJ7sJdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761135993; c=relaxed/simple;
	bh=HOIWlTLRdchLVpAcNKO/ypvISSpXYLdU54nD1Cif6rg=;
	h=Date:Message-Id:From:Content-Type:Subject:Cc:Mime-Version:To; b=rZawNvqtbhODS+o3qFdPLkgin2vWfc7bMiQ6Y7p7QOYpaAZJdrJiug94w1MBRfy6amMs4fembDvks/ai46TO/YlZ10coEBCHu1/4ekxBU/Q0ZZB7XvEfjQ3uhx6HTNOQidFv/wZKqFcjpbwzSGchbtHZC1G3g6Qv+9Ez1St2Ctk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=WjNkjCZL; arc=none smtp.client-ip=118.26.132.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="WjNkjCZL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1761135974;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=4T3rbRtw8rPMUwE3Q5fJJYzc6MD9lCGu3IKNcwi+QQU=;
 b=WjNkjCZLSsJFj+c/aS1yQfv5kJnEVGhfVrcTr3L0V6Tz/oxDJYOBH7y0CgWEr3hSwPk4gP
 1DW+XyigxP3E48I4J8f4b3ElUUZr8dC6HkR/DUzbgxZLAIYzp766SRV/ULrTBUXhE4T6mp
 nzTvx0d6Kp99D31gHtvVuoZV3q2Up6wEx4Q2eH5tLXIKCi4K6+jA8TaX63bJa5BhYKPX6i
 uT6BQBQioCnqneEkH62bIBLRdeuWLF9D64V20L51pyZ/Wk2q66PHdY4za6w96MMlF92uyq
 9kIG/6sUZUg+TT4V5Y+vNhvLnnvKw5vs2nEVfBvHFA95K5yNHYjAmxITaH8ixQ==
Date: Wed, 22 Oct 2025 20:25:18 +0800
Message-Id: <20251022122518.457702-1-caojunze424@openatom.club>
X-Original-From: Junzecao <caojunze424@openatom.club>
From: "Junzecao" <caojunze424@openatom.club>
Received: from cgbc-Lenovo-Legion-R9000P2021H.smartont.net ([110.19.164.246]) by smtp.feishu.cn with ESMTPS; Wed, 22 Oct 2025 20:26:11 +0800
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH 1/1] rust: fs: Add FileOffset instead "pub type Offset = bindings::loff_t;" and FileOffset test
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	"Benno Lossin" <lossin@kernel.org>, 
	"Andreas Hindborg" <a.hindborg@kernel.org>, 
	"Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, 
	"Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>, 
	"Junzecao" <caojunze424@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
X-Lms-Return-Path: <lba+268f8cd64+0c0b02+vger.kernel.org+caojunze424@openatom.club>

Reference issue(https://github.com/Rust-for-Linux/linux/issues/1198).
Only addition and subtraction operations on FileOffset are retained

Signed-off-by: Junzecao <caojunze424@openatom.club>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/r/20251020222722.240473-1-dakr@kernel.org
---
 rust/kernel/fs/file.rs | 121 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index cd6987850332..8c292f9115ba 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -15,7 +15,7 @@
     sync::aref::{ARef, AlwaysRefCounted},
     types::{NotThreadSafe, Opaque},
 };
-use core::ptr;
+use core::{ops::Add, ops::Sub, ptr};
 
 /// Flags associated with a [`File`].
 pub mod flags {
@@ -100,6 +100,59 @@ pub mod flags {
     pub const O_RDWR: u32 = bindings::O_RDWR;
 }
 
+/// A file offset position.
+///
+/// This newtype wraps [`bindings::loff_t`] to provide type safety for file operations.
+/// It prevents accidental misuse by restricting operations to those that make sense
+/// for file offsets (addition, subtraction, comparison) while preventing meaningless
+/// operations like multiplication or division.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::fs::file::FileOffset;
+///
+/// let start = FileOffset::zero();
+/// let position = FileOffset::new(1024);
+/// let new_pos = start + 512;        // Valid: move forward
+/// assert!(new_pos < position);      // Valid: comparison
+/// let raw: i64 = position.into();   // Convert for C interop
+/// ```
+#[derive(Debug, PartialEq, Eq, PartialOrd, Ord)]
+pub struct FileOffset(bindings::loff_t);
+
+impl FileOffset {
+    /// Creates a new file offset from an i64 value.
+    pub const fn new(value: i64) -> Self {
+        Self(value)
+    }
+
+    /// Creates an offset representing the start of a file (offset 0).
+    pub const fn zero() -> Self {
+        Self(0)
+    }
+}
+
+impl Add<i64> for FileOffset {
+    type Output = Self;
+    fn add(self, rhs: i64) -> Self {
+        Self(self.0 + rhs)
+    }
+}
+
+impl Sub<i64> for FileOffset {
+    type Output = Self;
+    fn sub(self, rhs: i64) -> Self {
+        Self(self.0 - rhs)
+    }
+}
+
+impl From<FileOffset> for i64 {
+    fn from(offset: FileOffset) -> i64 {
+        offset.0
+    }
+}
+
 /// Wraps the kernel's `struct file`. Thread safe.
 ///
 /// This represents an open file rather than a file on a filesystem. Processes generally reference
@@ -466,3 +519,69 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         f.pad("EBADF")
     }
 }
+
+#[macros::kunit_tests(rust_file_offset_test)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_file_offset_creation() {
+        let offset = FileOffset::new(1024);
+        let raw: i64 = offset.into();
+        assert_eq!(raw, 1024);
+    }
+
+    #[test]
+    fn test_file_offset_zero() {
+        let zero = FileOffset::zero();
+        let raw: i64 = zero.into();
+        assert_eq!(raw, 0);
+    }
+
+    #[test]
+    fn test_file_offset_addition() {
+        let start = FileOffset::new(100);
+        let result = start + 50;
+        let raw: i64 = result.into();
+        assert_eq!(raw, 150);
+    }
+
+    #[test]
+    fn test_file_offset_subtraction() {
+        let start = FileOffset::new(100);
+        let result = start - 30;
+        let raw: i64 = result.into();
+        assert_eq!(raw, 70);
+    }
+
+    #[test]
+    fn test_file_offset_comparison() {
+        let offset1 = FileOffset::new(100);
+        let offset2 = FileOffset::new(200);
+        let offset3 = FileOffset::new(100);
+
+        assert!(offset1 < offset2);
+        assert!(offset2 > offset1);
+        assert_eq!(offset1, offset3);
+        assert!(offset1 <= offset2);
+        assert!(offset2 >= offset1);
+    }
+
+    #[test]
+    fn test_file_offset_negative() {
+        let negative = FileOffset::new(-50);
+        let raw: i64 = negative.into();
+        assert_eq!(raw, -50);
+    }
+
+    #[test]
+    fn test_file_offset_large_values() {
+        let large = FileOffset::new(i64::MAX);
+        let raw: i64 = large.into();
+        assert_eq!(raw, i64::MAX);
+
+        let min = FileOffset::new(i64::MIN);
+        let raw_min: i64 = min.into();
+        assert_eq!(raw_min, i64::MIN);
+    }
+}
-- 
2.34.1
