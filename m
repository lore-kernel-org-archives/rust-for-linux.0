Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAC36EA91;
	Fri,  6 Feb 2026 13:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384256; cv=none; b=O2x0FklrYbYsOJD918t7YpJT5rjlpGBApNEJnjTGKTCrOnf9K5H8qhXF8jrTI5ohEeelwVrn07OlcKCdONm4KWUETbzoFy/a8nutouqCV9elTseN67fQLd0wbiyJbwQpHrd30TGKo1cA7pC+6sULNXRYT6thivs7f3G6BV/Fxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384256; c=relaxed/simple;
	bh=IECraKXcd+DHvtqKBKFL8sBG2lu0xAmadIGOT9Xlu48=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DE+lrlfQvldeHgFmiyZRv+4mDqAaV6TZi0mfys82SSCZ67Kfp/uv7YJdPAz/aqgheHiBQXSHYbgg+4Smbo+9Ebf1uQODfgUJdtQ9hLi0ISGLC3nxc0Hre6VT36cUvOlJGOeZ34WL/NXON2Tq0z2MJRXOgk1xyyw5Q77115m9qpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K26n/U8+; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K26n/U8+"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f6vtt1k8nz9v0k;
	Fri,  6 Feb 2026 14:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770384246; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYWqaXVjd2MJvpggWG6HolNNYe1161PvcKLpwFeMfMI=;
	b=K26n/U8+43MymQ3F3qp01iXHwSPx7inT9pyNW5YaKRbI9Wnqre0PHPkGE5Mxou447vFoYU
	GzxfxTvu/khs7rKIYb6pAcmSpi13rXlkyRRLBVeCTFhso7R5pxHGaElLx2PVD4CQwc4Kik
	pEQeGQpdgJJa4uMB0baRJXJkXiBOKQFc7HSkPOtcsRKv0m4r4uLJiMll6cRDTUo23KDr6i
	5/+u3+5hlKaKmgk7Fae0k7UG/sK2Qbbu0DByX/FK2KvbgzDQak15e/MAK3Y+1b3RvNssqC
	4AidFvnbLHHpaTV2ZBX9EcJSMPj37sUQzkQBuj6OwbiSFxf48p2dSjEA2W6s/w==
Message-ID: <7f1527d29ff1ea30d6d6ff2117e7aa547b4a7f00.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Gary Guo <gary@garyguo.net>, Boris Brezillon
 <boris.brezillon@collabora.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Benno Lossin
 <lossin@kernel.org>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  rust-for-linux@vger.kernel.org
Date: Fri, 06 Feb 2026 14:24:01 +0100
In-Reply-To: <DG7SURIB90VK.1B71FGJR6U5GZ@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-4-phasta@kernel.org> <20260205111635.5307e1fa@fedora>
	 <DG721WEFTFZY.2CSCXBQ8H0Y1A@garyguo.net>
	 <62b82ffdd40d568d822bda8cdea83cd030851f68.camel@mailbox.org>
	 <DG7SURIB90VK.1B71FGJR6U5GZ@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ytoawgktusi6ejpfkembixk9amq8yt5u
X-MBO-RS-ID: 24c03068de65f583e93

On Fri, 2026-02-06 at 11:16 +0100, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 10:32 AM CET, Philipp Stanner wrote:
> > Who needs fences from another driver?
>=20
> When you get VM_BIND and EXEC IOCTLs a driver takes a list of syncobjs th=
e
> submitted job should wait for before execution.
>=20
> The fences of those syncobjs can be from anywhere, including other DRM dr=
ivers.
>=20
> > I think we should go one step back here and question the general
> > design.
> >=20
> > I only included data: T because it was among the early feedback that
> > this is how you do it in Rust.
> >=20
> > I was never convinced that it's a good idea. Jobqueue doesn't need the
> > 'data' field. Can anyone think of anyone who would need it?
> >=20
> > What kind of data would be in there? It seems a driver would store its
> > equivalent of C's
> >=20
> > struct my_fence {
> > =C2=A0=C2=A0 struct dma_fence f;
> > =C2=A0=C2=A0 /* other driver data */
> > }
> >=20
> > which is then accessed in C with container_of.
>=20
> Your current struct is exactly this pattern:
>=20
> 	struct DmaFence<T> {
> 	=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> 	=C2=A0=C2=A0=C2=A0 ...
> 	=C2=A0=C2=A0=C2=A0 data: T,
> 	}
>=20
> So, in Rust you can just write DmaFence<MyData> rather than,
>=20
> 	struct my_dma_fence {
> 		struct dma_fence inner;
> 		struct my_data data;
> 	}
>=20
> > But that data is only ever needed by that very driver.
>=20
> Exactly, this is the "owned" type that is only ever used by this driver.
>=20
> > They are *not* a data transfer mechanism. It seems very wrong design-
> > wise to transfer generic data T from one driver to another. That's not
> > a fence's purpose. Another primitive should be used for that.
> >=20
> > If another driver could touch / consume / see / use the emitter's data:
> > T, that would grossly decouple us from the original dma_fence design.
> > It would be akin to doing a container_of to consume foreign driver
> > data.
>=20
> Correct, that's why the suggestion here was to have a second type that is=
 only
>=20
> 	struct ForeignDmaFence {
> 	=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> 	=C2=A0=C2=A0=C2=A0 ...,
> 	=C2=A0=C2=A0=C2=A0 /* No data. */
> 	}
>=20
> i.e. it does not not provide access to the rest of the allocation, since =
it is
> private to the owning driver.
>=20
> This type should also not have methods like signal(), since only the owne=
r of
> the fence should be allowed to signal the fence.


So to be sure, you envision it like that:


let foreign_fence =3D ForeignDmaFence::new(normal_dma_fence)?;
foreign_fence.register_callback(my_consequences)?;

?

With a foreign_fence taking another reference to bindings::dma_fence I
suppose.

Which would mean that we would need to accept those  foreign fences for
jobqueue methods, too.


And what kind of fence do we imagine should

let done_fence =3D jq.submit_job(job)?;

be?



P.
