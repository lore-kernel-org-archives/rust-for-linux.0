Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA363B0AFC;
	Mon, 11 May 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486580; cv=none; b=EJN+NGhNQcMj9vOMlKEwJ0Z9RBQPq7dF/frICMBBQdSS44Uis+qiQXvEulVqZuWPpGGt2JZk8+0GfLWJ5lm2ZqFzSJxRQeicT3ogEKRRD5B0XGCEFeau6dZB8UCuua9oXGrVmj4QVHzZSnCmlysdNdDAh8Yjp1gFd+89uUzUhqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486580; c=relaxed/simple;
	bh=It0UcQorJluW7DgSSaBTE6pHf5/fv6AYoJYbP19eZSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ES11+R0Q+mwtcDe9++JNkJDNeb+gnyIEghHEDpn0DU0hC244Dyr1r4V+/SM6t/KcnGKlHZXFF1boGP+pxfl89FHF/V/Jsi7mcQouqUTp4N8QQL/JQjCqrv9twAXdbfFBCmZ6Zl21qvgrozFzP7he6nl5tOCblT+fATo5A+LU7sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFTwsfwx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFTwsfwx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC324C2BCB0;
	Mon, 11 May 2026 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778486578;
	bh=It0UcQorJluW7DgSSaBTE6pHf5/fv6AYoJYbP19eZSU=;
	h=From:Date:Subject:To:Cc:From;
	b=UFTwsfwxKWNEJ+d1+AMbhYXFHXxMt5ffMSx4NhP66BoAaQDtEYyIqBl4dJH0EXlt9
	 UvAnIDj4ndGND5h17/pJ0GJBKHf0AUHJ23Q6WfdQ4yRn8niRRteqcLQAmwrSrLkGxk
	 ExkQPL2b+BpAHjredA6GlYu1xEkPBnhUA57MnIw3Ncr31SICfN0ydIHYPaZX5YbrRQ
	 zHLP4SZD+qWeW2BRlB8vzHDI0p25GTkNak8J/1Sq2Srzsr/hyfZTvuZD8XWTHh5OAj
	 w+cY8S8eUtmPKjLZNDfY+U6UPX/xc24c0WTlJ1Wq5RLBdIbziWoBdTpbDyy3PhId7t
	 Eqek41CKpGEDg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 May 2026 17:02:44 +0900
Subject: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yQ8KPXMW4KFCkGgbTDmhCu
 LsjLL/FexsYq7BBk22gvIrJHBL8JYNupPBglD4ZcpeXrvAeSSekdZYedbGIH4kjvsgoYFVW7lp
 7Huq2gNS/lQf5Hu/b/bQt7ZO7+B/Cvv8Ax+2FVH0AAAA=
X-Change-ID: 20260511-arm-avoid-rust-with-kasan-7670981ef8b5
To: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=nathan@kernel.org;
 h=from:subject:message-id; bh=It0UcQorJluW7DgSSaBTE6pHf5/fv6AYoJYbP19eZSU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmMvfpmFSmmelMTGh4dvJJef0d5W/jHdqFVtd94/ZZdk
 A8uvifYUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbicIGR4euNn/bKHedeTr3y
 9dcLqYN35qvOvuOm4KuzWW6ZDM+ro48YGbq8a+2tSy7F8grtVXi1q/uGpoOz6URWB7bfbxjOn01
 0ZAAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When KASAN is enabled, such as with allmodconfig, the build fails when
building the Rust code with:

  error: kernel-address sanitizer is not supported for this target

  error: aborting due to 1 previous error

  make[4]: *** [rust/Makefile:654: rust/core.o] Error 1

The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
saying Rust is supported when it is enabled.

Cc: stable@vger.kernel.org
Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
Link: https://github.com/Rust-for-Linux/linux/issues/1234
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 71fc5dd4123f..73e6647bea46 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -136,7 +136,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260511-arm-avoid-rust-with-kasan-7670981ef8b5

Best regards,
--  
Cheers,
Nathan

