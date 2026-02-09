Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367473033F8;
	Mon,  9 Feb 2026 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625326; cv=none; b=qoVJ3/IaHvX3Dk3Q4UBID0fNA51inOaks/TGuWgQ4MUxTK54HxCY19le9fglExK2gs8/Am0iN+YFuNiznWT84K5nKs4rquEQgB6t/EP1JOmKyodQFGrv9QIKYGfHc0S4k9g+Ib0Mu7i+93/pLHIlKpwvGFZKI/dFCoogH3G5ST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625326; c=relaxed/simple;
	bh=lh2hDOqMmY3VlX6bcz6dR+je37iAc6ukHMnDnzAz/XI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T37L/dNodgdO2oi45uAcjshO97O2itmCgYtrcNLqJPbWqleUDWn1pXVc4X+Upz2eisFZ/N6O5kGsbJtht7aaftaz7H0ASm5KVCPLpc9UFfiafECi1w3/bGYDjIjiSb2siQVStphMcKZQiWwvjuUA5PwBDsrHqC6nhEwvvrVZYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tVNzVyTv; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tVNzVyTv"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4f8d2q4Wk0z9t14;
	Mon,  9 Feb 2026 09:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770625315; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lh2hDOqMmY3VlX6bcz6dR+je37iAc6ukHMnDnzAz/XI=;
	b=tVNzVyTvbAEqg0gppS54m+KPKqLObTs8+J49s1G9s1GNMuSGNzl/O2CBjtyY6mUzaHrnxk
	YPGtoG/RqknkenlTJL4kB234mTeaMI01gwcyLocrbTIL1cY7ZlCyfZBn/T3ZZuUfS39jil
	YcWhLLI2FtqyF3aQY/XKQzzaguNKakep85yRNJuXglXe1TacKJfDqlRDFgYT6dy2H1g0Bj
	70nAGhYyusUILr9mTdkBKldfETVjGDZuakRJoHKqGf5G+w+UEcwN5VCZJ+ZjJw6zo7iRnm
	p/tDcWUpyIV5sJxHUGWpGuja5HF7JIx+xsHPGpjQBn5e1OdIokw5I84nvk/tDw==
Message-ID: <eca9693146dd9db88a6ea0b8b435d2ef0246ee2e.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Benno Lossin
 <lossin@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Mon, 09 Feb 2026 09:21:51 +0100
In-Reply-To: <20260206120442.51c5ca75@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
	 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
	 <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
	 <20260206120442.51c5ca75@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a597269bc5b3dd9e576
X-MBO-RS-META: szqxdtd6c64ssj1yxaxess8he3ar76eq

On Fri, 2026-02-06 at 12:04 +0100, Boris Brezillon wrote:
> On Fri, 06 Feb 2026 10:32:38 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20

[=E2=80=A6]

> >=20
> > So I strongly think that we'd either want to drop data: T, or we should
> > think about possibilities to hide it from other drivers.
> >=20
> > I've got currently no idea how that could be addressed in Rust, though=
=20
>=20
> So, as Danilo explained in his reply, there's two kind of users:
>=20
> 1. those that want to wait on fences (that'd be the JobQueue, for
> =C2=A0=C2=A0 instance)
> 2. those that are emitting fences (AKA those implementing the fence_ops
> =C2=A0=C2=A0 in C)
>=20
> And each of them should be given different access to the underlying
> dma_fence, hence the proposal to have different objects to back
> those concepts.


That makes sense and can be implemented. I can pick it up.

P.
