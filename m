Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC76367F36;
	Wed, 11 Feb 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805690; cv=none; b=O83exInwAjx52Nwy6NlBLap2d4fVxstvK6uCmfZSSYVfYWRrzOs/6aglGBACtGMK2omHdgYoFFbtM7e9Y15NHuJeAiEcnl+xFO08c+35DJBBboojvqG95bfC/eKR/lkFM1Ai3mxonmQth46TGK5MJqNkEtF/CgjYcM9fssnftXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805690; c=relaxed/simple;
	bh=N2ZPQqBSVooHIEfIdVe8c+HxQQL2Bv5AOu+mpnqjVBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsazClqloRyQZx9mNY2WveZHmI04GzGhdmRdKUqHp1gHKeFfxfy2HoopFfkcnCWodb6xSgURba4SAvHAs8gqL+htptR6OJ7j15Q0gsy83EUssHZV3058BnYTKi8e88aZx1E2mWdAP9XW/k6ed7HQfJoEiJzvUWJZ7BfhIuCura4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jfLtLllk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jfLtLllk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770805687;
	bh=N2ZPQqBSVooHIEfIdVe8c+HxQQL2Bv5AOu+mpnqjVBM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jfLtLllkMcmN2WDx0wFAGYXIAnd7+iP9dQlEUvkJmoyzbgZqlv9V0JaL0iP3EzovU
	 BovgheorJDxSruldxWpTP3XSQcEQrh+T2i6HiCwn5TO9GR7aSNjF8PS3rs8CNWwUFC
	 s1ARzPKJxwVbZaLUWXNPIzMJnhi5cQPg8a23AXHxW/wmRALdr2uc2XpYKewb1hC/Fr
	 8Z7gWlmYUiwRDBWXDJ+vlu3p6ADqYVPb9zKt4U6b2V68UvrMUkj3sLIjBH/2dWVDdO
	 yw9SUwu8/mBdsmcaxvT3j1q+oEsDpT8d4NwmZrQe3ZpQnFugFmuYQXocNLDDXtJ/9o
	 E7uZxKyYISf4A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BA0717E13E0;
	Wed, 11 Feb 2026 11:28:06 +0100 (CET)
Date: Wed, 11 Feb 2026 11:28:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260211112802.2956132f@fedora>
In-Reply-To: <5f777c33469ef5c34467a12609233d72064a9297.camel@mailbox.org>
References: <20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
	<DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
	<4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
	<aYsZHhX2IVO2kOSm@google.com>
	<DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
	<5f777c33469ef5c34467a12609233d72064a9297.camel@mailbox.org>
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

On Wed, 11 Feb 2026 11:08:55 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2026-02-11 at 10:57 +0100, Danilo Krummrich wrote:
> > (Cc: Xe maintainers)
> >=20
> > On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote: =20
> > > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:=
 =20
> > > > On 2/10/26 11:36, Danilo Krummrich wrote: =20
> > > > > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote: =20
> > > > > >  =20
>=20
> [=E2=80=A6]
>=20
> > > > >=20
> > > > > Or in other words, there must be no more than wq->max_active - 1 =
works that
> > > > > execute code violating the DMA fence signalling rules. =20
> > >=20
> > > Ouch, is that really the best way to do that? Why not two workqueues?=
 =20
> >=20
> > Most drivers making use of this re-use the same workqueue for multiple =
GPU
> > scheduler instances in firmware scheduling mode (i.e. 1:1 relationship =
between
> > scheduler and entity). This is equivalent to the JobQ use-case.
> >=20
> > Note that we will have one JobQ instance per userspace queue, so sharin=
g the
> > workqueue between JobQ instances can make sense. =20
>=20
> Why, what for?

Because, even if it's not necessarily a 1:N relationship between queues
and threads these days (with the concept of shared worker pools), each
new workqueue usually imply the creation of new threads/resources, and
we usually don't need to have this level of parallelization (especially
if the communication channel with the FW can't be accessed
concurrently).
