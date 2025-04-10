Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF028134E
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280635; cv=none; b=QGYFJXARh+SQWcSBCG0/GEk3Z+fZqok7V9oohmTxBsGIaz4spb0nfNrLywDw0Unmv1sjDVrRKicHRyVxO9yzHO3t1VkLmuy21yBkGDAjFmGFZkMlwd8m24vZNbh/uKBPNyFmYbxQHjhb1TxK8EetS0Ugugm5VXrM/YKaEr56iaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280635; c=relaxed/simple;
	bh=Tp8fVFya2sDu1gbTPaE9ZzIfUzdt0ybqaGGQcQT5y/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKYzFR1elGGWI4wgOwdNtk7V8fOF4mKr03tqW/EjQYRCF/a/jWNAZbq9OKKnYmLwTpauf6iZloGGjlbVG7N67wxrrDo7oOJCIqCXSmdY7yCx4KdMfJ4nCnr3GIDWutKU9Ay/ukgp7JsouskQ5Bj2yrgNa40ooWQBOJtLScQuzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEMDGxLX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEMDGxLX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEC5C4CEE3;
	Thu, 10 Apr 2025 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744280633;
	bh=Tp8fVFya2sDu1gbTPaE9ZzIfUzdt0ybqaGGQcQT5y/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jEMDGxLXxhbiuPezMF4HpoTksgTgJL7LvLWseKpFBDdxX92oygkJZC9xXHh5SAIZL
	 yW0JCjXX9TbWQOMAYyVt9Wi3CEfDzKQ6aW2/PlLWKm51ubMHO2RBx3+bXg8Tde1U4k
	 LgNSn15btv+B2lC5AdgT5Iv286EPCnMbE3GPdUnhcH6hHD0JtjOZBgXZrGQg8KIt9/
	 +qK2RPA2v0gq10eWFB91/h9+Q46JOIN5f7h22XqVGI4Ql6MNfEBo2TH4isuu2tvQ4v
	 91iEGrwSj2oj1AzaSUqQgcUrFs7EEMx4wKYY/EMSEHT7+dthZki1pMWaFEAqbMhV3A
	 DuIiGFl8vhpfg==
Date: Thu, 10 Apr 2025 12:23:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Asahi Lina <lina@asahilina.net>
Cc: Dave Airlie <airlied@gmail.com>, maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de,
	lyude@redhat.com, acurrid@nvidia.com, daniel.almeida@collabora.com,
	j@jannau.net, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] DRM Rust abstractions
Message-ID: <Z_ecMl2QtAssfczJ@pollux>
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
 <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>

(Adding Sima and dri-devel back in.)

On Thu, Apr 10, 2025 at 04:12:13PM +0900, Asahi Lina wrote:
> 
> P.S. my analysis based on the pasted code (since everyone here and
> everyone on Reddit is forcing me to do it) is that:

First of all, you keep talking as if I would have been resisting to do any
changes, even though I offered you to change things from the get-go.

Instead of taking the offer, you decided to go with wild accusations, without
even properly looking at things and understanding my intentions.

Given that you stepped back from kernel development, making clear that you don't
want to be bothered with it anymore (as you also repeated in this thread), I had
to take a decision: Do I "keep" your primary authorship for commits that I
(newly) create, commit messages I write and code that I substantially change, or
do I account for this by changing primary authorship while still giving you
credit.

The decision I took is clearly reasonable and *nothing* about it is uncommon.

I also want to point out that for patch "rust: drm: ioctl: Add DRM ioctl
abstraction" I kept your primary authorship, since I took the patch "as is" with
just very minor modifications.

However, I understand that you prefer to have primary authorship, even if the
code has been re-organized in new commits, moved, modified or rewritten.

This really is *totally* fine for me, and I won't argue about it (even though
one could).

> The series adds around 978 lines of code. After merging some code that
> was just moved around in the diff that Danilo posted, only 412 addition
> lines remain in the diff. So more than 50% of the raw remaining code is
> mine. If you exclude comments, Danilo only added 270 lines of actual
> code (and whitespace). And of those, a good portion were just minor
> changes and refactoring, not completely novel code (this also tracks
> with the stat that to get to those 270 lines, 379 were removed, and much
> of those probably pair up as minor refactorings and not outright novel
> code).
> 
> In terms of actual code added an not just lines rearranged or further
> commented, I probably wrote at least 75% of this series. And I'm sure
> Danilo knows this, having done the refactoring/rearranging/modification
> work to get here.

I do not understand what you are trying to proof here and especially why.

I also do *not* agree with the above; to me it looks like it does not account
for the cases where code has been moved *and* modified.

Here's the full list of changes for the diff [1].

  - rewrite of drm::Device
    - full rewrite of the abstraction using the subclassing pattern

  - rework of drm::Registration
    - this may seem like a trivial simplification (or move), but has
      architectural implications to prevent use-after-free bugs
      - some members (vtable) of drm::Registration need to be tied to the
        lifetime of the drm::Device instead, *not* the drm::Registration
    - introduce Devres

  - rework of drm::File
    - switch to the Opaque<T> type
    - fix (mutable) references to struct drm_file (which in this context is UB)
    - restructure and rename functions to align with common kernel schemes

  - rework of the GEM object abstractions
    - switch to the Opaque<T> type
    - fix (mutable) references to struct drm_gem_object (which in this context is UB)
    - drop all custom reference types in favor of AlwaysRefCounted
    - a bunch of minor changes and simplifications (e.g. IntoGEMObject trait)

  - MISC
    - write and fix lots of safety and invariant comments
    - remove necessity for and convert 'as' casts
    - bunch of other minor changes

The sum of the above is clearly *not* minor.

I really don't agree with the fact that you keep accusing me of "stealing" your
code, which I clearly did not. Trust me, I don't need that.

> Danilo: If you do not take me up on the CC-0 offer, I expect you to put
> my name as primary author of patches 3 through 7.

I offered this from the get-go, hence I will do so.

However, are you sure you really want primary authorship for "rust: drm: add
device abstraction", given that drm::Device is a full rewrite?

[1] https://pastebin.com/FT4tNn5d
