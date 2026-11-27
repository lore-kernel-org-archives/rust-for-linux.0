Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810310;
	b=K4k2dot70vHKVVbYGAVnvefOXMxNb7fB3K1TpLgbul33MigflzvPl5civoDiab1f7ORI
	 fn6JKDjcMhk3LY7h5MbEmJEKdoTyZAGyVgONoJLf9/YVGW+dykTwlDMVXO2xUv8aD5DmP
	 XzFNmLDoqade8DdB8ZXODOlzAkBE+LZ0MSshG6qe67hgUWRzwN/obT36nee4nGLJn6RV9
	 vlvtIph6Ve2Q4NGf30qB/0KTueWH8KzPdY/sKDq7FRH/kzSdzNLcmmaV9ouskiXIVh637
	 S/StE0hnMZgariZsglyPpIpZ8I6CNMKfQZWzjCssx8ZrGVCk6yICW8M2ev7GorvUrig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810310;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=xQkfae/SKeVDaBhKJZUuyKSaF2mzk809NAHAXx7sAak=;
	b=yXHIzKIOEu97GtYYpB7L849XiMS+9l3RhYBmQDLHaB8JMlye0lawySZYO0nfIx53814o
	 XHhtefzJ8XUC3uuwXU3U7Xh7j/iIsk7v0aAQQhwthLO+m6twhufp9tUw9oAWxF/7CIjcm
	 BaR4yptM6LLWdl5RezMOhCsBGMtrqZU73CuJAr+EHeTTri0i1EZvYc/KMcKHTg1ngnCA6
	 DVuPz0dD34GNWg6ZW4odLQAb+XY/qvjLbXtOIYKwJ/dTbsZHmvF8TVavT67Tl2hZBJg15
	 gyrNSc75DrcdJuU5abfh0YJAwoWstSsoKMHLlonqGRK4bKL5bsPUb8u4y22qwSi5caw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqscSC7o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB438606A321;
	Fri, 27 Nov 2026 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqscSC7o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDDD1F00899;
	Fri, 27 Nov 2026 20:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795810309;
	bh=xQkfae/SKeVDaBhKJZUuyKSaF2mzk809NAHAXx7sAak=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=UqscSC7oRfjgaDALeV44q7rOHH9jFsHctIWjLb1BN5foFIH/610yWIZT4EQ6WdKzm
	 CHHwiKAeVNcA7A7otdwvnTthdgJXwTpB8YbUWzEoqCksc5Ru77+oBOq0/bveio09mk
	 WXqqfYX/K2Wwy7w4Bxse6DlzXiKrUX7RXEETn0Q+cDeYAAm8GUD1bma0aesuTpFGIo
	 jA2b2evqxl5e8xExYPx50NFRdGMnYEyVsXJoGPBIFDZATPb8HNqMbL4eJxYab9hxDQ
	 f/xrrDJnBSaCUkioZsmWDGgNV+UJLYJzZMaXdGgMN3ZFo9fisCte0bGT1n0j+96t88
	 2wyaPTpdrX+Bw==
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
Date: Fri, 27 Nov 2026 21:11:44 +0100
Message-Id: <DN69MGXVNYTK.3QKU099BIJXHQ@kernel.org>
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
In-Reply-To: <DN6838W1WF2T.2FLQ4AOZX5B40@garyguo.net>

On Fri Nov 27, 2026 at 7:59 PM CET, Gary Guo wrote:
> Do you need it being a guard? You can do things like
>
>     let a =3D SignallingSection::begin();
>     let b =3D SignallingSection::begin();
>     drop(a);
>     drop(b);
>
> to break nesting. A closure-based approach wouldn't have this issue.

I also think that a closure-based design would be better.

Another nit, "signaling" is much more common in the kernel than "signalling=
".
