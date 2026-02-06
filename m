Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B312FB085;
	Fri,  6 Feb 2026 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373011; cv=none; b=KataRGH6R40DaPctPCdJdVUXXu+sqww9yVRLkLnCHZsXH3P0512XvZOZmiemxErNztI1WspObnpGRgkaWDiF/n/ZdVbRonZu0tmL2km4at91Q1DbuCsXi/vEEVR8GBMwYVQCk0nAM70hwzXlPg8ygd8ubEEIDkhk4842ZvNrXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373011; c=relaxed/simple;
	bh=uWFvkPo2jAVmYgug3FLkwIosXWlv9dOkXenRhtzUySI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=MZpWtEWKKczC4QOvGGwJ3p6RQkYJwma5Uekd/HovYQGUlITCYCE6bqPDaY9N7gqSABd6DVejjlTz6/7W6v9IFPSnUGgYShUr7lBSOMlQt0fsip4rNCf4xc7qDl4anWtf7MDVpDcqw/q0FtT/gF36MsBuCP6DajJq7fudzVi/ds8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oh8BuHVR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oh8BuHVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6E4C116C6;
	Fri,  6 Feb 2026 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770373010;
	bh=uWFvkPo2jAVmYgug3FLkwIosXWlv9dOkXenRhtzUySI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=oh8BuHVRk+pnoBdLUE5n/9xMy3O7NJUNGHP5G59cqkM0KQ296EUV7DabvrkB2dvPJ
	 qPFlDLcr2tdXRTrPsB5HAbgyUv3Tow7eJAewCq+npGu411Eci4GJjGJPXQ2eL7yvD8
	 J8QszSJgFOyVUycDMht9jjA4p06UnLOcfeC47EN95c+B4SWnLw1nhJC2ICxoXSixEr
	 QwHLWkTvTOfaCr8Q5xWYBMeGP7e1shlqQjhTt7sPbE2NsCZylDwuioG1iu90TRvQGi
	 X6Cigam6O6fFz6W0ax6IHWX2SrEoS8CQLT99OmsQefSBT+6c6/pNJ+2yx2NinytdF0
	 fn+kSvKWuDrBg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 11:16:46 +0100
Message-Id: <DG7SURIB90VK.1B71FGJR6U5GZ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: <phasta@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
 <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
In-Reply-To: <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>

On Fri Feb 6, 2026 at 10:32 AM CET, Philipp Stanner wrote:
> Who needs fences from another driver?

When you get VM_BIND and EXEC IOCTLs a driver takes a list of syncobjs the
submitted job should wait for before execution.

The fences of those syncobjs can be from anywhere, including other DRM driv=
ers.

> I think we should go one step back here and question the general
> design.
>
> I only included data: T because it was among the early feedback that
> this is how you do it in Rust.
>
> I was never convinced that it's a good idea. Jobqueue doesn't need the
> 'data' field. Can anyone think of anyone who would need it?
>
> What kind of data would be in there? It seems a driver would store its
> equivalent of C's
>
> struct my_fence {
>    struct dma_fence f;
>    /* other driver data */
> }
>
> which is then accessed in C with container_of.

Your current struct is exactly this pattern:

	struct DmaFence<T> {
	    inner: Opaque<bindings::dma_fence>,
	    ...
	    data: T,
	}

So, in Rust you can just write DmaFence<MyData> rather than,

	struct my_dma_fence {
		struct dma_fence inner;
		struct my_data data;
	}

> But that data is only ever needed by that very driver.

Exactly, this is the "owned" type that is only ever used by this driver.

> They are *not* a data transfer mechanism. It seems very wrong design-
> wise to transfer generic data T from one driver to another. That's not
> a fence's purpose. Another primitive should be used for that.
>
> If another driver could touch / consume / see / use the emitter's data:
> T, that would grossly decouple us from the original dma_fence design.
> It would be akin to doing a container_of to consume foreign driver
> data.

Correct, that's why the suggestion here was to have a second type that is o=
nly

	struct ForeignDmaFence {
	    inner: Opaque<bindings::dma_fence>,
	    ...,
	    /* No data. */
	}

i.e. it does not not provide access to the rest of the allocation, since it=
 is
private to the owning driver.

This type should also not have methods like signal(), since only the owner =
of
the fence should be allowed to signal the fence.
