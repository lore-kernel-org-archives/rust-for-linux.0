Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0A27AC30
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069622; cv=none; b=Jghk42uAYwEZHcfwaVolXfFt3bf7w1XgO0F3GVJJhXI7NRWDY0oS5ESKbjexo5dPn3kG1lgh29QjmgMs9b6BaUybfAKVAsT7xDw6+Toc8ktbR2LBZnYEpWwbEPRbCrGGA46yyRAzPTd1EDlUdyuTv9ED2qiYzDfKfx2zlkBRTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069622; c=relaxed/simple;
	bh=6olxyu+3Y03lElTth9nsN2qcWohq3WZMNnWZpuFx+7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQFy87xE0xxfHK98S0mJCY8E31ytVjN9JsgFif7M5Nkij0cwblzmJO/qjj5yLFphcS3DqNAU6b5q3WlNMqpdb/Jcyfx++/mk24v3c3SJd+tqOiQDiUeuFHzFfZKcFP+AT0/IP20dC1smSJwcUjq0cx1WHPEWWmCgpnaKV2FklBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PR4b5K67; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PR4b5K67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F66BC4CEEA;
	Mon, 16 Jun 2025 10:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750069622;
	bh=6olxyu+3Y03lElTth9nsN2qcWohq3WZMNnWZpuFx+7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PR4b5K670zMV5/9Gpgy9khBVPmfZd5UWmlO9W2U84NRKo92PwmNS3tVIWwN1ccl/z
	 p640dACw15AvF2gs/xX6G/T6O0hASOAtHIX1z090BnDKDtbTOLcHEPwxJc0xbQbjw+
	 fp75SfugzZ9Wkj/RkMRoN3TO5VGIZu976zz9iZt35ujZjvswbNGYxY1TcwrrU9ouiL
	 wsa51Paj1wc0dBQFgcb9gmzn4jeF63P5LzI4HndIlQGX4606mWAzmwq1N5WGUuom/Q
	 xXvBWZSjJBa7k/hCTVBt2cWFJzXIuJxFcIkZ6t8Rprv3M9sW8aGn2d9PsKWVs5EHqn
	 hEx6UvD/wtHFA==
Date: Mon, 16 Jun 2025 12:26:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org
Cc: lossin@kernel.org, rust-for-linux@vger.kernel.org,
	Marcelo Moreira <marcelomoreira1905@gmail.com>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht, gregkh@linuxfoundation.org,
	rafael@kernel.org
Subject: Re: [PATCH v4 0/3] rust: revocable: documentation and refactorings
Message-ID: <aE_xcV766hQacECP@pollux>
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602232842.144304-1-marcelomoreira1905@gmail.com>

(Cc: +Greg, +Rafael)

On Mon, Jun 02, 2025 at 08:26:21PM -0300, Marcelo Moreira wrote:
> This series of patches brings documentation and refactorings to the `Revocable` type.

@Miguel: This series will have conflicts with [1]. Given that it does not
provide any functional changes, do you want me to route it through the
driver-core tree to avoid conflicts, once ready?

(Will have to backmerge -fixes anyways for other patches.)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-linus&id=4b76fafb20dd4a2becb94949d78e86bc88006509
