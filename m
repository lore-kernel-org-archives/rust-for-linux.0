Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B526A1CC
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 23:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807786; cv=none; b=J+d3TUFqTzc6fq9LvawgG6Uz8lWUvmw2B7pGWHs583Usn9iQO96y88U9BOPlEY45uvHz2QrUuW5cpupf+kUjzboHN5rLM6QZe3b+HW7qad4blNmD2s+bLQN1Vq9hydp8t+3CinXnQBXrwWgxFlsAXw7aKHcw6mCjHEFrw2vz7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807786; c=relaxed/simple;
	bh=NfYA8jRdTajQS7satSsbxwtds13FUUPZsupu+wwSFf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKHtKPy5hwXlkbzvt4b8+IloifmCYpvfxIn4kxB9n/5uo6jPbKlVcEZt3ERRtcHAeFIyeDpKwZdJayDqRdHnBMPsf36zNKoETs4UNN1OFFuw/U7V6l2IM1inELIghj2S//ICQAqkfbUkDlR5JueWc31d5zcbM9pZIn9aQ/5FHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJcj2i3p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJcj2i3p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFAEC4CEE3;
	Tue, 24 Jun 2025 23:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750807785;
	bh=NfYA8jRdTajQS7satSsbxwtds13FUUPZsupu+wwSFf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJcj2i3pPy8XCRhJYYARpq1OOo34iXYJDfSh3UVF59+xdz5XfAI2Y88/Re9jkK/Kj
	 LGfZehg0lI8Kf0M23lIpOQe/PUbbLaDJR85lJ524Ghr5wacR1D002QZcJaT95Q0n55
	 8FzUJDv/TLmcEuv0q1jsIfCz4P2viytNq7CqidhLZ/Rl8yaoK1dQJsw4Uyp0xkmA+n
	 FyUXKC9gJ7cmAY2eCkwPHTaEzA4OO3RDKYGeLncD4ByWD/yY7I/dDZ0RuQwCqdRMxD
	 dozwMRTPmPMIalWSWcRGfSY6hnUrIe4zz9JqqHsAzsifDI774VyuhKCI8EwT8wjmIE
	 gICRu6HiqpohA==
Date: Wed, 25 Jun 2025 01:29:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used
 from register!
Message-ID: <aFs05TSWlDnhBUox@pollux>
References: <20250624132337.2242-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624132337.2242-1-dakr@kernel.org>

On Tue, Jun 24, 2025 at 03:23:22PM +0200, Danilo Krummrich wrote:
> Implement From for u32 for all enum types used within the register!()
> macro.
> 
> This avoids a conflict with [1] as reported in [2].
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
> Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.au/ [2]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to nova-next, thanks!
