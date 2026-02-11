Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB49232B989;
	Wed, 11 Feb 2026 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811822; cv=none; b=O3N/DflEworY0YFqOrkDOKIq4xs3ImRY6s99g0IoGFSYJFNoXwheHWHhNapX7ITr429sMBW2UqBr8fCs2xZZghyQ37uZ/ASEtMUKAfUN+eKOO3BvaJbcARFS3qyh4VDdaJQ6pKJz7fBdNQ4Ww3ux5bZYvDw72/mD24V6r5ZJ5N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811822; c=relaxed/simple;
	bh=P3p1xktT0pu9lAayEx7pZPThoKCYb789KGT+yGz4pgs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIhmsxfGLjWB0jeVOoU8/ujL6mAqGgeD6caI8NqLDHE6wGY5cY+7189J4nphF08RBAa+Y+QTpObx9LbQ5wXFutU818wJneTHUdXXWxUA0UmGhJmu+V3LOTBBZskYyIXUBuRaUwHQnrSuvNBY5TrO99JA+Ux7dGUHIDoeTl7xk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nUtqJfHG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nUtqJfHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770811819;
	bh=P3p1xktT0pu9lAayEx7pZPThoKCYb789KGT+yGz4pgs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nUtqJfHGW/VdrzUhq/iDU1B2hd6zX59NQ4mJfrsT2c5dw04DR4DnEhGCmF9AokKnF
	 C+CMF5PPdJjMz5SW5qegYgrqo1IodYKgoyvnjoFeW5LGO/e2i0+D5oU07UHpg+1Fbe
	 viwI5ypcndC9O651GCdPHh+jVfwrp9UbrEuj6JyWCH1lniKSuKQuTyhCaJ2thrkl84
	 7A4Slnfa51Zl4D1RdA1ygpmRwNmhG2lcXY5TVqTt7J6GdC7rzF3YJJHQ2U3L7hbR2b
	 SD+lRbMfgzs9yLUqVNMf3dmLqjvwfWWGdHKC1zZHCmkjiGToIAQTY/52WYOSO44RZF
	 10+eUMekqxotA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7DB717E1274;
	Wed, 11 Feb 2026 13:10:18 +0100 (CET)
Date: Wed, 11 Feb 2026 13:10:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alice
 Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260211131015.7bf38cf9@fedora>
In-Reply-To: <DGC3B6XIY3DW.M3CRU3IAUKOJ@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-5-phasta@kernel.org>
	<20260210155750.5cdbe6cc@fedora>
	<8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	<20260211120742.0e9e7122@fedora>
	<DGC3B6XIY3DW.M3CRU3IAUKOJ@kernel.org>
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

On Wed, 11 Feb 2026 12:19:04 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Feb 11, 2026 at 12:07 PM CET, Boris Brezillon wrote:
> > I try to avoid using concepts the language I rely on is not friendly
> > with.  
> 
> It's not really a language limitation. For instance, you can implement lists the
> exact same way as they can be implemented in C. It's more that a memory safe
> list implementation is quite tricky in general.

That's what I mean by trickier to use, they are because of rust safety.
And again, that's not a case for saying "nah, rust is not a good fit, it
can't do easy-to-use-lists", but rather a good opportunity to think
twice about the containers we want to use.

> 
> Lists clearly do have their place. In this specific case, it probably doesn't
> matter too much, but in general I'd abstain from not using a list (where it is
> the best fit) just because they are tricky in getting them implemented in a
> memory safe way.

Read my other reply. I'm not saying "don't ever use a list in rust!",
I'm saying, "if there are valid alternatives, and they make things
slightly simpler, why not use these alternatives". And that's the case
here I think, especially since the C side does exactly that (using an
xarray over a list). Note how I didn't mention the list under the
JobQueue, because for that one, I'm not too sure XArray is a good fit
(jobs might be moved around between lists depending on their progress at
some point).

