Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C633DEADC
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346562; cv=none; b=oXHfjue2T3BwbpDWc7Vdne45+AZ/G4+wNdH6Te8wL6E4A+g+NZ4F2u5nGTcWD0MCl9js+5xxVqy7BgurVawgAHrGYuXtpUkatLXVSw3h0/e0XlGmHvjqNd1GR98LGJzX+cwXAhZWoRd8zitJ6CeElYOSQj34qRJJdaixUj0CWZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346562; c=relaxed/simple;
	bh=NsIVwTttN5mLTvYAaW7hDJrj3FCgMBu36e1Fhhf8Eck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0Mwlllwo67Pp4FyYlk41xftljJkrkN3PQ8tDm6d0arw2yr4Q6uom2EcytR4btOrmYGZgPvUb/z64G0GC6kl0VKxZK5uUyFibo5B7KeeldXilbf1ntlmes//hSjuwF7icmlK2M4QZ6YZ4534qnaeLCeRXo35N6aZ9g2uDJ4UXVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Wa4WwthL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Wa4WwthL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774346556;
	bh=NsIVwTttN5mLTvYAaW7hDJrj3FCgMBu36e1Fhhf8Eck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wa4WwthLHMlLRf/BlizcxrTsR9rWSxk2tU62xH+RJKZGOx0wJCkAfL+TAiEA0CBC2
	 YlRVwcUCon99miPluMZet8cICqRXpU1Q1wGJxe2R4GuVFR5tWKn4Q2osglh+8B5C6x
	 UTk4NpG0deTS75K698XrQ9YB4TabaFhdngddJXx7W9jNbQwztvgvMMGrUy7DYJoEc/
	 7oaqlrYbVOVx4iNHlrixQLzMf3BUdDLbaboQgDFDaLVxjh3aYU9iJzxvncPIYLW5WH
	 p1On0PP1NIB654pgvI7Lciy8q00hPkPiUZ4XYDD6WPnQmjr5X0BYAls4u4YF/j1XZg
	 5zoiYj7kj8xlQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7938F17E4B9C;
	Tue, 24 Mar 2026 11:02:35 +0100 (CET)
Date: Tue, 24 Mar 2026 11:02:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Boqun
 Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 06/12] drm/tyr: Remove custom register struct
Message-ID: <20260324110231.2bc0f75a@fedora>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-6-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-6-a87daf9e4701@collabora.com>
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

On Mon, 23 Mar 2026 17:18:08 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Now that Tyr uses the register! macro, it no longer needs to define a
> custom register struct or read/write functions, so delete them.
> 
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/regs.rs | 33 ---------------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 869bad81d988b4c3d4d65e014d646b6db568e919..f337d99387417a2eca94cd2d7ce8c8fa38bb1cee 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -27,39 +27,6 @@
>  // does.
>  #![allow(dead_code)]
>  
> -use kernel::{
> -    device::{
> -        Bound,
> -        Device, //
> -    },
> -    devres::Devres,
> -    io::Io,
> -    prelude::*, //
> -};
> -
> -use crate::driver::IoMem;
> -
> -/// Represents a register in the Register Set
> -///
> -/// TODO: Replace this with the Nova `register!()` macro when it is available.
> -/// In particular, this will automatically give us 64bit register reads and
> -/// writes.
> -pub(crate) struct Register<const OFFSET: usize>;
> -
> -impl<const OFFSET: usize> Register<OFFSET> {
> -    #[inline]
> -    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
> -        let value = (*iomem).access(dev)?.read32(OFFSET);
> -        Ok(value)
> -    }
> -
> -    #[inline]
> -    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
> -        (*iomem).access(dev)?.write32(value, OFFSET);
> -        Ok(())
> -    }
> -}
> -
>  /// These registers correspond to the GPU_CONTROL register page.
>  /// They are involved in GPU configuration and control.
>  pub(crate) mod gpu_control {
> 

