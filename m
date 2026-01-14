Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D073815F2
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382788; cv=none; b=mv8C1gE3boRIf/DQnh1vy/1D/gsT5FSAM/K+8iI6150w/giPf6+/vV0/txW6o25A1IWyZrn3fFhKiwpMan8N5ksn2DrGwq3q6OEzp9IUgQG5yHiZxcd/qyaZS65spb/yshrrXCC2vSyv9MGLagWN9hCurg+fPTRcGtPokmSa2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382788; c=relaxed/simple;
	bh=9JYFjvNiC6i0vaR5+AN/EPJeIV9eoAdCkAztcYJG1Kk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FEbyPbwS/c2EfjYhRYn7zwGzuJAH6hYsbtXRc3mUPYMZ/T0Qq4VRNymm6agIui6NxsQDJKCLT06X0e4DUF/iTvpfyiRteCgpX8P8yBOczrK+xSWCCbMdzje14jVRuz2EitM4KJ0fAl+KX18hEdlfLiNEJD83N0mO+TyxrJfata4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqiviuES; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqiviuES"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso58999945ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 01:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768382786; x=1768987586; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85hA88Jj9jPujDKVPhU8iVk2KYmDiYOurxEj4yWVIAA=;
        b=bqiviuESodJanutqkuwzKYTHdfqIoXSjN+mzZTomEQhGKpaE2Gg8KPmW64m9oMLghl
         3z4EajwYS32UHT9EgYedbjz6o2ABTYYXtIimo4SaHC5s7Jg3+28PzXCqXkyVNkxEv5+d
         Hw1ALycykZKPgR7xX2ZXNgSw5XI9R1599pHH56nlvP/Li8rDDSL+jNsToVpf6mMy5qxY
         oYfVHOTcV7Nzs9Ow2ssr+SJsg+BYFiFvTFFQOnsouryH2Yei0gwKiLdJfwtLvIoYdf12
         yafrIHCzlUUl47kvx2r//P9cdADTuTATG2wjBPVGVWnxXOrGkEYa2xdogkXpOjmfQ98n
         xv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382786; x=1768987586;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85hA88Jj9jPujDKVPhU8iVk2KYmDiYOurxEj4yWVIAA=;
        b=eeAId5NNv5bWb2Sw3qYAPnY3y1cHNZstgo5dkLjBAHglvqWmwhSjJ3+NBYcrSVDdiC
         7D8/YLeaKXqDYT8JDYHGsv7IZosAb3zBBc41hcQZpxhiuHyW93zXb0FRASZhXyxN551n
         T3AcpaEKFc3ND7ZKN39oTd79K1CnqLPRLgMs/7Pu5flPfdcJje9V5LYCudzUmvrXDq/4
         PRlMZtHK2JrgOVJ3FSBGb508IkU6se4ZOXcwTjPcGDslTAED5UPBOg0+cEdVHF10/GQg
         y9nLhXzjqB1bbO5o0QoEGvmRvxiE9AhJCkfjy+1kyTyFu8tTG0dF9lXAYhjchGdSTa5L
         byfw==
X-Gm-Message-State: AOJu0YzWXDKzT7gkzYCNd2tQ9yzh391CMl9zRiOYsv3D+IJueZmd7iVP
	RmtZwnTh6GkwNPAXLQiDBNddzrCj1+/hAX+YrdVQXU5T8bFl+cCMVxoEkEIkkJTQ
X-Gm-Gg: AY/fxX5NhqShh7OTM45aSZff+kFmOpwE/e5N8UOCetCrx+pmBIEzVWYRFigOMTu49It
	mRf59Ua+VU4dtZwX43XiIhbYo3pVt7J0C6Ee56BBbHU6RP/wIP1VKQPdtL2OVEvFTTpxnI4tMT1
	Erv6+hLhs6g1sDRB0WZJTlIb/Ef+DpRV/pkeA7WnfMnzi6nu2qofx8jtYccR/XI5TDryDUVu1To
	LhGGK0fGkA+42++JVbXVgiOaHmwoU6U9iHd1qS/zJgrIux3n/niHl2pC4JCoojyjE3xARzL+hZ9
	SNvMJ4e3JHDR62enHBIoimxFmvV51JLAVSSyDvoUaAYzYwCB+n0bQPK8Jjf3NMLNYkIovTsJ1SB
	t3/DzZ82O+IvZNEnqYm2CFrmmLY2URdImB9S/U+PZ700iG/yrWXT2tocXD0umoAkqIhjReEXEKR
	zccOBsPA==
X-Received: by 2002:a17:903:2cf:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a599e09e05mr23309495ad.36.1768382786459;
        Wed, 14 Jan 2026 01:26:26 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c39fefsm224570785ad.17.2026.01.14.01.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:26:21 +0900
Message-Id: <DFO7DMI84JCC.1IAS0JWKKLNTZ@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] scripts: generate_rust_analyzer: Add
 pin_init_internal deps
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
 <20250723-rust-analyzer-pin-init-v1-3-3c6956173c78@kernel.org>
In-Reply-To: <20250723-rust-analyzer-pin-init-v1-3-3c6956173c78@kernel.org>

On Thu Jul 24, 2025 at 12:39 AM KST, Tamir Duberstein wrote:
> Commit d7659acca7a3 ("rust: add pin-init crate build infrastructure")
> did not add dependencies to `pin_init_internal`, resulting in broken
> navigation. Thus add them now.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 451d00dfc08d..229acd4cf1fb 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -102,7 +102,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>      append_crate(
>          "pin_init_internal",
>          srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
> -        [],
> +        ["std", "proc_macro"],
>          cfg=3D["kernel"],
>          is_proc_macro=3DTrue,
>      )

The recent `syn` rewrite of pin-init [1] covers this as well. How do we
usually handle this kind of overlap?

[1] https://lore.kernel.org/rust-for-linux/20260111122554.2662175-4-lossin@=
kernel.org/

Best regards,
Jesung
