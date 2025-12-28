Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BE1E834E;
	Sun, 28 Dec 2025 16:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766940901; cv=none; b=rdMc07Fp/KNaZzMpq0+W7eM1dVdvLt3SjhZJF07IWCvgFlOcESvTJebAuckHIDjs9uVvxdO/d8La6xgKMN5PBDO4f4pHWu1ea+2ET+D302izCaJ7RtAigXl7uzAaFJcYS0WzMVV4HOC74rr+R0a+eCjYAn4OLRlrV9aBEOw6vtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766940901; c=relaxed/simple;
	bh=N84e0bIrZTbhRqwbCNcLgS0vULctNkvDlw4oOjCD/eA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=sVPkLoS7RURybPe29fAvDzC48n1ViGvJJ4DEO3Y3LWw784zvOr/aAuVNGgI2htXnvxdhKFmENiG6+HD8NmUjeHLHXDP/EZJC5+EBZkx/2/+lys93pAfUTStAM1MgOk+EMaGURTkJIuG28kMqiCxMYEFop6Gfrll5Jl/CCc/0mS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=TQnl3hNH; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="TQnl3hNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1766940894; bh=vCjNCmisSg5ou9i6b9QmV+EHLJnsWV52XYCBvSS0gPc=;
	h=From:To:Cc:Subject:Date;
	b=TQnl3hNH7gFFOmzBnkW9LvecEbnPbJBrcnBjmxwqcCUwqSWHu45catZFZFOeRdWcH
	 bzp/jcBHVmo9pih7huOexqNiHmoNLjc+Q5hH4JN/gKods3ZBOSLLP9hcU6xK97W+Ix
	 /Y3POEhOWDt6+JFhDdqhFbw296b/4E1Dt92XGBSc=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id DB4364F1; Mon, 29 Dec 2025 00:54:52 +0800
X-QQ-mid: xmsmtpt1766940892t0ybw5jk1
Message-ID: <tencent_8FF346E3130160525D84423BE655DBF1F306@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNzn3XneHcoH9Kb0X2wnpf6JtJCSJISbbc4y8n/erDK+1Y3Dc1qdYF
	 21nbb0aShT4PGkvA5PaRea+Y2Nu8h6rer90q7vyP3p8bUhi23mGwAyXg/3EkoHgJsm+JSqz56+Pn
	 GEFKHFugZSJQZDTgnHg8CdzSp+ULgZXyEVybe48nN7j6Lm1JkTpIF73RsCJWBbFU7mk/2LrmGgTa
	 TDbBTEMDLMiO2/+deWMlijoYo9jTMlBvMw1thMU6mn89nuP8JbxLZIxngZA4nLglmK5/zhXAONjo
	 2wjxj3JwNMMs16X8v+eMt9ly42So+8+TRudNrkpa8mB7b/3ep8Nhrqw/1i7Z9Zg42W1t+/sCrAk/
	 NdCa1lix+2vyZT0wsG72Z02bqaa0wYZLffAjOz4mXsgcp/4Cbb/OMnMNNeqz3HbwQ0znkX4FuTnx
	 pSgFJV5xFd/xpRuDKZeftLQDj9iYhNc41GgB/ceS6lSTP0yV+adjIYFhsHhwLptHswDDlPCfLvzM
	 nepl9PEqcW5HTeKP5iGpUrHOOeVIM+w2Cz99x+6K/uJZ5HYWFrFzgUKkxnU/3AQMfizSVfzB6dbB
	 k3XPMCdTevy8+FTJEwHsZKkmEwXMiaOIHQn0p58fdBNm29baFVnnM4RmhkMvZoF57+5JReNrwTc2
	 Qze4zdxV2lEvbUC4aUbxvq/W+cbOwuPYBR3cBG96fbF9Rx7s/cukQq5+TqMu6b6MjpuQW7pXFBnJ
	 oPVmVNyQWM9ZZhUzMejCOm8unxOLfRWWNg8IrpGpnCZhUldWtpEUyTrwj5cjGm+c2BBZTqlLnxGI
	 Ct8etg70YwNcrmN1MF44M8ChyykPRjMZvtKH5p8JbWp7pQki7W0dIR+fC6nslTKFGeYS4Q2g/MRL
	 xN3rQF+jNxydXhTPzxmWrIMttIuY37zVwOVERa6ZGnPTWQEQBkm8ZGwHHiN04BRqB0ZY/jiteEff
	 fm9gV6A3f0X+4tCmXoSZAQSuLnUfbzcXXcv1/ha9ntRd2Yel5YOOkD3na9c9t7lgXjgFk8oC5+oA
	 I+9f1EXKfoufFiudpVZ4Q3IdoMBZlZlFpBQ2wXxMMlkM7OL7+jjkxNbVz1wsTvIqpZCt8FoaljET
	 A+WRTxCYoA0AFgROjzDTiQOTRK5fZ+pepQVvhc
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yilin Chen <1479826151@qq.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v3] rust: cpumask: rename methods of Cpumask for clarity and consistency
Date: Mon, 29 Dec 2025 00:54:50 +0800
X-OQ-MSGID: <20251228165450.1975484-1-1479826151@qq.com>
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
- Use real name in From line (Kari Argillander)
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

