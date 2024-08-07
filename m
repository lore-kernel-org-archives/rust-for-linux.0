Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FB14D6EB
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 21:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723065793; cv=none; b=dUNi4OQS7SRV1o9zqjLtzrIOv5X0kd22Q3oKprClPq7g4cXu2+8v3Hv5gY+nttzU8Iu+APAgp/WBoyAt6lOfiR7f6p3aqHjEC6lZhC7Gyc5uLrogaWSMBoPdjqRaLJYF72ICORqZ47JI0zrI9Z0wDbAVEf/XsRFXCJ4t2Y2J79w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723065793; c=relaxed/simple;
	bh=p3pjHis6/COI1zY/O5SGsUSb3ei7m7/wigXReUSzACM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sm32GYd7gZrYULnmunI0UwDmRs6SpteSmx6kLcEkYQMOvv8obaUg5KE/FLtP4wA8HH/vR1cyqlVUI3XvXjAvsAkiJRhQH9eO6sJEfv9MkNKP5qqDXl/a3gmwhtFXI30tf+OjZqHHpu7jLfZlXjcqA3c/AvABJmM/W1JN+qLNJaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FAUjXsw6; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FAUjXsw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723065788; x=1723324988;
	bh=ZYp3FbyerYWcaq8Uq45xquBH7mSWC+VI9xQMDrEeGvI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FAUjXsw65kOdHW2JdjUIe43nokNsHamwyk2XrVALtOQLV8yizk87QfLtjiQ7BRTll
	 jLPoQir1BN6aUlfDvAriSyHhTWnYiVucqEuUhnVlkQ1ja85J7eo/5Qc0y4sgdHNqPV
	 q4/CHEAesryREeWVNrn+8TDbAtw7eOaMWx5o6+8MVNl7k0NlDZCMOP320Kje02LkRw
	 tHHeIhvtxC+sM3WG+SQi7wOsWjVwq6KziOQQah3tuLtEwyvi4c/kz78nW3OS8WngTA
	 mNeGdnUOFpqgC9yPXCtTBGTgsT+DUdHJlgFfmUHZ27t7PrwSzHevtTAZeTAG+6mmUG
	 d0gSLc2962vaQ==
Date: Wed, 07 Aug 2024 21:23:04 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 21/28] rust: alloc: remove `GlobalAlloc` and `krealloc_aligned`
Message-ID: <498e0141-8df5-46a7-b891-e1cb754f49e2@proton.me>
In-Reply-To: <20240805152004.5039-22-dakr@kernel.org>
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-22-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 03289486c9ece5d1de07baad5aa1cf5ed473528f
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.08.24 17:19, Danilo Krummrich wrote:
> Now that we have all the `Allocator`s and the kernel `Box` and `Vec`
> implementations in place, remove `GlobalAlloc` and `krealloc_aligned`.

When I try to compile this patch, then I get this error:

      UPD     include/generated/utsversion.h
      CC      init/version-timestamp.o
      KSYMS   .tmp_vmlinux0.kallsyms.S
      AS      .tmp_vmlinux0.kallsyms.o
      LD      .tmp_vmlinux1
    ld.lld: error: undefined symbol: __rust_realloc
    >>> referenced by usercopy_64.c
    >>>               vmlinux.o:(alloc::raw_vec::finish_grow::<alloc::alloc=
::Global>)
   =20
    ld.lld: error: undefined symbol: __rust_alloc
    >>> referenced by usercopy_64.c
    >>>               vmlinux.o:(alloc::raw_vec::finish_grow::<alloc::alloc=
::Global>)
    make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1

So maybe the `#[global_allocator]` needs to stay until we remove the
`alloc` dependency?

---
Cheers,
Benno

> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/allocator.rs | 63 ++--------------------------------
>  1 file changed, 2 insertions(+), 61 deletions(-)

