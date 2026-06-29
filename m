Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165A2571C0;
	Mon, 29 Jun 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722782; cv=none; b=AAU/nY4dn2T/muLNJRelVkWafKNFgzt8MkokWpIY7MgvM8TR95W73/A9aMvVnlZJMZpWmGDhYYBTWFyh8W3laE8ld4OSr+IdrCL1e5F0j7KBu/aG8IRgnCduyaRhtGcSTKiMtQBNK3R757atX/9/XDSIwd6eheK1YhI8358JHr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722782; c=relaxed/simple;
	bh=FftD6cxtaLafMa5Abl1ZmNF0gUSqDocLlPF/xc6INGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bs22QGd55CyIwoLLEosrx+9hgqbllnRDuce0Ai/JqzHVErQWfzPB46828Xos4M96IV92XAa9iUuR+J73QZmRtUG94+j3CLPpg4aU86/HgZ01ox6JxrAZsi1VYi8DXMvdh1mFGLH5zN7y4XssCp4ijoB1rt6EnZiXBj6b4+gieuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmKZe48j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmKZe48j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D771F00A3A;
	Mon, 29 Jun 2026 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782722781;
	bh=FftD6cxtaLafMa5Abl1ZmNF0gUSqDocLlPF/xc6INGg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=bmKZe48jTpzSYweb3znBgB9zJA0plSnh6pv6hWFbEM6xIEUkWpqQN3FvxltFX7QpI
	 dBSAT4LeFgAB8iiNyyl39hvw10sMbXeNHfjwSM9RLgh6xm/KbRJ/sHA8Ee4uoJwmHl
	 DdKP9Koswd09L81TeRzkj7wpgYBYlRae75a1bwU2clmA8W0GPbaBFrRtaop/WIVMbh
	 zYPICgbE2fK7f3uop4FDLlleL4EoSNYzXCg4NbK1YzQcI28/wEOBvB+qF2v1+y3fUp
	 asI7QrzqaHBD7mz41gcvbA1NCqCca7psPgTR5C5D5Mp1pRbbW24fnYyaFy0t4bEYpK
	 7RM1+jvDTsGng==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 10:46:16 +0200
Message-Id: <DJLEHDNJCUD0.38PFZ5773D6BX@kernel.org>
Subject: Re: [PATCH 0/1] nova-core: Convert bindings to use zerocopy
Cc: "SeungJong Ha" <engineer.jjhama@gmail.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>,
 =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "David
 Airlie" <airlied@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Tamir Duberstein"
 <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Pedro Yudi Honda"
 <niyudi.honda@usp.br>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.de>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260629025220.1935622-1-apopple@nvidia.com>
 <DJLAUOEDW6HT.39URSU30Z0HT9@gmail.com>
 <DJLCF3LR0KMN.1TMKMZEZWKN8O@nvidia.com>
In-Reply-To: <DJLCF3LR0KMN.1TMKMZEZWKN8O@nvidia.com>

On Mon Jun 29, 2026 at 9:09 AM CEST, Alexandre Courbot wrote:
> Since there is no particular urgency to switch from transmute to
> zerocopy, I think it makes sense to merge things in an order that limits
> churn as much as possible.
>
> This means the conversion should probably be done bottom-to-top,
> starting with the bindings, then the types that embed them. For the
> bindings, `#[derive(zerocopy_derive::most_traits)]` should be landing
> soon [1] and I would like us to understand first whether that is
> something we want to use with the bindings; if so, let's wait for it to
> be available (unless there is a good reason to convert quickly) as each
> change to `bindings.rs` is almost 200 LoCs.

Doing another subsequent conversion to most_traits seems trivial. The upsid=
e
would be that we could remove the transmute::* types from nova entirely, wh=
ich
also allows us to switch the DMA code to zerocopy.

No need to go for it with might and main, but a minor inconvinience like th=
e
above might be worth taking, as switching to zerocopy in core infrastructur=
e can
simplify backports.
