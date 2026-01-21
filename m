Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB32ED848
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 01:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958171; cv=none; b=rI0XpJuYxG/gwJmORhymRUcgfVfG6peibdBqkbTWBA/UsOBPbwk4QeliYdYk1dmMSjkWfjBv+rzOMPuyNfFNcSGPpWKKbCiz+3r3Wes6Q76RDnv/1V+KQI8EA8ka8Mt/ZF52X0whhM2r7gX48BTJZZAC0uhWi5z432qiJRZbuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958171; c=relaxed/simple;
	bh=8tK93kNbfRfdSjL6W5C/lx7kmJbOTp0ynbmaT+UmxLU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bqlTtRAjk2vr8SlydC5YLmq4ff7t2HPLlIzadRoRZfT8iKruv2F4meC0Y/bYYbea5rKEBStw8VHZAdMP+6YNPC/DI1aopycXhQm5S0J/YjrB5rn5o4YS71mLuZ3+OuaSCTVRlF5CiUPl9MM7KLDn6bC2Dd8w96yh5KEnf8E/KME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbL/rA7v; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbL/rA7v"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2901818b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 17:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768958169; x=1769562969; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuJvjah/Tw/b3alV1e6g6NeIK8xwKHZbZfdxMeTcSjs=;
        b=bbL/rA7vKnUK60t458F+k9TNmrrwQRp8FNJf1paJmgyO7pQcG9Tf2qL0FwNlIhhj/M
         wmtYltkWPyFHUdsyCKbqd5h08PvbVZgVW6ePP6x4NVHWViPuxHkqzTm0gxh8OfPs6vQJ
         CoiqOT7sQXm04poUyru2FrS/ScaUYPl+3wTfGnhHIBqQFxlhYv9aatxwTWh67PAtLBHJ
         Y9PzxZWzEPOv5SuVLi91d7OvHTAc4sWuYMTDIvQDFiArd1iN344BmRJ13zI5QeVzP2Ye
         O/cu6PKyRykf8hSOPQiv/f+f6ecEViOeILdgFEa3vHKTQteqaqUX5o8vxRrXy0Fzf9bH
         RLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958169; x=1769562969;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuJvjah/Tw/b3alV1e6g6NeIK8xwKHZbZfdxMeTcSjs=;
        b=sZl7rytkWPUFuC+owFkfpD0kWweSo3z0B2i0vCB0fURKGK5tdhdG2KYkcGHEnAvSxp
         x3A23yq8uWMcvnw2v2Y8U2sie0NAvR+zthtkuLjxR5YxBBPOYKTG1JWIOM+iLPwwHWBR
         9HRSSsUZRRf8yTsPI8n8yp7nccP9YftbG5w5BdMX16C35WHFC8bZEwGcvZ3I/pfUOLYa
         hsDN/2fp+d4X51QXB3rAU7GRJTGl/ZTH9Y4s6GqwbUlJeZz9MDLctlPMtLPVzUvnGxW1
         9BwE2ge5GGguwTU2IdqPQ9w1ojeeY65guit9mqzC0Yc7p0ll57WoCC1SjzSRQlG4BdB8
         uJyg==
X-Gm-Message-State: AOJu0YydhPqFKyLoV8AY66E21/F8M91Ov85b/g22hcb8U4qQmC4KTBc0
	AY4i0ArLiZtzup2F1FWkIB1zvl0oVfEIctsTVLsqOLZbJTTnPZ0NIQH1
X-Gm-Gg: AZuq6aLNUalv2E4tX3FWML9EM11+3guC95hzo2Jr3WlxUWDhtHzB7X3wi+1DmfJmCd+
	MnPyHoISC4sPFpoRmKw6s0aPYIn1pV2R93Y4UbcZpTas6qtpz6SwTCHBZYz5jMFf1jDaAiuoXOF
	9NWIwPOVBCltvrb/SNp1mItcZbTATIMsRj9hCPe7e1rml0mxEZbopE60aGlA4T304q30pzAP/RW
	lQoMvw1yxCnmzisHbKxgKJhIu/ZB21kB1FHDsdzyUB90ZvXnsHBRDGZtVkfd6F8x1z38pqLt0+l
	1QEVLkUrVLM/ANAPPBQM8yHqu5gLxn4UOnny16v2Tc4DcMNB0ww2+r+wJ+jYACXJEugTLixuLHg
	lV6MmAGJJSXPX1u3cACA5d0gnwfyIYFyRmOZrk7NaugoVZK3etNgIglIfiX+QzpoN0I5XdE//Ss
	TcAD6UhV6tCezM7zQE
X-Received: by 2002:a05:6a00:1413:b0:81d:8d00:76d2 with SMTP id d2e1a72fcca58-81fa18204a0mr12463838b3a.40.1768958168312;
        Tue, 20 Jan 2026 17:16:08 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c4dbsm13363443b3a.5.2026.01.20.17.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 17:16:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 10:16:03 +0900
Message-Id: <DFTVC1IH8KM0.VR14LX627BWD@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: reduce cfg
 plumbing
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org> <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org>

On Wed Jan 21, 2026 at 1:10 AM KST, Tamir Duberstein wrote:
> Centralize `cfg` lookup in `append_crate` to avoid having to do so for
> each crate. Remove hardcoded `cfg`s for `pin-init{,-internal}` now that
> these are passed from `rust/Makefile`.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 147d0cc94068..b96d3cbe3df1 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      crates_indexes =3D {}
>      crates_cfgs =3D args_crates_cfgs(cfgs)
> =20
> -    def append_crate(display_name, root_module, deps, cfg=3D[], is_works=
pace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> +    def append_crate(display_name, root_module, deps, cfg=3DNone, is_wor=
kspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> +        if cfg is None:
> +            cfg =3D crates_cfgs.get(display_name, [])

Could we add a brief comment explaining how the behavior of
`append_crate` changes according to the `cfg` parameter? Since `None`
and an empty list have different effects, documenting that distinction
would make the intended behavior clearer.

This would also help later when we add proper Python docstrings.

Thanks!

Best regards,
Jesung

>          crate =3D {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -60,7 +62,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      def append_sysroot_crate(
>          display_name,
>          deps,
> -        cfg=3D[],
> +        cfg=3DNone,
>          edition=3D"2021",
>      ):
>          append_crate(
> @@ -75,7 +77,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      # NB: sysroot crates reexport items from one another so setting up o=
ur transitive dependencies
>      # here is important for ensuring that rust-analyzer can resolve symb=
ols. The sources of truth
>      # for this dependency graph are `(sysroot_src / crate / "Cargo.toml"=
 for crate in crates)`.
> -    append_sysroot_crate("core", [], cfg=3Dcrates_cfgs.get("core", []), =
edition=3Dcore_edition)
> +    append_sysroot_crate("core", [], edition=3Dcore_edition)
>      append_sysroot_crate("alloc", ["core"])
>      append_sysroot_crate("std", ["alloc", "core"])
>      append_sysroot_crate("proc_macro", ["core", "std"])
> @@ -90,21 +92,18 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "proc_macro2",
>          srctree / "rust" / "proc-macro2" / "lib.rs",
>          ["core", "alloc", "std", "proc_macro"],
> -        cfg=3Dcrates_cfgs["proc_macro2"],
>      )
> =20
>      append_crate(
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
>          ["alloc", "proc_macro", "proc_macro2"],
> -        cfg=3Dcrates_cfgs["quote"],
>      )
> =20
>      append_crate(
>          "syn",
>          srctree / "rust" / "syn" / "lib.rs",
>          ["proc_macro", "proc_macro2", "quote"],
> -        cfg=3Dcrates_cfgs["syn"],
>      )
> =20
>      append_crate(
> @@ -124,7 +123,6 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
>          [],
> -        cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )
> =20
> @@ -132,7 +130,6 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>          "pin_init",
>          srctree / "rust" / "pin-init" / "src" / "lib.rs",
>          ["core", "pin_init_internal", "macros"],
> -        cfg=3D["kernel"],
>      )
> =20
>      append_crate(

