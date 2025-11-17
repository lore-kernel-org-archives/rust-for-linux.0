Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847DE25785E
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381605; cv=none; b=E4lqsRSFUHqv5gN8z2oBdlwpmM7IBbsDF58dP6l3HFQxsGJy/J2vKMrGBEyqRcc1Z2vDNwvYyIss8R3A5D7NtzUMOQ0xW4ooaXdWZEiJl+zLeldHq2xILdwOKuc6LD2NhvrfxkW+pGa2IwkQc5HtZe1CnqYRH1Sg/zMhtcLxfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381605; c=relaxed/simple;
	bh=nMwkKtB2pvoDVzgoQ/F/c2xdZ04h+oxH0Fi4+KhyZ7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HY0apCdv9Jtz1Y9jqywNCaZBXWJ5YUbtEvEWKqK+jYcEkiLl4UX49yNbrcjZPDBkvj15c/N5hVPK5Mu3LLLolpfOpVffKKXKqiXGcDO4Y9IUTOsXcJ2K97dTd7rNmE7q12oiZBChQTM/Z6oLd/jOQsgv7pWXLS9hv5SAxck3wo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=KFNfgvW9; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="KFNfgvW9"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 14C39240027
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 13:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1763381596; bh=o6ZTUgObMIZolO8yhAxqHckrhH8zwvkN2YZfMsUNhIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=KFNfgvW9UY2GViKX3RB5JuL15nyNiJOI6/zLjQqiKWAwlslItKg81LGpemRUjRe15
	 Zi/2Kmuga4AM6gw4FMTfGGZBKQ6+/yW3jSKS11ItE9N2Npquni51nh7C+nbheIAjS2
	 9Pq7wDcBCdSn5fRAJlyDabOR6G23Li9SGjy3jb7J1UIzHLXHy6eRdEp989BSQY316b
	 x/aQdW/XmXaEVD0/FJKDE7ZYP1Qy+XSKk9xWTSyGCw2PxoI6aLs5r9WzGrCNZoQtC5
	 yPurORehH1SW8kp5qacX9pk/IdRmq5LCy03u9R1Phmh+/FDR+F2jti5U7r+nwP/AOr
	 rnnNCnPuYTyoA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d968R73Dcz9rxD;
	Mon, 17 Nov 2025 13:13:11 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,  ojeda@kernel.org,
  alex.gaynor@gmail.com,  boqun.feng@gmail.com,  gary@garyguo.net,
  bjorn3_gh@protonmail.com,  lossin@kernel.org,  a.hindborg@kernel.org,
  aliceryhl@google.com,  tmgross@umich.edu,  dakr@kernel.org,
  yutaro.ono.418@gmail.com,  borys.tyran@protonmail.com,
  daniel@sedlak.dev,  tamird@gmail.com,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
In-Reply-To: <20251113144547.502-1-work@onurozkan.dev>
References: <20251113144547.502-1-work@onurozkan.dev>
Date: Mon, 17 Nov 2025 12:13:15 +0000
Message-ID: <m2jyzo26y1.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Onur =C3=96zkan <work@onurozkan.dev> writes:

> Refactors parts of the get() and cursor_lower_bound()
> traversal logic to minimize the scope of unsafe blocks
> and avoid duplicating same safety comments.
>
> One of the removed comments was also misleading:
>
>     // SAFETY: `node` is a non-null node...
>     Ordering::Equal =3D> return Some(unsafe { &(*this).value }),
>
> as `node` should have been `this`.
>
> No functional changes intended; this is purely a safety
> improvement that reduces the amount of unsafe blocks
> while keeping all invariants intact.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/rbtree.rs | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>

This is a nice change to have if it reaches the general consensus.

Acked-By: Charalampos Mitrodimas <charmitro@posteo.net>

--
C. Mitrodimas
