Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8122237F726
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800214; cv=none; b=a80JOjnLb1WYnKI97/I53b2y5+Fbw0tq5bcg5+0cgLowakLSzpObcTWwP5URpQN5QaTQoRp8zpjDaPVljO/UmIJSsy5uo0+SFNFz7+RYxRjAMe8hMUR9pxXF/q5e8oJNNRG8w6UaLm/J3hqrwSS8RtXzdYJifHpJqkOz/prg0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800214; c=relaxed/simple;
	bh=wioUAD8C+0rgR7Ev3tCEnYXtNcLLMfGd63syxHwVcxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dO6G9PHD9cLR7JapU0oOHWuUH11dsZkBUyC6OViWP7lthONiutHtzETWLsQiEJzvoZU4IfDHsDjl8jXwmYatFlt3zFHfN0Snk5XEYBVhv7i/kwDBJtoWodBztaljsOh+npIsL0tIfHbsgt8M8TFtguAHr1kM7NdiMEVvcYakqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCUj8lno; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCUj8lno"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad9516a653so15845295ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800212; x=1775405012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYhd+KU2GoaXLmfUSCyKUY20rRmYV/7gtISAKLxYEYg=;
        b=JCUj8lnoo5ZDDu2b2FCVb8R3hYqL1vmUoVNF2BdoLN3pd1Wq9LXNgShayLdFOHER0+
         5YteuWk48JOKoVkRdJizaFiQwaGO2B5czagoIuif4juzaeMyFZgucec2Q0d2W6Ty9y5R
         tpq75JtdjmjGszaYXckA0R9gnxetmLdDq1seOVIu5w+M3Zo/JaLCenOWGr215EyRReER
         4ooU55kAqdx5M2po7oOI7UJDhGUZf1pWC4FEHP7UVNvygwShDpByIk4lEOKHBtFW2d88
         3VEFr4w4hljDatl/qMT5XgXa9c6itLinE0lExplMHpFSPp6cEYqHJx3tlmdCvZxNicLl
         +Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800212; x=1775405012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pYhd+KU2GoaXLmfUSCyKUY20rRmYV/7gtISAKLxYEYg=;
        b=dkYKVhTmzN5eK77O/3zg/0o1MOUlfugbz+DvgPRsUQEXJoJR0kboQKRf5HSa9I/oqD
         TRPN46VRe86Fp8yaAAtkQhPIOhxAXgrgpiRdbkXP4q6Tlx4cLZe4RrvzxoU57WINCtaV
         tecMo1QbCH+kIfwii6nOmvPHTs9aJtownNFM556YcaLBLYbRlgSDdV/mffkWW+rAOeVx
         NxTybX0bJZyM/RLTezP8S9F9NPf+16vsjhNb1I+KL6pwz6Y4tAay37Sp9J0qjKHYybw6
         2mPRGHJRCfHpRwjU1kwBQ8gB00e5yAbVtHHvx3uNdnFEhT7ZA+q7kuj8e6ZxWv6+WXa9
         8vlw==
X-Forwarded-Encrypted: i=1; AJvYcCVF5QywNi7P7Wlev0Kpd4kbhmbRS+cGT+ILZHk6+x2UrDXjLeEoHXJrSUq3fbmW6lK3IuTomb8I8YN2Lp5Pfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qdGbO3GFlimxXqUO9gxFZOit8HtRgbIyv0TP4NtfQb07rO4C
	p06ulFZixEOz9QzmtkgmuJjCPBXAW82iNdKoDjII7dWUrQZBuie8hGoZ
X-Gm-Gg: ATEYQzyG8S/BqdzPHnKtrl9o0LzOs5bSNmB2xY1eh3mQRwtCFiET37wbX2uP9MI59Yv
	a+JxFFILy/xxLBgDinypMe8W0dX9BEFxmoXHG8nnDNyU1Wy2ja/3ciVnLTIYNXKAAAQB2fWErO/
	gu9wL5Hd3y/OAWZessulL5wrdhlTcVphygv31OFRUPkkqfKxmswu10QnqyD8CVliA8zpxjUmzFl
	KSyFPblMnSkF2x87dteiQ/n7Se5vD/oelTN6/t+W7wPEvfjek5kCDI6hiEUlL+AvZLqVnYRBzS4
	/TG3JlyxS/jLXO1v/l14u54yZfVfdD0NLauNZq6+Q8wtygzJR57pKpzQkl+vFEPNYRubsGGAwTU
	Yjt3DkDPjb331mVWC8ISLl6VUGJJF66d4Z3F2+HNldKRhjnqjmLCDAUqw4BDSsrLP023tfcxxrz
	SFviv9AtxOJXW/ELNg/YD6nIY9zNGrXxDjEyU4yjox7pPKxOFHjQNSnN8d3kuHqoS0IzJSomB+0
	hGb0EhYaM0JXg==
X-Received: by 2002:a17:903:1c7:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b24b4eeed0mr28485965ad.4.1774800211716;
        Sun, 29 Mar 2026 09:03:31 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c176fsm52521175ad.77.2026.03.29.09.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:31 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V7 3/4] rust: Add PowerPC support
Date: Sun, 29 Mar 2026 21:32:53 +0530
Message-ID: <20260329160254.2592207-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329160254.2592207-1-mkchauras@gmail.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 10240cb80904..1246b3add8ff 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..589613eaa5dc 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 8e62f6fcf94f..7ea7570e3f17 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -402,13 +402,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

