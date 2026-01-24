Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B2186E2E
	for <rust-for-linux@vger.kernel.org>; Sat, 24 Jan 2026 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215396; cv=none; b=EK1kBompZtctoibhQlwR/9gNfORH8e+MOUiw8UG1vg5xjXBhFbwG+jjWnD67SQrEJxW3bAOeWZyvHzjO2KqQYSP1/btk3Ig5DX9F9mjElSVin1KTwRQeD09fUbnBCyiDUtzmj0UeVa8D/ILdml5IO3YgO2/gre9DLE53TDnJEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215396; c=relaxed/simple;
	bh=s5VV63214L9aIiNsY3Fe8HQ3oqoyNK56ChxQOloSsDE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b8bpIId/jDR2ljat8/Ads7dUdpGN7cLJUm/1WAfRJ/UCkEX/9tROn/p4bUk+Fce4hc4RF9Qz8yIXsZqsbJoMmcz4HjVY1zRQVgb5EapscRv+/MfpROci+Vnpe4HpVFd99watk2U/f65hAxzqLQ2Qxrk+scT/2Un+c26A6f2ktgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjNLZ1g/; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjNLZ1g/"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c47ee987401so1083647a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 16:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769215394; x=1769820194; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0I/aezjnuokBoW73JjqOvyELDq6BbD0cmw6CfuUW49Y=;
        b=bjNLZ1g/TReJHYCehU/9kynZpYpjKl86pn/hfExzw6Grj8e/IL1oEGLWWoLZs/svrg
         JC3abmU2JSZX2GH1JdEWF+Ya1qArgl1rl5NTKf3hA2hCh1ULAbfPQAO53kv6L3j754+L
         MOo1bvpPKBo8P1JQco8emXOmwCRvz1WYBwUt8IrywmUQ3YLzQx+iaEkfrdJVDXYb2S5e
         pz+ZcAYr4sVFvh6kXiraYqJv7squ18R/XSWAWGQmkVsHoVJJyPxW2USPk/3S0BAv4N3L
         G2Nww+Cgm1Yy6CRU1pCDETL68UH5n9dhGq8jh/cAXE6hsKzg8CU6X7AzdSoqw99Z0kjd
         WqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769215394; x=1769820194;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0I/aezjnuokBoW73JjqOvyELDq6BbD0cmw6CfuUW49Y=;
        b=LQJ8dEZMeH9HtEsovX8XKw3qa3vxE81MDFBHxDkxAxKqleBkPiedUsPRoGG0CUnFn8
         2N9X8/Fe1CAXFruVmNWS3UzZ+r5fDy4JRpNuDSRvGCHLUeFzUEnd0grFNYl2g4f5ZG7w
         PQ9Slx2h6uXQGeqjdAnAWphp6FbRrg0woUIH2wHQO1D702ar4+/zL6/H4MXksDuUbZ9z
         TEkYBSKh4Jk1zMkLEszkvafSJDvUoXySDOipLul03VZVmWBPnRMUd4kZQ+51BUcpTux0
         qXJkDgQkG/QM2peLN2+nn0/W7ougBl+eKJG3E5l6soO25RZucnW8AA0iUI1g6khBKAnj
         3bCQ==
X-Gm-Message-State: AOJu0YxcV1up8AkalbmxQaDlmT1XL+iGHjldd+ezf2V1tt77cFq1YTmK
	PtJee4xzQz+J/z2BU7EBqeJrvdXGV8PrlyLWO0Tpf/SzrkcTxu5gdZXr
X-Gm-Gg: AZuq6aKNYSjVLDxsy158y7TNQYN6bo+NmocErQ42cC2jiZMWlQ+0r0gF9CT+WOqBXvW
	phuk+9R2FpMgm+UqCw591vZa6/XLCOfPEniAYP+YtVSHJ/QuGIQsI/DzXed/BWYdm7H5ZuIedEx
	IlNlEFbg0lYgPF23kbptuF7a09XJn9OshQMDYyj30an/LT9x4whx5irhEE1jTzxWs2g6WXYhMGS
	gmKA53U3uft6pFztZSrzh0Pf8zzoyuODQL0g6wo7Tyq8HFVa3EL/93jZm6yHjLNq/726UohOavn
	kxbjRGw6lrtEa86QHuHExvWHoOJGCuUNsxllh7OFyuX7NHs9qv0kpVTWp4P2cdoK1bLYsQbRAAo
	WmZgAAqvzaELWRqcEN/dMXJRB7YrEnTZVkPnN2ZjXDfOkXBSxdardd9bP8jCtXrgmPOeqTFDMcX
	OW1jrIZg==
X-Received: by 2002:a05:6300:8b0f:b0:2ab:a456:9b09 with SMTP id adf61e73a8af0-38e6ffb5d6bmr4298433637.15.1769215393768;
        Fri, 23 Jan 2026 16:43:13 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cf8sm29576655ad.42.2026.01.23.16.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 16:43:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 09:43:09 +0900
Message-Id: <DFWEIHKOKVQS.1MGF5PHL2JFVT@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Jesung Yang" <y.j3ms.n@gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: fix resolution of
 #[pin_data] macros
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>
In-Reply-To: <20260123-fix-pin-init-crate-dependecies-v2-1-bb1c2500e54c@gmail.com>

On Fri Jan 23, 2026 at 10:18 PM KST, SeungJong Ha via B4 Relay wrote:
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

Perhaps I'm missing something, but I wasn't able to reproduce this
problem (which I think is expected as the `kernel` crate already depends
on `pin_init`) with the following setup:

Tree: linux-next (next-20260122) [1]
      (includes latest changes from `rust-fixes` and `pin-init-next`)
Files: samples/rust/rust_*.rs, specifically rust_configfs.rs
rust-analyzer: 2024-04-29 (which corresponds to our MSRV), 2026-01-12

Could you share your environment details and a minimal reproducible
example?

Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag=
/?h=3Dnext-20260122

Best regards,
Jesung

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
> =20
>
> ---
> base-commit: 6d7fef23043553336259211346b6b135d6c1f4c3
> change-id: 20260123-fix-pin-init-crate-dependecies-b94ac4247a48
>
> Best regards,

