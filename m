Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587384;
	b=394LLMeo+crVH0cm0cJ8W0goNYcLI6jDK7+5Vki1cOrwwvscSCKE3i34P3IaZXke8m32
	 yeSePy//a+XuYxnBd6dzE0k2t7YFsofGz0hQpC+Ey10Qu62wfA98LKG2dtNOytj2tNfBA
	 Bma3OmbMTmZCm5H3fUAwToSriLYFW7EEJPCYTQpiZF0evlv+OrpaIRZ13n5cLskbqsVjM
	 DzBR26ov+QzfIP8DDNWbMQiN3RpYrGAinQ3F41ZYKUnwh5ajwX8wi0zou3NEnMFEEyc3A
	 0FUU9LoDGQXXSZrTt87AGITAgcXNkQpvCcDeuKjQWda+P1NwGSPifncYi2kM2SzGInw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8IYxPCQoD7cmdiQr4ia+kH+yRcXKtjpnJvYpxZTFR9g=;
	b=cMjjNmNsNubuIyHQQD+swF1y9nk2zVSYnXeFNygGHDVWy/kPI0r5qj3W+McKU0WImNuJ
	 w+qJvLGa3kvIEhoMX/C1pJ91BggBz78DWtvN1MWPRHJJF1NlWI4dg0He4VYe/bDXdt3Lw
	 IRs4IC8+JPT8gzfvUfseR4gJlafxg+7qwnfYdiVV4FzdNePphsaT31a1OeIcKzzbMHOCN
	 pHsEorUvuYypc+NOWD9hfrL4/iFYqqWk7PNy13flwGUwuBm8h5PP+H8+LxD0TL+pL7eg7
	 /SkYi2g3hi1w5cZs1y1vTpqdTA6VVxoxI4E6vjc0aK8sDdRGeuW9beYQTgVZMJNCh8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y2V8nA2f;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305CF60A6F70
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 06:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305CF60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y2V8nA2f
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so5633724eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 22:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587383; x=1796192183; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IYxPCQoD7cmdiQr4ia+kH+yRcXKtjpnJvYpxZTFR9g=;
        b=Y2V8nA2ffutoi+r2jF8rX+fCyb/bIC2jJEz/osEvIZf7kV69rVMgrWq4qHlDTUTh96
         UxGNQqHnfG7PJMTr1DZqUUFvAGuVce0+GfD6J/0oq/XSeiJ2ZLfNx7KWsCFuO8pZOiZu
         dJDOfIoXt6snvKHnUqAwblWEZndvROGPo5Gz7B0KmjCGKFHXb1/tuZEcfojG9g4mHpMo
         DJnJtsJPBA8kfPrxpf7YEL7y55ge6yKjYSy5ikAS22rIIz+FEJVNz7c+W9+n9p0GUMTU
         2FEL6+kEqplNwPAgXRgfW/WTHL7VXZ4qoo+KmIgaA7vfOLbQBaCbf0bAwxVlOr4nsgRL
         5lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587383; x=1796192183;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IYxPCQoD7cmdiQr4ia+kH+yRcXKtjpnJvYpxZTFR9g=;
        b=DltCYjGxQ/wUHl/GnZYFY7hpSspAYEqo9yIsPO8gjnsoEkSn/6CIF/F3k8iLLfRWFJ
         7F78nbR058NcRe5L/qQvyLIIUvcnHCWdOs4UCtDENbZce2bq3xdENy7hT4TLRsVnLHV9
         CnqTNG3XLvEjVS2fNruS1XEWP3/OZTt2S2Y2GgHYo+AGoWsHsd01NGzRTeMA707epjZV
         7O/hWRU30EjdoWmAesa/RjkYdPwkm0truASbolMjMwLUP9gwnRq8itFrd0oDL05UUb20
         zxtDHaNAeAdl2jOYqTJn+9W6v82cgrDNQDBmo6lsKbfkJy73VRgbwMgRwnm6rhr1j2Vb
         D5MA==
X-Forwarded-Encrypted: i=1; AL+hErGutf4Oa/6S2C68Ivktix+zmH3+vOwbLqxL+GDXz3lCBNxhRCMt4QvJi/8OyAqJH0Th7Gihx725YPuTbYl+DQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V3m4EE1V3OE2HjgEmO+mms7SnbMuSY1YGPkgNMCkjyBrTFSI0
	gh0flVVANknqXTFTcQ0p9Smsz92AQw4lo5lPvvVapFI1+Xbaggfs5wLQ5HvVOkVvyUqxzaP2HTA
	+fIvrRClgfg==
X-Received: from dycmb10-n1.prod.google.com ([2002:a05:693c:20ca:10b0:386:c377:5335])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e91e:b0:384:2780:8757
 with SMTP id 5a478bee46e88-38570a3e793mr19421900eec.22.1795587382798; Tue, 24
 Nov 2026 22:16:22 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:06 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-14-irogers@google.com>
Subject: [RFC PATCH v2 13/30] lib/Kconfig.debug: Allow LATENCYTOP and
 fault-injection filter with DWARF CFI
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow CONFIG_LATENCYTOP and CONFIG_FAULT_INJECTION_STACKTRACE_FILTER to
be enabled on architectures using CONFIG_UNWINDER_DWARF_CFI with
-fomit-frame-pointer (such as arm64 and riscv).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 lib/Kconfig.debug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..650ed105860d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1893,7 +1893,7 @@ config LATENCYTOP
 	depends on DEBUG_KERNEL
 	depends on STACKTRACE_SUPPORT
 	depends on PROC_FS
-	depends on FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86
+	depends on FRAME_POINTER || UNWINDER_DWARF_CFI || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86
 	select KALLSYMS
 	select KALLSYMS_ALL
 	select STACKTRACE
@@ -2188,7 +2188,7 @@ config FAULT_INJECTION_STACKTRACE_FILTER
 	depends on FAULT_INJECTION
 	depends on (FAULT_INJECTION_DEBUG_FS || FAULT_INJECTION_CONFIGFS) && STACKTRACE_SUPPORT
 	select STACKTRACE
-	depends on FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86
+	depends on FRAME_POINTER || UNWINDER_DWARF_CFI || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86
 	help
 	  Provide stacktrace filter for fault-injection capabilities
 
-- 
2.56.1.831.g720f3f5937-goog

