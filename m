Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8521578D
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182960; cv=none; b=tA6jOz3QwXq8HeltpJz8usaPsMOh92PitDjDj0TZrpLqa/aY8oRKiC32o2E/Vk+UlJaAsp7Ez1pWvVbPwWfWjNtIyJ+YJ+lkDRWImOjb0l/j0/9qejcDdh/oxNCO832izwvOBrx+bCp0jU0G7SrwUnic7NtNsMToPaAUM0+P1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182960; c=relaxed/simple;
	bh=wBVUF132+z+WgT6ltNBSv6wZmNx2ZV+Gq/ipCOXNncI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHjaao1/9grsMGbXZ7LZHEqzLTjyrptWWl5nkIPq4dzrUXUWDchBnqF31xukx4/uogfmXQ4J9HE/HhibQ+bf0Kq7tKgXqVMMG1IKOcqAD0wHcIC6SQeaWf1yQAiUHJ19cLWHsu5UDQRW+MXDhpfb0rYs5hIPhRPlpxT88HSgVBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/+x5Asv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/+x5Asv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61837C4AF0B
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769182960;
	bh=wBVUF132+z+WgT6ltNBSv6wZmNx2ZV+Gq/ipCOXNncI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d/+x5AsvfyQ4dy+si7H0wDooUMJZ16ViT4q7ycLbXAGimQZz+B6AkIGzPA6pp08SH
	 NFgBFX96NujcaaMNiwxpIKvGjx7mjrj4ERVvRbzgmxfw7L2aX2Ihg6lf30/IOZkgll
	 Ki7jrohrhe5GXVfq8ryHEslmlE44631uN6cKgHwxgeQiSPJpPiqjAr21zdjsgPO2L/
	 ZGp9wCZsteeEXNCSJuAy8+XjrrlTiJ3Wiozwdp6vbECTUiKo1pygXk9OtDNOwZ/DG/
	 /sMrDqnvyYBeUy2uBw0P3r9hWPr/W/K8jWeARk3uP2zCbNY4Nc3Zz4ghZHz+osK/80
	 zoHAw3SftdpeA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b6c89d302so2289842e87.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 07:42:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1turQrfv496cFlDINyxmnwWitMdIsR7iIhQRsiLs6bfvTUiVQcAbaMjuTZipzpSdmvKXss3de2lkV2f0Vgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8B67LLmbeTDP0QSdP+GltZ/y44KHRTCeo2Z+ysHUQsWx2Tr2d
	vbdCBwAQsU90BssNVRnGIPzb7zLrqzYLqKujEn/wmmrJe3+6z9nwXuTbhxb3elyhes/s1zBOeVS
	IFZ4/wC7Ce498PeMe34MMZKBFRGV5E/M=
X-Received: by 2002:a05:6512:3e0b:b0:59d:e5ad:3673 with SMTP id
 2adb3069b0e04-59de8166552mr696494e87.30.1769182958932; Fri, 23 Jan 2026
 07:42:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
In-Reply-To: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 23 Jan 2026 10:42:02 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=hCOBboeWUEnzUpx5dX4j_xf69-YE4DXSi-F1613fyTw@mail.gmail.com>
X-Gm-Features: AZwV_QheDj0VwNsql3v6ak9tCGJkiWUNR0fNo0D7bqlKB1L_47yC7jtiJpwn1-k
Message-ID: <CAJ-ks9=hCOBboeWUEnzUpx5dX4j_xf69-YE4DXSi-F1613fyTw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
To: engineer.jjhama@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 8:19=E2=80=AFAM SeungJong Ha via B4 Relay
<devnull+engineer.jjhama.gmail.com@kernel.org> wrote:
>
> From: SeungJong Ha <engineer.jjhama@gmail.com>
>
> Currently, rust-analyzer fails to properly resolve structs annotated with
> `#[pin_data]`. This prevents IDE features like "Go to Definition" from
> working correctly for those structs.
>
> Add the missing configuration to `generate_rust_analyzer.py` to ensure
> the `pin-init` crate macros are handled correctly.
>
> Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>

Fixes: d7659acca7a3 ("rust: add pin-init crate build infrastructure")
Cc: stable@vger.kernel.org
Tested-by: Tamir Duberstein <tamird@kernel.org>
Acked-by: Tamir Duberstein <tamird@kernel.org>


> ---
> I encountered an issue where rust-analyzer fails to analyze
> structs decorated with the #[pin_data] attribute while testing
> Rust kernel modules.
>
> It appears that the dependencies for pin-init and drivers were
> missing from the analyzer's configuration. This patch adds
> those missing dependencies.
>
> I have verified that my rust-analyzer correctly processes
> \#[pin_data] structs after applying this fix.
>
> Best regards, SeungJong
> ---
> Changes in v2:
> - Fix typos
> - Drop the quote module workaround (will be handled separately)
> - Rebase onto `rust-fixes`
> - Add `pin_init` dependency for Rust drivers
> - Link to v1: https://lore.kernel.org/r/20260123-fix-pin-init-crate-depen=
decies-v1-1-1c6cfe9aa352@gmail.com
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 3b645da90092..766c2d91cd81 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -214,7 +214,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
>              append_crate(
>                  name,
>                  path,
> -                ["core", "kernel"],
> +                ["core", "kernel", "pin_init"],
>                  cfg=3Dcfg,
>              )
>
>
> ---
> base-commit: 6d7fef23043553336259211346b6b135d6c1f4c3
> change-id: 20260123-fix-pin-init-crate-dependecies-b94ac4247a48
>
> Best regards,
> --
> SeungJong Ha <engineer.jjhama@gmail.com>
>
>
>
