Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5E6230BF6;
	Wed, 28 Jan 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620660; cv=none; b=tia0KoRIeJ0h26SbeIW8j3RZxR7mSRuhBp1daLmxhv5bd32FR8/0JeSeaYWB7A1DPtE2IbIS7KTLBdXo/OOLLh4+XHw6RoVMywRNS3JpzXYt+//TB+SseFwXPX8GV6YFCvYlNQUaV9qhRnjy5jHWoTmwTDPy0CZLoDaXnYjp2D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620660; c=relaxed/simple;
	bh=MlBPgB+y4HnwK6VwiaoQ+jBhu9Li/CuO9L+TzQ6mGzg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=exQBGxhBaBj0LUK6RpEZwnLylcrBy7Ls/r7tKjlYAAeMjlNTl2VBIFeplONoHRRZt2KJ6e6w+y5eElMPxmPSH4ZkkICh3XjEp4C3lD8hxFF6uVystMLFOKVmB1kQdXEhyYQpMO3JNM8zldJESwPxlB8jKvJZt3230PQoh3U/diw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UY16ZW/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UY16ZW/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E95C4CEF1;
	Wed, 28 Jan 2026 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769620659;
	bh=MlBPgB+y4HnwK6VwiaoQ+jBhu9Li/CuO9L+TzQ6mGzg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UY16ZW/YoZKMSp1Ky6qZnmCZJb+hwUDhvcPUBSsISMTqB8qdPfZ1U7U0WaoZvS2k4
	 rZIuNfqL2wbSmqCAYYQ0dBqHP/slqjtOvXukRPRVjf1W9k0/DTV6/0B2giCqqyISfE
	 duuwojs7YOd4iJgKabWj56YNKxl3JPaaHbbjpzu0WF4t0zg141P7wrDoYNjH5z1K/S
	 tAzvfsPZgDuzxjOk74mFfa5vddX1x/JUvK7MpCZcsYTjeXj1YMkyp5iUIW7gUADkK/
	 tBRFLi5Cc0xB6Mn9pJnkGiWXMGHZlr56YDuLvi1lzDv4ZUO07wzyBH4Xzis87szyzI
	 nC7jA7QxpY4ew==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 18:17:34 +0100
Message-Id: <DG0E61MVNY5K.R3TSBQGW8JOF@kernel.org>
Subject: Re: [PATCH v3] rust: dma: allow drivers to tune max segment size
Cc: <ojeda@kernel.org>, <gary@garyguo.net>,
 <rust-for-linux@vger.kernel.org>, <dirk.behme@gmail.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <aliceryhl@google.com>, <robin.murphy@arm.com>, <a.hindborg@kernel.org>,
 <boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260128135320.689046-1-beata.michalska@arm.com>
In-Reply-To: <20260128135320.689046-1-beata.michalska@arm.com>

On Wed Jan 28, 2026 at 2:53 PM CET, Beata Michalska wrote:
> Make dma_set_max_seg_size() available to Rust so drivers can perform
> standard DMA setup steps.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

Applied to driver-core-testing, thanks!
