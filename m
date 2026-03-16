Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05329BDA2;
	Mon, 16 Mar 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671887; cv=none; b=qAZQaq2spJRw+N0O/aRkE5BnK4nkQEDqYrWto/SleuEfDdTJ3l0f4X3olFWLlQrl6dyLzpfxmTcCbiIVqmDOSY7FhhEd4q8dJSqbpWwafmAQmNauxIi37Nxb2nmNsdPVjg4IATa7r6VE4/lZ40vdrWhq25a8vENKbiEd0pKmQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671887; c=relaxed/simple;
	bh=aaRRcEpw+GjX8MvOq5s6iCn5i/v9HOJQA7cEvEXKaV4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=MIBaVx1rYkOql2Y46audiyUWWi5L+S27rtn3Kqtui3qGnjddHDQqIPQ4ZjJuqgmEccCZ15BFJ61JdZ/81MaH2SFwFuYTgbENrKHhR+angYGScOTkqhfWHQ+oZoYMmAFJT6HN3+UfNZMh+UNMmL5vNdZ62up43wz5hE7+khZWT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLA78lkb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLA78lkb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088B9C19421;
	Mon, 16 Mar 2026 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671887;
	bh=aaRRcEpw+GjX8MvOq5s6iCn5i/v9HOJQA7cEvEXKaV4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=fLA78lkbcKRomZ0JOafKOYNjxucPVAK9LPaaM4zT4xAzWPcQIu12HUiVmrBvXAvHS
	 R39ggOI2EnRjYgHScCusfoGvX1OFZsUUnf1V6fwgxrWIOto/D0nPZmoNJP34gwxlRl
	 Rt3X3JPlJdGqKTHnlj3mLGu0ELPa42HtUDwHZocWWdcACpbgtq5n3NHFHTnjH/GseV
	 /AgOaAEP+mOzafGmS8mbmdEyOvIPGLu96K5B9NBxIkjhgUzQBPrbEv1eoo1BQjIxZG
	 djtyii0JZVAg8OOCEzSkJ+Py9lavCnj4c+Qhnq+kXBBSLjR7CilI6pb+2v2PMPQYoZ
	 U8xZjtJ/ChR1A==
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
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <DH35VGPQ4P8K.2FOAKEK1K2S3Z@gmail.com>
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
 <20260308-ra-fix-primitive-v3-1-598017bcefd8@gmail.com>
 <177308129157.19064.2462259833624603051@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <DH35VGPQ4P8K.2FOAKEK1K2S3Z@gmail.com>
Date: Mon, 16 Mar 2026 10:37:58 -0400
Message-Id: <177367187873.68572.13759534078660151207@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461; i=tamird@kernel.org;
 h=from:subject:message-id; bh=aaRRcEpw+GjX8MvOq5s6iCn5i/v9HOJQA7cEvEXKaV4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJk7RI/rztr21M3n2PYlW6bLq37ZUSE6ufXYa70vE/gdQ
 55Pdor531HKwiDGxSArpsiSKHpob3rq7T2yme+Ow8xhZQIZwsDFKQAT+bWCkeGrpvPUyzl3mTkv
 RE7sfrfkSMWyCc+k/goEL78m+fhgiGw4I8OcKU5G2VG3rZXdJa/tzV6TnnWxwJGrx+6Dw8b7r3/
 5W/ABAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On 2026-03-15 16:01 +0900, Jesung Yang wrote:
> On Tue Mar 10, 2026 at 3:34 AM KST, Tamir Duberstein wrote:
> > On Sun, 08 Mar 2026 08:30:34 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> [...]
> >> @@ -335,12 +390,90 @@ def generate_crates(
> >>              append_crate(
> >>                  name,
> >>                  path,
> >> -                [core, kernel, pin_init],
> >> +                sysroot_deps(core) + [kernel, pin_init],
> >>                  cfg=generated_cfg,
> >> +                crate_attrs=["no_std"],
> >>              )
> >
> > Can you help me understand this addition? It's not mentioned except in the
> > cover letter as a diff from v2.
> 
> Assuming you're referring to `crate_attrs=["no_std"]`, this makes
> rust-analyzer treat crates in `driver/` and `samples/` as if
> `#![no_std]` were specified in their crate roots (they don't contain
> `#![no_std]` themselves).

Yes, that's what I was referring to. Still, it's not clear to me why
that is part of this patch. Is it intentional, or incidental?

> 
> (Actually, I'm uncertain if this is the part you wanted me to elaborate
> on. Please let me know if you need more context.)

Yes, sorry for the ambiguity.

> 
> >> +def generate_rust_project(
> >> +    version_info: RaVersionInfo,
> >> +    srctree: pathlib.Path,
> >> +    objtree: pathlib.Path,
> >> +    sysroot: pathlib.Path,
> >> +    sysroot_src: pathlib.Path,
> >> +    external_src: Optional[pathlib.Path],
> >> +    cfgs: List[str],
> >> +    core_edition: str,
> >> +) -> RustProject:
> >> +    assert len(BASELINES) == 1, "Exhaustiveness check: update if branches!"
> >> +
> >> +    ctx: RaVersionCtx
> >> +
> >
> > Could we make RaVersionInfo an enum? That would allow mypy to do this check
> > (using `match`) rather than relying on this.
> 
> I think you want something like the following?
> 
> @enum.unique
> class RaVersionInfo(enum.Enum):
>     V20240311 = (
>         datetime.strptime("2024-03-11", "%Y-%m-%d"),
>         ra_version=(0, 3, 1877),
>         rust_version=(1, 78, 0),
>     )
>     V20251222 = ( ... )
> 
>     def __init__(
>         self,
>         release_date: date,
>         ra_version: Version,
>         rust_version: Version,
>     ) -> "RaVersionInfo":
>         self.release_date = release_date
>         self.ra_version = ra_version
>         self.rust_version = rust_version
> 
>     @staticmethod
>     def default() -> "RaVersionInfo":
>         return RaVersionInfo.V20240311
> 
> At the call site, we can access each field via the dot operator. This
> not only removes `BASELINES` and `DEFAULT_BASELINE` but also ensures
> that we only match against valid variants, which helps reduce the chance
> of human error. But unfortunately, `match` was introduced in Python
> 3.10, whereas the kernel only requires Python 3.9 [1]. This means we
> cannot leverage mypy's exhaushtiveness check yet. Perhaps I could leave
> a TODO to remove the assertion and switch to `match` once Python 3.10 is
> adopted.

That sounds reasonable to me. You can also name the variants in a more
semantically meaningful way like DEFAULT, SUPPORTS_XXX, etc.

Finally, `__init__` should return None, not Self.

> 
> The rest of the feedback sounds reasonable to me.
> 
> [1] https://docs.kernel.org/process/changes.html#kernel-documentation
> 
> Best regards,
> Jesung
> 

Thanks for working on this!


