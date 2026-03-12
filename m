Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9904299A94
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305462; cv=none; b=tHx3xPoCztJQV3GD+J0KN5Fgo9voprky5Sj4m5q7lM4WYWid4AISJyotfTnQZ3REjbZU+90kztPtI0zL1wDMSsUgqW4+/UDvx62AVqkTelOUQEm4QqOeBnHzyltEbimzii0+PTbPllUSYSF822zcOYK2M+EXw1nClQ4CJJfEAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305462; c=relaxed/simple;
	bh=ZdmxOj35Via6EMadfC+VIYLWts8SEKTTORUJWDzo7zc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlIFa6jt0Hc4VYSFxArgSis7FDf2TKIeC95LlFBRuvJuU9qJ1A66MRc8BId2iK+Ntw3BHC+ypjTNM4nU5B/IGs0zuGyuOIMPhMcP81fFLATtdHIlEz+hM/5ZTGrZxm2kyHsgtmxeqIYk6G4NDs59HfMsMupyK5UPeoyl0VjIZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=POi1zhto; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="POi1zhto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773305459;
	bh=ZdmxOj35Via6EMadfC+VIYLWts8SEKTTORUJWDzo7zc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=POi1zhtoOuPrNtYt7puRjcEw+UOARXUTLjT+3UlF7a0RtAS6NUxQ1GwWD18s2Q5tW
	 yJOn1w4AII0HKM2XbD3RG5AgOiHUJHUH7MKYQpRGbXk1ax2sG56aMS2r7VR+RY+ODO
	 5SapVS+jGcth3zVvxfRP4xJ258kUsPYjSTUzev7YVKwBHXzGlqEvTEV8UsIxCbeay5
	 BFvFwCiA4LBjlKJGtcbIyoftwGho0lFl/xGw6P6jdOP45Gy1ODBAvnwBv32+yWtMTY
	 1G+R/39fxDsANIbnBUaQout6Pc0X3VTP8Esg5FHlylfSeHX5GoNoPNY2Ker4+rgWe9
	 oZuZzVk9XUfLw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBD4D17E026C;
	Thu, 12 Mar 2026 09:50:58 +0100 (CET)
Date: Thu, 12 Mar 2026 09:50:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v2 0/5] drm/tyr: Use register! macro
Message-ID: <20260312095052.65053bdf@fedora>
In-Reply-To: <20260312094330.481ec488@fedora>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
	<20260312094330.481ec488@fedora>
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

On Thu, 12 Mar 2026 09:43:30 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Wed, 11 Mar 2026 16:03:57 -0700
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > This series changes the Tyr driver to use the kernel's register! macro
> > for hardware register access, replacing manual bit manipulation and custom
> > register structures with a more type-safe and maintainable approach.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > This series depends on:
> > [PATCH v8 00/10] rust: add `register!` macro
> > https://lore.kernel.org/rust-for-linux/20260310-register-v8-0-424f80dd43bc@nvidia.com/
> > 
> > Changes in v2:
> > - Rebase on v8 of register! macro series;
> > - Add documentation;
> > - Remove manual functions to get address bits;
> > - Revise gpu_info() to use macro;
> > - Revise l2_power_on() to use macro;
> > - Set interconnect coherency protocol with macro;
> > - Separate commits for each register page;
> > - Replace HI/LO pairs with 64bit registers
> > - Order registers by address;
> > - Remove doorbell clear field from GPU_IRQ_CLEAR;
> > - GPU command is redesigned to accommodate multiple layouts;
> > - MMU register bits corrected;
> > - Use UPPERCASE for register names;
> > - Move the consts to impl block for registers;
> > 
> > ---
> > Daniel Almeida (1):
> >       drm/tyr: Use register! macro for GPU_CONTROL
> > 
> > Deborah Brouwer (4):
> >       drm/tyr: Set interconnect coherency during probe
> >       drm/tyr: Use register! macro for JOB_CONTROL
> >       drm/tyr: Use register! macro for MMU_CONTROL  
> 
> Could we also have a commit exposing hardware DOORBELLs as a register
> array?

Or maybe we wait until those are actually needed, dunno. It just feels
weird to not have all the registers defined, but still have some that
are defined by not used (MCU_CONTROL, JOB_IRQ, ...). Seems like we've
taken the 'only-define-what-you-need' path, but only partially followed
this rule :-/.

> 
> >       drm/tyr: Remove custom register struct
> > 
> >  drivers/gpu/drm/tyr/driver.rs |  32 +-
> >  drivers/gpu/drm/tyr/gpu.rs    | 213 +++++-------
> >  drivers/gpu/drm/tyr/regs.rs   | 785 ++++++++++++++++++++++++++++++++++++------
> >  3 files changed, 792 insertions(+), 238 deletions(-)
> > ---
> > base-commit: 91c02cfa16427b078c8a74f2b96123b579fdb07f
> > change-id: 20260311-b4-tyr-use-register-macro-v2-cdc89155045a
> > 
> > Best regards,  
> 

