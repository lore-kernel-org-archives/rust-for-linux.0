Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7109237E31A
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382729; cv=none; b=YQCXyWqwREgWDG051cUWcoR1j0JeqVqvijpkr4t4Ud2Xs6IrVYaghgNmRpAmJVRRQAVTZvxTToUAlCGyWeDVltSaVpnk9Ks7WOBF+DzTplPyzMKa15B/5HPFd9H+BPWDLFhYdzgCVq0mpPIl5clM/N+3gP46sQl1h5CIuYvgLBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382729; c=relaxed/simple;
	bh=OwK90LNEDputgshxTseCrKQEGKEwAtfdrp9uZ3LTo4k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XCRLf5l2Y2nybmlXIIe5zi1S6iFunukVAGzn7+3dEKOCixEztyVYHV1w/kWOvxYrWWmBoWuAau03xH0IUjjJb9YvZXIi2pgpsqAYwee34QCoBF2PJCKmWxEwtQEek8jX8a2rxfEothdxIlWSSwxQStB+/34yOZYQ+t91Wcotpsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnMlOkkW; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnMlOkkW"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34c718c5481so4608814a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 01:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768382728; x=1768987528; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NcbSCQL/mgy04WzufGUKY+SAH0duo4TiK2GYCxCRvE=;
        b=YnMlOkkW4bsZi41lFtTdwt+4kLL9X2oO7khaWRmGNpN2tLXbnGcCYS+3vK2hvWrWrA
         ostyTSCTe79zAHSZLXg5VkZwC1yTwYhRlU7Y26o095giJdFFm/ZEz3hIH2+9ze/FDA82
         WO7GqbyjIyCssRrCzo/5rpWjk+3ZyPzedG1SxI6jvpAILImQKJiCdvomGR4RrbuJV5bj
         buaYQWm4rhfOlaZCuzjQhiS8inghov5dnL9RjKm9w3AxunihYPcQh7NhtWYYY9Xq2Z1G
         f8gLnvF9O/TQtFBE0bg3UP7W4WC7lX6SwB5F+7PHCGE/+O8MhvbcMd+hXocCNMvu2ptn
         JABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382728; x=1768987528;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NcbSCQL/mgy04WzufGUKY+SAH0duo4TiK2GYCxCRvE=;
        b=VIW93jjx1z8KA9wmA3sI0mUYP4hGbuECvZlH0STk10WD32k3PX0seGDZHa7vLfUrLb
         sZ7SEombI3ISPl4UnC7h/gfypyatKnQd7GIYKh12+5U70t6kxqedS0adCffpUkjC1MEi
         QZUJVpZItU7+1lyLeG6WrkRdDBi68CpSpHQiYGFE/zP3amHZa8Y59H60nBbURBp1Y9Ju
         nnu3uluxcAuDn6ixaYOuJWjhw/zI+gdo3Qy/7YyS0L0Awstz8rQMytifzO+DyoehbtxV
         4RKjYt72SIbqD1QCdlbnJjAGjooGbfy7sR8u0pgsxhjvuJQT++LH2AorQaLNUqjgJhwf
         CcVg==
X-Gm-Message-State: AOJu0Ywg/xAO/grGAtPx/7xnkwaXQrx7DoIhXw2GUgFgvZQmLa5YQ42c
	nDJv1dKg/Pw+ulA6M+fkKkayY7EfQ+daYEfIal/361JqqQOWuNho5CJzjSUZQVHt
X-Gm-Gg: AY/fxX4XqIJK6a95kfLc1h//spJE7dhQvEdo7EXuq72Kj5MDOr7uxzO41bp+SahsLic
	2gbADfHxuUyCoIwxE1fDhHhziNVWdqvAfPbD+kJvCmulUQzq+IZYJ3HRQWejLQT9f/I/EB8xcod
	pYW3RWB/edJVlDBJCgfkwbMqaZLcf9fREdBYQLwHm2x5Zgl1/efMp2/aW+aYwMI9UCOYietxzTk
	9j9TTxjeAD3tyzCMkd+FRaRwhyQKWVe6GQqdL1sWLHzrtJozmsmo6Lxz3jMlbRw7TWNjs9Zg22O
	FGssQqIwW8jCUhO+7DzczgxJp9a616cMjszSDcLLNPiAjAcNntzZizDMBl6F4SJSGn108ZBfatO
	64lkxEEIfYnx1ao6f3ZyKiwfkrNU7bjxckUIdChRZ01NDjF92vMbNw0KtI8L1ZrqBj9YXtByqx+
	koJnySucStXYY0vr8u
X-Received: by 2002:a17:90b:54cd:b0:330:6d2f:1b5d with SMTP id 98e67ed59e1d1-3510913e14fmr1974069a91.26.1768382727629;
        Wed, 14 Jan 2026 01:25:27 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109e3f91fsm1426514a91.10.2026.01.14.01.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:25:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:25:23 +0900
Message-Id: <DFO7CVW1N56T.3AHEZX5FITQ8Z@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] scripts: generate_rust_analyzer: Add pin_init ->
 compiler_builtins dep
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <20250723-rust-analyzer-pin-init-v1-2-3c6956173c78@kernel.org>
In-Reply-To: <20250723-rust-analyzer-pin-init-v1-2-3c6956173c78@kernel.org>

On Thu Jul 24, 2025 at 12:39 AM KST, Tamir Duberstein wrote:
> Add a dependency edge from `pin_init` to `compiler_builtins` to
> `scripts/generate_rust_analyzer.py` to match `rust/Makefile`. This has
> been incorrect since commit d7659acca7a3 ("rust: add pin-init crate
> build infrastructure").
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 4639a756a932..451d00dfc08d 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -110,7 +110,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>      append_crate(
>          "pin_init",
>          srctree / "rust" / "pin-init" / "src" / "lib.rs",
> -        ["core", "pin_init_internal", "macros"],
> +        ["core", "compiler_builtins", "pin_init_internal", "macros"],
>          cfg=3D["kernel"],
>      )
> =20

Similar to above, these tags are needed:

+Fixes: d7659acca7a3 ("rust: add pin-init crate build infrastructure")
+Cc: <stable@...>

For the change itself,

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>

Best regards,
Jesung
