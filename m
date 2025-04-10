Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222AB284B5F
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286082; cv=none; b=VW/rQ7powyn/8/UNFUP2zF1qIkXYthDfKKay5jKiJZQLo6JQFm/Kp6hRcFL4KC2vpYEHt+kBxn6zvuWh70Qbq+lebfqwcAOTOUmvIVT1fTR4Loz870l3lw7TJELCQ+eme1nqXIWoeT5mhJRBQtFGkmkdIJ8zfNGMUxcsF8/TBlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286082; c=relaxed/simple;
	bh=TFYBx64XSyamvuQktj18G68Lcx2Ey15niLB/ox1YCPo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=B8XiauGvVIJwKWyUqTqRcv0ni3pMBdFZqg7p2/I3lXaa9GS/rKUHAw0mmudn5FGq8jyhWKmTeeRmkyBuRlKd4uu+s2lLEAcsJclF7CBiy9fs7mWqKfBkg+bsjrvD8TOpdyoUqZgXnyV0kcSohI8VfGUioCa36Wvo6xqRSAXw15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvmuJwmj; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvmuJwmj"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3912fe32a30so291815f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744286079; x=1744890879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YB5SBjpT96ncrBxuWBve8p8aanr7Ka+pbjknFnvYN0E=;
        b=uvmuJwmjtjLXgCs2PzuS/FGeF7AcjpZXBvZCRR+dGLthNzXw7YfJx+UTyNBgEhUhqe
         wKVtd8fDTbuZCna2E6YfLo7SmzzRntMnhaMGDGeTYmSNttXp6IGgp8GtVnucZKxsWxzD
         S+KZIVa+joU35+6jzgzxHQC0MYnqvHUfFaNvz7ggg6uk5lnUDKAqjIMXEwaMCcWZlwWC
         mt3O6CNEvmf+C/YmsZnXZLi2xSbHCRPfWx3eU9/rq9estSTW1YRLlFTn8MuhiVa7PHbJ
         6un2Il5EbaqNenF3IX6vT5yXNV3e+Bw9WWjqNL0mBZzd3ayZiwu5E9Jl8inyAWNPdWd+
         Fgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286079; x=1744890879;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB5SBjpT96ncrBxuWBve8p8aanr7Ka+pbjknFnvYN0E=;
        b=ak+CZ4wNyKMF6uvWRYp4r/HXQlHf2TWcc2+y61bi5UN9Dosg7equ+7tkZolc11PF4z
         bepp7WmGK86vHu25se/+HLeVYnH/Y4BNM2m0Bm0Eb1TK5PS5lelDJhw3EhefaIF6E/Or
         +dOJ8Hr6oTyza2/B4MQhEbpA52mrmzvtd82TGLqSqwNW0GhK21JvoDwPom6XGLWA73Tr
         0LA5Hm+DrzfTezT/jwrTgxVJgyfR/0+Aho6Oug5HxFbhwVV2krbD1n/l9CPGXla5wHWu
         FwBEc2glHAeeN7UH6pN/bmKibt/LwTgQaXr5V1otSzJf1hG9+iFXUWTAKDiNbr1uK1h+
         urMA==
X-Forwarded-Encrypted: i=1; AJvYcCUGw74cryC++5DOONAREYj5aqVKA5DqUcU+j1yRt095Igsx5BsKsDqtatqgNWMonHUAMgrl1AI+3BExPAQP8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzibg4aLj7B3I0xzKWcmhpm1RTirVyD+1PdKITLXaUFutgqS5gF
	e9ASSwQtCtQmeUDsoi03DXQC6c0mgfvnM/XIYViZaJBoXY02s9utX+ECXnfTxL2IeZJmpPmvr+g
	aMmmSYSHd9Q==
X-Google-Smtp-Source: AGHT+IFzn3mn0oI9Ck71yb9277+/GcvT1W8LjrbC1butNihUTnplW9tQ6uv6YUMVhQUf1tJTleJ/ca2PeC6biw==
X-Received: from wmco15.prod.google.com ([2002:a05:600c:a30f:b0:43c:ef1f:48d3])
 (user=panikiel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2a8:b0:391:48d4:bcf2 with SMTP id ffacd0b85a97d-39d8f276117mr2011463f8f.12.1744286079487;
 Thu, 10 Apr 2025 04:54:39 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:54:20 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250410115420.366349-1-panikiel@google.com>
Subject: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Calling core::fmt::write() from rust code while FineIBT is enabled
results in a kernel panic:

[ 4614.199779] kernel BUG at arch/x86/kernel/cet.c:132!
[ 4614.205343] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[ 4614.211781] CPU: 2 UID: 0 PID: 6057 Comm: dmabuf_dump Tainted: G     U  =
   O       6.12.17-android16-0-g6ab38c534a43 #1 9da040f27673ec3945e23b998a0=
f8bd64c846599
[ 4614.227832] Tainted: [U]=3DUSER, [O]=3DOOT_MODULE
[ 4614.241247] RIP: 0010:do_kernel_cp_fault+0xea/0xf0
[ 4614.246621] Code: c6 15 8d ad ac 48 0f 44 f1 48 8d 04 80 48 8d 14 45 d0 =
37 42 ac 48 c7 c7 22 99 bb ac e8 9f 7a 05 00 0f 0b eb 9a 67 0f b9 40 12 <0f=
> 0b cc cc cc cc 66 0f 1f 00 41 81 ea 00 00 00 00 74 03 0f 0b 90
[ 4614.267606] RSP: 0018:ffffb95acfa4b978 EFLAGS: 00010097
[ 4614.273464] RAX: 0000000000000057 RBX: ffffb95acfa4b9b8 RCX: 3ff1c813cb5=
76300
[ 4614.281426] RDX: ffff9a50b792b8d0 RSI: ffff9a50b791d548 RDI: ffff9a50b79=
1d548
[ 4614.289408] RBP: ffffb95acfa4b980 R08: 0000000000000d7c R09: ffffffffad4=
5d500
[ 4614.297399] R10: 0000000000002874 R11: 0000000000000004 R12: 00000000000=
00000
[ 4614.305369] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00003
[ 4614.313345] FS:  000076fa106dcfe8(0000) GS:ffff9a50b7900000(0000) knlGS:=
0000000000000000
[ 4614.322386] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4614.328806] CR2: 000076f8fc207bd0 CR3: 0000000227242000 CR4: 0000000000f=
52eb0
[ 4614.336777] PKRU: 55555554
[ 4614.339786] Call Trace:
[ 4614.342524]  <TASK>
[ 4614.344867]  ? __die_body+0x69/0xb0
[ 4614.348786]  ? die+0xa9/0xd0
[ 4614.352000]  ? do_trap+0x89/0x160
[ 4614.355721]  ? do_kernel_cp_fault+0xea/0xf0
[ 4614.360413]  ? handle_invalid_op+0x69/0x90
[ 4614.364985]  ? do_kernel_cp_fault+0xea/0xf0
[ 4614.369654]  ? exc_invalid_op+0x36/0x60
[ 4614.373959]  ? asm_exc_invalid_op+0x1f/0x30
[ 4614.378643]  ? do_kernel_cp_fault+0xea/0xf0
[ 4614.383335]  ? do_kernel_cp_fault+0x31/0xf0
[ 4614.388005]  exc_control_protection+0x49/0x70
[ 4614.392871]  asm_exc_control_protection+0x2b/0x60
[ 4614.398144] RIP: 0010:_RNvXs5_NtNtNtCs3o2tGsuHyou_4core3fmt3num3impyNtB9=
_7Display3fmt+0x0/0x20
[ 4614.407792] Code: 48 f7 df 48 0f 48 f9 48 89 f2 89 c6 5d e9 18 fd ff ff =
0f 1f 84 00 00 00 00 00 f3 0f 1e fa 41 81 ea 14 61 af 2c 74 03 0f 0b 90 <66=
> 0f 1f 00 55 48 89 e5 48 89 f2 48 8b 3f be 01 00 00 00 5d e9 e7
[ 4614.428775] RSP: 0018:ffffb95acfa4ba68 EFLAGS: 00010246
[ 4614.434609] RAX: 0000000000000000 RBX: 0000000000000010 RCX: 00000000000=
00000
[ 4614.442587] RDX: 0000000000000007 RSI: ffffb95acfa4ba70 RDI: ffffb95acfa=
4bc88
[ 4614.450557] RBP: ffffb95acfa4bae0 R08: ffff0a00ffffff05 R09: 00000000000=
00070
[ 4614.458527] R10: 0000000000000000 R11: ffffffffab67eaf0 R12: ffffb95acfa=
4bcc8
[ 4614.466493] R13: ffffffffac5d50f0 R14: 0000000000000000 R15: 00000000000=
00000
[ 4614.474473]  ? __cfi__RNvXs5_NtNtNtCs3o2tGsuHyou_4core3fmt3num3impyNtB9_=
7Display3fmt+0x10/0x10
[ 4614.484118]  ? _RNvNtCs3o2tGsuHyou_4core3fmt5write+0x1d2/0x250

This happens because core::fmt::write() calls
core::fmt::rt::Argument::fmt(), which currently has CFI disabled:

library/core/src/fmt/rt.rs:
171     // FIXME: Transmuting formatter in new and indirectly branching to/=
calling
172     // it here is an explicit CFI violation.
173     #[allow(inline_no_sanitize)]
174     #[no_sanitize(cfi, kcfi)]
175     #[inline]
176     pub(super) unsafe fn fmt(&self, f: &mut Formatter<'_>) -> Result {

This causes a Control Protection exception, because FineIBT has sealed
off the original function's endbr64.

This makes rust currently incompatible with FineIBT. Add a Kconfig
dependency that prevents FineIBT from getting turned on by default
if rust is enabled.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6..b31811a92286 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2367,7 +2367,7 @@ config STRICT_SIGALTSTACK_SIZE
=20
 config CFI_AUTO_DEFAULT
 	bool "Attempt to use FineIBT by default at boot time"
-	depends on FINEIBT
+	depends on FINEIBT && !RUST
 	default y
 	help
 	  Attempt to use FineIBT by default at boot time. If enabled,
--=20
2.49.0.504.g3bcea36a83-goog

