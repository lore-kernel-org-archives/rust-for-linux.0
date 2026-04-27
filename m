Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C079639B49A;
	Mon, 27 Apr 2026 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278037; cv=none; b=mPbWbobFTqXHArkmDAZ+DwDm5yMYYLEjBSWyYU8AWGjHyAGwG//ut6haK9FRJS5lCttQlfnn/Dw5dZPL3dDEpYGJ5ulfi4b7RJLC1yjVbz4VlB4jNUlydZFShuqWUt7LhAdIT1myoCRNxI0Z9/wTAK7ccSpAjftzoF0VwSTlh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278037; c=relaxed/simple;
	bh=i1vjJALIDaFsj4uh/5cp75KPISUb4APzAkpviJnOHLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MC3iCY1VzE9MTaxti8V3A3aGw1jSSa58I6xgt5721Z+viNanrGZ7ml7Cx+E1qZ00cXfRwiKUbQKwMz6vR98iXhcEPB29xhNUVWdb6PM+1GQMcmuPVh7vLbl/alaaCoYE3h1iTPrQJBKwCgd+9AUA1F8jEHiREht8cat202LsUow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FnSSCVVa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FnSSCVVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777278033;
	bh=i1vjJALIDaFsj4uh/5cp75KPISUb4APzAkpviJnOHLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FnSSCVVay3RYT7TQS3vMPGVKJihpMtf/5br0ucloKOwZ6UUZDxf0S7nDN+L+srxEM
	 Mv4v3C/2tJADeKoXg8i48RbV249shlIQXfOfHKIwhl+9xaGu0gI/iMVUASZAaWdhol
	 1BtkgxZ2ZLB/ZBaHmFZWG8cQdEN7gndpy5hy61TGKxYJd1jHs/eJ6viOgQ7HmnZ4LC
	 hNWcdTOBv3g5AxPG+nhZWLqlJkN0BRthCwNstnuLtOFfIaCrQJKhD0ju5P6F6A9aqI
	 OEM8sOLfsQ5LAbgEXmSkriR8Cy1EB3VIEiAmqgwyjX+CtRenjwKiASsI3+u3og+hTf
	 AlwO7ZAN4mdBA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DCF0717E04F2;
	Mon, 27 Apr 2026 10:20:32 +0200 (CEST)
Date: Mon, 27 Apr 2026 10:20:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Danilo
 Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
 <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com,
 alvin.sun@linux.dev
Subject: Re: [PATCH v4 12/20] drm/tyr: add parser for firmware binary
Message-ID: <20260427102028.25e370b7@fedora>
In-Reply-To: <20260427080926.73950-1-work@onurozkan.dev>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
	<20260424-b4-fw-boot-v4-v4-12-a5d91050789d@collabora.com>
	<20260427080926.73950-1-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Apr 2026 11:09:25 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> > +        let fw_header =3D Self {
> > +            magic,
> > +            minor,
> > +            major,
> > +            _padding1: padding1,
> > +            version_hash,
> > +            _padding2: padding2, =20
>=20
> nit: I would write it like this:
>=20
> 	_padding1: 0,
> 	version_hash,
> 	_padding2: 0,
>=20
> to be more explicit.

OOC, why do we need these padding fields? It looks like we're not doing
doing any raw copy/compare of any sort (fw_header is built using values
read through the cursor). If those are not used/needed, I'd recommend
dropping them.
