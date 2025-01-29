Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595031BEF87;
	Wed, 29 Jan 2025 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738149366; cv=none; b=fkI9+vzjFVMQyXwG0wwf1jdehAw+jC4PR24Qk7rg2gXQvqz8LM/f6iIvuFpsd4A1q3Uso29Jrx+mVCL1FAP+hlKC767iKqcZseHPAuuCtV621QRYNIQVplDh+5F/54CrQYdaQwwOArYCpwRf1LpbQQU1rTdrV7c1DZsntywOXqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738149366; c=relaxed/simple;
	bh=Z8j7IHFlPoGI7Ge57NhhkQp/dqTUDiovAvzb5wRmR3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sIPL1n8DOgTFOzV9gunc+mF8WTTZlJps9dB07moy9CyR9BM7yl+nFylSVn0AeI+BcAi190hzaqZZLyukkArsYeRU1nC748yEL5JaoOOtiEnmq9V+OG+cPt3EOYZ7pIrJoqqgl7vgvDfZB2Q6XCoWnrvOi+OCxD176uAtRwXreOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md8G45Fw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md8G45Fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4433C4CED3;
	Wed, 29 Jan 2025 11:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738149365;
	bh=Z8j7IHFlPoGI7Ge57NhhkQp/dqTUDiovAvzb5wRmR3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Md8G45FwCxIgInGgMoVEzR0UlOPgg+FZVbsyx12RSHzrZ80bYD31PTMJVT+At9rUL
	 443GAR/fP7ST+tYANmRGZpzPnxemiCtz8ESV86liyDVEEzctnm2n72z8AW3GkQY8tx
	 UjwzJEGabA7SsGwLdg5alRMzNKq+Y4E0hvM3r/7xiKoFN6yeQx/mGyaDj1rqWNdrWm
	 8Q9COV7QpZBZm1TnZOBDGFJYGnWZ+wFvlxHLDEPDFskwmZ4LbWIluqEk1buBpQFDrx
	 zdSZHvkZBcjmQ3msiK1ZYkkj3DnXgdT3Uib5bnJT8CI9CxMaeXAu4UBsR0h+ULKWsT
	 yQYzit2SaCC4w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Timothy Garwood via B4 Relay"
 <devnull+gtimothy-dev.protonmail.com@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  <gtimothy-dev@protonmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] rust: HrTimerMode replacement with bitfield_options
 macro
In-Reply-To: <20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com>
 (Timothy
	Garwood via's message of "Tue, 28 Jan 2025 18:12:49 +0100")
References: <DS80qoWpf2_CoG8atMaPTH_9n1u1KOAzwhJfLmUVwwM9VgDvL4lsK-LCBbaJyCOUhNEZ9GicVz_x-J6Jcrm6dg==@protonmail.internalid>
	<20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 29 Jan 2025 12:15:53 +0100
Message-ID: <87jzadlvkm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Timothy Garwood via B4 Relay" <devnull+gtimothy-dev.protonmail.com@kernel.org> writes:

> From: Timothy Garwood <gtimothy-dev@protonmail.com>
>
> replace the HrTimerMode enum with a bitfield wrapper built using the
> bitfield_options macro
>
> ---
> This patch provides an example of usage of the bitfield_options macro
> proposed in [1] as a replacement for the HrTimerMode enum introduced in
> [2].
> [1] is a RFC.
> This patch depends on both [1] and [2]
>

Very cool!

Since `hrtimer` is not upstream yet, if you get a non RFC version ready
before the next `hrtimer` spin, I can put a dependency on that if you
want?


Best regards,
Andreas Hindborg


