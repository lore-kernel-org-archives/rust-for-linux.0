Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F1C28E617
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640906; cv=none; b=V1tN6RdzCLCwfe0LHU0RVRYJ8KBaGWAPnwzcqU/jiSvPkLBGgM/wWTfAgErdVZU3XLuEvojU1hYv3TmGV19YPbQagcwWCfE/F6k4LAxbPwVmMeyANw1G6/SBuvsw05i5JptS0JhzzQSIq8IOrzvg+NUTEUXnS/iz90NuNoPpC5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640906; c=relaxed/simple;
	bh=eoV1LKYYvy8aJ+dcGMl+GQPXeWWu0sK2KyqWqP4rLUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIUJy7o7ReY1P6Lhhb9Iyjux/IQXofB5J8Vx1idGixBgwYbhIdv8dNJvkIZze3X4Qo9wxC1mx6CAI7MuAc+IY2sYrYybZ0M0L/1E0lfIXb0LO2BTg8zJC2XVGx3V/zAh9RcQ04Fc47jvJg2qZRtn5Z2umfDYanDEY3+p2F92B3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=HBDCWl8b; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="HBDCWl8b"
Date: Mon, 14 Apr 2025 10:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744640894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cTMsjF9n6SoguO4hT2u+FJPG/CrTB5dYj5Tjoq5pP5Q=;
	b=HBDCWl8b4iQC38u4cxkalj3ddFDWK6bptFswxab02B1OhvHHhoJVxaiBqbat7tLoI72AAa
	/bqi6Aq/07REfSHWZfbgoG9Bk/x7agbd1k+WLaKUhBTTMS4IUYpL5nnb8WUbIGN5/AwQsW
	oVgQawJOU1KP9RRp9uAu9W+dR6lT7/3pqnx/1+udddRnlAmmHIJx1b/zx7i459RjffjAUJ
	hl72DAClTTxCKJZAOJkCVKBFPznAKkHeL+d+kK65Lyl9bFZE8LWEaepprypMTIAwS4/gFS
	9wt+/rNMaMLceP7PhHFVVmW2UqV0fRu60ICEH9ApmU9rZwtPlF3fvl2mhCluTQ==
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
Subject: Re: [PATCH v2 6/8] rust: drm: file: Add File abstraction
Message-ID: <Z_0bdrn14D-g8kr0@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-7-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

> +        // SAFETY: A callback from `struct drm_driver::open` guarantees that
> +        // - `raw_dev` is valid pointer to a `sturct drm_device`

struct

> +        // - the corresponding `sturct drm_device` has been registered.

struct


> +        // SAFETY: `raw_file` valid pointer to a `struct drm_file`.

`raw_file` is a valid pointer..

With those comments fixed, this is

   Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

---

Tangential food-for-thought: might be possible to introduce a helper to
kernel::error::Result to make the error handling here more
ergonomic, but I don't know what that would look like exactly.
