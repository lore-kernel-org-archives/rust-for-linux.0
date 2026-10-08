Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929637F00B;
	Thu,  8 Oct 2026 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476439; cv=none; b=Csgso9le46cljKK8HFqHGyny5fH+dJfJ9k22/S88kSP7Vr4XYjUwuyGqwriVrhjInzcpOEE2zxN6cRICHaxUXmf/Op8ENA6tDVy6A5kv6V0LQhdS2VHbO+exs7KVu0r1Gg8FbQ/ZkMyx8r+1aXchsUrrBJ9SrWc7+pzm4b6ZJuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476439; c=relaxed/simple;
	bh=oPSoHQ11ypAaPIABhCAiopDIiWX2jJ7dOM3XZSrV2KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMRRUNRJiTbUiyhJ9Za7kzaOiEWHbuRiKc5RccgniaTCBRb0iiakAVLSfBmgsMvLNDJPMb93K2g25VWkx3pVFZIb76dXtNqf1tOnxocX7z4gmn4VKRmI8GlhPs23XD6iJcPqwOGuf9RRijhIP7cou2FpLDTsBXX5HrbcVlKEfEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9+ebnQ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9+ebnQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E726D1F000FF;
	Thu,  8 Oct 2026 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791476438;
	bh=GhgR7sVBa9F7DYQR42UbZ7EhITytWRRblc/gZbB4/UY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h9+ebnQ6cQfaZ8H/x2avih2jhPtg5/x/xSGXwlkNRi477tiX322vlWq5cwZW7Gy2M
	 oWJ8q6MiAJJHJyGpVYCaTgx/jULR0y0rcxvXj924UdYEoNjcFLOLiztebyrNGx8LPN
	 ELBAqbN0DcXEeuuKhRrxK0nza1gGTpqzK0Um5LwY8LXuyykCUQLHHbKuiazzb7Z9cb
	 l8pIT+wtvLIN2PVMo9zLv1LEpApw7kCHyiu5Z/DOWmD0YKf3B4oZCl5f29oS8riw8a
	 FTm8CXWzAVq8/yfuATp60RXey3ASKTdz5YNMWvWRTaw2EFfb2C4syZib7o+78he86T
	 zLapVEVr+/DtQ==
From: Benno Lossin <lossin@kernel.org>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH 00/20] rust: pin-init: create self references safely
Date: Thu,  8 Oct 2026 17:20:31 +0100
Message-ID: <20261008162031.158761-1-lossin@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
References: <20261008-dev-selfref-v1-0-6c1eb269fe57@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Oct 2026 14:23:47 +0200, Gary Guo <gary@garyguo.net> wrote:=0D
> This is a big series that add support for one field to reference a siblin=
g=0D
> field in a safe and ergnonomic way. Unlike many other crates in the=0D
> userspace Rust ecosystem, no additional allocation is required, thus it=0D
> requires the struct to be pinned, which is exactly what pin-init provides=
.=0D
> =0D
> This is a very powerful feature, and thus can raise concerns about whethe=
r=0D
> it is sound. I spent a lot of time studying the rules to make this sound,=
=0D
> and presented durirng Kangrejos [1].=0D
> =0D
> The simple use case looks like this:=0D
> =0D
>     #[pin_data]=0D
>     struct MyDriver<'bound> {=0D
>         dev: &'bound Device,=0D
>         #[pin]=0D
>         irq: irq::Registration<'bound, MyIrqHandler<'bound, 'bar>>,=0D
>         bar: Bar<'bound, BAR_SIZE>,=0D
>     }=0D
> =0D
> You simply need to mention a lifetime that shares the name with the field=
.=0D
> There are more advanced use cases which require annotations like=0D
> =0D
>     #[uses('bar: invariant)]=0D
> =0D
> to explicitly declare that the lifetime is used in invariant manner, and=
=0D
> also=0D
> =0D
>     where=0D
>         exists<'dev>: 'a=0D
> =0D
> to create new existential lifetimes as a way to erase invariant lifetimes=
=0D
> that would otherwise bubble up to users. More info can be seen in my=0D
> Plumbers slide [2]. Note that the syntax for explicit variance annotation=
=0D
> has changed following discussions during Plumbers.=0D
> =0D
> The initial plan was to upstream the simple use case only and iron out th=
e=0D
> advanced features subsequently; however it turns out that DRM jobqueue=0D
> would need the variance annotation feature, and Nova `Cmdq` would need to=
=0D
> use the existential lifetime feature.=0D
> =0D
> During Plumbers the upstream schedule is discussed, and instead it was=0D
> agreed that all the features should be upstreamed at once, but the usage =
of=0D
> the advanced feature usage limited to the pre-agreed users only to limit=
=0D
> the blast radius in case the feature needs to be reworked.=0D
> =0D
> Detailed documentation about the pin-init self-reference feature would be=
=0D
> added the following cycle, when the usage of them become more clear.=0D
> =0D
> The pull request on GitHub [3] has a bunch of test suites, which are not=
=0D
> synchronized to kernel tree.=0D
> =0D
> Link: https://kangrejos.com/2026/Self%20referential%20pin-init.pdf [1]=0D
> Link: https://lpc.events/event/20/contributions/2498/attachments/2200/485=
5/presentation.pdf [2]=0D
> Link: https://github.com/Rust-for-Linux/pin-init/pull/181 [3]=0D
> Signed-off-by: Gary Guo <gary@garyguo.net>=0D
> ---=0D
> Gary Guo (20):=0D
>       kbuild: rust: allow `clippy::comparison_chain` globally=0D
>       rust: pin-init: internal: pin_data: infer self-referential struct=0D
>       rust: pin-init: internal: pin_data: rewrite fields that borrow othe=
rs=0D
>       rust: pin-init: internal: pin_data: pin borrowed fields with wrappe=
r=0D
>       rust: pin-init: internal: pin_data: teach drop check about generics=
 that cannot dangle=0D
>       rust: pin-init: internal: pin_data: self-referential drop order che=
cks=0D
>       rust: pin-init: internal: pin_data: check covariance of self-refere=
ntial fields=0D
>       rust: pin-init: internal: pin_data: implement initialization of bor=
rowed structs=0D
>       rust: pin-init: internal: pin_data: project self-referential fields=
=0D
>       rust: pin-init: internal: pin_data: add `with_project` method=0D
>       rust: pin-init: internal: pin_data: enable self-referential support=
=0D
>       rust: pin-init: internal: pin_data: allow lifetime to be shortened =
per field drop order=0D
>       rust: pin-init: internal: pin_data: parse explicit `#[borrowed]` an=
notation=0D
>       rust: pin-init: internal: pin_data: support mutable borrows=0D
>       rust: pin-init: internal: pin_data: parse explicit `#[uses]` annota=
tion=0D
>       rust: pin-init: internal: pin_data: make field lifetime invariance =
imply type invariance=0D
>       rust: pin-init: internal: pin_data: complete invariant borrow suppo=
rt=0D
>       rust: pin-init: internal: pin_data: perform AST lifetime replacemen=
t if possible=0D
>       rust: pin-init: internal: pin_data: support shared projection=0D
>       rust: pin-init: internal: pin_data: support existential lifetimes=0D
> =0D
>  Makefile                               |    2 +=0D
>  rust/pin-init/examples/selfref.rs      |   60 ++=0D
>  rust/pin-init/internal/src/init.rs     |   42 +-=0D
>  rust/pin-init/internal/src/pin_data.rs | 1556 ++++++++++++++++++++++++++=
+++++-=0D
>  rust/pin-init/internal/src/util.rs     |  268 +++++-=0D
>  rust/pin-init/src/__internal.rs        |  357 +++++++-=0D
>  rust/pin-init/src/lib.rs               |    1 +=0D
>  7 files changed, 2238 insertions(+), 48 deletions(-)=0D
=0D
incredible work, Gary! when you first told me about this, I didn't=0D
imagine that it would look this clean from the user's side. I sadly am=0D
unable to take a detailed look at all of the patches. but we've talked=0D
extensively about the design; so I'm sure we'll be able to fix all bugs=0D
that pop up:=0D
=0D
Acked-by: Benno Lossin <lossin@kernel.org>=0D
=0D
just for the record: I think that users of this feature should come=0D
gradually. that way, fixing any issues (if there are any :) will be much=0D
less stressful, since there are fewer places to fix. we've discussed=0D
this and also mentioned it to Miguel. additionally, it would be great if=0D
users would take a careful stance when using this feature. I'm not=0D
worried, just cautious, since an unsoundness hole here could end up=0D
being extremely ugly to fix and require re-architecting the users.=0D
=0D
once again, great work!=0D
=0D
best,=0D
Benno=0D
=0D
> ---=0D
> base-commit: 0d9aa4b994379c6e0099737221ed421deb7e1a31=0D
> change-id: 20261006-dev-selfref-27c37abfa849=0D
> =0D
> Best regards,=0D
> --  =0D
> Gary Guo <gary@garyguo.net>=0D
