Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725FF2DFA2C
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639673; cv=none; b=XBWWENvqXAdyCvDa3NLeU3vVWAyKeq/7bXKQU3CcItxv5RFdP1k0K3xLAtwvwT+0lYY73RFsRCAlIQt0OrMHxkPEqcCu4Rb7Ejz1lzfjSDX1xwjnksVFWJl3ZjDGLzMbUrIjjnxwz1R4ahOUaVuQxIUdkE/Ld/5yuX7vgKnIGo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639673; c=relaxed/simple;
	bh=6k0uI19VYeIR5ClE/8dtKk6PTKapPKQiV1hHwv6iGzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fg/OgNhzlf8YB9tfyUkXLFlehlES2Hc1v25qYzm+mreVuaZ2ZAMHkRtGq+4tTfOjMhKFWTdFNJnpSfuvkgOW0CS1LZaY8ffiYka89+mCG1p+DP71fzWakzFEkIOKqdrb3AQFwTLdkPdxDj3XwH8Qsh+jO2s5PMf1JHw5ULHZVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=qx9o+qWg; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="qx9o+qWg"
Date: Mon, 14 Apr 2025 10:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744639669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WG8Ya8Fve9d6OMW+BMmc5Uir//SNWkLbvkXAiaSTZoQ=;
	b=qx9o+qWgsrX6DxR65VjWusDFSiD7lFgXlMpghVQhsD+jcol8bZ8/eQzAZAdILMJvwLZuE9
	SwROBBC8XNaPp0516UlKxj0gHjNF4LeFFDGWbkKPqTayjCF1+mARWqSqbfHLNtdIHyitOp
	yUciKi5vq6dO3C8H5dtUN8NB1irftQpCAN1o+VyPnYX1sSNu90Gnj3iCzbyPMbdd+Q+ur6
	k6SArWOMmsaitsoZUDKlbzyn3sXx7ECpmiHQdtRq20eSEQYYc9E2XVC6pm18AODr1bAjgV
	QsHffCsgkwzxS6ihVz882db4bVBl2jfb9Kr1yNBJL0xTMt7VtXUjnr8fAhufMg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/8] rust: drm: add device abstraction
Message-ID: <Z_0Wr_e6_gprfmlF@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-5-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid poiner to a `struct device` embedded in `Self`.

pointer

With that fixed, 

    Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

