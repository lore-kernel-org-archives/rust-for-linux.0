Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D01E3630A5;
	Fri, 24 Apr 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030171; cv=none; b=Vx89QpqinnNUij14CL8mKVynu811kQ7bwv9HzQ8F+lEj2uVGYbPlSbwkojBSQbokOU9p8MlNolWvfiS1ADwxLHqVG1g7dLJqXJ2A5s9qy5e6fsioxPUu08Fx2VAJOawqtWZVyjEoam2/9ucKvoW99xoENypDkYFqSknXRPvyoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030171; c=relaxed/simple;
	bh=qQfSPz9FhVFebk323sUZt3sErhPKekAJy5xZUAyb/s8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JG/qKR0QSAPFkpIGoZDkMcWuMLYevtBWSM9sI0QSa4/nj8NILVJJy6rDhg+UwPVuzcz8LdRjZweAqqt4x0t/81nOX8NlPeoBVw6z1MSDUrVwt50leYEUCko6fPcfwNqSxG7thtICnkcLYPkMmBk3p65fyZA8zw+FbELl9a9QEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qsa86W4e; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qsa86W4e"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g29hv3Nn9z9tqL;
	Fri, 24 Apr 2026 13:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777030159; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5uBvKfnRVee6qIWhfuQrjNUPZshLHMzEG+8Z3PYzFg=;
	b=qsa86W4ejpyaylnYGVB1enWyxaortLzsls82O6SoaxfKsRoOzhATxwBn3xu92tysrCG6d4
	ltJ2XTiZrhL8j66nfPzxxIND5K74GpYF4KEJqiXcAHYccHafG9sqKL8aVOoONdo0UE8nxw
	QLcbBTcxZkw4bZw6I/TwOCBb/mrQPIellwy1TjGdz2+iOWo93o8+H5ATiT+WhfsUGzmsHn
	bFTLYIbgPbOJxKzzX/ewGf6L68CwFuiKdKgbA6AT/fGhx7dbks1sjyl5HEkbPQBbF3FVSI
	DQsaNXSUhiuOPKYCcINthZzW4aYKEpbRAyuvGC85sWbjxyRheA1O0+7mWDj7/Q==
Message-ID: <eca3a1b9712a132a400e51247320fe44aeef168f.camel@mailbox.org>
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
 Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, Philipp Stanner
	 <phasta@kernel.org>
Date: Fri, 24 Apr 2026 13:29:16 +0200
In-Reply-To: <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
	 <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
	 <adS9JslFrhFK57os@google.com> <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: rzexo48fac87saf89ua1a679q1pjse7t
X-MBO-RS-ID: c3fc1020e87c5006d92

On Tue, 2026-04-07 at 12:56 +0100, Gary Guo wrote:
> On Tue Apr 7, 2026 at 9:15 AM BST, Alice Ryhl wrote:
> > On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
> > > The SAFETY comment for the call to ListLinks::fields in List::remove
> > > was left as TODO. Fill it in: the call is safe because T::view_links
> > > returns a reference to the ListLinks field of item, and references ar=
e
> > > always valid and non-dangling.
> > >=20
> > > Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
> >=20
> > Thanks. I agree that `item` being a reference is the only thing needed
> > for this to be sound, as reference implies that the pointer is not
> > dangling.
>=20
> (cc Philipp)
>=20
> FWIW, I want to change `item` from a reference to a raw pointer.
>=20

Are you still working on that, or should I or someone else pick it up?

Regards
P.


>  In Philipp's
> WIP DRM job scheduler implementation, there is a case where the list is
> conceptually a list of `UniqueArc`s; each job only needs to handle that i=
s
> sufficient to locate the item in the list and remove it.
>=20
> I suggested to him that keeping a pointer and do a list iter with ptr
> comparison is sufficient to achieve that without needing to do additional
> reference counting. Of course I don't want to iterate the list when I cou=
ld just
> call `remove` function on the list itself; for that use case I want to ch=
ange
> the `remove` function to only require a pointer (with additional safety
> requirement that it is valid).
>=20
> It's orthogonal to this change as I'll probably be more careful about poi=
nter
> provenance too when making that change, so just a heads up.
>=20
> Best,
> Gary

