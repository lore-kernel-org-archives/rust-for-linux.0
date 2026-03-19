Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57F23E1227;
	Thu, 19 Mar 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932533; cv=none; b=DH0KaxDfeNlNtwZg6CQF82nK8N4sc+bx2dNDDmSKo2gH7QFA5z2t9Co1I7Yh9qbhgqEAziasYknQlM0tYEQQgtflOno3P4F3QaeNpBqLTf4xOUIGzwUeKS3rc9zhyroE46HBKaSjRejHbXJstJGDF7vBhU84sOtftfWX1VXWrKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932533; c=relaxed/simple;
	bh=NDqIcoSuQrBgyZ0j2ZHYSc/+LLwVm246I4SQXeSmNQk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cMIv4G6oecunnxqCzt1IH3neoC3nSqxT91IoqE8Vz24l/rLbG3PeeKrZefrc0gc9LoObnFZF/FkCm4jqJE7P5OQIdhVRfpB2cFY9m5C5XJfYJLL6SrCROLgWCoUdQyyYqpWicobf8V3sZ8LfP/ouAKit49eUvou/+UHGh2BSBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCrK67PE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCrK67PE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0929BC2BCAF;
	Thu, 19 Mar 2026 15:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932533;
	bh=NDqIcoSuQrBgyZ0j2ZHYSc/+LLwVm246I4SQXeSmNQk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=uCrK67PEcxeduHtVndqicE8Xk2CSreUTywVzgZ3SuGWSB7qURF/ZKzNpzXbji+Vrv
	 fzhrEyoGZKmtctmrJECXSkqCvp6GJ0zj7svnluLJzLwOAWR520Ni8UUcHhwHYAYRiK
	 IOuKiuwPuyAy/0Af/nWySKHf5YYwVRuznXTRrozNnPG1D+mgWENsgbrm6XRNPwRF/Q
	 pETUGyJ4Z9Y+mIFhHdC5pGQMgHLODoI7da8v/sGEttxhuFq4zQlGT+sW8nIS1GHNm4
	 HRBiSLEBXuN0qGGRzuX5LcFQ+iStKool8opyJImT1+7GpNu2RiZmac8n6Aix/Ou9zi
	 153momwkUiXRQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add
 versioning infrastructure
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
In-Reply-To: <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com>
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com>
Date: Thu, 19 Mar 2026 11:02:00 -0400
Message-Id: <177393252080.237.233380198774445367.b4-review@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=tamird@kernel.org;
 h=from:subject:message-id; bh=NDqIcoSuQrBgyZ0j2ZHYSc/+LLwVm246I4SQXeSmNQk=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJl7+N+HzJGR1fxQ4nx/vp1SyNEFHF3/uTZIGr865eTKW
 OTTd2dNx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnmTGb4wzehyOGPdVJv+dkGL4+tQkpXF/1dnmdtqR+iKvDiiM8RXoZ/GuuEbyr
 lfW9rf3t3mg6nWGfrHZsrc/3W9texeW9oLvjGAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On Tue, 17 Mar 2026 18:29:54 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index b4a55344688d..21832763c5be 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -49,7 +54,19 @@ class CrateWithGenerated(Crate):
>      source: Source
>  
>  
> +class RustProject(TypedDict):
> +    crates: List[Crate]
> +    sysroot: str
> +

Could we move this type down so it's closer to its site of use? It's ~350 linues down.

> @@ -200,67 +227,70 @@ def generate_crates(
>              edition=core_edition,
>          )
>  
> +    def sysroot_deps(*deps: Optional[Dependency]) -> List[Dependency]:
> +        return [dep for dep in deps if dep is not None]
> +
>      # NB: sysroot crates reexport items from one another so setting up our transitive dependencies

It would be great to avoid having to sprinkle this everywhere, though I admit
it's not immediately obvious to me how to achieve it. Maybe we can live with it
until the MSRV bump. Again, would be great to structure this in a way that
makes that cleanup simple when the time comes.

> @@ -335,12 +370,120 @@ def generate_crates(
> [ ... skip 17 lines ... ]
> +    Represents rust-analyzer compatibility baselines. Concrete versions are mapped to the most
> +    recent baseline they have reached. Must be in release order.
> +    """
> +
> +    # v0.3.1877, released on 2024-03-11; shipped with the rustup 1.78 toolchain.
> +    DEFAULT = (

There should be a note here explaining that this should be bumped when MSRV is
bumped, and how to obtain the new values that should go here. It's really
important that the string MSRV appears as it's a likely grep target for when
that pointer is updated.

> [ ... skip 40 lines ... ]
> +            ),
> +            "sysroot": str(sysroot),
> +        }
> +    else:
> +        assert_never(version_info)
> +

The call to generate_crates should probably be below the block that synthesizes RaVersionInfo.

> [ ... skip 24 lines ... ]
> +        # `rust-analyzer --version` shows different version string depending on how the binary
> +        # is built: it may print either the Rust version or the rust-analyzer version itself.
> +        # To distinguish between them, we leverage rust-analyzer's versioning convention.
> +        #
> +        # See:
> +        # - https://github.com/rust-lang/rust-analyzer/blob/fad5c3d2d642/xtask/src/dist.rs#L19-L21

either "a different version string" or "different version strings"


-- 
Tamir Duberstein <tamird@kernel.org>
