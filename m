Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6CB37E31A
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382468; cv=none; b=DlVqe74Ia+/sMkPOyVcTUNdTa1nuwgHSQAkllHbRPht79KTb+5AEhTEuUWhwfgjCnJG8NueScLrhcOVYDg2dKeJwy6wc25zeUubXN0YD7EJeAclpBJhTEKKOFW5bdUkYuczS8ej8jiRCVWcfsUjg55yWzyz2xdQZiynWP7bENOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382468; c=relaxed/simple;
	bh=jwV2uwGZ2M7YDB/QJwCc2wGu+28PNLAEYK2ClK5aG8o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=b4HfzaEP0P7QLWWrSzxjqmctAcNyKEZoYv2oB4sQjLyPW0cKNtSERw2Rr75CvHANu9+mrbstWO0zHF00fyehbagf1MghASFNTE9P0Y0bQkksFLp4wR/8zPWGwfpyjRfrKh+3GFo+kshnsLqYlurmCsGUSw6mi4zvU7RcccOzcL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgrYcrSc; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgrYcrSc"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso1671028b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768382466; x=1768987266; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjYtLMftWK7eLfK1LYtQ3c0qZ26EPLj9TyyoeMxwCOE=;
        b=PgrYcrScsVLJcPacyth5FKOYqq9W0pfWkEAcYJoTGEq2sSk/7vcR69nem61kskTwMV
         1DhV94dma0W/OfkXV0XYcs+ruSVDwXfE2f6OWWw1Ziemql6wTSjPiN31bf51bK/jKq3N
         98nxWaadmsza1oQqYT5eQ/U0OaE+iENbhnQuLJMfswCKMvjrZQpu4C/Nr7mCT/XkORWp
         2QV+9P5AdlAOGZ/RU3iEw/LSrFwHOk3yM5XZZ27WRGPYvE/ClZ2bpSYekuzSH76day1Y
         GlDnL//qG2DqQP9JF8lg+qt9wGFKnD/WlIj9petCgTMV8h6v3gR4674byiYmd/rjG2gh
         gWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382466; x=1768987266;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjYtLMftWK7eLfK1LYtQ3c0qZ26EPLj9TyyoeMxwCOE=;
        b=Jhg0sZO3V0CFBm/nBnOWI7yvAgrNh4iG3HBL7bgap6IviwVReSBWc93cPi5ta9/bEg
         VuKqobVnHoR5ykq+2tYqdKebJHsS8PwK+TGcyzKGuHIPxfvPvgjMLGa9mT6w1N43VcFT
         2/En337ToERmwoOHlsvrfm5LMPTtO5BIH1x4B7r4KSMCdHYbI6mobSnmm1aCCNWSw2iI
         BufwY4+v4z7l52aXnM+n0WefbXG03WCaJOzPJBWFZkccZKLbh5ZBcCh/q8jI+FkS5qdh
         1it5PiXw60rZkxUau7v6uZF+1fPW7flIFr5lAihdXwEvymeoBlpCQmDkZiT3r46QyaYK
         FUjQ==
X-Gm-Message-State: AOJu0YzBo7x8afZ/Aq73MntmTBOajFO7axtx7pefbTjDDzcL5QwItUeu
	Ja3IYcJtRplPsVCdH0t8yAiTir5BRbPbg0r2zh30T9ZBbbcj6XE+cclK
X-Gm-Gg: AY/fxX57G8ZBkVdb0KtKPa/ZT8dh+79z8NlMJUYHQdlig9WRJWLvYNdxQKhq0eEFYI5
	8XhAVK7Wi4Aze/7KcVrKydy+hqQejeTg2CByU0P9n6cqTr9OZz8grkAH5DKqvLUKoRFNrmZ5gzQ
	Hrs1C+ZxCN1s7AKWoGxEj+wZ5BB+6PHkdpnqLRRdwG9frRD0UJjPQn8gz8eDyxJ8LB/PiueazFr
	C4WFFQkO3EjV1Hcf9NhaPl33CcIFRjCwwveC/nLtGhZhewTLOBQZdCIEuESPHhQ7RRbD7j+atnQ
	Q1UmPuM+eItjv8nJgjSciHURJv6SnXv7/hgGikdCH1SnojG8aujLRsUdugflcx/WrXbHDGQo0Xp
	PO5RXNx0mpaAjTTp9IviInggjE2+VvyYVtGxbdIWQz4u/hr2BBNwxT5XLANMVQiuM5M5JM0DKtg
	Y/eVX7yA==
X-Received: by 2002:a05:6a00:448b:b0:81f:4dff:336 with SMTP id d2e1a72fcca58-81f81f969a6mr1655695b3a.52.1768382466183;
        Wed, 14 Jan 2026 01:21:06 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81efe4a95c7sm12448712b3a.37.2026.01.14.01.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:20:59 +0900
Message-Id: <DFO79IRELYPB.2V1XQTCGJL5DB@gmail.com>
Subject: Re: [PATCH 1/3] scripts: generate_rust_analyzer: Add
 compiler_builtins -> core dep
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <20250723-rust-analyzer-pin-init-v1-1-3c6956173c78@kernel.org>
In-Reply-To: <20250723-rust-analyzer-pin-init-v1-1-3c6956173c78@kernel.org>

On Thu Jul 24, 2025 at 12:39 AM KST, Tamir Duberstein wrote:
> Add a dependency edge from `compiler_builtins` to `core` to
> `scripts/generate_rust_analyzer.py` to match `rust/Makefile`. This has
> been incorrect since commit 8c4555ccc55c ("scripts: add
> `generate_rust_analyzer.py`")
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 7c3ea2b55041..4639a756a932 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -83,7 +83,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      append_crate(
>          "compiler_builtins",
>          srctree / "rust" / "compiler_builtins.rs",
> -        [],
> +        ["core"],
>      )
> =20
>      append_crate(

This looks good, but I think
`Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")` and
`Cc: stable` tags should be specified.

For the change itself,

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>

Best regards,
Jesung
