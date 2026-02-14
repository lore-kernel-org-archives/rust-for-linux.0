Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7B1FC7;
	Sat, 14 Feb 2026 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027774; cv=none; b=MiLvkhKFLSZQTqpQpu8x4NdFaMYagmkCqD0i3vvAqAWoBZaPeZ5kUtMlHH1z/yNvPZ5VgKl1vYejdZlJ4eJzkk/OgX5h6ToXh1xQ/i5swPgKq2mVlgZW4KRKccgMdlueARhVDRbpod0djlxoI3KBJH3tvnHvYRgREODNhosfk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027774; c=relaxed/simple;
	bh=xyOf2fWzxOJtK+0/50LLyIpdNvmN+b5hy/uifQGZjmQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=poFPsYHe+KoAFtUMe+ODUImx9arLmvzDI7XdifXvXQfLlM/a2lMNKc8cKsIJ+5EEJgcUnj5UJtIO10MxRlGngK6UVm5U3pVCGnD12hbGnIQt/2Td1NBKFzDsEWm39CSUia8huKgoVxsDsAkdE+jqOeawZQj9jpWor274htu5DnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tV504CF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tV504CF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C12C116C6;
	Sat, 14 Feb 2026 00:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771027774;
	bh=xyOf2fWzxOJtK+0/50LLyIpdNvmN+b5hy/uifQGZjmQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tV504CF88KgFFS510W5jd2+qGEBjYaza1H2B2t7tNFoBa/mtIW7CZIkMfhRuiYPTC
	 RLI7N7oV+LDSoTXSyuKAl0xIB/QUTFX74G7fFiUhicLCE64SXyXbBsgLQEaeHWIl9H
	 3H82IJgJKq9dMJO2cA1RmKdbMr3MN682E/w/CjGi2D16unBrQAO8f5FuN3ZAJX4eqc
	 0bEgVMYRseIB2dFGRH3UJp+2Zix3Xcw3Kk+NwtPqEevpzOxrd7hutHcAff5K/n8oaT
	 aM4Hd51G1XPaAPML5gsnCbTD4FiKrYScayQfdn1juepXEq19F5f03aTkkcnCRRhOUN
	 hFOBpuP/mnRgA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 01:09:28 +0100
Message-Id: <DGE8Y55O5445.D6KRXL724153@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>, <tim.kovalenko@proton.me>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
 <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
In-Reply-To: <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>

On Sat Feb 14, 2026 at 12:50 AM CET, gary wrote:
> (Sorry Danilo, resending as I didn't hit "Reply All". I was travelling=20
> and not on my usual email setup).

No worries, just noticed it before hitting "send". :)

> If you prefer, I can send out a version with just improved projections wi=
thout
> all the generic I/O improvement stuff.

Yes, that would be great. Otherwise, we can also use as_slice_mut() to avoi=
d
having to touch field_write() directly, but I much prefer the former.

In any case, I'd like to keep the PteArray type. It can at least provide a
function to calculate the value from the DMA address for a given index.

(Would be nice if we'd have something like a dma::Projection<T> type, such =
that we
could have PteArray::init(self: dma::Projection<Self>).)

> I've already suggested that in
> https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/.6=
0Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570456463.
> The issue is that however the PTE array needs the actual DMA address to
> initialize, which Alex and I feel that we shouldn't provide to the initia=
lizer
> when `dma::CoherentAllocation` is not yet constructed.

Ah, indeed -- that sucks.

And yes, it would be super pointless to give out the actual DMA address in =
the
initializer, as it would defeat its whole purpose. :)
