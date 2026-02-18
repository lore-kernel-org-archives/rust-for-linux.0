Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8591E0B86
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439135; cv=none; b=CCO+EsDJmrAp6NmDwBle+CYPfDq9j7WVdG+F6p1zZUKVKwfZRl3ZNY0OL0E9Zfa/6tsRzPaWpj+suVRe6JqsM7FM5rp9E8XQRcWw2U49e3pOrJy0P58uFJrq3E1U24X9qFL8AJoFqjYIXuHBdcYjGFuT7UvtS9nSlwUkIlAI/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439135; c=relaxed/simple;
	bh=dpEoJVkZ8u5zwCtoRACzTRgw6UcMbUu6PuWAlx+c9yk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=d0ANAQ2aAzen6ZV681XJL6RmfbdsBB2kmG/awNny0K6jrDgpa1uLBIrNfdnd90xEGcNE2b9p16kXLJkSXYudedA//WuIimzpvFe95FmLVXREGo2lLool9pWYm7dYjn87ZzRySrmyBFMtt1U9qO9DUDoWC7qs6GQTQKKL8eWZvG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA66Sg3v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA66Sg3v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED4BC116D0;
	Wed, 18 Feb 2026 18:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771439135;
	bh=dpEoJVkZ8u5zwCtoRACzTRgw6UcMbUu6PuWAlx+c9yk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UA66Sg3vn11PzJIZ/IgMHi+T1tlWVOLeAT15MPM+jsaBvCPmVw8BC5TNbqYOQrT1Q
	 XoFc1jfb4eZ1cT9k8NBR3XEUN8gWrRWDgNzxz3LiBa7XZt7xThtXrJXUfn+66D0f3y
	 7HxWGEBRrYS824CbLpacKHJuuo6/yEp9sfPRjl0SKioD7nEqItdcP+frTPffE4Trn9
	 r/wz0wLh2rlGgOYoX1Y+3C+AFHOd0m+wlwmbybevhB+juvKAZlfHvO745df3Hdo1Fp
	 dM7hHDvAH1PGOS3t1I3MAD/1j1UElHXZXfjTZeDCBgvAVUaOr26+gCCUDPCyZ5GO3X
	 1I2VdhgBb3Txw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 19:25:31 +0100
Message-Id: <DGIARICPV94V.2L28XACPYVUPQ@kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
 <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org>
 <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>
 <DGFJVWDJUOXK.27766P8H081G2@kernel.org>
 <CANiq72ktXTSsxKHcX5eNGf-6NR-ySXf9CX0M+gPumzZxVVufow@mail.gmail.com>
 <DGFP45YZA0MG.VUXK28J7P7B9@kernel.org>
 <CANiq72k3C8Vs69xSRk7aNkzBsjnhyy6C9XFS9j5FNHJbYDUKmQ@mail.gmail.com>
In-Reply-To: <CANiq72k3C8Vs69xSRk7aNkzBsjnhyy6C9XFS9j5FNHJbYDUKmQ@mail.gmail.com>

On Wed Feb 18, 2026 at 11:49 AM CET, Miguel Ojeda wrote:
> I didn't know what your plan was

I don't generally have a fixed plan for individual patches. Instead, I
constantly evaluate the situation, considering dependencies, synergies, the
release cycle, general feedback and stakeholder input -- and make a judgeme=
nt
call as the context evolves.

For instance, in this case, there is a potential synergy with another fix, =
which
I did not mention so far as it does not define the timeline for this series=
 as
it can also be addressed otherwise.
