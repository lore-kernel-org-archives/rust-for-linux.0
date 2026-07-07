Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C17431491;
	Tue,  7 Jul 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440254; cv=none; b=bqJkGTRflUHghs2KO90wNPlm3flgkyC1XY2SLTftt+uwP05MPM5CcP4wp6xymGTa51Xqiy810vzFxUkUSGkHV/VwVMh3MGr/RvHX9lDHfgdY/neBh6N09BW0VTQEn6ir/Y8E7ks+4IeXlqK4Zq+bPEbE4+7dr307DIf47E/KbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440254; c=relaxed/simple;
	bh=kq7csEZMCWIR3Nqk9Uyeu35brC01S0h2QDOs1NskOiE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=CixC4H7XBFXHmdzEV2f2BYXL4uuuqb4iETwhnb5Fjr5PhBk3daF4JeN/myrG/N3gQIB2eWyIOLlB4paMYmS4C6Q9KhTvJtvntjJvQYoKSgC98rSP8vTj+CGZhS1HSxL6bPKM0ZbsaJTCAu3XgigZsm4vfjRWoX/1y7seoTQ3VWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Za8JzwSk; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Za8JzwSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783440248; bh=3tfmRPDT+1QOaw5GsDCNz0lG/e5HGkeEEkljqobHYdE=;
	h=From:To:Cc:Subject:Date;
	b=Za8JzwSkhZvvRzHgbZZ67V6tbLtuq4CSh8fqF084PmSqKgUfRMw4IsNmloymYq3Y1
	 0ZZsEPdPADI03LUfeHY1x2mBa1aazJSUZinDdJAuzwcsOt5ArEgSBERom2llRBto5T
	 HSeuvUoFm9ljpGqvKGkXzGW0Iqewv26kAXGifXS0=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id FA02CDA; Wed, 08 Jul 2026 00:03:58 +0800
X-QQ-mid: xmsmtpt1783440238t89snxpp1
Message-ID: <tencent_2E90E794C61B02A9A4BB88BD76B02B976307@qq.com>
X-QQ-XMAILINFO: NMiAo2azIaDA0YKW5VRqne1Ekeprn8Prc1v/R9u/76ie3f5i/YAOXDWXuaHcrr
	 SsN3iiMw/IDHHkgCBSrltFWgxNZXpXtWOK2IfHWtyyj3iptMctb8jjR/KzAURdNiEaoRwyawIwSE
	 mGYp55qWDmqpfuLBogAE94lZOlTYmQX5caEkkVk1SryW873xBnpuIun4zwUvgTpoWL8YoXrkFxxO
	 gMtEx1WSrszoYjwqogjx1rYQHGnafFFhTbn34mjQHJNZaSnoRM56uXfiiowv7BUvB8vtN28Q5j+T
	 Gec/eeaaJutquq60lnvuvOehxl07dZCuapauXIFehDPaG/tEQC0BtvXEjxggFBp+xYseCLFU8OG1
	 bKOtAcoblmkNnioCeBOsIfX0Vq8Ppuczza3LXK6rCzeSjtEnGv58MpsKk4DN6o8nrRTJCAtwRFvE
	 i+TJBBOnQ0Mzn0tGoPS8RdgNYytWcrqzxjhJqKOD0qaTaNz42LAudHEKXAoo41z7ohT8JwN3SoYo
	 OzZCQIdYNcn+K9b32PK8TkH5v7/xye4Nqtj/+MCFQxFcptuetZY12jzyFDj8tl12i0DRXx3xjXtJ
	 kgahuXxc4WTeToseh/80MBs+z+YiczbQ/FWyniWVve5J3uJSm8kR0jAdarnbGFwSLWboAcGR3gxZ
	 yN0UH9pXS/4/HDTxJymHjPPRUVDFp16i13pZCi/sMJAmFQTsN2dH7DUVwVZ4UeJ6N4NkIvujOe3J
	 5ub0MzVvvJZ+KmY8qtRYTNlbCVJALL8tSsvpV50iTWCv/VGtpA4KezVOqdgrd5GVunaHXiXA/Z+X
	 NZYEsVUyMUNdPqh60du5PR0xi+n2+9/4qizlSeECHOkgY4Ae93z9rNuNc6344sf8Js/5qcRoQEMd
	 NiJn4beWtpZQ62lMwSNpX8xqbppLp/tTrhdD5PcQ06k2gJwRWcjme7peYgPUdy0DP3J+kAZf4qFX
	 zDvxYr0xhSsCdQC7NaSU49JSvFqv3c3SNEiBftKYKu1omkTp9+H1XzlYXaiiSljKpmTtdQWE9hRG
	 r1b7aSDkpJHdxZ5pwzkzw/zwz1kX6feNXETxQiY+8v7vfT/CvX/1Fe6JrBsOYLixGnQHMlNtiQgf
	 WPZE20WKhYSnyIiyo=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yilin Chen <1479826151@qq.com>
To: rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH] rust: io: fix Mmio::from_raw safety docs
Date: Tue,  7 Jul 2026 16:03:56 +0000
X-OQ-MSGID: <20260707160356.2799585-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MmioRaw can be constructed safely. It also explicitly does not guarantee
that the represented MMIO range exists or is mapped.

The unsafe precondition for Mmio::from_raw() therefore belongs to the
range described by the MmioRaw argument, not to nonexistent addr and
maxsize parameters. Document that this range must stay valid for the
returned reference.

Assisted-by: Codex:GPT-5
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
 rust/kernel/io.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index fcc7678fd..59b276a04 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -780,8 +780,9 @@ impl<const SIZE: usize> Mmio<SIZE> {
     ///
     /// # Safety
     ///
-    /// Callers must ensure that `addr` is the start of a valid I/O mapped memory region of size
-    /// `maxsize`.
+    /// Callers must ensure that the MMIO range described by `raw.addr()` and
+    /// `raw.maxsize()` is a valid I/O mapped memory region for the entire lifetime
+    /// of the returned reference.
     pub unsafe fn from_raw(raw: &MmioRaw<SIZE>) -> &Self {
         // SAFETY: `Mmio` is a transparent wrapper around `MmioRaw`.
         unsafe { &*core::ptr::from_ref(raw).cast() }
-- 
2.25.1

