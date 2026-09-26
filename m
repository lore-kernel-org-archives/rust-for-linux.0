Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0103239085;
	Sat, 26 Sep 2026 21:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790458718; cv=none; b=foL6ERh8Fhbv9pwHnXYvvQDsucrPXzQe+XCw367vW0bgklac7BKX5GlW+xY9MOGBam1h+6ayLjT4iPLJwItG2y+ZZ3h2ipYn6mP1blu0piQTQQZkN0lGPYV+JBoJ8Nv1CC5hR/MHT37FKtrfL4zoJfoB/xViAEPdmdNXOJ/Ju5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790458718; c=relaxed/simple;
	bh=QZ4qG6CAjnsQOhMxAteANtjuOgDSBWfCQZ64Lsscvu4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mikFm+Vl5zzI4h+qIMGzf2pGqrgrm3RxC0TsmwawMU9TsBNpxHfMay9Z7zcs64OHM2HDI+NKtm8xU7CyioaYtHaLZ1E56JWucogmvCGXCczvLXg9szKAox6aJmAA1vhv/8Dw/p9NXuGw8pND/Y0GwC6re1snrUDTv1jnsz8nNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KML1pR0+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KML1pR0+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722DC1F000FF;
	Sat, 26 Sep 2026 21:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790458717;
	bh=YmeBn4iVGzFom21AShd9pBGF6QuXhtV16ZOJy3OGq4E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=KML1pR0+BfrNQ4Yghb4qjoTrIkiQpkJD5iOutuYq57LmS/EWbufxO6Nsm864w1j6q
	 V9zXwqGaXm7r4CTZi8CqSRf+EMPZffYdhA+DfQE7zNVFpVOVlZvTLGwKH3hRlwTTjw
	 DxUNm+YyYtIVvyoGp4M5wFdE11SJ1PFxn5JlIbDilUD07S0YwzLwj4XPLf4xCzddVB
	 jmctxQTigesltpMUQGm0x4t2BPNa2/de+yYDqFvLXQm6SLcSphIht6kDkem70oKnj4
	 +81tg7oTWQto2bksJ2WuSChe41+vEIt7EvmKxL1FpiTUmK6kNC4uHug+mte5kUGndG
	 6vEnZdG85S/pw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 23:38:31 +0200
Message-Id: <DLPKN532X7JJ.14Z51ZIBUIK94@kernel.org>
Subject: Re: [PATCH v3 1/2] rust: uapi: add zerocopy/zerocopy_derive
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-1-e19bcb71980d@collabora.com>
 <DLPD8RQKM8VU.3QWOV9RFLA8S6@garyguo.net>
 <DLPE0D8F96DE.91C7E0MAERDS@kernel.org>
 <DLPJT1IUSKQO.1CAWHDECQAFPO@garyguo.net>
In-Reply-To: <DLPJT1IUSKQO.1CAWHDECQAFPO@garyguo.net>

On Sat Sep 26, 2026 at 10:59 PM CEST, Gary Guo wrote:
> On Sat Sep 26, 2026 at 5:26 PM BST, Danilo Krummrich wrote:
>> On Sat Sep 26, 2026 at 5:50 PM CEST, Gary Guo wrote:
>>> On Sat Sep 26, 2026 at 1:26 AM BST, Deborah Brouwer wrote:
>>>> @@ -71,3 +71,6 @@
>>>>  # Structs should implement `Zeroable` when all of their fields do.
>>>>  --with-derive-custom-struct .*=3DMaybeZeroable
>>>>  --with-derive-custom-union .*=3DMaybeZeroable
>>>> +
>>>> +# `drm_panthor_gpu_info` is copied byte-for-byte to userspace.
>>>> +--with-derive-custom-struct '^drm_panthor_gpu_info$'=3Dzerocopy_deriv=
e::most_traits
>>>
>>> This is Tyr specific change and should be in patch 2.
>>
>> Why list all of them separately? Can't we apply this to all uAPI structs=
?
>
> There are types with paddings which cannot derive `IntoBytes`.

We have some existing uAPI structs without explicit padding; new ones shoul=
d use
explicit padding though.

But isn=E2=80=99t most_traits intended to handle this through best-effort d=
erivation,
leaving IntoBytes unavailable for types with implicit padding?
