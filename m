Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018883E1D0C;
	Thu, 19 Mar 2026 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932535; cv=none; b=jNsf9WFMZnOJLGf0IVtnWApR8gw0Cc2wGc0a01o4gxLUq20F7906adWvWUe2Dlya+Ns0stUdz8+yvW4fxTSa7d0Maw3XOpcHCHAZOmKbbnbtK6MNu0Y45Yvi+IcVJrnhvFz9n85dM302podAOi1uYGQvFmbdTRg8BSidpHbwxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932535; c=relaxed/simple;
	bh=dnu1RM6z2yyIVHa4OShPtKWEl6MOA0kn/sMyOLXQYO0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CTviPODWiUdJD58U3TXDdrdoWnvsUktmjI0r42sEv1lR4zDzXUk76uWPqiPyJK0Z9C46OBm6Bs4ZVg6OD90oMKslMwOIRJogtFY6dE+nJhzOKj8YlcdZE6ZpOtqIT3YZO2nE16JHUdpvx8YQO1cDH0Fs2kXwTz3hGWN/QQw+LlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlMG3FJt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlMG3FJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C50C2BCB2;
	Thu, 19 Mar 2026 15:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932534;
	bh=dnu1RM6z2yyIVHa4OShPtKWEl6MOA0kn/sMyOLXQYO0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=XlMG3FJtWGtUkX2Hooq4vvLpjfAqOuOj1tBW88zGfokLOGvWpK3PVsIT5UjmSrPZF
	 TsvEksrR68kCBzkHI1wokw+Mk6Uy3ie9kLJ4b1jqpZtD41c4UmvxN2Rb9YWNmhCetN
	 mMUAt77Bax2f+5wcPULn7+6aEv6L91NyqyYzDMC/IH4rLMnepJ6gpgpiTj3fnkwEgS
	 qonQo+lCy7Tb2u0yhAj0CM8i1iuCVab7Jo5thGK68ueJQ/jZXApOtddofpjyTx81fA
	 B+bxqX/shEoX+bLLs4lRHQRNKRrbx0M1tp1B9KradzmnznrYMGFrrTa+99TDmeWXSb
	 cAxRPay6baCrw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
From: Tamir Duberstein <tamird@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com>
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com>
Date: Thu, 19 Mar 2026 11:02:00 -0400
Message-Id: <177393252082.237.17419844885611963902.b4-review@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416; i=tamird@kernel.org;
 h=from:subject:message-id; bh=dnu1RM6z2yyIVHa4OShPtKWEl6MOA0kn/sMyOLXQYO0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJl7+D8feXdyfgfj30fMs1Xaj/r/558+d4uvZNh6vjdfg
 h1O3/9d3DGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqfSIZGaYuZO82XFWy4YNz+p+YW7cDmd4Y/vr1zFfj28nr02d8nRrG8N/5wWH
 JI8cZQyZlv2TgcUqNE/nrYS19jnF60KTvqlNm/eQGAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Tue, 17 Mar 2026 18:29:55 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index 21832763c5be..bf5a0f16995a 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -372,6 +374,7 @@ def generate_crates(
>                  path,
>                  sysroot_deps(core) + [kernel, pin_init],
>                  cfg=generated_cfg,
> +                crate_attrs=["no_std"],
>              )

This seems to be independent of the RA version. Is this broken today? Should it
be a separate patch? Maybe that patch need not be in this series.

> @@ -432,6 +435,18 @@ def generate_rust_project(
>              ),
>              "sysroot": str(sysroot),
>          }
> +    elif version_info == RaVersionInfo.SUPPORTS_CRATE_ATTRS:
> +        ctx = RaVersionCtx(

I think you forgot to define RaVersionInfo.SUPPORTS_CRATE_ATTRS?

> [ ... skip 7 lines ... ]
> +            "sysroot": str(sysroot),
> +            "sysroot_src": str(sysroot_src),
> +        }
>      else:
>          assert_never(version_info)
>  

This bifurcates the handling of RA version differences: half of it is encoded
in RaVersionCtx, and the other half is here in the presence or absence of
"sysroot_src". Can we keep it somehow more contained?


-- 
Tamir Duberstein <tamird@kernel.org>
