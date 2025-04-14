Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251D22522B0
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643286; cv=none; b=mtJ7cT+huZDLW7evPVS34vXufFRMqrlD8NjcNCScXLNLAH4j9fvpowcT8dUpUkUQbVTcr1Z2ZEKs78p/5F/P8+TExqXtrdEEVb/7sznYB+/z5teeP0RXTNRlpfJ1A/D4pfySee3mj4yx+YlAd82t/77NhTnZ+VAyb+/vISPOqIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643286; c=relaxed/simple;
	bh=/8YjQhPVsRhtje5ElZPs135KCb3203Z15Mn/lBXF6+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWjWVTodfuFN2CfXJdyd70n+3yMVbqPC5ObJ4x/XIz61cB3OM4gjpihdXKFObwJzsgbgOLZOE68+H0LLY4+Dj8CBbbFfDOiZ7EjCmwBSEJ+3EmY2Jz0eZLVObX5anCf5AHeEh3210lNGjAbrTNi5g7U3soUGO1B0Q9BZMTrXCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=ByUP6Lmf; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ByUP6Lmf"
Date: Mon, 14 Apr 2025 11:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744643279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9PCTNCX7kjBe6rZrQDmsxEBCtnOteVqstFPzzwQK37U=;
	b=ByUP6LmfmJti4jEkRke/5Hd639c/CKX0/Gixkt4QEvJlUbsDWZOuih+snIRSCpJjkFTIXo
	KE475+ZVVDTzzFqR+McQ3H9OQYuFfDRxKry2qFfaDYjDzS/0KirmpFNkrKplNnxLNpS8+z
	jsDoa9WMwaaCl4OpXyDcvLu3rPkBbydkbij2BtsPfSckw+daISjQqa6zHY7XwwKi1xwrrp
	e2Cmxp86C1gG+bFdkN1tFo9fjUDWQHs/7ECE13K4oy6HzRAe1yhqYWkM7t6aEgPzwH+8a7
	3ushzJO98SD3rfq9Dk+D7aHpGXIr0xvLY+taivF3JfRSTeKP8aV5jEaDUw7rAQ==
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
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Message-ID: <Z_0kyE-wABj1tmrK@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-8-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

To the best of my ability, this is

    Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

although this is rather above my current Rust abilities.

> +    match T::open(unsafe { &*obj }, file) {
> +        Err(e) => e.to_errno(),
> +        Ok(()) => 0,
> +    }

incidentally this would be another candidate for the helper I alluded to
earlier...
