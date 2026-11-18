Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007364;
	b=zHUnzcAaBMIcBV7zcVB719WR1yu+1QLkMRw38VAczhiVyz27tx72VWtJaA4ZiLeCK5tW
	 iLUq0M5xAQ97UUkOhxrLGN+RVsGGKqHNgJWX12XnkO52Tx+cnIfvIcfmb6CCj2ZXysqbw
	 1SkJ+IAvX0oFOfzcMIrEel3wpk+YIN4I3oDpVqboWFW3VH0pMGRNbwjPB0wVYoU5D2eMV
	 BwCO62kGabFUUB7OYOqwT3rEbEN/J5or90ABHFHI4sIWUcXvFfiVWP8pWptJ6ALTTFgDY
	 I/NLtjNBhzJ7qxLood6gmDPkItSlgykQKLWl8vaQQTHBYHdLNnoSsc4gHVJHQ+EHONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8XqsJBCy3LgGuVcdZnn1AgUSdezItKIAUZq3HUhg82k=;
	b=hkcMLcO1uoLpb2ofyyYq79jemmqKtJ8aVEesYN02NSDZDJaekNygKjtqUWDmzHAWy577
	 JdDYVJDNjvuM7k3a45bGaa0zHSyLLwliXayHNTmhcglNQBww5MX+6vRM9RdvA4WgHsEF8
	 dkvRN0ZYYw6WFoVTOdcMW7taVKPw33Bdn8RLkeRaSR5WsLWvEm/F/ZQfJEwRf7h6ewlfO
	 7aVY94ShMYrSeWmdjFytsbJ+nEM4ZO7x0rICaDeX/IVkGgWuUV+NuheyK+IRONqIviS+Q
	 ccfLNoWSK14T0/ui3znhNYve0E81ugxVPz5fjtYRv3an1ur7DPREZmVRerJGSK1Y/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K9knS71g;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8779606A332
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 13:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8779606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K9knS71g
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso444001f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795007362; x=1795612162; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XqsJBCy3LgGuVcdZnn1AgUSdezItKIAUZq3HUhg82k=;
        b=K9knS71gIAMXGfb8HE8EJWYhyVAhycTbcfYajWQwdg6DmdmPgzWVtheCHAnYwEN/fJ
         ZBAmBiiXVUL6tEMefslp99r8WkRBzck0YGDt1A/6QYtubtdvA0D6zmx2emnrJwkePzpO
         phE3mXSa/5CoCTv1fgT2XkwUOPVU7gKnCJXCjejIz71bWAA3TxLdH6TXlfz4GOUz1B7c
         toxcFCGIV+7kGA4QEan0eYLBQmyv7H19CuiEMhjeJ7CWNlXw77DVji0+kP3/e2zKOLQr
         iAJ4RCVJ7vWyGNcDqDBzoHu7OVKRArjieVdBAlRxqGe0ec2wKuA5IeCG+6hSDgs5CX/r
         Y/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007362; x=1795612162;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XqsJBCy3LgGuVcdZnn1AgUSdezItKIAUZq3HUhg82k=;
        b=DQ3cToG/DxRGtzJdtcSyWNOQWS1a4qJP1pEGnvlN54dmQfFO5Ko/0up4lxFSiYs5cq
         qMqqDXO8nzI9qGSpW+XNNkreANxmaShez4kr383SidPKPYKjrdbnQJFZSCT14m+OI4sM
         HQ7ZkRpsrpCUTlnQhLJfgeyrIyRFMHN3ZYb53mnfuxwrQoUVarQ284kZn0EiBEDg3YaR
         J5c0E1aUZHeM43t9H+3V9Go6HvhW0FXJYx1YORYYjsdMszMmvyv1HonE51KlYPEnd6Aj
         VR47MxRw/6ko4RQx+mmizllAw8fVbFfcNRN6HiXVuKcWISluD2AlenEuzn/igc4iLAzk
         C5VA==
X-Forwarded-Encrypted: i=1; AL+hErHHvGti/nZOcGnW1Zv1Ea4ccUBxHN+8Zmy+VeCsewfi5RJWnsTuvCnxZm26DkOeDXBVKqjX38qNW9iX/FwlvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3wrthKPtf/9WhyBSlu0W3ch0VoH9YYH2OJYuMqZmUp3+Ot9l2
	T/hbg2/AlT+F6yrbrDfCbhY3HzB62+3++R3ouzZY477UJ+2S/5zB/RkMFfwfVkrki+xDWfE+CGk
	+fx0ulmAMuhpUHq0+OA==
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a1:b721:2a42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8a:b0:4bb:6687:5394 with SMTP id 5b1f17b1804b1-4bb7da13abemr52303665e9.9.1795007361512;
 Wed, 18 Nov 2026 05:09:21 -0800 (PST)
Date: Wed, 18 Nov 2026 13:09:18 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH2j/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3aLS4hLd3NQioExaaV5yCVB9sa5lcnJSsoGpoVlKmqkSUGtBUWp aZgXY2OjY2loAQj74VGYAAAA=
X-Change-Id: 20261117-rust-merge-functions-9ccbc0516df5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tVfSyhjcztmSSxfmenaNsWCKesbHq9usuWxfMF/g4mA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/aOAN7wTksfRJhYvTT7pqJDf338iJai21scbg
 0vUYym7VCWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav2jgAAKCRAEWL7uWMY5
 RlzaD/91J+a8g8dl/Kov07Q3+d3A1sHPlOTB0kLyl3AX27lULux87Km19pgAMPxxJNKxEQ5J4vv
 XGKJqC+UOAo9dMl2o29NCqagkTejsVLitDYxUL5o7uTvMeqqT+iQlAf9r6Qrdb2Ycw8ElgYkRo2
 T2g8FFeZ/vieOEtEHM83c5P4IIvzZW2zSgGjqo6P8w5az+m5/MKxeQvRFsH+hL1H6CNN2E34agf
 /FyrgFdn02PbRTK0Ec0ZaAD/m5F+zTjKvndBMxK/ghN9ptnt2uT4eeOoLt9aLBSr2q9PKLbWWuZ
 Q4BxuEJUC1rG9FbMHhpbpRyn3NPcpZQMlus5eD8VfyBm5udnLb2y0WqoQfRB6CT15UQGfHjZgt3
 ypLAFsmtpWpKbFE6tE6QGwkNKVr6yYHjPojXZdccwCc7VkcKES5eqHzAdslkXNrphBB2Q8Npiak
 hp5isyKL+UE49dnz9bYz++A2jts662hku2eAcU+IcIQY7KhEHOniA2yfdxmonm+p+U/eDLwuLb0
 OJjm9z1jelpQhg7aAiams/2FLFAM7ani7LFCX9Sb5nMcxxY5VEpktsFcBIF3ja30ZysHON0/OMa
 ZFDLJapU9iirToguu9KJ3eUizTI7W4jB973AsTBKQp2tF6ojmbnnbzfdAD+Y2OAVVZfZXAP+qUO jVVTivH5vuaRU9A==
X-Mailer: b4 0.14.3
Message-ID: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
Subject: [PATCH] kbuild: rust: disable function merging unconditionally
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Function merging causes various different issues:

* For CONFIG_CFI there's an LLVM bug causing functions with different
  CFI hashes to get merged. This can lead to crashes at runtime.
* For gendwarfksyms it causes functions with different CRCs to get
  merged. This leads to broken MODVERSIONS information if the function
  changes in the future so that it can no longer be merged.
* Wrong backtraces when a crash occurs in a merged function.
* Possibly also issues with pahole/BTF as the merged function's debug
  info is lost.

These issues are new to Rust because in clang, function merging is off
by default, so these things have never come up before. Because of this,
turn this option off for all configurations.

Link: https://lore.kernel.org/all/avy_9SPRaPSKD8b4@google.com/
Fixes: ac61506bf2d1 ("rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5aac6f1b011e..17b7ac3afbc4 100644
--- a/Makefile
+++ b/Makefile
@@ -622,6 +622,7 @@ KBUILD_RUSTFLAGS := $(rust_common_flags) \
 		    -Csymbol-mangling-version=v0 \
 		    -Crelocation-model=static \
 		    -Zfunction-sections=n \
+		    -Zmerge-functions=disabled \
 		    -Wclippy::float_arithmetic
 KBUILD_RUSTFLAGS_OPTION_CHKS :=
 
@@ -1136,8 +1137,7 @@ endif
 ifdef CONFIG_RUST
 	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST selects
 	# CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
-	# Disable function merging as LLVM incorrectly merges functions with different KCFI types.
-	RUSTC_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers -Zmerge-functions=disabled
+	RUSTC_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
 	KBUILD_RUSTFLAGS += $(RUSTC_FLAGS_CFI)
 	export RUSTC_FLAGS_CFI
 endif

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261117-rust-merge-functions-9ccbc0516df5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

