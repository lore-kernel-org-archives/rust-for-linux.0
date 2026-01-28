Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645323ED5B;
	Wed, 28 Jan 2026 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632419; cv=none; b=kpDQjk6MZkTsUKthSNPohYfVMO/ZDkmorsr1YdnpL1+nLoS5UhJIbN2CKQ0RqumM7rwUl4JlEuv8j/yTdBwEMl/B4q3MuYKeHOeUUvW2pVtcgVI9MHmmRc2P0eO3IAVXCwSAdBxoDbFOXS0gv8x+ow2BtF27hAkgci/0LAVqggI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632419; c=relaxed/simple;
	bh=KelgtYQwasZw0N6+6oEDu2iZxgNIj8PjDW16xvh3y30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fmPnd6V2sxkzU8zrzR0dsmKOvXS94d3yNG08/91V4ignhDWYQyEESZRjnFLpZn70fKK9G8yBYq67yyiHiH2MgzZFn/XpWEgC9LTMeSCeP0d1LBAsDtmckFjdnfvEB6senGsszIzU/PXXU/I7cfOODaZg9Kg9OquzqQZbwAYnPMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vw7pdGCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vw7pdGCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C45C116C6;
	Wed, 28 Jan 2026 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632418;
	bh=KelgtYQwasZw0N6+6oEDu2iZxgNIj8PjDW16xvh3y30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vw7pdGCen8iPBYHjP7Lb+7j8E+/PPU86ys/p2M/27xd9xezdkGsln5mKOSEMexS6j
	 SgUkO2g7GsL3CRkxILKzBRhgTpXBDGrFn7ngj/2um7zEkes7NMGh8mVaOP7WGpc9FF
	 R2r8CPzSj9BKx2t9dWyKLQwgkXeZ1UM8hKj29EUhhNx8VcEZ9pkoBR8N3fudW6wWu/
	 nxxgP+x9ZAepcS4laXeApmasjwwsboVYlck77z97PrkLyyhNvVQ7hr+5ltAQuYQWUl
	 6PtQ5id0K/fpi61qYZtnNMOsPWsUFcglsfdsPaDFdnUwX3wjceLHp6LiUh8i/OvoD7
	 brKrd6I3b57/w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki
 <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: add GFP_NOIO flag
In-Reply-To: <DG0GX23ANI54.2PQM2BL2IKRLL@kernel.org>
References: <20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org>
 <B382G4tglwrTe0BrE4L1X0Gomobzu5_izmtxPTKuVlYvKb4zniLIMTaCMpVikVaqMIUusk_d7I9eZw0iJYFOaA==@protonmail.internalid>
 <DG0GX23ANI54.2PQM2BL2IKRLL@kernel.org>
Date: Wed, 28 Jan 2026 21:33:27 +0100
Message-ID: <87a4xxsciw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Wed Jan 28, 2026 at 7:37 PM CET, Andreas Hindborg wrote:
>> +    /// [`GFP_NOIO`] will use direct reclaim to discard clean pages or slab
>> +    /// pages that do not require the starting of any physical IO.
>> +    pub const GFP_NOIO: Flags = Flags(bindings::GFP_NOIO);
>
> How do you use this? What about abstractions for memalloc_noio_{save,restore}()
> instead?

I use it to allocate memory for backing storage in rust null block. The
allocation is done during processing of disk IO:

                page: Page::alloc_page(GFP_NOIO | __GFP_ZERO)?,

Best regards,
Andreas Hindborg


