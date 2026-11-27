Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811221;
	b=1Jxp6Tui6jAXHjsQig0xteDG5H5XwtRzrWgVAhCDrMadpbJ1NEPakWWHASWgS35h6aQY
	 V4kbvNyEz5R+mDayfxkdQ7d3bmRvP6+A03VysSuXHeD/K97SzOUk2AX5og07wX8PTVaj7
	 1jEfoq/zJ5RwJVZaNVqBxMRVUN8yHUpHZq/4din0zw1riSX+aujbTuYkpzk90mSogQWop
	 HxqXNxV+2bedXyq72vW2I4JAZCkZ/ez/thOQQRwYUsmqSor8GEW7VSkJU2cqNA92NoB70
	 HmCgoC9vhWKPPi1+36SgvCmEOMvfSzmEa2JFHDV26/wTBl3u6/SeGIXraKqBcHfEWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811221;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=dd6KxHH+iKcHM/gA8I4KWEQmk82hPOhzgathyyn9jII=;
	b=kt+MYkIGiU4g5/PIl6c8AaiNSVzi1i5PmvrEHhzBj/yhjBeXWA/lDv26fTEDNm+zrUYt
	 JkBPL3HsiZh6d9iYJK++5+QDErdpMZSc3eAtOKvbmPUWhDJngMpXtnKhkcNSXxhmX25c8
	 7yVpK5lHkMg8b8urBQFaYSYt0c5ca4mPEegATaexziHrpj/+OfyPOfCM50FFCMT9TE379
	 ZA02sbjPpwg8Lj4Fju4dvxX/UucypvEiCafEM9KJF1zfncaKZGaaDa1Un/Skiq5+RIK9k
	 hJlwa85Jd+GR2I9SPBQbGV3dtABD2tMTZFzqVzT3qI+AHartJgM37CVppxj19Hl0QEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO4mecrO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB76606A31E;
	Fri, 27 Nov 2026 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO4mecrO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68A91F00897;
	Fri, 27 Nov 2026 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811220;
	bh=dd6KxHH+iKcHM/gA8I4KWEQmk82hPOhzgathyyn9jII=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=FO4mecrONKoUaPEmD0row/8D7V40iOYSV21mfKJp2ViiQew7pHxFy1GF2X9mnd7kg
	 tn18OUWTVkNbE5UxP5NwX3d2CSON1z0R8PDCdmEVKdS/2tTKglY6s4Q62VLDMwxMHn
	 2iOh8m3KTDQ5MpSaiPNm9BWoiebGgjAsRfUTlYeitVW2rMKq7/yGQ9w9U3JbAXimes
	 khq6sTBX8m7eyz0a6/MOyiFNp1/O7YxqyO5AtRTaDzcOLHoOAjMYFZG8dnAMZHcDBQ
	 hb0VKJ1/PVFk4o9JU0saGvB9vMnAXOP7lnKbmIyGGn+MgBayQLcUegScF6WqpYPeHi
	 1K9l9DxO+YxRw==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 21:26:55 +0100
Message-Id: <DN69Y3A64AJG.3SOFZ9ADV9HKS@kernel.org>
Subject: Re: [PATCH 0/2] rust: dma_buf: add dma-fence signalling sections
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261127-dma-fence-signalling-v1-0-c44e8f4910ca@collabora.com>
 <DN6838W1WF2T.2FLQ4AOZX5B40@garyguo.net>
 <DN69MGXVNYTK.3QKU099BIJXHQ@kernel.org>
In-Reply-To: <DN69MGXVNYTK.3QKU099BIJXHQ@kernel.org>

On Fri Nov 27, 2026 at 9:11 PM CET, Danilo Krummrich wrote:
> On Fri Nov 27, 2026 at 7:59 PM CET, Gary Guo wrote:
>> Do you need it being a guard? You can do things like
>>
>>     let a =3D SignallingSection::begin();
>>     let b =3D SignallingSection::begin();
>>     drop(a);
>>     drop(b);
>>
>> to break nesting. A closure-based approach wouldn't have this issue.
>
> I also think that a closure-based design would be better.
>
> Another nit, "signaling" is much more common in the kernel than "signalli=
ng".

Well, while this is true, the API already inconsistent about this in exactl=
y the
functions you are abstracting here, so nevermind. :)
