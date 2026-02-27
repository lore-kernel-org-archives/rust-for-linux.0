Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3C5428484;
	Fri, 27 Feb 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208362; cv=none; b=uSuwlWbEvO0Lj2mEswhDs8BJWVdHMVhzWNP7FI3NSu7DlG3Co4aa2ovL4zEtl899/WrqxuKqR/L2G0E30LJ827zO8Ej3IuEjjOuGitwzw3iZX6eMB9va66zSyL15QNMgMBP8LDonspf1YOSGFzgNaP8Sv9HubE0fSncfZytrV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208362; c=relaxed/simple;
	bh=wyyunZ0riOSV6Xw1dmnP7CmSZ8Rh0E6BV7dz5L6dakM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=WH8sX+wz5w2YYjYYH8/ieV1d2FuU/2R1SPW8yjl12ZRr/M8aJdAsqbDNIm0mkF2M9xfgQ573dH/STkOnW+Wg8G9Y5G0OdSUJRzNhjCeanep9AjimSVzoIj9hdwkpUaQjM2jhebNEpmBhlhvO5g3crrtAwcwdXzT9+3zKngU6Q0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCww8nzk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCww8nzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07B7C116C6;
	Fri, 27 Feb 2026 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772208362;
	bh=wyyunZ0riOSV6Xw1dmnP7CmSZ8Rh0E6BV7dz5L6dakM=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=gCww8nzk8MQC2CScyRsrKi5Qu6I5RP3YSjwzdp4kBw6B8dHful7fRLCb/b8kn7OTa
	 gE2LhFsAQP4PBsJinDB67BpI5mdQIfpkU6C6CQR6anLZE6IqYtVE0v8/bAlyBR7oF8
	 neUykMv8vkoEscAldARk1xhA6o+ZyNDBme46WNm4FKWcHvmUS0kBHIczKcr0Vmov0M
	 ie1tMYrO7KdhV3svT/wGQRn6WTKRVKYMrhf/sLJGYvwk4QRpWUZ8RM5cR+gctbk2AL
	 518emV8D16ohQBVyDzHN95ahskFZgnHavsrQ49thL7uTG0x80Tmq7zQc1Ro3n0sFOS
	 ZetQS5dK046ig==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 17:05:56 +0100
Message-Id: <DGPVFJES9GP4.3R0YQHAQP96EU@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 01/38] gpu: nova-core: fix aux device registration
 for multi-GPU systems
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-2-jhubbard@nvidia.com>
 <c4bc5e1a-0ed3-4737-97c8-6775f4fdd6ab@kernel.org>
 <DGPUTSI5OJ0C.2TCRCF3ERRIOE@garyguo.net>
 <DGPUWPJCFPZH.4NVAAQS1I6HR@garyguo.net>
In-Reply-To: <DGPUWPJCFPZH.4NVAAQS1I6HR@garyguo.net>

On Fri Feb 27, 2026 at 4:41 PM CET, Gary Guo wrote:
> On Fri Feb 27, 2026 at 3:37 PM GMT, Gary Guo wrote:
>> On Tue Feb 24, 2026 at 2:47 PM GMT, Danilo Krummrich wrote:
>>> On 2/21/26 3:09 AM, John Hubbard wrote:
>>>> The auxiliary device registration was using a hardcoded ID of 0, which
>>>> caused probe() to fail on multi-GPU systems with:
>>>>=20
>>>>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/Nov=
aCore.nova-drm.0'
>>>>=20
>>>> Fix this by using an atomic counter to generate unique IDs for each
>>>> GPU's aux device registration. The TODO item to eventually use XArray
>>>> for recycling aux device IDs is retained, but for now, this works very
>>>> nicely.
>>>>=20
>>>> This has the side effect of making debugfs[1] work on multi-GPU system=
s.
>>>>=20
>>>> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>>>>=20
>>>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>
>>> Applied to drm-rust-next, thanks!
>>>
>>>     [ Use LKMM atomics; inline and slightly reword TODO comment. - Dani=
lo ]
>>
>> Danilo, can you drop this patch from drm-rust-next?
>>
>> The patch that is supposed to be queued is
>> https://lore.kernel.org/rust-for-linux/20260205221758.219192-1-jhubbard@=
nvidia.com/#t,
>> which does correctly use LKMM atomics and add comments about possible us=
e of
>> XArray.
>>
>> In fact, I am not sure why this patch carries my R-b.
>
> Hmm, actually this patch contains updated comment but somehow have LKMM a=
tomics
> changed back to Rust atomics. Not sure what happens. Anyhow that patch sh=
ould be
> picked instead.

I picked up the latest version of this patch and fixed up the LKMM atomics,=
 i.e.
the result should be correct:

https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/d3f36fa57aa289c43e0=
1da16c928a2cd971ad5dc

Looks like I could have picked v2 instead, as it seems to be identical exce=
pt
that it already uses LKMM atomics.

@John: For the future, please don't send patches in multiple series / ways.=
 I
think there was no reason to include the patch in this series in the first
place.

Thanks,
Danilo
