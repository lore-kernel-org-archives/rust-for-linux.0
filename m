Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA739447D
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388094; cv=none; b=Uc4soNvt+rWbmCVa97qnrMHPvxx5Fu/ya2CNIwjG1BOmNRQxIrsddxcbcaeIa8kUTS6GKMHQuVT0ipQPB7TmzxXZI10hVXFjvxli2doTJTOjiYcaC/KDCVU1dPZrqWcdOptLaDhKqgm8lrupiKa9NhCTehiGPhP0uroEncXFSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388094; c=relaxed/simple;
	bh=h15B+mLxNukcbl8kaBs4zZVN1yOkPTyQwCi2akIWAsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=n8y4B0GmbP4vTtjTLvg34uiRXDt6W9fk2BzitPb5FGIVr8GwxYHufJhBnZCtFyJpXHX/J2J4nQ9n48j4WpdGIQLIBmszYSSxpHR5R032rYooTi83VHMWiYjMgkDzSG4qry8+IGW2Rs3YUtZgRDKo97O33uxdJ9r9W4DoEe8/6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sarwt56r; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sarwt56r"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2260505b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 02:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768387913; x=1768992713; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc2RKiW/qIW7UFKPDHYtLyrvvbuZ6HzsjcPadGA6Wvs=;
        b=Sarwt56rfDiC/KeLBf5EGwhdyHMXO7+7CSpFfCNpbHLs2RvKi6WOBq2/SJ6Z/GS4Yx
         AppnhOjuXByjyaVuDE7kjX/xrQFG3eT9hthv+8KvJkNY0rPshdTjMz16KexG5KWWrb4J
         aO/SKabPsO9nITU+xY4YgW1J8R7p+su/V+vIiR8nQbwsvAB1cprYxT1Al7qacdck7pqU
         t0uCuhewS3iU7g2fgYfEZ7zADc/zNdz9Meo/ueE9dmBZwHqATLlzoboNJkes2x33eBJI
         1VP+mtmszaSpTv5Xn03O6xt7+7EZUdYgN8evB1uvyiuiGYMp4Bdrk7vE5/rPXQ2h1zMg
         7wGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387913; x=1768992713;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vc2RKiW/qIW7UFKPDHYtLyrvvbuZ6HzsjcPadGA6Wvs=;
        b=dfSR4BRSnQDYlKh0+XedDCtXAt9xzKmelTckLyH+2NWPrsy7CWkU67kMUoP1S3PPid
         rUtamb5NEcxt0LSkEICWZIxkiSsUEfg4X5owFfcMoBoa7wi72XXZEhCLPVR2T9tuwKRF
         mRn/b/WstLyL/i73iPowB7UPAm9c77Fzcr+GvfNMfslyB8mmh7IeMC95+79t6H/A3Dnn
         3eltl9nqfHTl22foXUQxuZhe1aANYFGybnMzRUwN5ziCAz0SuSWN6WZJYHFpas3rFj+L
         xx3tMfqMX0OXXf56V0YqYHiu/znyJJAa4BvhKkHgZesOxuou0U9aCm+ya/HgauJt1fKO
         zENg==
X-Gm-Message-State: AOJu0YxO849BU/oAXZiK42P1Glvavxjy6XadQV42/ZD9Au8f1wNaLnA0
	IVVcGB9owq++kMEVwU9jpnxG5dzDjKleH8+EaOijcRx0IDi0WA3Kz1Dl
X-Gm-Gg: AY/fxX4RdAf9RQMMDyDH6/mkSxnLYPwytXApIuQk26D0WG2cExfQsX7BjLlUmkTdeE0
	X0q7Us91wkFzIRISwGfBnaaMbfgBLJsIVejNx2eU62L1zbLsAO2+ILru/ttnpDZK73Z5p7Zz6rM
	aVfIx5ltkWJaEs2OG2lxZaJ4sbdXVZwF9UcsURE4incOQkR6tR3FBvRDkz0lIl3Ac1X5HhM1icI
	Dh3luWobYmYRaaYezgFWULrLYX8QAEkJu1SKMJRH5yXo6fIgMWiOzeVcsDfqX4JaagOCp+N5XCa
	HyZAyQa0w46Eisjcfvub38tzd5DD13MMCByVfUR+2Ngo4g0wSxaU3duSQn9vZrnkNKcYhWuONZ+
	KZsh+M3tuT+giI/mX1rjZA02Z9pyjqRM84ZgQ1RrXVuVqxl/rHXWvqGdq/LKH4lJzul+vyQe6fe
	jjMKGfuQ==
X-Received: by 2002:a05:6a00:4008:b0:81f:4bf4:1858 with SMTP id d2e1a72fcca58-81f81feb1b9mr2051868b3a.37.1768387913379;
        Wed, 14 Jan 2026 02:51:53 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm22800519b3a.31.2026.01.14.02.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 19:51:47 +0900
Message-Id: <DFO971H9VQCE.2GZD7P4Q9GV9H@gmail.com>
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] scripts: generate_rust_analyzer: Add
 pin_init_internal deps
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

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>

Best regards,
Jesung
