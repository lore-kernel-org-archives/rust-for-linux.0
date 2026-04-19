Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926FD360722
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607579; cv=none; b=qLqkVQetQRt0K2C3VDb4F8paXt5Gv+2WPcCEHoe+6r8tGYRccIbqWeNlEZgpJQ7LCkRHxT/PKb+aLv6MMLE1QthWt/7hs8ugJO9qemxTd7AztzSRiTHPd+HkpqZAISg9JBgZIon5fj8CSl5v9ayzaEXu3+1+k+rNXssJIKTux14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607579; c=relaxed/simple;
	bh=6GSGT8vDPiYQI4YGHLluie648X2Cni+IOPr/N/E3cXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lz59tWegtnMxdE3iA+Axq+XFnjzRJZq8sB+NTHSZZHv3T3p/6ha+d27Lh4Mh8TodVWRjAFyREenaypLqrAQXzOXynX+lwp3al/VnWGTWMfPH9rjHcAKtrTGYJ7vcWJGeyaNJGYKimhu9CHd0i+iZm8DFexh+yK5QpF2lcXZPbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+wifKV2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+wifKV2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3591cc98871so932292a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607578; x=1777212378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=S+wifKV2ocGrbF//7oJUX8XtbvZxx+YH/TjDfTDx3jpnwTHln41BITOaycAUKXCqgJ
         OMwAN1vN34i2CttY5WoWULqeuIQy4A9JtCaK0gFuW/O6awKA9Cghwv9v5DUAPKtpkLll
         VN3RS1B5e11O4T/D+oAxh5oFgETCgd3NKB42+J+1vvcjSWnjeXWtkjHpXkjoEwQztbxn
         blgoVh9296avlWaFst+pCaC/p7wrqT33VETAopPQGWaQO0v0HNsz50y5v+30Y9jXohqg
         iKDbhwHOpYkKODT92Vl6e1kisN1NW7Vt+ZMsDGJDRKcmTc/kSlpVyREVVkYfD2DcFTZs
         kcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607578; x=1777212378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MAzEojvrGMWtL4vp0RLBqclc7WFfe3ybUbm3n1AbJ0=;
        b=UCqcHGcw1dZ0HlzeSkzLP+cg4cqNkpXi5xf9kqetuvTZ1LsCPxS9XLFK+HT/np+Fzk
         I0fAmgxZANCOf/4q7s/nnnTva0SydG1KW7j+lKQK+yaduzqu9hCVh5lMO/TpWY6ms+nx
         sJz1XfwGyFgsta+9qNFCe1y5b6mE1DeaguCHVegQ4n82Q0i9fjM5AqeIn0NuIlkv+MHy
         I7wQ1xozv/oycx6WZGM77OHCy6s5zTfH0zpcQsJ7Xw1nREvX2+qTMeu1sKipPSli/7Li
         IdJWWMc7NHzyHIn9pCG2HIofI3JyBfVjIHWwL2nN9aDO7uEMoHRrnAosXtwhoGZR7Tl8
         L0pw==
X-Forwarded-Encrypted: i=1; AFNElJ9GTnorheWs1RjVS6UjkNi35U2iHgBPPg7M5SG07n9Travuo4ZJzNFWnHmagqw7rQdAnZ9YJogkCcOyo9bIUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVo9s5XWll+ZjQsDxloaF3KwI1t9updW7bTk1LZx6SZ6kw/BS
	DDudy+PPABnk+vbR/RW4LrRrZi0GLJw+tRPWH4kj+8NdVD9Pl58jJE09
X-Gm-Gg: AeBDies201kpWIW22zKeGnIpuRqetrcNNw1cuAiNfNafNgXXnaJOGDSFLbp3BpTRa9+
	g7om8/03LyIaOzu5zy0O1//lYXtG8173bjdoom1dPGZ2/oAbKZxhlJjYmDHyEXw2UQ4MymjFtd+
	8Oent32pI3jOAS0rF7OHkgfb4dInYeLeuluuFP8mfcmrZ4riMaRRUF/bkmvd69ehTyc1yb12qhk
	OdCm9IPzhNmOW4BgiZ4v5uc4HyaZ2euz3dTBSg8Nq0hJzf6rWUzmrcSh6o8atNparerNrvRW2Ji
	Oz/qnXobOm6KWnSkAxaOxJV0krUuSzr9JAUq6TMHo5bSMZmWARU97X31xbrHNO5vwSegU5MqJRc
	XpEb2tFokcOxcMzJCCcKaw/kiVM3ge7n8YbgbBrelaxTgrJHQKh5Y/g64pSBYSY8c5/E3XHm1bC
	SzntLQe7JnX9q46m5RmME3OcpoFUbFxuS5OFBa
X-Received: by 2002:a17:90b:5112:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-361403f4e8cmr9215960a91.9.1776607577877;
        Sun, 19 Apr 2026 07:06:17 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm7718121a91.7.2026.04.19.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:17 -0700 (PDT)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v6 0/2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Sun, 19 Apr 2026 23:06:11 +0900
Message-ID: <cover.1776607331.git.mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
References: <CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20260419140611.MNRDDx-MquqrXOCfyIxnilRgBh_JE8sZaFPvSNqmkLk@z>

This series bounds the `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround
in `rust/Makefile` to the compiler versions that are actually affected by
the rustdoc (#144521, fixed in 1.90.0) and doctests (#146465, fixed in
1.92.0) target-modifier bugs, so that ABI compatibility checks run again
on newer toolchains.

Changes since v5 [1] [2]:
 - Patch 1/2 is v5 1/2 renamed from `rustc-max-version` to
   `rustc-lt-version` per Miguel's plan to rename on apply [3] and to
   avoid the `99` form. Nathan's [4] and Nicolas' [5] Acked-bys from
   v5 1/2 are carried over as Miguel indicated they would be preserved
   through the rename.
 - Patch 2/2 reworks v5 2/2 to fix the doctests case that Miguel
   pointed out [6]: the v5 form reused `$(rustdoc_modifiers_workaround)`
   as a prefix, so on rustc >= 1.91 the doctests variable expanded to
   a stray `,sanitizer`. Use Miguel's suggested explicit
   `ifeq`/`else ifeq` layout with `rustc-min-version` +
   `rustc-lt-version` combined inline, so each affected range is
   visible on its own line.

The `rustc-version-range` macro Miguel mentioned as an "improvement on
top" [3] is intentionally left out of this series; I will send it as a
separate follow-up patch once this lands, as Miguel suggested.

Tested by building `make rustdoc` and `make rusttest` on rustc 1.93.0:
both succeed with the workaround disabled (empty expansion), confirming
the bugs really are fixed in 1.92+ and no regressions are introduced.
Macro expansion was also spot-checked across simulated rustc versions
1.87 through 1.93 to verify each range matches the expected flag value.

[1] https://lore.kernel.org/rust-for-linux/20260205131522.2942928-1-mlksvender@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20260205131815.2943152-2-mlksvender@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com/
[4] https://lore.kernel.org/rust-for-linux/20260203221224.GA2703490@ax162/
[5] https://lore.kernel.org/rust-for-linux/aYS9bRugxr1rUvA3@levanger/
[6] https://lore.kernel.org/rust-for-linux/CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com/

HeeSu Kim (2):
  kbuild: add rustc-lt-version macro
  rust: Makefile: bound rustdoc workaround to affected versions

 rust/Makefile             | 18 ++++++++++++------
 scripts/Makefile.compiler |  4 ++++
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.52.0

