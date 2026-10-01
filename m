Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823846D2DC;
	Thu,  1 Oct 2026 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858296; cv=none; b=aCRthR07fxjXj8rHeXUmEgA0tl5/N+R/9xzDfh9pZL+/79B/vaE2fZf1RiYdxK5CeIcq0Wrf/PuyhWoLPMmsRCERjaMWQNAwgytAYQcXK0K8lDISfAqq01xR2szMldBOGRpk+lnJdTlD/TK6mUz9N71I3LqMgM2TvTkCxw14XeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858296; c=relaxed/simple;
	bh=rTdJfTp6Ux7RxrKwWyxck6B5Jj/E+6IrrydWjAIDbCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrQzkFraPzfpEmRJfWO8ho31tv19ZoG1fRplEsJNE2MrELu/eTYhVfj44xFVlJNEplGwcqS3wUU7YRBlfDwRqaKCaPo5bF0/uHT9wKq8lEVIHp2mgssiWiw1pgzk5+NnirAJ5Ft132wrcdkTcARag+fSDZrVfclTOdIkZwmokS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KmkIj3Dr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KmkIj3Dr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6EB1F00899;
	Thu,  1 Oct 2026 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790858295;
	bh=m0VE5bsXDh4gakyVXWTwStf+8GehEKit4oOjPmWVai8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmkIj3Dr03cdBnmR7FrXS5Z4b05yR3OJotT0KpEBgYEH/9gebNk/7QiWwchjEW2k3
	 xSlXgfaEAOvalHzP0I2FhuaBcd/YUqdd7W/jaSwo07Cmz80ABS/55ddazdQxBd35jd
	 +eHpuOFuv6dkmJza6Otgc84ItNX2bd8XjI4mvCsM=
Date: Thu, 1 Oct 2026 14:38:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nenkov2004@gmail.com
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: binder: Use lower bound for node debug lookup
Message-ID: <2026100156-strongly-plural-e7f1@gregkh>
References: <20260831052635.42417-1-nenkov2004@gmail.com>
 <20260831054920.42550-1-nenkov2004@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831054920.42550-1-nenkov2004@gmail.com>

On Mon, Aug 31, 2026 at 07:49:20AM +0200, nenkov2004@gmail.com wrote:
> From: Hristos Nenkov <nenkov2004@gmail.com>
> 
> The Binder node debug lookup currently walks the process node RBTree
> from the beginning until it finds the first node pointer greater than
> the requested pointer.
> 
> Use RBTree::cursor_lower_bound() to start the lookup at the relevant
> tree position instead. When the lower-bound key is equal to the
> requested pointer, inspect the next node to preserve the existing
> strictly-greater-than semantics.
> 
> This changes the tree lookup from a linear scan to an O(log n) search
> without changing the returned node semantics.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1249
> Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
> ---
>  drivers/android/binder/process.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

This does not apply to the char-misc-testing branch :(
