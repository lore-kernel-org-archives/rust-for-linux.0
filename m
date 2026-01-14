Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD52393DFE;
	Wed, 14 Jan 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390148; cv=none; b=ebOB0wmiWWIycbEO23UqNORohQBSCU+7GeKqQujzKVo9a30xMbCmDC7A30MA7BaRX45txqawKBnxd1Cp4MZKhoRkCVPRfLFtazmZMKduqJFkCQSxXUybytNUgTqgXkFVTymba7gNbWDh6u+kBP6vDtJ2zFyRhFMXx9nVbsXkZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390148; c=relaxed/simple;
	bh=B0YLRdChLNp7/s07T5/aghmUznv3pFBjkbDOEnMQrNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ts675r2YuzuQ1zzzV98yA2YpA5fzdv7EhWquC1OVJBswxuuuX2pZRozQuqw0BBxBAChg6krP8TjA92rCBSjTFBeS7RoVohSYcQrt1qI9Do+Z1RQ/+pzZmc/tk43c6FBX2HfvXK0++wwQoaT7qxQvCDEu/1pKWF4AcmqdymmLFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0VFDWFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0VFDWFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9ADC4CEF7;
	Wed, 14 Jan 2026 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768390148;
	bh=B0YLRdChLNp7/s07T5/aghmUznv3pFBjkbDOEnMQrNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o0VFDWFtFEv4mUocOOXe5N6emQv5YT2Pj8LNk1MEHbozOxZ7kmaTGkOWg+nSdy3mr
	 yEvO6YxU3AjYxEA3wrar6xl8rTK2TPjy7UT8c6hploWMD0N+ZWSA+bRmRj0NY14jer
	 p92taujfsEZtY3wKmfVq51zV3LiJjLPlJzXjvUwyZb951ej3/Pcl1XO1hAbiowERJr
	 uVmatnUudFigZjdngdxygZ/ALSranU1LqUGaAZ5EIihLiZQE+viquC+PPTiciG4c+Z
	 hNu+xcenmUXea9JFKH81lfm20XUorVZjDwm7jKfU9Ke0TMxrxHtJdsr8SkfKNFkHZK
	 45qk6nGFcegZg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Tamir
 Duberstein <tamird@gmail.com>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] rust: fix formatting expressions
In-Reply-To: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
References: <fzJECG6tYXqKgwdDYbvu0KQoPJybIbvqho0oTcuFz8CVKSJkzYpi5MXPq4FMMtplrcb9bQiXDPtJ9XogtmhrcQ==@protonmail.internalid>
 <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
Date: Wed, 14 Jan 2026 12:28:58 +0100
Message-ID: <87qzrsfn5x.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Tamir Duberstein" <tamird@kernel.org> writes:

> From: Tamir Duberstein <tamird@gmail.com>
>
> Allow usage like `pr_info!("one + 1 = {}", one + 1)` to compile by
> ensuring that a reference is taken to the entire expression.
>
> Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
> Reported-by: Janne Grunau <j@jannau.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/near/566219493
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>


Tested-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



