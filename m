Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E238552C;
	Mon, 23 Mar 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260381; cv=none; b=DSPpuqESGl8ToNBzVJmD1IobuMeVWmY1WM7htPqUj2imnhr3qrF0GkzOW9Z5XOhuz/S48N0iPU3BQYlqn0BDQ/GmV3uAnbhJ1qkevAWACktch81ChkmaxjDX/APspXmmKm6vRy4fvji9aJtLG0jPZ69EinmM0f/wrsEwgBc+5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260381; c=relaxed/simple;
	bh=MfZ7qPnGcDwwnRnY9NtGnFB+PxjGvuhIOJK3a6BMpKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGgTQRq38AtwLEz+lArqrgGBO46ltGeSj/6+ebhnby/KFLcv8dCTR63cApHG7Tabr/3XtmF1SQgONELpn3TH3ZuUUHnWynt244AOFcvNYAVU+v0x7Frfa0l4GCWAYPaRu1I+Urno5GBIDQBbMZhQc8pRT6k97WvqaIGjbWsWm5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IxwpJzeI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IxwpJzeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774260378;
	bh=MfZ7qPnGcDwwnRnY9NtGnFB+PxjGvuhIOJK3a6BMpKA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IxwpJzeI4t1CjUM+iN9WyQ7cLwziTwjCYsUSSiqB1B1YD1zOhx0OcW8CrADEGyyMc
	 feGdLCSX/93TxUBwhfEWZDm7wmbd/MB/rBVsJNBDBmsc9UhLmqzysRB99E1nnMhpTf
	 +AT44hx81Mvon8pB+7hsNEimTKchyqwSPpYV9XDmu2JkBkrk7ZdKA7H2WP6aNzZ+p5
	 wp+YIfqM9O7VaqtPhV9OepM+6ieXZJKFvHLhAdo3aL/lpNidl1fcLzy1tDj43XRsfj
	 v7TReSRMOkP+4Wv3aS92SlmdlJqxCc4+F3vuni1hbXdsbsEEgVHjtTBX/hIbxxyzpH
	 31KFf195qmr/A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07EB617E0071;
	Mon, 23 Mar 2026 11:06:16 +0100 (CET)
Date: Mon, 23 Mar 2026 11:06:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Danilo Krummrich" <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, Sumit
 Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Jeffrey Vander Stoep <jeffv@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, Daniel Stone <daniels@collabora.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <shashanks@nvidia.com>, <jajones@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
Message-ID: <20260323110613.6b153163@fedora>
In-Reply-To: <acDyu5M7KY0qQ5aD@lstrano-desk.jf.intel.com>
References: <20260316043255.226352-1-matthew.brost@intel.com>
	<20260316043255.226352-3-matthew.brost@intel.com>
	<7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
	<abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
	<abmaDElHmbQkYy57@lstrano-desk.jf.intel.com>
	<20260317214320.74e6c130@fedora>
	<absp4z1Op0BrXReP@lstrano-desk.jf.intel.com>
	<20260319105729.2c20116d@fedora>
	<ab+PgBzwJkhhj6dw@lstrano-desk.jf.intel.com>
	<acDyu5M7KY0qQ5aD@lstrano-desk.jf.intel.com>
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

On Mon, 23 Mar 2026 00:58:51 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> > > It's not the refcount model I'm complaining about, it's the "part of =
it
> > > is always freed immediately, part of it is deferred, but not always .=
.."
> > > that happens in drm_dep_job_release() I'm questioning. I'd really
> > > prefer something like:
> > >  =20
> >=20
> > You are completely missing the point here.
> >  =20
>=20
> Let me rephrase this =E2=80=94 I realize this may come across as rude, wh=
ich is
> not my intent.

No offense taken ;-).

> I believe there is simply a disconnect in understanding
> the constraints.
>=20
> In my example below, the job release completes within bounded time
> constraints, which makes it suitable for direct release in IRQ context,
> bypassing the need for a work item that would otherwise incur a costly
> CPU context switch.

In the other thread, I've explained in more details why I think
deferred cleanup of jobs is not as bad as you make it sound (context
switch amortized by the fact it's already there for queue progress
checking). But let's assume it is, I'd prefer a model where we say
"ops->job_release() has to be IRQ-safe" and have implementations defer
their cleanup if they have to, than this mixed approach with a flag. Of
course, I'd still like to have numbers proving that this job cleanup
deferral actually makes a difference in practice :P.
