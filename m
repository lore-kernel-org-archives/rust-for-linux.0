Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DF22538F;
	Sat, 25 Apr 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130830; cv=none; b=oCHsc0s/c94vifZtEmOQTZpIuItY2XHcJ143TgR3E+ejxa47bT7qyTvXaWJB2SJfWsKxUf/CHNpHCDBM8vQkj3t3WZjOIAP94nfb0lzAQCtv9FoPaUayqLN08cwTPCifBcuBTVha/vkBCb3Gb3TXXYoXxZAFLJGwzb0vzLOdjUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130830; c=relaxed/simple;
	bh=I7j3SJ+t80Dc26Qi8HucXt1ZfBdJMAsiYdekCEpWdSM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=A468kIKejR1UGuOt4k15+5XoiWOfJpCL66e7/kzHyQTYb/lWlKMjsv0VbLb/OK8pdHIotvlLmMrUloxSrDc/1ols74dV6vjJlukSLnKVjAZ42dj4QHmU77QKMSLQwf0ml/wyd+ROQW7Hm1jd0q0cPrzauaS+vluwpmvXTch2iyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTQlw4ku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTQlw4ku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247A8C2BCB0;
	Sat, 25 Apr 2026 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777130830;
	bh=I7j3SJ+t80Dc26Qi8HucXt1ZfBdJMAsiYdekCEpWdSM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=FTQlw4kuCz0Niueqwa+7u7nVfPlJ1SxOMNQbeX/rHGz8baVtKHQqfO6rYydS6sgy5
	 VRD/211RtZUstDSu36AUYgQTgs1r/mi5u94yc4IjDzVnek93VFt6T3ke9fKUQygP8n
	 8JaiHl7dw7oAHW8PJrapP28/V6uzeNZKHuKvw3wLxn6JwQYSe83cgNEzB9+0LUqXOy
	 smctAw5fDvkc3ssZNAc+0RI4vhXUQsBvbP5nYZj/J8PBB4lxhEqYDyoaPV2oM20aoV
	 umd3uuv+iu/N3t1ACYAu1T6LGzbS8NuGAGutjwnNrnrwPvmUCPgB854RRPM4JVhYR9
	 pfEPyUcVN1yug==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
From: Tamir Duberstein <tamird@kernel.org>
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CA+tqQ4KK=Ukma8-S47+Lr_YK94Pz76BRD5cfwxSxvYytFiy2qw@mail.gmail.com>
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com>
 <177393252082.237.17419844885611963902.b4-review@b4>
 <CA+tqQ4KK=Ukma8-S47+Lr_YK94Pz76BRD5cfwxSxvYytFiy2qw@mail.gmail.com>
Date: Sat, 25 Apr 2026 11:27:04 -0400
Message-Id: <177713082412.98244.16931124285886474486.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5115; i=tamird@kernel.org;
 h=from:subject:message-id; bh=I7j3SJ+t80Dc26Qi8HucXt1ZfBdJMAsiYdekCEpWdSM=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlv7nre8ml7IP7lwONf2Se2MXbPuHfyWe3x4A7jg9s5A
 5imPHp2oWMiC4MYF4OlmCJLouihvempt/fIZr47DjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBVf2ZkeM+xrEX57vNv7mFx1UmTb0SsfffntHioRtQ3PQG/C99m6DH8d/J+vtt
 wt0DrsQRju9vOW7aHVnF7M86OK39hW37rVFk0OwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

On 2026-04-25 12:17:04+00:00, Jesung Yang wrote:
> On Thu, Mar 19, 2026 at 3:02 PM Tamir Duberstein <tamird@kernel.org> wrote:
> 
> > On Tue, 17 Mar 2026 18:29:55 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrote:
> >
> > This seems to be independent of the RA version. Is this broken today? Should it
> > be a separate patch? Maybe that patch need not be in this series.
> 
> The primary motivation for the versioning infrastructure was to
> incorporate the `crate_attrs` feature introduced in the recent
> rust-analyzer release (denoted as `RaVersionInfo.SUPPORTS_CRATE_ATTRS`
> in our case).
> This solves the side effect of enabling `sysroot_src`: `sysroot_src`
> implicitly brings in `std` as a dependency, which is undesirable for
> driver crates. Setting `crate_attrs=["no_std"]` is a direct fix for
> this.

I think I understand. Setting `crate_attrs=["no_std"]` is a no-op in the
absence of `sysroot_src` but required for correct behavior in the
presenve of `sysroot_src`. Do I have that right?

> 
> I could split this series into two separate patches, but I prefer to
> keep them in the same series. I think a standalone versioning
> infrastructure patch would be unjustified in isolation without an actual
> consumer of that logic.
> 
> > Is this broken today?
> 
> If we enable `sysroot_src` without `crate_attrs=["no_std"]`, users with
> a fairly new rust-analyzer release would see, for example, auto-complete
> suggestions for `std`.
> 
> To provide full context, here is the sequence of issues:
> 
>   1) Inherent impls for primitive type have been broken in recent
>      rust-analyzer releases.
>   2) To fix 1), we need to enable `sysroot_src`. There are also other
>      reasons reported by Eliot to enable it, as we know.
>   3) A new problem emerges: rust-analyzer thinks we have `std` in the
>      kernel driver crates.
>   4) To fix 3), we need to use `crate_attrs=["no_std"]` alongside
>      `sysroot_src`.
>   5) However, `crate_attrs` is only available in rust-analyzer>=0.3.2727.
>   6) This means rust-analyzer<0.3.2727 would still suffer from 3) if we
>      just use `sysroot_src` + `crate_attrs=["no_std"]`.
>   7) We need an infrastructure to conditionally include both
>      `sysroot_src` and `crate_attrs["no_std"]` based on the user's
>      rust-analyzer version.
> 
> I hope this clarifies the intent.

Oh, this contradicts my understanding. Forgive me if I misunderstood,
but aren't you populating `crate_attrs` above unconditionally? Unless by
"only availble" you mean it is silently ignored by earlier versions? In
that case this all makes sense.

> 
> > > @@ -432,6 +435,18 @@ def generate_rust_project(
> >
> > I think you forgot to define RaVersionInfo.SUPPORTS_CRATE_ATTRS?
> 
> Yeah, interestingly, mypy didn't complain about this. I'll fix it in
> v5.
> 
> > > [ ... skip 7 lines ... ]
> >
> > This bifurcates the handling of RA version differences: half of it is encoded
> > in RaVersionCtx, and the other half is here in the presence or absence of
> > "sysroot_src". Can we keep it somehow more contained?
> 
> Fair point. Actually, the presence or absence of `sysroot_src` should
> depend on `manual_sysroot_crates`. To keep things more self-contained,
> I think it would be better to embed `RaVersionCtx` directly into
> `RaVersionInfo`, since the values in `RaVersionCtx` are solely
> determined by the version.
> 
> I'm thinking of something like this:
> 
> -------------------------------------------------
> @enum.unique
> class RaVersionInfo(enum.Enum):
>     DEFAULT = (
>         datetime.strptime("2024-03-11", "%Y-%m-%d"),
>         (0, 3, 1877),
>         (1, 78, 0),
>         RaVersionCtx(
>             use_crate_attrs=False,
>             manual_sysroot_crates=True,
>         ),
>     )
>     SUPPORTS_CRATE_ATTRS = (
>         datetime.strptime("2025-12-22", "%Y-%m-%d"),
>         (0, 3, 2727),
>         (1, 94, 0),
>         RaVersionCtx(
>             use_crate_attrs=True,
>             manual_sysroot_crates=False,
>         ),
>     )
> 
>     def __init__(
>         self,
>         release_date: date,
>         ra_version: Version,
>         rust_version: Version,
>         ctx: RaVersionCtx,
>     ) -> None:
>         self.release_date = release_date
>         self.ra_version = ra_version
>         self.rust_version = rust_version
>         self.ctx = ctx
> 
> # ...
> 
> def generate_rust_project(version_info: RaVersionInfo, ...) -> RustProject:
>     ctx = version_info
>     rust_project = {
>         "crates": generate_crates(ctx, ...),
>         "sysroot": str(sysroot),
>     }
> 
>     if not ctx.manual_sysroot_crates:
>         rust_project["sysroot_src"] = str(sysroot_src)
> 
>     return rust_project
> 
> -------------------------------------------------
> 
> This allows us to remove the if-else branches and the `assert_never`
> check altogether.

Looks reasonable to me. I'd rename DEFAULT to MSRV. Its value should be
the new MSRV which is 1.85.0.

> Best regards,
> Jesung


