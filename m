Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5B3C0C;
	Wed, 11 Feb 2026 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770825096; cv=none; b=mlebC6nAuYUQM+o39AFqGJ7XvFAw6ZhTCwYNUoKRP2aeUJ/tEUjskxbVy9l9Ey59zAL8Oe8HaF36oBVQlgX/7ybIngYRqvjf4gXARrLYOBXX/IoKjXSwDZkV+NvwQIUKbQ0XGUB4cSW68pz24P/9ggE7eW8P9H/53jVAvOo8+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770825096; c=relaxed/simple;
	bh=Iey+EChssgWRCogmVNhp2zKX7+c9DLDfWteHuP7l6NE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWctfZLGLG+EAujItRWHezPDZzEpZ7GgIHNmlCi4ZVKB+PayDGuTWjVPlNEFNf/DWLOTvR4OHnEoe53jg2urlHAdw1LGglJ4DDlhAGsnh0F396pm5xPvHWGhdHMrdPKfDPMxEJ7xbWJTLcFhw0amXil92NVN9Z6rJ18AFeYNkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CNDcXoyK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CNDcXoyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770825093;
	bh=Iey+EChssgWRCogmVNhp2zKX7+c9DLDfWteHuP7l6NE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CNDcXoyKyfmyh3YVu9cXAANvfM/X8USP/9da2lw+3wSnAp9dQnSUnVO2PdWgTAqJo
	 xY5LR0A+sjgu5c1FbewjiapYQB2ly/2vsNDY4tWZZC3RVKJCTSV20sWIBULJ4Tzick
	 rzBX92qVlROwMJn6g3CHq21gSmeZ+9D2IfMVCMtSTTi2vprji9Y1G4g9DJpCSSI9Py
	 n3AZbuICn8C/7rIfH/udwwtkXayKytCzpNYsZ8cIaN35HyYoA5U5tLNDnGxinpEOMK
	 DepTw4swRHXtYIznt22FCJ/l+LnMmG8Ey9ppOXVIqXIEoVBfxFxFiG3EB39voF1l81
	 oum8a8TZJmDlQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F51117E1144;
	Wed, 11 Feb 2026 16:51:32 +0100 (CET)
Date: Wed, 11 Feb 2026 16:51:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>, Gary Guo
 <gary@garyguo.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260211165127.19f2f56e@fedora>
In-Reply-To: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-5-phasta@kernel.org>
	<20260210155750.5cdbe6cc@fedora>
	<8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	<20260211120742.0e9e7122@fedora>
	<f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
	<aYx0a-2eANbM_vnd@google.com>
	<DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
	<20260211150738.049af4bb@fedora>
	<aYydpYzd4AzFoAvZ@google.com>
	<bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 16:20:15 +0100
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:  
> > > 
> > > Back to this particular job dependencies use case: we have to embed the
> > > DmaFence pointer in some wrapper with the ListLinks element anyway,
> > > because DmaFences can be inserted in multiple of those lists in
> > > parallel.  
> > 
> > Okay, if that's the case, then the linked list is *really* not the right
> > tool for the job.  
> 
> We have to distinguish what we are talking about here.
> 
> For the JobQueue, it takes over a cloned DmaFence and stuffs that into
> its own list. Problem solved.
> 
> Whether the driver has other clones of that fence in other list is not
> relevant because it's not the same list head.
> 
> JQ's lists and list heads are internal.
> 
> I don't see a problem.

Both the list and xarray-based implementions will work, but what you end
up with when you use a list is items that look like:

struct Dependency {
	// Two pointers to insert the element in the list
	link: ListLinks,

	// The pointer to your fence
	fence: ARef<DmaFence>,
}

vs just the ARef<DmaFence> that's stored as a ForeignOwnable pointer in
some xarray entry. So the list overhead is still very much present, with
none of the benefits of the direct access you'd get if you were having
something like:

struct DmaFence {
	// Two pointers to insert the element in the list dependency
	list link: ListLinks,

	// Put the rest of the DmaFence stuff there
	...
}

which you can't have because a DmaFence can be in multiple dependency
lists at the same time.
