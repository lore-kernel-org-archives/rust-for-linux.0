Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550BB2A1BF;
	Wed,  7 Jan 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781232; cv=none; b=MGTPkRzF1gX5WoZzrIlZzK+DYcippjkLksN5iDJaCiPbxI3ldasntxewDroSDNAio9D3E9aqq/kv1xcD/L45m51QaU4w1zv7V1E6a91Fsa8js/QlEB/cBr7Baz6fxfY243hgPqe5JQuxp6pWIsfYs3KcNy9GFIsPghXzl+YbWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781232; c=relaxed/simple;
	bh=ypPZHliCFbdwvmK0nWDp9/A/bjNjBDrGQz8E3u6yHAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auCHWqAmUSaI6pwwSCO+xHUucjOJRomTjgR6d+jJiy+DNKEnBIw2ffTLDrYRBw333wUJ3luGo6IL1+0/7Rh6SPotxOA/xiQYn6yhLMh+lMxj50SahIFr2QlRKD3KrFLZgKTS1fZWSvqEP1GjrgW68q3foeIxWpwe7WCwxcYO10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPCtYDfS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPCtYDfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B798DC16AAE;
	Wed,  7 Jan 2026 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767781231;
	bh=ypPZHliCFbdwvmK0nWDp9/A/bjNjBDrGQz8E3u6yHAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TPCtYDfS6gtOcf57QcNV8pz2gS9xdRVza+rnJCg9DHzym/5kJpDKwR57RCNuftp/8
	 fKfgvF3XwD5aDFE74SKPc2RbD+AIa0LT/5LOZviMDj3KYHYl1zMl6JcH/blnGDKMQi
	 pS+c0GamFcKJS+zstothaU/k7RTfa4St2vH7wIxyuZYsdr0LEDxkJ7tmEM68t7tyGk
	 zmAt8L2WNbcOcJQwYNdLn9eGEkG/Vp/PyYISve+0YpNNUpvaxY62oKhrbxS2Kr3Hwc
	 1xMTIEBhsTfD8baHdNfChNUXauDau4eU9R1XlifpSk754Z3M2ZCUJ7f9xo/1tFiS5P
	 /SCrp/3mWSReA==
Message-ID: <9693961b-efe4-4b4c-bbe5-fdadc45a75e6@kernel.org>
Date: Wed, 7 Jan 2026 11:20:25 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
 <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
 <9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org>
 <70a8a73e-2dad-4bad-83bb-a245b83afe5d@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <70a8a73e-2dad-4bad-83bb-a245b83afe5d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/7/26 1:24 AM, John Hubbard wrote:
> $  dmesg -t --level=info|grep NovaCore
> NovaCore 0000:e1:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
> NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
> [drm] Initialized nova 0.0.0 for NovaCore.nova-drm.0 on minor 0
> 
> So I'd love to leave the GPU name at info level, if you agree that
> this is about right.

Since it adds additional information about the specific board, which is not
covered by the chipset information already I think it's fine.
