Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183133F363;
	Tue, 10 Feb 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714400; cv=none; b=XFryb+JgXtCtzR2gGY/UNu2tkVjWRzUIzPOd0HRZz0Sf3y5Ir3Hl3AGjcFrr0tfeFitpyj6y0kOLhHrPt8any8jS9rTIivvDlCULEsMLtA5cP3Tgn4Ka9rBsDv71evjUopHynXZqEXkHFhP8lytWYvpiEtTHIIAYa0UjbXFUN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714400; c=relaxed/simple;
	bh=KoL0DF6UjdxcWuqn+iTCS0biVJL6+6OXe/SqA60fXm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rxpzGRAIjW7DO82Yo5IajkIehcrqb9MJjc4sUTPGEojtFOlNRsFkO4pLYa7nQJT7C32gJj6QBfWo2Wji2y+c1kv/bbAydxON3mIo5YIX29bXavObVHRZ7l1InwOIcvc8XX4/3/1v57bgCp4e9Fn/SnIM8gRM1YGoNSX08IPpqTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dzBEltuz; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dzBEltuz"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4f9Fzj0fRhz9vMW;
	Tue, 10 Feb 2026 10:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770714385; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KoL0DF6UjdxcWuqn+iTCS0biVJL6+6OXe/SqA60fXm4=;
	b=dzBEltuzFxm2uaTXZtNeEqAH1DKiXW2gmx8t6zDbjox61gUxSdfNEd8ElIfRPPPCbVdCQp
	ihAFn1mrZI4kfnKjT9fDIfLcIywheVfFjKtaxI3jhtrjHBngQurzHWFTkaIvZZd89U+qpm
	hJ+VTJEIi78kLw73VA1Xe0pzqoWQnvkNazyHBHh6neO75hfFmzBDY7Wl1PJUBZfsLgZ0a2
	Px8AzunYxx6frFZKYJdr1HzPpLZ3+rZibODzqHoXdTGPJj6Le0caJlWfi0PVUELy/PgIwr
	F3Le2KaL9ao4ihKREr3vIcG0q8RgeIUWb95x/jzMu5NXybg4Yh4IckL0lhig0w==
Message-ID: <29712ecf50a8dbd6ec13865ab4313a745ea16c14.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, phasta@kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>,  Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Tue, 10 Feb 2026 10:06:19 +0100
In-Reply-To: <aYruaIxn8sMXVI0r@google.com>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
	 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	 <20260209155843.725dcfe1@fedora>
	 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	 <aYruaIxn8sMXVI0r@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 1n83koemthymty6o5gddcb7ucmorhu4c
X-MBO-RS-ID: beb1d6f231ff3455abf

On Tue, 2026-02-10 at 08:38 +0000, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 09:16:34AM +0100, Christian K=C3=B6nig wrote:
> >=20
> >=20
> > On the C side I have a patch set which does something very similar.
> >=20
> > It's basically a WARN_ON_ONCE() which triggers as soon as you try to
> > signal a DMA fence from an IOCTL, or more specific process context.
> >=20
> > Signaling a DMA fence from interrupt context, a work item or kernel
> > thread is still allowed, there is just the hole that you can schedule
> > a work item from process context as well.
> >=20
> > The major problem with that patch set is that we have tons of very
> > hacky signaling paths in drivers already because we initially didn't
> > knew how much trouble getting this wrong causes.
> >=20
> > I'm strongly in favor of getting this right for the rust side from the
> > beginning and enforcing strict rules for every code trying to
> > implement a DMA fence.
>=20
> Hmm. Could you say a bit more about what the rules are? I just re-read
> the comments in dma-fence.c, but I have some questions.

The rules need to be written down. Elaborately and in detail, once and
for all.

We're having those discussions about the mysterious "dma fence rules"
for years, but no one has ever seen them, despite knowing that they
exist.

They seem to live only in the heads of a small number of GPU developers
who figured out through long years of experience what works and what
doesn't.

There are reasons why the state writes the laws on paper somewhere. So
that you can read them and have a source of authority..

That would end much of our endless misunderstandings and repetitive
discussions.


P.
