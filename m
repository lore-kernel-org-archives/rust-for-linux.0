Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E245464D;
	Fri, 26 Dec 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766765322; cv=none; b=mgLY953GhgNp8w3I+FbZTbJZagcUZl4gY6tTQo1Nc9Og//71R0ZNVCvqsi9T+UgwcLi8JyKkWLWylnuOw0N1ABFoeGAOa+fj1wOOXRJUdSpqYaDGRF+e/JIWwScEMjPsIezbYe51UVbRgmjHl3dTl7bQJYZouz3vODHIppgqL1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766765322; c=relaxed/simple;
	bh=QHwNAc3PUucbOb/LgkYM7nPiNCLMEfUCJDtAHHjaewE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=aH+85EcCubeA5SxrEW2uBBupuDVguQoayUBPXQwyOYRVQmjrA8K7GcCw6haUJ9TOIqasijavXYgji1j5h4f5OqsCqL3cX2Ymnnm3dcmdQt4kF3aNzE/WA/F2xq13URNOyCOwNWx/KBB3bsBEJjODo5oaWlfJlnYvCdyIHMqXUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=U3XmnmEO; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="U3XmnmEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766765308; bh=xfMSNe4Z1EXMx77nlzkhuyjepFUFT8NEmRopxZyk16k=;
	h=From:To:Cc:Subject:Date;
	b=U3XmnmEOa/CcF8bLU9sNfTai/AwOVzB1U7RrkcjDkRCvccTjjhiSf2mXp5fnPbk/b
	 8P1nkDg3KKWgctpzOV69MvH3lKVWtd5Sckc4Z2IfG4A8d0FOLzwV0g/bJCzm1VQbnj
	 Lf+JDqKE6ie0GERGU4wKuLslUpHEYuXOlTm83Ynk=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1CF82437; Sat, 27 Dec 2025 00:07:15 +0800
X-QQ-mid: xmsmtpt1766765235tbbiry4zr
Message-ID: <tencent_58EDE157C8C700CFF88DA204B7492A113508@qq.com>
X-QQ-XMAILINFO: OKOirRU4nj6ho2qb9xTZu6kRO6mguaXNJd+REsPr9ded0o3p5Je+JxxW3txjCn
	 rEg+4p7T4nJDGUIqVaQtO1cPBMiPiMBfelMyAMpY3vbUrTXHxFQDQU6pnS/+1En3rV1sJsCe2669
	 FxDK+19f+I1WzUAOsLVrfCOphSk5Jo+Z4GbMP9YK6EF42Z3YnWKpOUAOIQVxJgvlfViGU3n+aOqb
	 GCj0qTAaTx8MUEzx5b91iUH/3V6+teywIUJaGTfJF21iOw2hQC0C83FWF2PqVxjrFazkqoPkcWvM
	 orHqRkZCgjwlROJSWXMq/kec2iRcMFyZbCXz3UoLOx/uSUAe+2Mc1l45vnGI3EzHNUWcq0sfNZFf
	 MhSmjqhZbfU4Vokgg2xN2nRndT11h1TR3zrpJU8fJRacjoUgyKpjQYuejC3jm61DtnmZjbPWFrdF
	 knCi8DeCQ4ABOvJjhl0FAZn9U5G7sMqRGkvN7mu1cBSvMpCrR/i73GeI28YnNiCfNZO/AA+Cs8ai
	 eyryD8vywki9Q+FR8ULulaY2gmngPBh40YzWydKfCe+kQFxt5moGFLnUt0iRT31fol5vfpF04hyl
	 LANBEc5hAB3CimGLENFRS3KjGML0nZeaeMsknFpNLa0UsQ+oNqMibxIHTyr24+k6BXvwA3sFzUkY
	 Z4kjTcJhLCDv5HwQtSV65+tLhaWGn6Sno3GaCcukYkIiSX+I+uCJ+Lf2Qu5MgZWnmq+wqq3iEBqF
	 gO3TqElDe6QxBvHkBn7+ZQkeXpu63KDemXBqU8FQpT7WGYMwgYmM9DeMpYY1ZEh+6Oclu3StSRad
	 GqSaV2069iHrnlp0epQKeKUq82CI3t1wbGsLvmZhTzWD11lO33Rnxz8b5ENg71b2021hjuaW32qb
	 kugOwuFJt0Ax1tXTQzppRJZDfTN/QnewzphrtmQjVe+jQ539wJPerb4t3TGmSy74+g5a7NU0UTEY
	 uIQOQurRR9McqTB8kFI69oYVitfORTdHQ/qFOBmzm7/7sIn/PLalIJW7VvVn2dFHYzkFSiejnHCW
	 FwENzSZMkwmgr0vj3qM4BfY7GaPeypkPGluiYmEUf3IDKoVNIOWdAuEMs/IPI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yilin Chen <1479826151@qq.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: cpumask: rename methods of Cpumask for clarity and consistency
Date: Sat, 27 Dec 2025 00:06:44 +0800
X-OQ-MSGID: <20251226160644.1634545-1-1479826151@qq.com>
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

Signed-off-by: Yilin <1479826151@qq.com>
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

