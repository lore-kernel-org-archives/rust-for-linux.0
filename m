Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F4D384245;
	Tue, 10 Mar 2026 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140336; cv=none; b=n4prLJnYwi4vLYRFhqOE0d6ryAemfAgSiLLYfB5ZXGQE6GcdUl4VpE2SdpIPq2ci27qvOUxdk226gIJBQXlIw++D6KWjIjWuedZ5SdmH3LH6PI/XjNzPN0SZQLn+/4D5qkNnCjPqoEZum9vX/BUj9CGV/Xb7OsLN8b4BtognAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140336; c=relaxed/simple;
	bh=P3TywGqRAkhOoXBhCiCMOV9gwuUSxS2oeLYbxPkHnjA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=PLbKLdCA8dIac4bADABcoFa+zDJk4roQ6xjk5mRmuSnDCLVlCgHw+rKUrZWTX4UTNzSzeQA1vQFxCEEt9FeLEIojYn+SLF2UV+96SCDVYSLUEmlMwrIcFSUEiZnSZSF4s78lDOMPnbJ5RsKV55q8nuAL6n/HRw/k9BLVfUCvFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpX9Pz0r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpX9Pz0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DB4C19423;
	Tue, 10 Mar 2026 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773140336;
	bh=P3TywGqRAkhOoXBhCiCMOV9gwuUSxS2oeLYbxPkHnjA=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=MpX9Pz0rS3A+qDX6WlvyVrbiRpvWJ2KvhZUkWiofdPZlKDyhG8UGmlG4iPzeew84u
	 1YmVLm7gawNFKUUKq33UpP9vjIeih85cOxercEgGB+eYM2BcaQZTnYDyzWcTFvLSGM
	 Wktl15nF2sSj54MbXVSAVoVNgvkA+5yW40YR785WEbWu/fbTJtbqXclkYp1q71xM3I
	 knuaVyS9OSLWoftLEyn61NngFXUBF1L+zx/DF81AgKe+saojsica+dp7AP+xEePFGh
	 2V7Y/JgWLzPZfCN0Tky5B0Ok6GGzIn1LBnsgi8ppJH56FKAO06aNngkJvSwG/LjByn
	 YXMtsOajf2+uw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 11:58:53 +0100
Message-Id: <DGZ1SFR07FY8.26IXX819VFGC5@kernel.org>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
In-Reply-To: <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>

On Tue Mar 10, 2026 at 3:01 AM CET, Gary Guo wrote:
>> +// TODO: Revert to private once `IoView` projections replace the `gsp_m=
em` module.
>> +pub(in crate::gsp) struct Msgq {
>
> These could all be `(in super)`?

Yes, or just pub(super). However, that's not the case for the functions in =
the
gsp_mem module, they could be pub(in super::super) though. But I think I pr=
efer
pub(in crate::gsp) for those.

>> +    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem>=
) -> u32 {
>> +        // PANIC: A `dma::CoherentAllocation` always contains at least =
one element.
>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) %=
 MSGQ_NUM_PAGES) }().unwrap()
>
> I wonder if I should add a panicking variant of index projection for this=
 case.
> Perhaps of syntax `[index]!`.
>
> We could also make the existing `[index]` becoming a panicking one instea=
d of
> `build_error!` one. It is more consistent with Rust index operator that w=
ay.

I thought the same, as something like this `[n]?.ptes[i]` looks a bit odd.

However, I think we ideally want both variants (I like your `[i]!` proposal
above), since generally users should have the choice (as they also have wit=
h a
slice through get()). For instance, the index could come from userspace. Su=
re,
you can always validate the index in advance, but having a fallible variant=
 is a
bit nicer.
