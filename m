Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE333C503;
	Mon, 12 Jan 2026 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204889; cv=none; b=s0MeZMShkX+ON04qhGXzCmtV1T1nEm7dR8/JFfGfMERHmiLunYyzrSRYTEX8VLMre2K6S34auN7ZJEpL8Wn296LS1s028WF3Ga6S/PLQrrFoiJQSYTTN3x084eCJscQBRftXqhmo3wHNd3hbxk8Ah4S4mC/ewbTJLYEHrt16rzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204889; c=relaxed/simple;
	bh=q89ToZ+ldcaIM5RDhT5olib99YIPaQEeEpQB7ymKeN0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=k5crrDqhF/fNsiulw3MloFTAy4k6Pin0Jh9pTwGqmA+OjfspDoR+lB/0A53NqCDjOOaWpC9nYUyNTAlmlc5A0mYd1d4k5j8GmIklTq129K/EMcgMFSv57jgYYqdBywbuvv5bDT0betLPzTyH7EUyrkc4udvuuYwk/WLHUcZBO/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=wk0TRSie; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="wk0TRSie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768204876; bh=T7OUsW6vowP3FKY+kbnsy67vVWLq1UvDnvGCt5xJL6o=;
	h=From:To:Cc:Subject:Date;
	b=wk0TRSieNIXt738Ty00UhMSbCRzm+9PVrR7VlZ7UK/O8kNQU+BpT3ejhmnx2vpZvc
	 mMigK7O7+7rQZuZuat9TjVfmjIe1XpTklj5EWHVsWHqKjTdQm62Lffts7tyiayH603
	 SM8HfvBAtuVUxlFqP8Z56TCjV3Sl4Y9+/oxWiWzM=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 4F1CAB3; Mon, 12 Jan 2026 16:01:15 +0800
X-QQ-mid: xmsmtpt1768204875talmgsr9o
Message-ID: <tencent_38DB4FAEAA8E319F0F1BFF098A922623AA09@qq.com>
X-QQ-XMAILINFO: NhKbcYr69dwuT1alD/XobShkANNtEgaIjxcrGrLdO5cs72ZrErKuHcq8fn2kEl
	 SUSI2AAyNO/veH/dQaxeEFHwwZDnfnQ5z59Fyd5AVaJGCOIcZmdjRdPPb3nC6cYeAVjEfSoQQvQ9
	 y2Nrl8mMQ96+eo8CKtnITxBfg4kLeSw8DmKUOmAxyqSUX1RCleUrlCc8DiDyfbsN76hafGob+gmV
	 bUhsrqdXrOrYi59+l6/KGNWtz/YmA2MDwpqK383kqC2rPKC6CBSHojbZg2IXrvpIzjOWlpiJpTnw
	 uM9SDESaI7Qponqoj5nTdUTxe8SC5GMdJAoFygLx/JZB+TWu87gxEeWsg3bXbsXj0AS4yX0jtXk5
	 /2Gv9Vj3DKbEwi9Qx4FRKKQEKdcYUTQEZ1RoMOwIlt+SDwIHw1e4BNcqCW9MFmbN2wQ66XXa4Ms6
	 zST1yGgAOo5liQjtBo+yMtpWJ0dtfTIPi3soIjUXWkSvhVZhP5TKY7qqT2CjJfEIB9dMgZzuoQNa
	 3OyLgUnQojRcu22JZA8mveg4yaAjHAdMvKgW5/S5sA+5TYAsMG5VzLYDPPMfvLNVvttZ8R976PSd
	 1mQB4gEhKgIKfNqaw6y0hrGzr1zQBhjwvLjaAinPS9Z4y6b2xi3TLFAC379beNsVcg+22HQnvPQj
	 dk4GiDbsjBKBeZgPw4tM+uNRRyrcNeXbtgCabo8CZ6DmwwvccNlwvPxQ+5pT14AI7zIZjZjxM6MY
	 FhSjoY3hwF9FVbxQz/Q50i3aO4S5gUUVnQOTVQ+tQ5H7Mk5PzmLZV0fuQQ1vJMV/ettTJ5+G9/yb
	 9qesnwMxTy0/gs96NWU+5ehKZokWa5e/sAlEIJGw6nX5J3OV03eeeOJ54u+8Ersg2gdW0kviAbH1
	 otUPRXUb6y3n6ELP5S5rqVrBxqertQ4dfTTDz82A5wubfevBuitaJYGJZ3H8m632G00/SER/3Ksy
	 oQZPXg7KfaLcgwItFAXksGIy7EOJwvexYzFZfpBnpkwOnFv+njKRvzY6BXkyhiQwm3xSOgc3gcYl
	 X20S/AS/6L0/9+SYJUifphSH+EI4GWxSPg02LuUR9yVQYsweMek7NPWMzH0LoBtwjXUQBeeA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Yilin Chen <1479826151@qq.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v3 RESEND] rust: cpumask: rename methods of Cpumask for clarity and consistency
Date: Mon, 12 Jan 2026 16:00:47 +0800
X-OQ-MSGID: <20260112080047.1495278-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
align with the established naming convention for constructing types
from raw pointers in the kernel's Rust codebase.

Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v3:
- Use real name in signed-off-by line (Kari Argillander)
- Add links to priveous patches:
- Link to v2: https://lore.kernel.org/rust-for-linux/tencent_58EDE157C8C700CFF88DA204B7492A113508@qq.com/

Changes in v2:
- Use real name in From line (Alice Ryhl)
- Send this patch individually instead of bundling with others
- Link to v1: https://lore.kernel.org/rust-for-linux/aUMUA_JWalyGQdAx@google.com/#t
---
 rust/kernel/cpumask.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index c1d17826ae7b..44bb36636ee3 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -39,7 +39,7 @@
 /// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: CpuId, clear_cpu: CpuId) {
 ///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
 ///     // returned reference.
-///     let mask = unsafe { Cpumask::as_mut_ref(ptr) };
+///     let mask = unsafe { Cpumask::from_raw_mut(ptr) };
 ///
 ///     mask.set(set_cpu);
 ///     mask.clear(clear_cpu);
@@ -49,13 +49,13 @@
 pub struct Cpumask(Opaque<bindings::cpumask>);
 
 impl Cpumask {
-    /// Creates a mutable reference to an existing `struct cpumask` pointer.
+    /// Creates a mutable reference from an existing `struct cpumask` pointer.
     ///
     /// # Safety
     ///
     /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
     /// of the returned reference.
-    pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
+    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
         // SAFETY: Guaranteed by the safety requirements of the function.
         //
         // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
@@ -63,13 +63,13 @@ pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
         unsafe { &mut *ptr.cast() }
     }
 
-    /// Creates a reference to an existing `struct cpumask` pointer.
+    /// Creates a reference from an existing `struct cpumask` pointer.
     ///
     /// # Safety
     ///
     /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
     /// of the returned reference.
-    pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
         // SAFETY: Guaranteed by the safety requirements of the function.
         //
         // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
-- 
2.34.1

