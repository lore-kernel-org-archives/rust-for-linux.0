Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708899;
	b=VNnqj9Ww/5+rtVL+zXfADuIZL8hEmFsE/Kwjplz9Qx+0v6J9iQPoeHkcSercgEh9h30r
	 SajJusN+YzXr6pDqJyT942Asrpu7Vxa86U4cgfOZ49qE0QKbSN7fKkm2YUdRDu33hKxTL
	 P9nTwouIWjjDRxrYwuZeVtb8Sqgp++bcpE9HsB3okmm/PqE8O5NFlLppZ60VNnfyO1kzz
	 1DYyk3S89yIeZQ/oGTNTSIw/lMb9Is32QIohHExYX/rG5Gye0I7IxlJ2nqHPaRdRghlsk
	 CKN9UPwE8o2T+mTWdn72vOls2r0pKQbrT9HCZGcjHPJRRzZjWeauIKGHToK5BvaSaUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708899;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=MBbUTxFA4mvfBMgr/0WWHEsgu+vniTSqXklSzU/9Eyc=;
	b=nkjjBRgJoh6Y/z4vQMu0QXSeU/tnou0J/0LvuttKiMNZsYFlxuE+NR0CXSaQsUoOEf4j
	 3QzDGr6RXrIkGgtic11nNw5CxBELd3kFfl5SU4x9XYdnGkdBTXJm7hq/7fzGBrzKSW5uj
	 DDLJnVJF0Wv6Kh1fyo67Cykt5IznTHCq+84/H1o5vIwOQFF8408MB27uMeXW+J2JmoD4x
	 2q2J5Y1csNZNhmAmisd2HjkHhmo06vS7JunpH2df566v2hMz+4jzsirXhKKcZkQbFyu/k
	 ABQEl9lokmsAWHhEDFBdrT/71XwQWP1D3YUqlN8Y5H17G9mwMjLSW1znukQcKQSrf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0X8ySZX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5385606A329;
	Thu, 26 Nov 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0X8ySZX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B3F1F000D1;
	Thu, 26 Nov 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708899;
	bh=MBbUTxFA4mvfBMgr/0WWHEsgu+vniTSqXklSzU/9Eyc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=L0X8ySZXvcLsLb8PRLA+6xaDCxDmy4Mb4CXrGLYLeKMiU5FfPQMG2zZfimnB8lqoO
	 fD81vlJlD0iMEY08VEUVo38TR/Qqx1tsvoexHkE2DYzAn3xHsciJW6PIDCpT+Mi7mX
	 RjgOzSQiEou8R2Pl0G7V7iTbb9IR9HoQzemwBpaqZHdstfAE+izstgoSwn/Ejntz/V
	 3TY9UBTpBSzqjaxe1wmrbDBSPiTsrKFANp2QWuHFsw7qn51vG5g9vpV9RHntnGfpLS
	 FG/wxj3hXxBw8CVSIbEi2sOxugKoTFDET8Jka7TWD/bnLSr/gZmEenzMC18PVnfLes
	 UHcxx/l4WS4bw==
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
Date: Thu, 26 Nov 2026 17:01:34 +0100
Message-Id: <DN59ODLBQ8MW.35935L948NFQS@kernel.org>
Subject: Re: [PATCH v7 3/3] drm/tyr: add Job IRQ handling
Cc: <daniel.almeida@collabora.com>, <a.hindborg@kernel.org>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <deborah.brouwer@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <gary@garyguo.net>, <kernel@collabora.com>, <linux-kernel@vger.kernel.org>,
 <lossin@kernel.org>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <simona@ffwll.ch>, <tamird@kernel.org>, <tmgross@umich.edu>,
 <work@onurozkan.dev>
To: "Laura Nao" <laura.nao@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261126111145.117769-1-laura.nao@collabora.com>
 <20261126141830.215638-1-laura.nao@collabora.com>
In-Reply-To: <20261126141830.215638-1-laura.nao@collabora.com>

On Thu Nov 26, 2026 at 3:18 PM CET, Laura Nao wrote:
> Result<impl PinInit<Self, Error> + 'a>

It'd be nice to avoid this and just return impl PinInit<Self, Error> + 'a. =
I
think in this case you don't even need pin_init_scope() for this.
