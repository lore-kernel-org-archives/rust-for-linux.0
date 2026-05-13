Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640A3659E8
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 23:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714413; cv=none; b=V2Uh4rYkpq69l1wGIjW2Eq/nt3AtXILOc+ii0Qu8Ps9yXEdbB4APyDxQmEM8LXd3J9CT3ig7jZDlMM4CgWEbt9qqehXf0nYs5PK1xZOBE/LR/TizcS1xMU+9i6uTDuG8Y8MQ/4psdOImLNmqkPtcwu8XWYuzMqEYmE3wCe7+MO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714413; c=relaxed/simple;
	bh=aCyr6mMpFe+JPlzMZkcsV3765jllo6qBtErrBhYxztE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=uL0jEK5qkfQ7ieu2vtKzowNo8xDx8QtKAChkj1jLD8RlUJNWHPTydD8COOgqwV2SvZxwkmxQ5eUM4ZBwkJRyhAK212d+TCQJL9OMiND50SD71JoxmNzNHQHqhadXWrxF56kMD8IzAuohpnGJzlrz5UQLQFWNlhC8PpgBAhUnnT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDe6Lmjs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDe6Lmjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5984AC2BCB3;
	Wed, 13 May 2026 23:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714413;
	bh=aCyr6mMpFe+JPlzMZkcsV3765jllo6qBtErrBhYxztE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=fDe6Lmjs9iFa+L4+WGZgHsoOYpQGjrpMxjqpbAzdIIT/HptRvue3m4Qhsz/cblstb
	 IF8hqbyZ6wQElVk2sMhnELclT1n0bU5Fp4F5JeDHX2Z+ZGQ/lNAN2J9KP945yrLdLf
	 QP3T1EeeYnEl6c30+AACs2THH2CEVBcL6x721QTVfq74geJCGeahnfaWvORaojMavY
	 ArHBr3ZSQNf7JoKwtb6RQZc7AWXdSkr7bVlTsf1ZTnrYrzLEjEz2ZpoNo4praK/Nz8
	 agSwRA0UtYun66Leawou2QLRhVfK8Km98PmzRhti/QwEb+XfeSk/nRJbFlfke5jbpG
	 JCnGnPm8bsCvw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 01:20:08 +0200
Message-Id: <DIHXMUSMRHYB.39N8PCC9D86KM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 08/13] rust: drm/gem: add GEM object query helpers for
 debugfs
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Alvin Sun" <alvin.sun@linux.dev>
References: <20260326-b4-tyr-debugfs-v1-0-074badd18716@linux.dev>
 <20260326-b4-tyr-debugfs-v1-8-074badd18716@linux.dev>
In-Reply-To: <20260326-b4-tyr-debugfs-v1-8-074badd18716@linux.dev>

On Thu Mar 26, 2026 at 7:53 AM CET, Alvin Sun wrote:
> Add name(), refcount(), is_imported(), is_exported(), and mmap_offset()
> to BaseObject so drivers can expose GEM state in debugfs.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  rust/kernel/drm/gem/mod.rs | 49 ++++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 276ba3c53475d..b6188c8873ece 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -21,9 +21,13 @@
>      },
>      error::to_result,
>      prelude::*,
> -    sync::aref::{
> -        ARef,
> -        AlwaysRefCounted, //
> +    sync::{
> +        aref::{
> +            ARef,
> +            AlwaysRefCounted, //
> +        },
> +        atomic::Relaxed,
> +        Refcount, //
>      },
>      types::Opaque,
>  };
> @@ -177,6 +181,45 @@ fn size(&self) -> usize {
>          unsafe { (*self.as_raw()).size }
>      }
> =20
> +    /// Returns the name of the object.
> +    #[inline]
> +    fn name(&self) -> i32 {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `struct drm_gem_object`.
> +        unsafe { (*self.as_raw()).name }
> +    }
> +
> +    /// Returns the reference count of the object.
> +    #[inline]
> +    fn refcount(&self) -> u32 {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `struct drm_gem_object`.
> +        let raw_refcount =3D unsafe { &raw mut (*self.as_raw()).refcount=
 }.cast::<Refcount>();
> +        // SAFETY: `raw_refcount` has the same layout as `Refcount`.
> +        let refcount =3D unsafe { &*raw_refcount };
> +
> +        refcount.as_atomic().load(Relaxed) as u32
> +    }

How is this reference count useful in debugfs? In any case, please don't ex=
pose
object reference counts, it motivates abuse.

Can't we just prove a common Debug impl for GEM objects instead of providin=
g all
those accessors?

> +
> +    /// Returns true if the object is imported.
> +    #[inline]
> +    fn is_imported(&self) -> bool {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `struct drm_gem_object`.
> +        !unsafe { (*self.as_raw()).import_attach }.is_null()
> +    }
> +
> +    /// Returns true if the object is exported.
> +    #[inline]
> +    fn is_exported(&self) -> bool {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `struct drm_gem_object`.
> +        !unsafe { (*self.as_raw()).dma_buf }.is_null()
> +    }
> +
> +    /// Returns the offset for mmap, or 0 if no offset has been allocate=
d.
> +    #[inline]
> +    fn mmap_offset(&self) -> u64 {
> +        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a va=
lid `struct drm_gem_object`.
> +        unsafe { (*self.as_raw()).vma_node.vm_node.start }
> +    }
> +
>      /// Creates a new handle for the object associated with a given `Fil=
e`
>      /// (or returns an existing one).
>      fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>
>
> --=20
> 2.43.0

