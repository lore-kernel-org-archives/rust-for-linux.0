Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C8136A022;
	Wed, 11 Feb 2026 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806858; cv=none; b=aq85WxOBgT1D/PWg+80PSfSSn0tnkIRX3V4ObZObHT28sAfFaWZjXw02neZ1v1vU+cA9JMu3jOW0RNgVjx3biOWlHug8v8/hE06tzHIdVMlwrjw8w+Bh4qQChifxFjpwr8kik2gzGB9ANmJopkurNxtRxogrsewm8mLkqiW2z2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806858; c=relaxed/simple;
	bh=t5z29sdjoI2pyDdH/AdNiFMZxUo2NeeZNAipSnwq5zw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MCzEEv52YOiK/N7oOMncezQ0auZ6c0xMc+q/q8ocXskc8rc7t+Wb8osEkfSVKX3fPKSn0BXIJ7tmoOroWiGbHP1TXCVYHg4qY0KP7lMvZKydFiaphy/fhjxfLtf2xsTKnCkwfW8AYsUsZuAUbypKUr7DSSNXRkAFJgY0U91TSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SRA72+b1; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SRA72+b1"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f9w9w1fWZz9v0f;
	Wed, 11 Feb 2026 11:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770806852; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5z29sdjoI2pyDdH/AdNiFMZxUo2NeeZNAipSnwq5zw=;
	b=SRA72+b1owHd36VTHquTwabZexBV4RC/kvuGEz3D48A2+Cnj1onNOTs02Ny/9a1T70vkDu
	zCuqD2zQB2hBQ7C5q8g5Wdp/GUx8GVAgBScWV0ee4ruGPCS78rSxIMw1fMtEhYm5+dT190
	zpgWr6vHDgZ2JCDikHlw7WG76LeJO+dcfSwUgrJeDxSFBH3812+GVHJ4atWLhUi8m65+I/
	96tdQq1j09K2rIek/8oFwuF0HzOp1OpM0ryFuvihKg5GffKWcz46b5KVjAUz6MpeVydxTc
	JVflLxiqLbCnpXAijfUXfezL3EmlX7TeKwrkaVqyzI1H6W/dVElYb2E6+wqBKQ==
Message-ID: <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>,  Benno Lossin <lossin@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Wed, 11 Feb 2026 11:47:27 +0100
In-Reply-To: <20260210155750.5cdbe6cc@fedora>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: e1f3d9352780d436a1a
X-MBO-RS-META: xfo3rdi318f5njketuggfaicofkmdy9d

On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
> On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
>=20
> > +/// A jobqueue Job.
> > +///
> > +/// You can stuff your data in it. The job will be borrowed back to yo=
ur driver
> > +/// once the time has come to run it.
> > +///
> > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (ownership =
transfer).
> > +/// You can set multiple [`DmaFence`] as dependencies for a job. It wi=
ll only
> > +/// get run once all dependency fences have been signaled.
> > +///
> > +/// Jobs cost credits. Jobs will only be run if there are is enough ca=
pacity in
> > +/// the jobqueue for the job's credits. It is legal to specify jobs co=
sting 0
> > +/// credits, effectively disabling that mechanism.
> > +#[pin_data]
> > +pub struct Job<T: 'static + Send> {
> > +=C2=A0=C2=A0=C2=A0 cost: u32,
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 pub data: T,
> > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
> > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
> > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
> > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,
>=20
> Given how tricky Lists are in rust, I'd recommend going for an XArray,
> like we have on the C side. There's a bit of overhead when the job only
> has a few deps, but I think simplicity beats memory-usage-optimizations
> in that case (especially since the overhead exists and is accepted in
> C).

I mean, the list is now already implemented and works. Considering the
XArray would have made sense during the development difficulties.

If it were to make sense we could certainly replace the list with an
xarray, but I don't see an advantage. The JQ just needs to iterate over
the dependencies to register its events on them, and on drop to
deregister them perhaps.

We have many jobs, but likely only few dependencies per job, so the
lower memory footprint seems desirable and the XArray's advantages
don't come to play =E2=80=93 except maybe if we'd want to consider to avoid=
 the
current unsafe-rawpointer solution to obtain the job, since obtaining a
job from an Xarray is far faster than by list iteration.


P.
