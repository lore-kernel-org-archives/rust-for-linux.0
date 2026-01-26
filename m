Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C205D23EAB3;
	Mon, 26 Jan 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441743; cv=none; b=T4BNfEePc37X8NeQKBBj0UELchCIOBI7HaDwR5e6YtmTpWCIhSDh4YdUSg80oqYS1m799m+kSd8W+STOINzHAj3wTZc3eIDWM+mp/35D7OA405Rux9oE4X7NCes7BhmW6QtktzMwasTW+NlIBFi9+vAQcY27PnpRDn4PesTtVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441743; c=relaxed/simple;
	bh=Zsj5GV2Wx59l0SS2ck0KTf647N++hXpV2gQqB1R2r34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LsBwXUfEoi+itesU6ETlx3LKaah9fOkGmM8fGBseWsvESaMeP6rvZiCO+L21cf+ZrUCG7dNxxOhh40DSSuc2sddaIVF0m61LngemMIOk8jMnHwMhIssLPe0ZF9iopVvJG3ZH8cFhBGEa8L1kOSp7qcXWrwTthzGs1tUfPeiVSOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WEyJc2xN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WEyJc2xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769441740;
	bh=Zsj5GV2Wx59l0SS2ck0KTf647N++hXpV2gQqB1R2r34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WEyJc2xNIDS1rc69lK2hGe+0nUtvu9VR4xim8dthi8gOgnyRID1GyJQ6ss/4UHlux
	 PxTrZWSuCYNp/ao1NHKvjDXNJzr6uBOKQrEXUTYcnYseQGg6Eq9l7ndlLEfXQHz2Yl
	 ImCB093+G7/Vqy4TAhD5r/43a+j66ATpnMtWtKkoLCGzylOa29QzElgvXr87y61J8t
	 1aw0YZFFYe408K/lhflrM1hu4TyqxU+jT6FouPUpETA9x0n13rqRWzyrrO7n+pAQbF
	 jXiFoMufibJDkjTFY06obHbAy9Xbjwk62duG0Vi/IZquv9WPkbvNOGhSP/FWlNeYXk
	 5qFBFr1/9VTwg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD26817E0E6C;
	Mon, 26 Jan 2026 16:35:39 +0100 (CET)
Date: Mon, 26 Jan 2026 16:35:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Janne Grunau <j@jannau.net>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Asahi
 Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
Message-ID: <20260126163537.0ca199cf@fedora>
In-Reply-To: <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
	<20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
	<20260126160036.2b2c66a7@fedora>
	<CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jan 2026 16:07:30 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Jan 26, 2026 at 4:00=E2=80=AFPM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Wed, 21 Jan 2026 11:31:19 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> > =20
> > > +/// A [`GpuVmBo`] object in the GEM list.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` a=
nd is present in the gem list.
> > > +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>); =20
> >
> > I find the name a bit confusing: BO residency is often used to refer to
> > memory backing the buffer object, and in this case, you can end up with
> > a GpuVmBoResident being returned for a BO that has been evicted (one
> > that's no longer resident). =20
>=20
> Good point. I meant it as "present in list" but I guess there are
> other things a gpuvm may be present in.
>=20
> Any naming suggestions?

Valid, Bound, Present, Active?
