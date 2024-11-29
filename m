Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74314F135
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873329; cv=none; b=qkQjYDo2aXKAJvquFpx1EqVEncjk+h/mh8kDQVP16Uv7zDmGwMXa8NHprfeCrrnNwyJVGe5Wj2xttHuknl2BMaEX/BCe/6iRgvm9tzcSvfqt+QXXw0azZmC3ioBJIBpa+U/HcIgxIA+dmS/4Dzatdf5Zr7N4a3CPxnFhOJaLzIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873329; c=relaxed/simple;
	bh=xC3TBC3hXDQtRMMLwHaC2Yx9WYQVsimtRWH+4eR5vK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6ihj3hB1SKKNhHVeg+euH5LNOx/MIcT2+4rIXrXwAFtWsRLXbD3Zu02dvu7YLKeIkA7k++155R80wwRv9eqqmcFBQkD1qDaeKxRl9ZJ8bxKmZOR39gfERyXHZEMpmSmHhC4SKQ1acfNJcyQX3Oyw9+R4pphWnZsUqoPBIALAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0c52VNuO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0c52VNuO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so15093945e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 01:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732873325; x=1733478125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCya0V2ouJjFIBaqKyJ8rlrVuDCrvVqJzJ78/+Hkl4w=;
        b=0c52VNuOrPSgIl5S8eXmO+8Vm8/sxzRh1nNOY1qhSK1AiYRTtgIWWQPN9QqQJA8H++
         FTgT44PTX+BLBxbGQsfKGDduMmarc4kmTmX6Qns5FiaFzK6oiLeqPBrBAf5Wu2a/gM3I
         839R90fQFGIFkhPZrHlrQpTpZD8H/KDKTaRtmDob1UYYjSCxnGx/ERmDKptQxqAogxlv
         xFS6lgQNV2l5koAAVwQu3dYTT61hwxbKe3canDAYvoLKkpzU8M/YgV8qnx8q2fC7jNkw
         VL8YwzE8Ky4JxH6c1amzu4RQ2OaibvNemMwxJjJKv2GhIX3F6xAdccv2Au6ml5HL6cnY
         gGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732873325; x=1733478125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCya0V2ouJjFIBaqKyJ8rlrVuDCrvVqJzJ78/+Hkl4w=;
        b=IlsLrFwaOToCfTQkujztzmhwZTj9UC2Hr9+Elw4TbIhzrtgOOp5JQg4+sR0VB385/d
         Kaeq17eXFjOQEpNMY2zbbNPyWrBZ3QdIcU9iLvFHCcVkRPsWSDD241gc87C0OmqZau1N
         /CThKjaoDUB/crZ7vj8U10451H7XHndeiIyqQPDtbMNFq7py4Ec7/yamILkdZU8YqekF
         eIMNW0za7Rz0sNflIlEakOoTUdiBbISEcrZ/2HLskdfHq+XN0OnILfblVoaicvCiz2x6
         4sSUUOQD/sF5R0adRItXr+EMAEUP44w9ba6/4vH7Mkz+VAZoxb1PV0XCRcEk1cLmpJXR
         En6A==
X-Gm-Message-State: AOJu0YxouAl7WtaPScEOR05+AeKucvOJjJCzkhTZqyzxfwz/Yi9ogY1l
	5q97cbWRqK0paVfAnsCP8VfjbZhKab+jf09Lx7dwGrAa80manAWhuJcfu+YmujT+VX+43myoZKs
	j6Y0I86Ugt+TEcRsw4LrRDhpAGuk7XESK0S+t
X-Gm-Gg: ASbGncvB3C2+AoOB3cbo9WMg/vlhfZ+5sgBpm6VnMsnn4mNHa9q9sh6BHKw2EDL6gVG
	goiOfX6iFPpnsSSfcKlwBuXRuBgBHZ3tFLdCttD6VbKIl6GE05+wLv0dqOLQAGg==
X-Google-Smtp-Source: AGHT+IE9/TgAZVKCU5TDmSXossBwgPrlUoxMO11jrwBXUmpCqnfqprE/r7XZr8dFH04PAocSUQRrR43EoUB/tAuRFhE=
X-Received: by 2002:a05:600c:5101:b0:434:9dfe:20e6 with SMTP id
 5b1f17b1804b1-434a9df71c6mr87366995e9.23.1732873325500; Fri, 29 Nov 2024
 01:42:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128141323.481033-1-pbonzini@redhat.com> <20241128141323.481033-3-pbonzini@redhat.com>
In-Reply-To: <20241128141323.481033-3-pbonzini@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 Nov 2024 10:41:53 +0100
Message-ID: <CAH5fLgi9+d6PwZdU23xcF0p+m6mja3Dx8BufiiM-ZgLtDSqQDw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: block/mq: replace mem::zeroed() with Zeroable trait
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	boqun.feng@gmail.com, ojeda@kernel.org, benno.lossin@proton.me, 
	axboe@kernel.dk, tmgross@umich.edu, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, alex.gaynor@gmail.com, a.hindborg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 3:13=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> Isolate the unsafety in the declaration of the Zeroable trait, instead of=
 having
> to use "unsafe" just to declare a struct.  This is more similar to how yo=
u would
> use "..Default::default()" (which is also a possibility here, but arguabl=
y
> less efficient).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/kernel/block/mq/gen_disk.rs |  8 +++++---
>  rust/kernel/block/mq/tag_set.rs  | 10 ++++++----
>  2 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_=
disk.rs
> index 708125dce96a..65342d065296 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -6,7 +6,7 @@
>  //! C header: [`include/linux/blk_mq.h`](srctree/include/linux/blk_mq.h)
>
>  use crate::block::mq::{raw_writer::RawWriter, Operations, TagSet};
> -use crate::{bindings, error::from_err_ptr, error::Result, sync::Arc};
> +use crate::{bindings, error::from_err_ptr, error::Result, init::Zeroable=
, sync::Arc};
>  use crate::{error, static_lock_class};
>  use core::fmt::{self, Write};
>
> @@ -31,6 +31,9 @@ fn default() -> Self {
>      }
>  }
>
> +// SAFETY: `bindings::queue_limits` contains only fields that are valid =
when zeroed.
> +unsafe impl Zeroable for bindings::queue_limits {}
> +
>  impl GenDiskBuilder {
>      /// Create a new instance.
>      pub fn new() -> Self {
> @@ -93,8 +96,7 @@ pub fn build<T: Operations>(
>          name: fmt::Arguments<'_>,
>          tagset: Arc<TagSet<T>>,
>      ) -> Result<GenDisk<T>> {
> -        // SAFETY: `bindings::queue_limits` contain only fields that are=
 valid when zeroed.
> -        let mut lim: bindings::queue_limits =3D unsafe { core::mem::zero=
ed() };
> +        let mut lim: bindings::queue_limits =3D Zeroable::ZERO;
>
>          lim.logical_block_size =3D self.logical_block_size;
>          lim.physical_block_size =3D self.physical_block_size;
> diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_s=
et.rs
> index f9a1ca655a35..1ff7366ca549 100644
> --- a/rust/kernel/block/mq/tag_set.rs
> +++ b/rust/kernel/block/mq/tag_set.rs
> @@ -10,6 +10,7 @@
>      bindings,
>      block::mq::{operations::OperationsVTable, request::RequestDataWrappe=
r, Operations},
>      error,
> +    init::Zeroable,
>      prelude::PinInit,
>      try_pin_init,
>      types::Opaque,
> @@ -32,6 +33,10 @@ pub struct TagSet<T: Operations> {
>      _p: PhantomData<T>,
>  }
>
> +// SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
> +// all are allowed to be 0.
> +unsafe impl Zeroable for bindings::blk_mq_tag_set {}

This will have to be reverted if we want to split up the kernel crate
due to the orphan rule.

Alice
