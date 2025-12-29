Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E41F329C42
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019587; cv=none; b=qR9Vl3HFh15S+spcRkwJh/sOc6B0dv/fP3ieWxGxBD/xkR76NQjiu43mzd/iycqBcL9TDi9hFKQR1U356EvVBjSyFAjs/7+B5WEocO8W5NWmOaF1e9qJdeI2WCT5c8G3Y1pKjS+euggSxILOPiZvuJMQoEkkWjfk7LiPfa17XM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019587; c=relaxed/simple;
	bh=q0XDlPuu5awhL7ME97+x8uG3V7rcU3hi9wMUlPBUvn4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=X+loHjKI4xDnjaVXJO27Cwfema6zv2qvvBDDx0zooTOhS00bFmnP3dgCyRPawfPTdHGl6vzIi4sH2589e5E6K/jbGlxqU/hAOIQWaqvR5KAlfcp9ve2GW1NDxqFDXgrpFBRoQRt3Oubp7D6gcw/09hrSCL5tJ8YHSjhKSeWwAVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNu2u68N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNu2u68N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B9C4CEF7;
	Mon, 29 Dec 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767019587;
	bh=q0XDlPuu5awhL7ME97+x8uG3V7rcU3hi9wMUlPBUvn4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=oNu2u68NlT7ivz3XPG9xc6eZbmwPALwLC8E9SaTheNHb8tvubUiN3Xz8WkeQrtaW4
	 F7yDX0KZ8gmtI8t0oQWYsKXPscfMAI6xZqc76b2V/sl5oG8uibQFbfkHnD81f5O8s7
	 6LWCu+NGw+GDTU+3IG+RzL8kLNcGgqMQ4x1Xh7IzDabgOZ1mxtO04lMn7ANCmMecpu
	 3Pvd/NYvH1Ngx/sxX/E9fhkaETgXxmcaZIAuJbKu/ce6VyTy7LJraV2eHWvPjwNkdi
	 kwJM3fKsm8XvDax5YIe7nmAZ4mFzRZMcTmjXrD8SuTVtVhOPmA/Ie1hJt2Koz/N7m2
	 lTvNJDVZADjvw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 15:46:24 +0100
Message-Id: <DFAS5YQICTL9.UHDV6CVYZ30W@kernel.org>
To: "Brendan Shephard" <bshephar@bne-home.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4] drm/nova: Align GEM memory allocation to system page
 size
Cc: <aliceryhl@google.com>, <joelagnelf@nvidia.com>, <acourbot@nvidia.com>,
 <airlied@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
References: <20251215083416.266469-1-bshephar@bne-home.net>
In-Reply-To: <20251215083416.266469-1-bshephar@bne-home.net>

On Mon Dec 15, 2025 at 9:34 AM CET, Brendan Shephard wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This is important on systems where the
> default page size is not 4k. Such as 16k or 64k aarch64 systems.
>
> This change uses the updated page_align() function which returns
> Option<usize> for overflow safety. (See "rust: Return Option from
> page_align and ensure no usize overflow").
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>

Applied to drm-rust-next, thanks!

    [ Import page module only. - Danilo ]

For future submissions, please make sure to run scripts/get_maintainer.pl.
