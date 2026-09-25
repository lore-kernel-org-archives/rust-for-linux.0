Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E7426429;
	Fri, 25 Sep 2026 13:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341700; cv=none; b=nw7CVRmuHZAsXJmJp8VStafN/k/Wo6YOcR/cwHaLLs/xdGpuNgccRmf48H/IUbi7lFYF7hNMDwG8nxLiQ/SeW2xHCg9p3Invy2bY8tc3KfI1a8tLg7idpyqoEmA8/tGwst4k8yU3NYw9QqMqTDPEG8ykdG/aRePgFqZp4oXIeH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341700; c=relaxed/simple;
	bh=ONHK6in2QFugTZAdE+WlBVZjzs5/SaRPqlOjW5r82d0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r86YeWKBP7vSONBo/D1Y1B3WzSemLDTDoO22oJ3YDWmMW4ZI1V+7vuSRDc6YuOico6XFjxkjS4JpTtF0FNhmrN+TKOXgWZ5nZ6y6G4sPHnsS5w5EcmUrKy9v0niPj2BcmzV9jDE3goQnR/D//EET6vAnDcale6B37HLevdNpwBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VJvFRdzm; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VJvFRdzm"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hrrbw0hB5z8tb6;
	Fri, 25 Sep 2026 15:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790341692; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONHK6in2QFugTZAdE+WlBVZjzs5/SaRPqlOjW5r82d0=;
	b=VJvFRdzmjasGynjExD+5PDmk22sTHro/QyZxhGQWYqt0lxEugNgqvj/m3YEVmDzrFhnbZX
	lz8cIzjEiLThuScQ4227h1Z003PNsshSx75JzOfJeDjHL/I+No8gr/jSP+gAVgAupXqIsh
	oXUryIjzA6DtmGUYKJ+jPNBXAGiAAsaXyYCqIrHqMTd4F/OqBBItzMlOPtMz1Q3KSFkOVk
	9iyNonnsfhwNhPPj/JGLmzIaF2F0qCpBps55l7mYVwFpgd6lhnKIcA8dkhNp35LNWp058o
	/VFMOWLHWURnaxC57nXjUVXPyrb1DuVUJWekcR0VZjoxtC19A/fwe9ekHs378Q==
Message-ID: <f0248d1529378ab8be957009a93a0a73ee74bafb.camel@mailbox.org>
Subject: Re: [PATCH] rust: DmaFence: Add better warning through Device
 reference
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Philipp Stanner <phasta@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>,  Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?= <work@onurozkan.dev>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 15:08:05 +0200
In-Reply-To: <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
References: <20260925081958.3048112-2-phasta@kernel.org>
	 <DLOBPY6OBEOG.2Y4I4LRA276WU@garyguo.net>
	 <DLOECU7X3MTR.31Z6N1I0WB0MJ@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b787db3ca691950e030
X-MBO-RS-META: 8c6mfob1m1qd7hgqm67bx3qp9g1rki55

On Fri, 2026-09-25 at 14:30 +0200, Danilo Krummrich wrote:
> On Fri Sep 25, 2026 at 12:26 PM CEST, Gary Guo wrote:
> > On Fri Sep 25, 2026 at 9:19 AM BST, Philipp Stanner wrote:
> > > Replace the warning print with a dev_warn!(). To do so, have the
> > > FenceContext carry a reference to a Device, protected by the already
> > > present lifetime.
> >=20
> > Add a lifetime just to do this a print doesn't sound ideal. You could u=
se
> > `ARef<Device>` instead?
>=20
> Yes, that's what I recommend in general.

Weren't you super opposed to refcounting wherever it's avoidable?


[=E2=80=A6]

> That said, we can also use WARN_ON() instead, which avoids the device dep=
endency
> to begin with and still provides enough information to find the "offender=
".

WARN_ON() is fine by me.

>=20
> But as I mentioned previously, I don't consider this that bad of a condit=
ion in
> the first place. Signaling with ECANCELED on drop() seems perfectly reaso=
nable:
>=20
> When a driver does a teardown of the channel (or more generically the exe=
cution
> context) it will follow the RAII pattern, so it will be very natural to j=
ust
> drop the Jobqueue, which will drop all jobs and hence all DriverFence obj=
ects.
>=20
> IOW, driver will likely invent a new type that does the same thing on dro=
p, just
> without the warning. :)

The driver can avoid dropping half-forgotten stuff by calling
jobqueue.complete_all_jobs(ECANCELED) immediately before dropping,
which allows us for having the warning without false-positives.


P.
