Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF11E1C11
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771153591; cv=none; b=HNuztKAVa2mYi9VsJH4McR43fPUfKfCYf3fIDecBQ8CQHXPH+iuOstKnniYdFWQzBeEMh+mE6yW3upgqkWglPEFsx4kfwWR3I8KhTTMZnGDVQVxF8OJ42ve7Kc1215S00mLpIDAbqCt+JVpWOtgi0Ls6c/IsCm+a/okt+cN2+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771153591; c=relaxed/simple;
	bh=KqAxAtgWN/6NyA33H07LYOrk1WYDKITy4Wbd9pCgasY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=G+dvgzEPQKsaSEfac6jpCsB17U7Ptj8y9YHpabyZXRxrvOp8ywXDGYLZOy8HXnmgtoJ9bInp5Op75GXMz6TZnXOAI7KCvzH1oNDu4VKhpa0GQ89m+4dKaQ9CuNWeJZxL3tlvft9ksXoZ4zP3JBVQ00uNADMFM+DGcMHHD3xDD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD8dVKh2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD8dVKh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAC0C4CEF7;
	Sun, 15 Feb 2026 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771153590;
	bh=KqAxAtgWN/6NyA33H07LYOrk1WYDKITy4Wbd9pCgasY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=bD8dVKh2qQ0ysNfH6zGjOM6a2uJbpZj2hES/JrqOR/6oQ/NAvlkLDTCabu9jCvSHU
	 562eCsppr8Sxs/Us85j/gWJvK5MeNiDjF6qip/UCQpHfjmR904iZKIJopMmbVumUHx
	 Ton3ycR6M2Y9NmZMXECShZ7oeJv7tiq3434q4B81GdAVlX9ejc6NreFdwqZLngoi+m
	 YtenmNSM+Kxh2w5ap7K+UOsXD8oPDblkt8lOAO8XkgzIEmhe8aQXsOtHEQKLHeu9Qy
	 a6bZXfWTAkVI/laqhM47gImcTeEEo6fp2LJM7zHshHrjAmUJz1Zaso/yB5KMvqDMpd
	 1sXLkoOfA9a3Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 12:06:26 +0100
Message-Id: <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
In-Reply-To: <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>

On Sun Feb 15, 2026 at 1:47 AM CET, Miguel Ojeda wrote:
> I would prefer we at least have a reasonable review time for this.

What gave you the impression that this should not be properly reviewed?

> (We treat the unsoundness bugs as bugs to be backported etc. as a
> policy, but on the C side we don't really have/do that, and I suspect
> this would be over the "threshold"...)

I do not see any reason for this to be backported, but it is reasonable to =
be
included in a -fixes PR.
