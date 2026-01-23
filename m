Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B2E325716
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171030; cv=none; b=Rvr56rAhDcsiRGKCzvfCTbD3HyPZpp6rsMmHEhPN7TMTuCh9FEjDf5Ygec3mFGKoK7agZIaDrhAv/uXPZGztL+2COvSXsPqDAwcPsppwJzRuACyg5FZD7vXXD4tqM85cwfU0oX+ScAYxVF1iguenVFriFs02WFvpYIYxUth2HrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171030; c=relaxed/simple;
	bh=nORhTpsSqGe84i8S4O4Syf7Oa/fZet/1ahZXLyjwbaI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=g4mbz/cUw7lpxfCMmA/jmTfXT8TKqafgg0m20nBLq5WrHQT9ZXfF+sQpZVpbh83F8dJW6zwHLgv7zNdOc/kUedx4PL2GwKRkdd0hVAgzx0KsrZG2zS4Prw+kMKj5HWITgIjpNeesjF1lBIInEj/R2vuq/nIjIBhK4ILFah9kW9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFi3t9W1; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFi3t9W1"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso1253557b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 04:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769171029; x=1769775829; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puoDcbNsoBglApMH5U6xdwiKVX5/fe7/Z4P1s6f20iw=;
        b=FFi3t9W1LbnesQOoSGqayrUeH4H6H19WDiCqxVTEaLwtEDg1mw/FA27Gd5J3Bhmtri
         RgHhkrfh6dFiphbCHTWlRPifEXhm2d4sxBzPUHx02lrIKLzr+6srwldtnv5/eqR92Ziv
         kg4Km6nXK/K5qVpiVSl5bz9xm00zkyKa2BboV5lCwU1qeLfwmPkY9s/JocQLjjYlLTn2
         uKWKrMUIBYkY/DSTy3Skuk0r6DYc4Ml4fXTkNelm7BbvS1KrWa8FpyoeM1weNvDkmFgN
         7FPV2pJ+ZZpDyahShjDQkFOsI73Ou7tdZPUGMiIwdMon5t0fwUR3Tw4eWprCCKnXzdLv
         7oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171029; x=1769775829;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=puoDcbNsoBglApMH5U6xdwiKVX5/fe7/Z4P1s6f20iw=;
        b=nmLhi9ZaNCJCNpJMXNMilKbOtHJT6nF3MedIHCBpKHtvY4DSp/0t6D6qj+YayWcS+o
         u57BB5qZ9g3t7/s2CmhvW9jrPwn0o+SYo77zrrV+7jm6g0Eld4vLpIosi3SmB8UpM30b
         0trRE8FpGsW30o5PMwOi1VGfF1fEE4ndafCSbOTFlyM0HfRWsZ5ZcRs2d4uX7PJ668pQ
         R6izYHYDmjs/LmC6ycQz/VyZhulVndknXdfvjpyMeq2qxaEdNyxwk03BN4b1bnDQZdtE
         D4Km0DOcPAKPtWY/uVd0cR7eJM5/NWGMelGgKNrLH/qtmui70d5CAidgSvBgeN/PZxQS
         EzHw==
X-Gm-Message-State: AOJu0YzO+rVJ7FtXaVoBx9CmpQbeyx/fbv7/uANDoywkh7Nt7DhdyHYQ
	nOWEWFuN8CGsLVKQC0Ke7wY19NILIbBaqg4d4kJ8SW6Id5RPsYDOY9QH
X-Gm-Gg: AZuq6aLRYsND0SxSt4W6XuL3Od3Thv11yAcr4mc6ngW05G8dVUbwvFPi3v4tIsEw+KA
	aQpnqjdEUsKTHVVhb3KeipKFTNX3rNo+JRVNGlwGsTXSpkxGVMOAm2LCa+ldATtY1LpvkvjHuTA
	WNl0sYdO5jf5zCb2WxSiltWAsTGdhgTp9O7x8WNtnCzXxxHbLi1nYrNUjFXmCv1DTeqlLVOVT2M
	Q3jYaZ4bjnks2CPV12vuIOsFaeCh6zgg7xjxSTpRtsNxYm/IIf+CgikvvQ4/c5MHqlVuXq4pgks
	irKrkgnD5mKKE4zpp1WF/tq32NfeqI9l4YZal1GUHOkjd+3t0SoCzStSxtqtfY1TUlyqfeVomAz
	EFxyjyLcukRfFc8q6Yq95ZSnEU6KqJsRjwF4Ga5ltkt36/hln7GbnZpPBj6GAjFPdbWid9qyITZ
	yncyN+sg==
X-Received: by 2002:a05:6a21:6b17:b0:33f:4e3d:afed with SMTP id adf61e73a8af0-38e6f74eb4dmr3319479637.33.1769171028485;
        Fri, 23 Jan 2026 04:23:48 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f1ebesm2081827a12.19.2026.01.23.04.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 04:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 21:23:44 +0900
Message-Id: <DFVYSCDHP5UA.2RX1AU34POA3M@gmail.com>
To: "SeungJong Ha" <engineer.jjhama@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: better pin-init
 macro resolvea
From: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>
In-Reply-To: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>

Hi SeungJong,

I think I could give you some background on where things stand :)

On Fri Jan 23, 2026 at 7:02 PM KST, SeungJong Ha wrote:
[...]
>  scripts/generate_rust_analyzer.py | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc94068..0c6c0444917f 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -123,10 +123,18 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
>      append_crate(
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> -        [],
> +        ["std", "proc_macro"],

As Miguel pointed out, this fix has already landed on the `rust-fixes`
branch as commit "scripts: generate_rust_analyzer: Add pin_init_internal
deps" [1].

>          cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )
> +    # pin_init_internal uses #[path =3D "../../../macros/quote.rs"] to i=
nclude quote.rs
> +    crates[-1]["source"] =3D {
> +        "include_dirs": [
> +            str(srctree / "rust" / "pin-init" / "internal" / "src"),
> +            str(srctree / "rust" / "macros"),
> +        ],
> +        "exclude_dirs": [],
> +    }

AFAIK, the `#[path =3D "../../../macros/quote.rs"]` part was removed
recently by this series [2], which is set to land in this cycle.

So I would recommend checking if the problem is still present even after
rebasing on `rust-fixes` with the new pin-init update applied (or simply
checking the `linux-next` tree as I think it has already picked up the
relevant changes).

Thanks!

[1] https://github.com/Rust-for-Linux/linux/commit/74e15ac34b098934895fd276=
55d098971d2b43d9
[2] https://lore.kernel.org/rust-for-linux/20260116105514.3794384-4-lossin@=
kernel.org/

Best regards,
Jesung
