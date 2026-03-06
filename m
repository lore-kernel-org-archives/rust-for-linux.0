Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69512381B06;
	Fri,  6 Mar 2026 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795015; cv=none; b=cJeoDgQHk3LbJnSXlM0p7WA/WsdEGWcO20IZQhTSQaB4YFuxLjtf4rR+fwl2Z1blURKYA3dTMDltw1oIxOabjvZWDPO6dRvlaZSFkloN6EIxI8MXxHI1RqCQylkJP5ncWixM8EdGKE1D6WnnGTKtQtGtysm6mjk119mUnA8r+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795015; c=relaxed/simple;
	bh=9kYhONNOuHNdTnEFXcExgHi8n0fGbiUgRAaTDCbIcqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LuJujRczSoKUlkpn51xIxe7ylYxTK2Bsdx8uM2IiVdq/CV7OtX4dMgLpJCog8KcvekfPOyT+5kpX9Raf41MZ3wg8hZoGPIbIf0W2jUa9S1ZT7TBnkKUGkWDa/0w9O6p/MZsLxluCUU6kt1Se4kLA8yWgX0cT9ffa+fYNskwFZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTDbKOpx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTDbKOpx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C08BC2BCB3;
	Fri,  6 Mar 2026 11:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772795014;
	bh=9kYhONNOuHNdTnEFXcExgHi8n0fGbiUgRAaTDCbIcqI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RTDbKOpxoF1J+0YGsIe4inkKZkkELNb0sZAhBcxnObYCNGFEcQIeMcIAwm7nGM99n
	 GSijIOczN3ZbGAJxa6xwXdRUPU8cNCMuweonYby9//8PlSIedpowNvgceKpjNcD4DU
	 bk6s5STkAeZM7mV2YnotGvhjQX9F7gOTNI7a5HQzKHL2T4634gdn5IFGGFm81v4LwW
	 VsdnjLAFAZHGvlRBFhbWoEGoqjRpXdOQvuaLZ9e8Eg10daSLpEuVOBg3gCTj4wvuuM
	 3Looy0HT6EdabLHJQ1Ywd23hygCGXPL7+fACrTlouGML20s1c8hs7kdbuzD/5r/AKf
	 Ph1n6uuXgCRrQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 12:03:28 +0100
Message-Id: <DGVNDRM96OTJ.1RD1IGZ4QV5VF@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
 <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
 <DGUODB0SCS88.2LMCK991QHVG4@nvidia.com>
 <DGUT14ILG35P.1UMNRKU93JUM1@kernel.org>
 <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>
In-Reply-To: <DGVAB40GKAYG.3MX3IZQO1816A@nvidia.com>

On Fri Mar 6, 2026 at 1:48 AM CET, Alexandre Courbot wrote:
> On Thu Mar 5, 2026 at 8:16 PM JST, Danilo Krummrich wrote:
>> @Alex: It also seems that this is based on broken code, i.e. I noticed h=
ow the
>> DMA read is done in this case in e.g. gsp_read_ptr().
>>
>> 	fn cpu_read_ptr(&self) -> u32 {
>> 	    let gsp_mem =3D self.0.start_ptr();
>> =09
>> 	    // SAFETY:
>> 	    //  - The ['CoherentAllocation'] contains at least one object.
>> 	    //  - By the invariants of CoherentAllocation the pointer is valid.
>> 	    (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
>> 	}
>>
>> Why isn't this using dma_read!()? I think creating this reference is UB.
>
> We can't - technically we would have to have the `dma_read` in `cmdq.rs`
> so it can access the `CoherentAllocation` (and do an unwrap in the
> process):
>
>     dma_read!(self.0, 0, .gspq.rx.0.readPtr).unwrap()
>
> ... but that cannot be done as `MsgqRxHeader` is part of the bindings
> (i.e. in `fw.rs`) and thus its internal fields are not visible to
> `cmdq.rs`, as per our policy of making the bindigns opaque.

We can have a helpers for doing such dma_read!() calls in gsp/fw.rs instead=
, and
just forward from the actual methods.

	fn cpu_read_ptr(&self) -> u32 {
	    fw:gsp_mem::cpu_rx_ptr(self) % MSGQ_NUM_PAGES
	}

> This can probably be done better with I/O projections, but for now we hav=
e to
> do the read_volatile by ourselves.

Not necessarily, see above.

> What makes this reference UB btw?

Gary explained this in another reply already; I think fixing this with Opaq=
ue or
passing raw pointers instead involves even more unsafe. Whereas the simple
indirection from above is fully safe and can easily replaced with I/O
projections once we have them.
