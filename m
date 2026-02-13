Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4273EBF02;
	Fri, 13 Feb 2026 21:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771018490; cv=none; b=sYUkKU6AQSSqAK4s5hWqQkGzxfah+tg/vbOuH/Tvui5pwoZWEvBw/QThqmIwV1MxOdqyuuCMy2+LnQBuAeQTrNB8LmmTUnVzP/Xv7azxloNGYBykPlmdl7jMZyOgX9mKvnL/PYTu0B2EsGzEJXNdOgxdNmY3Q4872YG2ECeFI5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771018490; c=relaxed/simple;
	bh=+w7gihi+oD0zmFHYOyTJRuntNFlfBgEmHjCvNNAPJxE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=KF8qFLY0I+lDg+t1vz2iqS06I49VlH0HRHKDM3xzsM/ZnYmEN4rd2CR4yx7l+m30Je8sA8fqpDFWRT1T/SQtRfZkc4k0U85FXDPJeoO7f7+ivo9Ix/s/ynIU/L4KqZMi2OrMtF3leYye6/mzMBKaIPr8Mtf47d/IDWm9VFC6+Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4yGwHYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4yGwHYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96446C116C6;
	Fri, 13 Feb 2026 21:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771018489;
	bh=+w7gihi+oD0zmFHYOyTJRuntNFlfBgEmHjCvNNAPJxE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=L4yGwHYkWRPYjDHOMOEZr61L73WkVQc1tmydOq9QgHq0QOG85x3OSyewZzPSWadJy
	 4A9tjGV6nT6P9HiQpUb8eDUbjoMu+yZVnVUG0YtCN84R5TUC5wojkvPp/lOFUwZutv
	 CL36QMfOUWfzuNLTE/rq1MmJShEcTh/2Xu2RMdCB8RsD0tnqJVvbf/au/JrEnaLBSM
	 9SJwx3mvnlDrGPB4vgqowDJbPsFwJ3vO+MnF+I+0oKB4FS0/zgVxt7pCynr4HvwHLM
	 5e20FpeVSse8EMrPCr4AqIYVXq5l6OjVz0ADDzcRU5PHW7dOPDLLtcB0gb2rykj1TI
	 pofDs4SygH7tA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 22:34:44 +0100
Message-Id: <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
In-Reply-To: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>

On Fri Feb 13, 2026 at 8:40 PM CET, Tim Kovalenko via B4 Relay wrote:
> @@ -159,7 +158,7 @@ struct Msgq {
>  #[repr(C)]
>  struct GspMem {
>      /// Self-mapping page table entries.
> -    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
> +    ptes: [u64; GSP_PAGE_SIZE / size_of::<u64>()],
>      /// CPU queue: the driver writes commands here, and the GSP reads th=
em. It also contains the
>      /// write and read pointers that the CPU updates.
>      ///
> @@ -201,7 +200,29 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
> =20
>          let gsp_mem =3D
>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KER=
NEL | __GFP_ZERO)?;
> -        dma_write!(gsp_mem[0].ptes =3D PteArray::new(gsp_mem.dma_handle(=
))?)?;
> +        const NUM_PAGES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
> +
> +        // One by one GSP Page write to the memory to avoid stack overfl=
ow when allocating
> +        // the whole array at once.
> +        let item =3D gsp_mem.item_from_index(0)?;
> +        for i in 0..NUM_PAGES {
> +            let pte_value =3D gsp_mem
> +                .dma_handle()
> +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
> +                .ok_or(EOVERFLOW)?;
> +
> +            // SAFETY: `item_from_index` ensures that `item` is always a=
 valid pointer and can be
> +            // dereferenced. The compiler also further validates the exp=
ression on whether `field`
> +            // is a member of `item` when expanded by the macro.
> +            //
> +            // Further, this is dma_write! macro expanded and modified t=
o allow for individual
> +            // page write.
> +            unsafe {

Both of the statements below are unsafe and should be within an individual
unsafe block with their corresponding justification.

> +                let ptr_field =3D core::ptr::addr_of_mut!((*item).ptes[i=
]);

This should use &raw mut instead.

> +                gsp_mem.field_write(ptr_field, pte_value);

Formally, we won't be able to justify the safety requirement of this method=
. :)

The good thing is, we don't have to:

I understand it seems like the problem here is that dma_read!() does not su=
pport
index projections. Well, it actually is a problem, which I think will be
resolved by Gary's work. However, I think the real problem here is a differ=
ent
one:

This code does not need volatile writes in the first place. We just allocat=
ed
the DMA memory and haven't published the corresponding address to the devic=
e
yet.

So, for such initialization code we shouldn't have to use dma_write!() /
dma_read!() in the first place.

I think the proper solution for this is to provide an API that allows for
initialization with a "normal" reference / slice.

For instance, we could provide a `alloc_coherent_init()` function that take=
s a
closure which has `&mut [T]` argument, such that the closure can do the
initialization before dma::CoherentAllocation::alloc_coherent() even return=
s.

Another option would be a new type, e.g. dma::InitCoherentAllocation which =
has
safe as_slice() and as_slice_mut() methods, but does *not* provide a method=
 to
get the DMA address. Subsequently, it can be converted to a "real"
dma::CoherentAllocation.

With this, I would also keep the PteArray type and change PteArray::new() t=
o
PteArray::init() taking a &mut self.

This way the PteArray init logic remains nicely structured and isolated.

Thanks,
Danilo

> +            }
> +        }
> +
>          dma_write!(gsp_mem[0].cpuq.tx =3D MsgqTxHeader::new(MSGQ_SIZE, R=
X_HDR_OFF, MSGQ_NUM_PAGES))?;
>          dma_write!(gsp_mem[0].cpuq.rx =3D MsgqRxHeader::new())?;
