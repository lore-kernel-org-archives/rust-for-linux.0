Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD503242B1;
	Mon, 26 Jan 2026 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445882; cv=none; b=JdLiqeEgxwdH/W/pEHxtDtOHOU1dOjgnj9lZp3l9XrPtGFeF16fzfcsY7yd8mAnmrlK+i6EUdUu3G+y6T8BytrVs98ou1e7B/DIruTBedcneVaEtUYoao7GEHejOZbsDeijQsqx7dlw7nVIR/AAiPoYY0Emz6n/jz6X86473bT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445882; c=relaxed/simple;
	bh=ffKQtPDpbfGS11T9Nc3mJZXIZs0b+SMUS1xWAPHHyL4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iVOUkQ9zITGOCa2RfJzEYE4I8U2jwtfXN/0zxnbp4xEnyRrrlcqdPp/wh4DJeye5A48XjL384bZVZmMzICxly7wsMU+Wcyyxgv/HKLOH6W8hP8/UZmKURgttV1q7s2uxdm5w0LhZLk6cmQiTi6ZVdZlEWem6qSeEp4ixR4S8kQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTWDB7cr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTWDB7cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5014C116C6;
	Mon, 26 Jan 2026 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445881;
	bh=ffKQtPDpbfGS11T9Nc3mJZXIZs0b+SMUS1xWAPHHyL4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=qTWDB7crEQ6Tg57qHfJ2hMOCqSpKIGDonGmy43Hgqhe6AwRLxaJppWvyB6uWyeuFx
	 mJchttBldxrZvOH8sR03go9G16WN07PWyAYeU4WOspfZnnePbzRDI6ItmaKv82foOV
	 qbO+87IZlyAE7NtfQzWaploMvJ4QyZ9M5HA83QHeY7ur351kyt3CeGzNAtiOtHqDnD
	 M5h6K6DUMdACwkZUV0RQblXAyA1vxXIzDaBLARS7AkZU3EaVMlbYlJKc/BsfnY6T7W
	 olHXJtkREM4FwWVXBiuFM4gjaMwKZKjyh0QSop22hLyUe5HCJMLhJ5Zf/iwXQGwDYU
	 PmqtBiiRGWzQA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 17:44:37 +0100
Message-Id: <DFYO7QI5YDJC.3EO91BDN01YBF@kernel.org>
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
 <20260126160036.2b2c66a7@fedora>
 <CAH5fLggFzHSB-iassPmwkP74h6qN6V6hYaCfjT0_JEvGoDecBQ@mail.gmail.com>
 <20260126163537.0ca199cf@fedora>
In-Reply-To: <20260126163537.0ca199cf@fedora>

On Mon Jan 26, 2026 at 4:35 PM CET, Boris Brezillon wrote:
> On Mon, 26 Jan 2026 16:07:30 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> On Mon, Jan 26, 2026 at 4:00=E2=80=AFPM Boris Brezillon
>> <boris.brezillon@collabora.com> wrote:
>> >
>> > On Wed, 21 Jan 2026 11:31:19 +0000
>> > Alice Ryhl <aliceryhl@google.com> wrote:
>> > =20
>> > > +/// A [`GpuVmBo`] object in the GEM list.
>> > > +///
>> > > +/// # Invariants
>> > > +///
>> > > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` =
and is present in the gem list.
>> > > +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>); =
=20
>> >
>> > I find the name a bit confusing: BO residency is often used to refer t=
o
>> > memory backing the buffer object, and in this case, you can end up wit=
h
>> > a GpuVmBoResident being returned for a BO that has been evicted (one
>> > that's no longer resident). =20
>>=20
>> Good point. I meant it as "present in list" but I guess there are
>> other things a gpuvm may be present in.
>>=20
>> Any naming suggestions?
>
> Valid, Bound, Present, Active?

I still have to catch up on this series, but quick drive-by comment: I'd go=
 for
'Registered'.
