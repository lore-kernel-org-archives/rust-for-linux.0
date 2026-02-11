Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8233893D;
	Wed, 11 Feb 2026 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804549; cv=none; b=DW0YcGI7EO4c9aNv8SCoJb/Yn8KWv/GFaoWe6smapazkpC891p9uqJIqes0JTTEoywb5ed0eOJPY2eyFWSCAHMc2vnr9Hqb8ZAJbRwQWhRW5Nh50Wu2pGq6G2RMPSuLhPRklbuTcAC+M42uo8XN2nqDxYkuQlULm/EgZtQ9gcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804549; c=relaxed/simple;
	bh=HEVCh6pKz/bnqK7JQNj4OgLdAcyirEtwdMFUXxgeC/o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQQ/BQJ+4O9dC0jXCnIFUaP3HQQwB3e6+t6aEIcvAMK4ejISMwepHDmx11EyxmeDlCyRblbx3aYUrQbL5Jg7STwn0bQE+MfQgQ3jJab6tcNKZUR7DTgZh+3pQxHs2oq7F5LMpkTNOpgIEzakyLzvAwZMIVdYIqvqu/0WTi9lQig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tRtKIc0H; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tRtKIc0H"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f9vKV3Yjpz9sQX;
	Wed, 11 Feb 2026 11:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770804542; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEVCh6pKz/bnqK7JQNj4OgLdAcyirEtwdMFUXxgeC/o=;
	b=tRtKIc0Hcxxsd+KjoFbsOzU51z2hp7ajQRuUokDGudMBL97qarHV46d+zB4dAX7vLB0/my
	KCiOSIr0Nt1SyYi72myoR82iFnvqSwz/WTOjsh/ofhCIwn/EJ3EcVSd+rSQ38fFXF6T4WQ
	LY89rlr3SBw6HTwuIlhCh60xwHAJJ81o9Vvo28q5WhzdrhZSNfLCTZks3G2qJOjoCzlf6J
	8CM11lgCwmDroSLsgXHgSiR+N/eB4yNFrD/U6fs6kyRYIgZRkrmibPvSM/3wyLaTH22ATl
	ZM8/+8OV3I42aSh9Z2x6g/HUd2QExL5fYF3MvY4FTcVZ2DBatX6KnJ+dhwslKQ==
Message-ID: <5f777c33469ef5c34467a12609233d72064a9297.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, phasta@kernel.org, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Gary Guo
 <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Date: Wed, 11 Feb 2026 11:08:55 +0100
In-Reply-To: <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
References: <20260205095727.4c3e2941@fedora>
	 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	 <20260209155843.725dcfe1@fedora>
	 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
	 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
	 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
	 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ehiawnajzhr1fnkrdkutyo7fb9kaidn4
X-MBO-RS-ID: 96200e600e59c8d4974

On Wed, 2026-02-11 at 10:57 +0100, Danilo Krummrich wrote:
> (Cc: Xe maintainers)
>=20
> On Tue Feb 10, 2026 at 12:40 PM CET, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 11:46:44AM +0100, Christian K=C3=B6nig wrote:
> > > On 2/10/26 11:36, Danilo Krummrich wrote:
> > > > On Tue Feb 10, 2026 at 11:15 AM CET, Alice Ryhl wrote:
> > > > >=20

[=E2=80=A6]

> > > >=20
> > > > Or in other words, there must be no more than wq->max_active - 1 wo=
rks that
> > > > execute code violating the DMA fence signalling rules.
> >=20
> > Ouch, is that really the best way to do that? Why not two workqueues?
>=20
> Most drivers making use of this re-use the same workqueue for multiple GP=
U
> scheduler instances in firmware scheduling mode (i.e. 1:1 relationship be=
tween
> scheduler and entity). This is equivalent to the JobQ use-case.
>=20
> Note that we will have one JobQ instance per userspace queue, so sharing =
the
> workqueue between JobQ instances can make sense.

Why, what for?

P.
