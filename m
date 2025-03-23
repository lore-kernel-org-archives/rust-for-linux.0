Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A01DB933
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Mar 2025 22:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742770131; cv=none; b=SRLTXufx3kKQwg7CBSSH2VNQQNbeFQyMjgvEgPNgWQH66BXRUlkd/sDYocF3cTHQ16hk/FPieWdI6mSin+BjORuzs8FCqSu4sBynu3Td5Pcv2o2ThoIk6qTFVtBAdWOzsZzfZld5pW2fzKkGBVGKM7U2NYaujMtb/yIhXK/4J8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742770131; c=relaxed/simple;
	bh=dnFhYYnzKlVDFTJsHnhxZlxKUHTxCBnQ8RG2gM1BrKA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMLFOOoFLCr+nhszVISvnPBH6xDQzR6rS5R24y5Siz7ciY4getem+Jpm2C0BmHM1FPSq3gURfv0qCIFiEjEptp4DyrfBGp542KUNZXxpx4w/cLLRp/3HfBkd5auYUJBEKIDFnC3p2+5DbjPmXzi1NVaGyA2mr6sx+LlNXPjACIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=pPcWRwJ6; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="pPcWRwJ6"
Date: Sun, 23 Mar 2025 18:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1742770117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IPUcsPWWa2X9NKfpybVnP9b2BUGvSK430jlCkPrgcYg=;
	b=pPcWRwJ6ULwbzFVnYhIkw85Ou/fbeyBqqixE9bPjue5gt4XnjsIwZtqv/W8AOOimwa//lw
	MGeQNOeLPbmVR4Uyo46BmpfX7ZGdrSley00lutcJsJ0Wpcr2x4oaYsBYKei0QTrvg7djta
	RF22Z3ZIY7jDI5SSCYfwpPEY/zAcQ5Z3M143egmgItXDXvPjsyLJfWiTEckWlVTJLeGhsL
	8zRsfeddKqwItobtsycZyajOv3GLCEWP4k2k+4qrEEjucPkaAWbnM391NLpwvYC907xwjq
	AZ7HfTVC+7PB4IFJv044IpsrUy4Lz2wsJejWoLjKXioqgx1zyBbtCFEYQnthnw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Sergio Lopez Pascual <slp@sinrega.org>,
	Ryan Houdek <sonicadvance1@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3] drm: Add UAPI for the Asahi driver
Message-ID: <Z-CPspG_Cy-f-MKe@blossom>
References: <20250314-agx-uapi-v3-1-3abf7e74ea2f@rosenzweig.io>
 <Z912pMazVwHKLi72@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z912pMazVwHKLi72@phenom.ffwll.local>
X-Migadu-Flow: FLOW_OUT

> Since this is a deparature from our usual requirement that all pieces
> should be ready before landing anything we had discussion whether this is
> an acceptable one-off exception for special circumstance. Thanks a lot to
> Alyssa for driving this. The very much summarized consensus is that due to
> rust this is a special case, and because the userspace is in upstream mesa
> and lead by people who know what they're doing and have been around for
> years, it should all work out. As a stand-in for that discussion:
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> But Dave&me very much do not want to make this a recurring thing, please
> don't try :-)

Thanks for the ack :)
