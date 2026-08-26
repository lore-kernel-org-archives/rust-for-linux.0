Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69F44470C
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756332; cv=none; b=aN5PKhnMqNxlzPLGZz62Opr8RRUcIzNANgL9dQ9zdrQuro+D5ds+CtAj4lZtARh3JFfMKI6nQUAasPOtiEBnCTz5AoEf4aNq6zHh6aOiR8rUfXduUA+nbchOgUOHr6T8Xkj7wLS3EE7U+ALZHvNSS2c1H5olMm8+hwi3WRw6kIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756332; c=relaxed/simple;
	bh=qBLB1wTJZ/6KP7t9g/JMwKsYPovFh4gKeKF9tIbo6iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjP8LjkA0jta5v3Nxuy+RHjQYA2gcCy+j/bfnZruZ5OL3+/YDhPI3DG7uRz79MlkBXOAS+B+5reYmg5yAmMfJx0wG1TJyEZtxErAHbjeY1gsu74Vjs8Qf1zStGdtTT0P1JbdC8YKlorrDA4yLmifpL11Hg4HCTILH1ZY42hIQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTaWbPjA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTaWbPjA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so814108f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 07:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787756327; x=1788361127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ESgYh6ZftCel+XEMzHlNChNKC5IMTGij4jJbzjOOzk=;
        b=FTaWbPjAlKVdDsN2NIQrtxH6soT2/qusQpYDo+xF9gH9UweyNmOweu1SZFn1v/iUmx
         WrmwRWuhjzhg+xYWuT0CPaNZiGV91m1VnNPm5IDTpLGyOsYNysx6ShsejO+7lyW6wiBn
         T6TnKJsY1F98jtJMk5xmiGSFNvLBu0bF0s58da9mGdDmleMBPj9XshVjpcf3m7cSNJVi
         xO2xD+Ngnc45It0neZr0vZ9JuPlEf+dFe5kvFe+GcTpY3jAPFO+FgmI7i3vebrszhl41
         ij84j0DTTDNMHjYhqsptvQ+TPN1QFiw+B90ZaSOp2bojg6bx2WY8DLv7gb/Pazb/KxLc
         u90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756327; x=1788361127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ESgYh6ZftCel+XEMzHlNChNKC5IMTGij4jJbzjOOzk=;
        b=QhnWr108CwyPRhGGVMqBWP15ANrw70eD5MKK5YvmFab+EyNV6/W3IrDUHT41RnMmXo
         MnflDLR5ZVcgzodWFmyJdRfsl1mcn83/ISkNe8gJ+sSqjpx5nIRoLIq9Z0MwA+yriwKl
         hvtPR3IVrFoMpSE9i8Q+h5T3CGq+Gfr7RQDEsGGsIYupyC+V5JohnzYrlKlMwyAs/Ajh
         I0DnvTfdRV4oM+zOjr4Ul56dpkU6sTR4e2iJGNIGzulutZ79U55xJdp55kRBVeo/5lKR
         lP9nZC0v/lK1Q1XDtHIPSU+rkhJkQDPtrpZbmeNOesWdM3+IWYGLinIXvpZEXB8td8NW
         7OQQ==
X-Gm-Message-State: AFuF++k3ixtHS6pfe5jshVgOCpJ8yXoc7agUfkRDha0NNMhiTvaZP1GT
	qM+j2S+rod6NRzorb3Sxnt5X+6VQ/kaBF/MR432f44ftLVpSrGYxo0ri
X-Gm-Gg: AR+sD10VbziVVG498vc6ejbc74/nJkfwMNqDFpMmO7awGCrb4Qoc9FLnQpu2TJ8FvId
	I+8lfm61BTQzlQbHLeNzKP/eAV8jB3rszwizL11afxIRVlCtGdTf7BVnCWOJIYqn1ToVS4oyvCA
	eokAwAIyuR7oRbPOoUW/SgstKlIvDL1zTHkt3QlQ2gp7NItMpCdRtv7EAxnjirYGoYza9uFqUj2
	0szcLt7HbeWvn0bAi1QM5SmdfalL3IL3paqq3/4H3ntlvoEV3mb2vmXJ2OQMRg5VTPHhg65hfdy
	vr61e3taCygZ3HNWVkn73xPOGRPnv0gWHSw+hk8Ek51sCP1S1bI0Yyp0QD5Khju9wxuSWFbOmNH
	W70NR5+corOuJdjW6w8EFhlcRZ2ZPagATeGDGEdPX1X3ENMy54bfLnApX/QKIMhlB83nau+OYE3
	fgKSpKZqesIBU9ClGa0YKI7fJ86h7Wr2lWXoUNUIwjB24i5W+lgChj8vu+pECC8GkrreOgNdfB2
	gM7ilzo6z2lAEYWabFkkM/KS51/s9S5c/7tdKyp0g==
X-Received: by 2002:a05:6000:22c2:b0:482:e658:bb7f with SMTP id ffacd0b85a97d-482e658bdafmr3594386f8f.15.1787756326828;
        Wed, 26 Aug 2026 07:58:46 -0700 (PDT)
Received: from MacBookPro.lan ([2001:861:3dd1:ccb0:7ca4:98b:a443:98d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm2935144f8f.35.2026.08.26.07.58.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 07:58:46 -0700 (PDT)
From: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Subject: [PATCH] rust: zerocopy-derive: Remove the BoolExt trait
Date: Wed, 26 Aug 2026 16:58:32 +0200
Message-ID: <20260826145832.42387-1-elouandacostapeixoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIXME comment was saying that this needed to
be removed once the MSRV >= 1.62.
The current MSRV is 1.85.0 obtained by using:
`scripts/min-tool-version.sh rustc` command.

Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
---
 rust/zerocopy-derive/util.rs | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
index 5c5e9d3bdcb8..47aa9f78bd4a 100644
--- a/rust/zerocopy-derive/util.rs
+++ b/rust/zerocopy-derive/util.rs
@@ -713,22 +713,6 @@ fn only_derive_is_allowed_to_implement_this_trait() {}
 // The `#[allow(unused)]` is necessary because, on sufficiently recent toolchain
 // versions, `b.then_some(...)` resolves to the inherent method rather than to
 // this trait, and so this trait is considered unused.
-//
-// FIXME(#67): Remove this once our MSRV is >= 1.62.
-#[allow(unused)]
-trait BoolExt {
-    fn then_some<T>(self, t: T) -> Option<T>;
-}
-
-impl BoolExt for bool {
-    fn then_some<T>(self, t: T) -> Option<T> {
-        if self {
-            Some(t)
-        } else {
-            None
-        }
-    }
-}
 
 pub(crate) fn const_block(items: impl IntoIterator<Item = Option<TokenStream>>) -> TokenStream {
     let items = items.into_iter().flatten();
-- 
2.55.0

