Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7D3E024F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172617; cv=none; b=PfLGAdWCcCqGQ3ozHbxOXiV07om9ZHgouxyGVzkKUJLb95EHwHDSy2ifMuoLK2J89mYAoNNYStY02qBJLX6B2W3m9xGkVlvxJa1pCus8fDPKwn8M7RX9kzEyRc0N8/QPTa4LD6kokKwdSjJH5xYsn/A9XI4wNHuhIgrGZZpvH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172617; c=relaxed/simple;
	bh=MVBJnIqJflJGSFwfGDyGrwXlPsLUaoynPyttg2cgWFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RhE3X/P3gom/VFLMMYFKYkni+T+NRSp6UXvPvAZTcq9BxG2s0CEJE/SWumVUQs2IcR+7OST0xfQTRVkhudOSwEW0kuCpWWXS0edqrch/jchzsXopeSm5/EbMQ3JjN8OKCHbmAuklheRM8j/B8sI/zU38wEarLZztqiGzOTZv6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcMHmmm6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcMHmmm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF98C19423;
	Tue, 10 Mar 2026 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773172617;
	bh=MVBJnIqJflJGSFwfGDyGrwXlPsLUaoynPyttg2cgWFQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZcMHmmm6VcVdSlzHmiOLIgX+GOoN0DhFXgA19ksUc2hLPskNm24B/04DM/pc19ksH
	 Qy/TrcW7ZBZvBkKcIxRiahTJtv1MOXwtQo5u9GLJFanA9GbI61HtROPkYUex007wJY
	 HeAsAj5QOm7aFwDKQlzG/qT8W6SI9h6kfeXfWPf2bDVp4dj6MMGyeP0clPsp7rWl13
	 jv4pNk7XcyChbAnOX/NtUkWP8gzmJb7t4+hVttZPJCFtAHttuYoJT7Tqas8+/D1+qS
	 OXB8KXZ6MwHIHWQhfIEN3onRfwU+ulC/Biq1zigEnt33kmPvRf1JaycSNxtvEaZ7IB
	 37HhxW/+0QX0g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 20:56:53 +0100
Message-Id: <DGZD8D623QRZ.BXYEDETBVH84@kernel.org>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Cc: "John Hubbard" <jhubbard@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>, "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203224757.871729-1-ttabi@nvidia.com>
 <20260203224757.871729-3-ttabi@nvidia.com>
 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
 <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
In-Reply-To: <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>

On Tue Mar 10, 2026 at 8:52 PM CET, Timur Tabi wrote:
> On Mon, 2026-03-09 at 20:59 +0100, Danilo Krummrich wrote:
>
>> > +=C2=A0=C2=A0=C2=A0 /// Low-level write from a raw pointer. Caller mus=
t ensure ptr is valid for `len` bytes.
>> > +=C2=A0=C2=A0=C2=A0 fn write_raw(&mut self, ptr: *const u8, len: usize=
) -> Result {
>>=20
>> The method has to be unsafe as the caller has to promise that ptr is ind=
eed a
>> slice with len elements.
>
> Ok.
>
>> Another option would be to pass a fat pointer, i.e. *const [u8]. write_d=
ma()
>> would then need to use ptr::slice_from_raw_parts() and the safety requir=
ement of
>> this function becomes that ptr simply has to be valid.
>
> So I tried this approach, but the end result was that write_raw() and wri=
te_slice() were practically
> identical.

That sounds wrong, the only thing that write_slice() needs to do is to forw=
ard
to write_raw(), that's a one-liner and not different to what you have in yo=
ur
patch currently?

> At this point, why bother with write_raw() -- just have write_dma() call =
write_slice():
>
>         let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
>         let slice =3D unsafe { core::slice::from_raw_parts(src_ptr, count=
) };
>         self.write_slice(slice)
>
> I think this is better, but I wanted to get your opinion before I posted =
a v8 with this change.

The problem is that creating a slice of a DMA buffer, that is used by a dev=
ice
concurrently, is undefined behavior. Hence the indirection through write_ra=
w().
