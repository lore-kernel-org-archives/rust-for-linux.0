Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397DC27147D
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Jul 2025 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370765; cv=none; b=pi4tGC82m9SU8na611KbEUpPrtw+owKOICPToOAkkCjr9Q5V6kxsq9uEeKt1+OJCgWS8L5xA7rRUQb3CFbJh47EO1E/sPBILN3X2guIu/Uey6EaOg3f9e384Ly3NmHbjNPsDMrHBiP5amF8fjIXom81ccF4l+/t6f8BH4fkbpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370765; c=relaxed/simple;
	bh=jrHyPTE0Cbbg51nU/1dDVkkk444gMusx+i7f5CaT3BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpCrm0gO+MpvRs98QyIbDwQgPKtXotBDc4kHuftitSW0mkEyuqKdLJOlXueZTEqMc5DQok87WG8FZdlVkz5TKZsHlCA4Nwq9ZBW9V2Ig0kY+Bf9LL7cMOJG9OgYfxdbyXuV3lKCM8BI1G2I4gdF/5Q0Au3ZpYiyMi5DlYp64YvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZ+VDBVv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZ+VDBVv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3628922f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jul 2025 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751370762; x=1751975562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veoFO+1wdpPDWz3qRkvkxT3szkUu/z2wjkK1DneZyWM=;
        b=UZ+VDBVvIPiPg+KusvlM1G13dxaBGmTxAHDPOhozNVmQ4QQaMCKXI44cJTUy4z/E4H
         mGYecZsXg0KR7EJ4BM7G5VibZne/WSo1NpG1yM+s3+4p22UL+IXiEgXdWdi9utxWUE8K
         DoIwmqth+I8ukbb57iVMTu+/d3HgdEYtqO11xBTA9JKciT2O4EWiAj62f973pT0ZZmOY
         mUGJSaS5DJnLoCsLUd1KWqo4BN2vs3m/Ur4NZ80lX1NeY5Jq0Ter+QAmfYVDTP2lePgf
         0Ini4agqU+8AuCsFBgVvfW4vEUab9Pi4uZyFC2jOtmH3way9Z/4wMDIU/y9fWL8bK4H+
         OQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370762; x=1751975562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veoFO+1wdpPDWz3qRkvkxT3szkUu/z2wjkK1DneZyWM=;
        b=Vi2eWNSZu2mY8YFqwwzohRCDxYfPwj0GK1Xvzk1zBf6pcV0q6JZPkbQslUYFmxxsAp
         xSzSgOb8bFRUR1VA5QQNVrFS6OI56WgLPDElV5LLugyDZCyAdKKejokeoAbODrTDfv9U
         NsvvIspGIhfKgWYNhiGTFqJYABS5t4QK9m0WXwFxVX+0wU8/8HLcGdFik9ihhl3TCks6
         s96FNTPd+F09/Vs7nX+41hcCPLjnjMFa5p/XGL6vlmey99JKkSzUQbGMUbYBSuBuppON
         c4N38vlTjuiaZqbuSXO+MVqzGbrvmBIf6ki981ZNDaaC7E+cKgSL67eg1rl5Em/09tQ9
         5pJA==
X-Forwarded-Encrypted: i=1; AJvYcCVTZtwQ4oZ4C+AE1CGwDfMlEP1F2bs6jvGaGBhYADysqAjJO9qi5hGtWcm7Qpq2dUaf7mCgZNySe1ZJ5Zv31Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSP6w/a87RWTlhAv7zwyjJukdJaX1KNKdHYn2ecdNEroO4f5hQ
	VeX/n+hFhI2RIQkGhH5AyqWoM4J1d0JdMjt34oWie/0Mpurf4/G6rQfmL4wptphQtHLcp2ZLlzR
	Y+U/35aNw3E2jD+UoLB4D4Wa/e6koDK7RqrR2/Kd5
X-Gm-Gg: ASbGncvW/L1wKvAkRjDY1Fqa+ZY1UH9oOhxnetcZBTt8HxqABxpSfGvvmZL/3gnBbzR
	V97GgJuttyLnGiLDW3wr3EQBSfEeCoACwprNv3rYACB215caMAyoqmdch4K/ZZTYsQvBbZRkpVd
	k55aP85CuNy18Fq1hAkErII/aCpSDWLjjtJChrpmJdGmlhDcuUsKf3B/Y=
X-Google-Smtp-Source: AGHT+IFUlJySjsgWCyutnog4gDVqPy3/yBi31gYRy/p63NPCINHZ/bW019+CCuJmHTVh0LKrHnBPA0F6FZ0BNIhxi30=
X-Received: by 2002:a05:6000:2188:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3a8fdb2acd9mr11587808f8f.7.1751370762366; Tue, 01 Jul 2025
 04:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221640.3325306-1-vitaly.wool@konsulko.se> <aGO5qadROziFuO35@google.com>
 <3D58CB40-CB1C-47A2-BB71-5C32B3609AE0@konsulko.se>
In-Reply-To: <3D58CB40-CB1C-47A2-BB71-5C32B3609AE0@konsulko.se>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Jul 2025 13:52:29 +0200
X-Gm-Features: Ac12FXzcpTlny4SSlNLGwk5zd2CXwwCXOFc_w3xt_vRf8kazpRdDDaXsreX05Ek
Message-ID: <CAH5fLghKvWgaVT_=TYpwqBJ4z_XYDbT8kbLvkxAT95+Sjg5zYg@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] rust: add support for NUMA ids in allocations
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:19=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.se=
> wrote:
>
>
>
> > On Jul 1, 2025, at 12:34=E2=80=AFPM, Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > On Tue, Jul 01, 2025 at 12:16:40AM +0200, Vitaly Wool wrote:
> >> Add a new type to support specifying NUMA identifiers in Rust
> >> allocators and extend the allocators to have NUMA id as a
> >> parameter. Thus, modify ReallocFunc to use the new extended realloc
> >> primitives from the C side of the kernel (i. e.
> >> k[v]realloc_node_align/vrealloc_node_align) and add the new function
> >> alloc_node to the Allocator trait while keeping the existing one
> >> (alloc) for backward compatibility.
> >>
> >> This will allow to specify node to use for allocation of e. g.
> >> {KV}Box, as well as for future NUMA aware users of the API.
> >>
> >> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> >
> > My main feedback is that we should consider introducing a new trait
> > instead of modifying Allocator. What we could do is have a NodeAllocato=
r
> > trait that is a super-trait of Allocator and has additional methods wit=
h
> > a node parameter.
> >
> > A sketch:
> >
> > pub unsafe trait NodeAllocator: Allocator {
> >    fn alloc_node(layout: Layout, flags: Flags, nid: NumaNode)
> >                -> Result<NonNull<[u8]>, AllocError>;
> >
> >    unsafe fn realloc_node(
> >        ptr: Option<NonNull<u8>>,
> >        layout: Layout,
> >        old_layout: Layout,
> >        flags: Flags,
> >        nid: NumaNode,
> >    ) -> Result<NonNull<[u8]>, AllocError>;
> > }
> >
> > By doing this, it's possible to have allocators that do not support
> > specifying the numa node which only implement Allocator, and to have
> > other allocators that implement both Allocator and NumaAllocator where
> > you are able to specify the node.
> >
> > If all allocators in the kernel support numa nodes, then you can ignore
> > this.
>
> This is an elegant solution indeed but I think that keeping the existing =
approach goes better with the overall kernel trend of having better NUMA su=
pport. My point is, if we add NodeAllocator as a super-trait and in a fores=
eeable future all the Rust allocators will want/be required to support NUMA=
 (which is likely to happen), we=E2=80=99ll have to =E2=80=9Cflatten=E2=80=
=9D the traits and effectively go back to the approach expressed in this pa=
tch.

If we are not going to have allocators without numa support, then what
you did is reasonable. Though in that case I would consider just
changing the existing methods instead of having methods both with and
without a numa node argument.

Alice
