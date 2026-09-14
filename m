Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA33D7D82;
	Mon, 14 Sep 2026 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383593; cv=none; b=QoTxmgd5/LA8c7OqQ04T/37oCBqa+bKt/pKgh+PddNKcBtVZUtZ+XlyMFNlOOHLmOI7Gvhx22lxyKl5RY/RaE+44Yt+0COuvfVWdoZigrF+Lo7ppuFB6H+gQ/fDQ9F9a9QVpPnJIUvbQ8emhEMrWc8C4JyJGp7d1UL8MMZKA74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383593; c=relaxed/simple;
	bh=wUSWOAwuv8WbftY13eJFY7cdsmtZr8wHtpJzTjHjQ/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=efdFGDBvXP1xBdwe3dLlmKffZOJcVnJpCBMzaWTm9HtLdoG0NzQ8aX9REQi87kSpnLxC5CcO0bXDF8HgweJGxknWWMw3lt55uaZlIIrB84joiRRehAZOvM5AaCOAlKrAWUTGnEgN4dTm2ReW53L9KjlLMso8qT3rp0owLZUE+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBL5qrZj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBL5qrZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23AD1F000FF;
	Mon, 14 Sep 2026 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789383586;
	bh=x2TjAAutncf4ENJcUmccneQn3Qg+/E7cvgwW0tmXPMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EBL5qrZjbspf5FkLQhjiVy7hzqgCmL59PoJuMGnaWKDfZlptnSGuagixTWHt3lyUu
	 2k1VsTlu+pP1HI2Hl1O5fmH1dHU3tzjH01zfnCF85kh0irtERdNHBBgYu7V1pMLawG
	 PUs50NoRsmuPbKy9gpjPX0+al4tGAWc/25XUwLeARG8VD7W2lFUrXLRZLmWo5yueXV
	 lJyzphuH5oudrbRRYFRXqrstGxHQAgQ7fEfayZsaZGj3nEHWDZIz/5hwPmeqN7fcX+
	 qnfNpIOdWBx+CSYP5wSDIw6UjUXGkKtOVBS8eMu4du0YpQ80pxF8KbjDkjS0pxW6CF
	 zJ9lItFesuZ1Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Yilin Chen <1479826151@qq.com>, ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yilin
 Chen <1479826151@qq.com>
Subject: Re: [PATCH] rust: configfs: require Send data for Subsystem
In-Reply-To: <tencent_05937A22D2DA2BAE808EF19E491AA109BC09@qq.com>
References: <ImeI6ab12UCXAZVW3-KRxc7AELF-et3TKlpmchMSeMieBMVekE65n2sM9LYa_WyA8qkaiWeN-9_zkIFlad047Q==@protonmail.internalid>
 <tencent_05937A22D2DA2BAE808EF19E491AA109BC09@qq.com>
Date: Mon, 14 Sep 2026 12:59:38 +0200
Message-ID: <87v788t7xh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Thanks for the patch.

"Yilin Chen" <1479826151@qq.com> writes:

> Subsystem stores its data by value, but its blanket Send implementation
> did not require the data to be Send. This allowed a configfs subsystem
> containing a non-Send value to be transferred across threads.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Should.20add.20Data.3A.20Send.2FSync.20bounds.20in.20configfs.3A.3ASubsystem.3F/with/623719979
>
> Fixes: 446cafc295bf ("rust: configfs: introduce rust support for configfs")
>
> Assisted-by: Gpt-5.6 Sol
>
> Signed-off-by: Yilin Chen <1479826151@qq.com>
> ---
>  rust/kernel/configfs.rs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index cd082b83e9e7..f8ca5fc03bf1 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -135,8 +135,9 @@ pub struct Subsystem<Data> {
>  // SAFETY: We do not provide any operations on `Subsystem`.
>  unsafe impl<Data> Sync for Subsystem<Data> {}
>
> -// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads.
> -unsafe impl<Data> Send for Subsystem<Data> {}
> +// SAFETY: Ownership of `Subsystem` can safely be transferred to other threads
> +// if its data can be transferred as well.
> +unsafe impl<Data: Send> Send for Subsystem<Data> {}
>
>  impl<Data> Subsystem<Data> {
>      /// Create an initializer for a [`Subsystem`].
>
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac

Re our discussion on zulip [1], I think your observation is correct, but
there are a few more issues we should fix:

- AttributeOperations: require AttributeOperations::Data: Sync. This is the
  point where the user implements a method that receives &Data from a
  foreign thread, so the requirement is visible close to the use site.

- GroupOperations: add Sync as a supertrait, since make_group and
  drop_item receive &self the same way.

- Change type GroupOperations::Child: 'static; to
  GroupOperations::Child: 'static + Send;, because release drops the
  child group on an arbitrary thread. The child's own Sync needs are
  already covered by its own AttributeOperations and GroupOperations
  impls.

- Update the SAFETY comments on the FFI callbacks that call
  get_group_data to cite these bounds as the justification for handing
  out &Data on this thread.

An alternative is to put Data: Sync on Subsystem::new and Data: Send +
Sync on Group::new. That is simpler but less precise, and it does not
document the requirement next to the trait methods that receive the
reference. I prefer the trait-level bounds.

Can you send a new version with these fixes?

Best regards,
Andreas

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Should.20add.20Data.3A.20Send.2FSync.20bounds.20in.20configfs.3A.3ASubsystem.3F/with/623192434

