Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFA322A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771784005; cv=none; b=cR3w0/xTrXZG3+/Sh7An1k9xwv/WuTpy44LmabfymjKXy91l815/UmDonjUYsHnN3UGuI9gJDcfbR2EXd56r42bWdaYUVvSPiyeehOMqv9pjKjzq0iUk1Pmmt84f1ylu6dy7Vx59H9SkUipkVLoLUjir08K3NtoBXBkQaAtZ7vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771784005; c=relaxed/simple;
	bh=hIqgXZd5FMqfLfyGvz8FJHmE2JgWnHUAv7jzjheKI78=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7HyY6b2ArtZe3CblLmLPm+9JbW9J8sEdkGbinCh39cRj1GdNEmDf+ZEDVhtbLkKPqnbE2O9DA1qJebQWgd72B+8nULzrYziTdT91BQszK3cFigP0UymAAqvAheWFX+YQYCJTaZVMfxIS7FJVMVmAAJSc0lxlwwxWKkcdHcXM8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PA2+g5+O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PA2+g5+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771784002;
	bh=hIqgXZd5FMqfLfyGvz8FJHmE2JgWnHUAv7jzjheKI78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PA2+g5+OYkSH93cy3Mr5PEscRkgXSw2PpmmUOiGH+kDQfBTztSWSx3ey4B8pdSA79
	 pT3EnMLB01ULwTaf0IitFG8iUopRi1oRbwqGB78i+a3ZvHZoSNjDcRPDgj/84a/PNu
	 d2ZMCdTBVw1SiYBHEA0Wb4vYdPdTRmc/byBi2WW/7xJLbIPKjLPcioGQK6IEx80BVf
	 E5lMv3lx/vFMC7TSZzMLnPKe+3jM8EDq2m45gNnXYnvxrgUIcp5Bh4KyplcxqCCmqG
	 nH02AtJP8iEk8sI/saGMbg/S7AqDdWUPsrG6HbLrf7NJ2OSmX8ZTbBcmAzIoWCbbSM
	 rqg3eOb22Du4Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB03917E12B9;
	Sun, 22 Feb 2026 19:13:21 +0100 (CET)
Date: Sun, 22 Feb 2026 19:13:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
Message-ID: <20260222191318.0ddf8eee@fedora>
In-Reply-To: <aZl2Qzl4knlY19Hb@google.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-6-deborah.brouwer@collabora.com>
	<aZl2Qzl4knlY19Hb@google.com>
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

On Sat, 21 Feb 2026 09:09:23 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Feb 11, 2026 at 05:37:06PM -0800, Deborah Brouwer wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add register definitions and constants for managing MMU address space,
> > including:
> >   - Address space translation configuration (page table format, attributes)
> >   - Memory attributes (cacheability, shareability)
> >   - Address space commands (update, lock, flush)
> >   - AsRegister helper for per-AS register access
> > 
> > These will be used by the MMU/VM manager to configure page tables and
> > control address space operations.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>  
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> > +/// Maximum number of hardware address space slots.
> > +/// The actual number of slots available is usually much lower.
> > +pub(crate) const MAX_AS_REGISTERS: usize = 32;  
> 
> Not necessarily a problem, but this constant is not present in Panthor's
> header file.

BTW, I think the max is 16 not 32.
