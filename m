Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8ED280336;
	Tue, 10 Feb 2026 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770732072; cv=none; b=olFVReWHbdzfETEnpckXmiMXURMf/cB/q5DClDPafvCDFRiC/J+FI2sdQqfmlCSLPhIWqtaaRrT4VdAaiHADfbxTNqFOItr4rFBkh3ryRsdDOpQ6S7CITf2KjZNyoo18GUhr2+vsg0X5hf8dVSNhCXlg6P1sSHSFMaiZX6JQg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770732072; c=relaxed/simple;
	bh=zuHbjY7EoNYTml/iK6qwDq4J/dQBwA0aQapMmXHrOe8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HavD23Get3byXRA8fff+T4gqf4m/gxQqY+Zo0C5gWkpNYe2NlT9bUHIWx3qYBBdUrs5FnWdXj5ZcxiLN8tJCjSAgahulLpHK5ZE5xb25JIM4AkDXYCMvA/phUBZQJKVlU7GHatcoGBIytbN78UqiSqZtyev6prfonDwRw2lxpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wMz8dduT; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wMz8dduT"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f9NWd2NxFz9tvm;
	Tue, 10 Feb 2026 15:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770732061; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuHbjY7EoNYTml/iK6qwDq4J/dQBwA0aQapMmXHrOe8=;
	b=wMz8dduTCeMpURiTHPB96yqTYg6G1oreqkQP2+7v38iAoJYhsSAGEDcIovj8dx35gxTk3c
	ijF8RFzoiurq8Qx3umCTQ8fVnC9BhsnSUAQm1Gd6q+C6ZssE6O17DBwZI9Q7igRGq+rghQ
	/m2Ym4t7gWfs5psnSQmhNOYEhingVxA4gBNVknoCtTd40OY1fP5IdhUUOWiRWt/8CPyuAj
	WSvLcAsjqelCPV+eIjM8i+cuMZ6404TMTQZrhwi0YrgScX/PM8QuRGmlU2wJxENVpJAWx2
	cqi97S29o4kGSWFkmk4rizucf5IFyUVThczbRYgJEmEUpdoboc/QKnKflC86dw==
Message-ID: <fe2f97ae271116e7544be778a1d1aaace529dfec.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alice
 Ryhl <aliceryhl@google.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gary Guo
 <gary@garyguo.net>,  Benno Lossin <lossin@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Date: Tue, 10 Feb 2026 15:00:56 +0100
In-Reply-To: <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	 <20260209155843.725dcfe1@fedora>
	 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
	 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
	 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
	 <aYs3VVH_UXMFa5oC@google.com>
	 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 134be79bddea08014f9
X-MBO-RS-META: mwuyb7stxfjdhbnyfwb8nyj4czrgrsw1

On Tue, 2026-02-10 at 14:56 +0100, Christian K=C3=B6nig wrote:
> On 2/10/26 14:49, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> > > On Tue, 10 Feb 2026 13:15:31 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >=20
> > >=20
> > >=20

[=E2=80=A6]

> > > I mean, the timeout handler should also be considered a DMA-signallin=
g
> > > path, and the same rules should apply to it.
> >=20
> > I guess that's fair. Even with a timeout you want both to be signalling
> > path.
> >=20
> > I guess more generally, if a fence is signalled by mechanism A or B,
> > whichever happens first, you have the choice between:
>=20
> That doesn't happen in practice.
>=20
> For each fence you only have one signaling path you need to guarantee for=
ward progress for.
>=20
> All other signaling paths are just opportunistically optimizations which =
*can* signal the fence, but there is no guarantee that they will.

Are you now referring to the fast-path callbacks like fence->ops-
>is_signaled()? Or are you talking about different reference holders
which might want to signal?

>=20
> We used to have some exceptions to that, especially around aborting submi=
ssions, but those turned out to be a really bad idea as well.=C2=A0=20
>=20
> Thinking more about it you should probably enforce that there is only one=
 signaling path for each fence signaling.

An idea that is floating around is to move the entire fence signaling
functionality into the dma fence context. That would have exclusive
access, and could also finally guarantee that fences must be signaled
in order.


P.
