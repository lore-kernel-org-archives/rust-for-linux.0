Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040402BEC45;
	Mon,  9 Mar 2026 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081296; cv=none; b=u8MolBU3miXJp2BJCE1+PHr4zGItIx6fyIK/+JPXh3aYic/QKPFg5HlcwzSTUtKCanr9YZqCOX8uZD07gzeFm6conOCtEXeoNu2WuHUOzaneBfW9IeRuA75bb2ZUDp6YfeevOmyp+KqjW9uKgAo/EbNM5TBO1ohHoeZ2t1zukhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081296; c=relaxed/simple;
	bh=qi7u65EQcP+ruchlrukvGnObKkxRRXNJJ9Ji+xaSr8o=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ujhBxJdF291a7bQbLd2JWsEUVXGSD9gKUpESufqlYlPglLGszzcwdU8N5IvrOBStJZMSd9apwqagMjc7ehNDcud1lgcme6EoUTVt3flvS5yw1JtXyMkfKNd1FvBoLelVCcKOhxbVwBvHQudXczKRS9t4eTqeqLZ5vX2YiWtk01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqyH2qgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqyH2qgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FB7C4CEF7;
	Mon,  9 Mar 2026 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773081295;
	bh=qi7u65EQcP+ruchlrukvGnObKkxRRXNJJ9Ji+xaSr8o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=CqyH2qgvsUzq6N5xXqgePaz20T+IgMdZkNpuTAX3umbyGb9o7J0xM5M+C23Y4H1X8
	 Ck2p9khiAriOeFiXtLlWvmYKXGwcbMAqqVQpRwbwT9oF8zhnMZEBhfwjkp7PvISVdT
	 GKaQIljsSYzY/9lw1s4bGBiPMy5zWJd3+sIav3f3TjSa0hP8CtBBSuTVwbTBxPAru/
	 h+pyLrEA/jcqDNPdMdrdfp5nW/ZfUv5tgedRSZaEcjTBBrGoBrcZfaNTMYNazrHkgd
	 1MjGmCKyNp6l76Mm5NUY4fmmGGnnPmHGPHFgokwiWhLs/SaaZ/DP2BmvQ+9Asn+6E9
	 9qrh2mDpfX0aw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] scripts: generate_rust_analyzer.py: add
 versioning infrastructure
From: Tamir Duberstein <tamird@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260308-ra-fix-primitive-v3-1-598017bcefd8@gmail.com>
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
 <20260308-ra-fix-primitive-v3-1-598017bcefd8@gmail.com>
Date: Mon, 09 Mar 2026 14:34:51 -0400
Message-Id: <177308129157.19064.2462259833624603051@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
X-Mailer: b4 0.15-dev

On Sun, 08 Mar 2026 08:30:34 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index b4a55344688d..a4d25bb8b602 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -49,7 +52,41 @@ class CrateWithGenerated(Crate):
>      source: Source
>  
>  
> +class RustProject(TypedDict):
> +    crates: List[Crate]
> +    sysroot: str
> +
> +
> +Version = tuple[int, int, int]
> +
> +
> +class RaVersionInfo(TypedDict):
> +    release_date: date
> +    ra_version: Version
> +    rust_version: Version
> +

Unlike other types that are intended to be serialized to JSON, this type is
strictly for internal use. Could we make it a `@dataclass` instead of a
`TypedDict`? That produces more pleasant syntax and clarifies the intended use.

> +
> +class RaVersionCtx(TypedDict):
> +    manual_sysroot_crates: bool
> +    use_crate_attrs: bool
> +
> +
> +# Represents rust-analyzer compatibility baselines. Concrete versions are mapped to the most

Same here.

> +# recent baseline they have reached. Must be in release order.
> +BASELINES: List[RaVersionInfo] = [
> +    # v0.3.1877, released on 2024-03-11; shipped with the rustup 1.78 toolchain.
> +    {
> +        "release_date": datetime.strptime("2024-03-11", "%Y-%m-%d"),
> +        "ra_version": (0, 3, 1877),
> +        "rust_version": (1, 78, 0),
> +    },
> +]
> +
> +DEFAULT_BASELINE: RaVersionInfo = BASELINES[0]
> +
> +
>  def generate_crates(
> +    ctx: RaVersionCtx,
>      srctree: pathlib.Path,

Could we define these constants closer to their point of use? I understand the
custom of keeping these things near the top of the file but this 400-line
separation makes it hard to see that there is quite tight coupling between the
two sites.

> @@ -200,67 +245,72 @@ def generate_crates(
>              edition=core_edition,
>          )
>  
> -    # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
> -    # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
> -    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
> -    core = append_sysroot_crate("core", [])
> -    alloc = append_sysroot_crate("alloc", [core])
> -    std = append_sysroot_crate("std", [alloc, core])
> -    proc_macro = append_sysroot_crate("proc_macro", [core, std])
> +    core = alloc = std = proc_macro = None
> +    if ctx["manual_sysroot_crates"]:
> +        # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
> +        # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
> +        # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
> +        core = append_sysroot_crate("core", [])
> +        alloc = append_sysroot_crate("alloc", [core])
> +        std = append_sysroot_crate("std", [alloc, core])
> +        proc_macro = append_sysroot_crate("proc_macro", [core, std])
> +

Should this logic (inspecting `manual_sysroot_crates`) be in
`append_sysroot_crate`?

> @@ -335,12 +390,90 @@ def generate_crates(
>              append_crate(
>                  name,
>                  path,
> -                [core, kernel, pin_init],
> +                sysroot_deps(core) + [kernel, pin_init],
>                  cfg=generated_cfg,
> +                crate_attrs=["no_std"],
>              )

Can you help me understand this addition? It's not mentioned except in the
cover letter as a diff from v2.

>  
>      return crates
>  
> +def generate_rust_project(
> +    version_info: RaVersionInfo,
> +    srctree: pathlib.Path,
> +    objtree: pathlib.Path,
> +    sysroot: pathlib.Path,
> +    sysroot_src: pathlib.Path,
> +    external_src: Optional[pathlib.Path],
> +    cfgs: List[str],
> +    core_edition: str,
> +) -> RustProject:
> +    assert len(BASELINES) == 1, "Exhaustiveness check: update if branches!"
> +
> +    ctx: RaVersionCtx
> +

Could we make RaVersionInfo an enum? That would allow mypy to do this check
(using `match`) rather than relying on this.


-- 
Tamir Duberstein <tamird@kernel.org>
