Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA827F727
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639232; cv=none; b=aH6S8qLprfU4Owk02IhU2BzZLOtSwZmkRQNkib2Hlj/HHAeeEqsB5rt3q+YE+J6jra1F02Kui6xBjkhnQDPeUxZ3op1WLfELhGZH74B4hlcSMAfFRtvjAVynBAI+RmY5aJH4oYzuqD9c6kFCzmxwNCvf1obbf9IPGQU2CsgQ4x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639232; c=relaxed/simple;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK/hv/zKporDNrjYbfdg9OU74Tdqi62VcJAxyl3DN6gXB6KdKZewbvCl1R5dVJwnD7BDaNLZNrgC0btc3AHaFDh1lbhsXE/GwaghCiUovWK127N5SNbjIGbvxuJZBjisgauyCoHlS7i25U2/Zu3Q+eLGMyY5Tw7LzyXChMbvRmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=C1/nq6Wy; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="C1/nq6Wy"
Date: Mon, 14 Apr 2025 10:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744639228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	b=C1/nq6WyDyt7TNMgH7KSTbefu6FL6JN7S7c5drm+oll+tMtCDzPKK1inAS5C4q/j05WNkh
	+Z1RSIobxa7PQto8emmyCTikM8pCNo3BfL3SzGo+PtwH9GhqV3cJTVMACImvylU8XCCZx4
	oJKl/DbL4B1EboM13r4ozhkjOYvk1z34UUcJ1tRiwqHYZozTydi7Gtdr/yGUW19v8zfIp1
	Ou7BY+04/4z4XmaYVrF4pzFekk+CWk0IwoIYdCkyoFANBTDpMOaKQIZuN2n4iAr2OusFgX
	RcAIuSBJiS3vyXS8AJHAOo/Ho1KycbL6xE7qK6rQvXHZL8qVnlmGJm7vWUzPZg==
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
Subject: Re: [PATCH v2 3/8] rust: drm: add driver abstractions
Message-ID: <Z_0U9vrSpj_sPtG8@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-4-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>


