Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F40F493651;
	Mon, 21 Sep 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992117; cv=none; b=De3AnK+W5HaLP4rHr+h2xbGhNgZ4PJx9aJxNUeahhOWQrs6fVtz+pf8pSBy+HOtIqNzCaEtb/LqGG896+1FKgwi1ZCVWadd42rMzebiTAfxjQcLUEr8bNYN2icGoTqz1dfA05Uqbc6RQU723FBv4Rt2Z28vSYNsFaHN738lROe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992117; c=relaxed/simple;
	bh=nFVv1hw2LAlqCZcW9tB0V1fWqL1oB3ynzlA3Aj5IBco=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=oA9BZFUCNHQHS1YdhiVbb0FfaLvxsHkvkC3chLZ2Jot4eaDcVkpfHgWU/31rlM0Vyul32uCG+0rYDMB4zQ+xNL+NmgZymZip/qxrOVYA7x4GwbGw5VzJD1rZge5fJNpYgwKYb5C3ofkma9jhaesKJBnMTKv+JQTgV27OxKuifb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=kD9XGGO8; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="kD9XGGO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789992100; bh=AGcyMt6afjY7JRTjcf606pOI3YtMAQCRo3jjVfdNQzo=;
	h=From:To:Cc:Subject:Date;
	b=kD9XGGO8z6JMxRY25oVzOl6KCaLKwDe4C50lNXZGdlVBySRYjUe+R20Yh8x5EsFnO
	 FrVisr4+qIPr3Tsmbp9SNsuNgqcMRP75srH75TW7h0Hsw0D+N9zt6HiARm7XgrjlF7
	 N8Xx2+fnezWeLDgDGrVxoaD0jCiz2uc5vMGoSyaY=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 652324A; Mon, 21 Sep 2026 20:01:37 +0800
X-QQ-mid: xmsmtpt1789992097tqi643qwv
Message-ID: <tencent_5F3F1A5D096692FC22CADA8FAF888EE39E09@qq.com>
X-QQ-XMAILINFO: M9x8kX0uaJja0dRWvhuk+ZaWxMcu4uBFXETS0F691T+jhbLdXp+K2l5kUpFI4n
	 sdS2/tShuBC4YB7BUfaNrESM7GN340HP0aFahk+rDNKpmrymlgTn9HiYsMeWFzv0DjqL3RDp+CdF
	 3p0e8jEfalKlASYHlbBWyzX7Qen61S3mXN83K5KAZO5FLRWzWhN9wVixO0Os26cy0/vsiowiwJ1h
	 X79ey6jyTaqf8X+97IHoics40zxMyBzpMYU2tmuCs3OWBx1NVwsK6L2w4BrAO46jvZOxQ/wuJiYU
	 zj0Y1i0hqFRMEElCqjhppond1byGr6S4bVQS5mZuzTvy+IxnKrarQ6SaKTIqWuMqfiU9c4vtvvNr
	 YGQ7UF2Y4HWZa7LF+AfT3uwdKuO/AfAwp3BmpPbUGywwflHdTXX8CJGKFAiRKC7WcJDeMi87INQ1
	 Vk7O/Sc8OBZYHfh58gOUNJkP+o25fViqyi1+FIKUDpfgkhWvX/rPEKz1mF+CiO/K0TmO9OjcTH2P
	 Ew/VuVHtesi/L8UKAgzASmDYynBeR3EprqgQtIrOU4B/g8Eb4Em1CpsE+k5fBs2Z63VK1bvFNIAA
	 UWOWu0TQGSe9F1l3zfvHuAdHB2I4fq6Tmu3Mk/tnzGR/t1NtBXwI6os88qQbaNo10zL1djeHWJTM
	 rwOVxcdz7WLhYa+y5qKAwJguGAwuf8MhYwiR+osiR/l4t1hkIFJPCh3N9MdADMt3xlag/N4lMWQe
	 44l8D7eUbLnA28F5Xr3qlmUDT3nO1PNVRn4MZiv9uKNET4s8Rs7Bb3lwpJwSsPIL2TIQrDW8Wt9u
	 5/QR739kf88ZkcL9j3iaDvNIETEcR28p1i7ytvWNMxv3vSSCf8p30Vkudfk8I557e/yAN8c96a+h
	 jZFzFds5M3afp+gNeGRWFwfSB4vpIHRF+femPtDxIGlvkDulKlYbGJ3lviUjvy58U3ax1WQmCgFF
	 JKixqKYfGhQEHv/uTyIH5mDktO/Wu8Z/xM/mlAzIdP8fwvi52Nt+Vfs350Zi5BARfDZ5gjtL0zA0
	 FWlBpGk4bLe5FYnXtWNjGNFV0fEPrCaGmdZvNTSFtpTA8KVT7F55c+KxhdNzA4nfrBWYL93mVrdn
	 EC3kEuHmGAdIHcaLR7SGMj1foAsJcjelXuD0wZ
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yilin Chen <1479826151@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: print: document safety of formatting calls
Date: Mon, 21 Sep 2026 12:01:36 +0000
X-OQ-MSGID: <20260921120136.1406994-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining "// SAFETY: TODO." comments in the Rust printing
implementation with explanations.

The `call_printk` function passes a module name for %s and a pointer to
fmt::Arguments for %pA. Restrict its safety contract to
non-continuation format strings, since the continuation format contains
only %pA and uses a different argument layout.

Assisted-by: Gpt-5.6 Sol
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/print.rs | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 0d62beeedca5..86b4347a7707 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -29,7 +29,8 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-    // SAFETY: TODO.
+    // SAFETY: `%pA` is a Rust-only format specifier. Its callers pass `ptr` as
+    // a valid pointer to a `fmt::Arguments<'_>` value.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
     w.pos().cast()
 }
@@ -96,8 +97,8 @@ pub mod format_strings {
 ///
 /// # Safety
 ///
-/// The format string must be one of the ones in [`format_strings`], and
-/// the module name must be null-terminated.
+/// The format string must be one of the non-continuation strings in
+/// [`format_strings`], and the module name must be null-terminated.
 ///
 /// [`_printk`]: srctree/include/linux/printk.h
 #[doc(hidden)]
@@ -109,7 +110,10 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: `format_string` is one of the non-continuation strings in `format_strings`,
+    // so its `%s` and `%pA` specifiers match `module_name` and `args`, respectively.
+    // `module_name` is NUL-terminated as required by this function's safety
+    // contract.
     unsafe {
         bindings::_printk(
             format_string.as_ptr(),
-- 
2.25.1

