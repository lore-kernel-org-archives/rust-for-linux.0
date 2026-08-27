Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031653783C3;
	Thu, 27 Aug 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837662; cv=none; b=AfKtF/fWzPeC4LzekgXhQecr2cW49TuLmJnYY5RTMen/lSWunUSYP432mTnN5hzp88DgE1fomwU9QIScxdBMXZDXW2tgyKDhk+kFSAqHWxwkSpxn/FUYyUl7GrkRU7yd9R6N5K1sdsjyisrU+5P5FCOt73MjkXA5EYttM2gQyiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837662; c=relaxed/simple;
	bh=yglYERUhEwE9WdPmeX7+7IeEZN4xdX2MI6DKXIoYrA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H4kdQX7Kh3Q67c0pfQmz87TGd+MXNZVArlJKSwvqaro1L3ylaMHvMEdo8oI+GAxDYvObdHAboSYUKI0bweRTGtNE8pxJXdRDLVDk1ddDwpkotMJKmG8+ofx7A1ye7ycoXnMcwcLqOdSMiQ0g5hWhVb64jfwoehzIpiVrsRwy8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGQJzEfI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGQJzEfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D1B1F000E9;
	Thu, 27 Aug 2026 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837659;
	bh=yglYERUhEwE9WdPmeX7+7IeEZN4xdX2MI6DKXIoYrA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VGQJzEfIbi8odtYbJdOPGneocktB1zprgt1QlrMbSCcEIeDvxY42e/DtGfFLOLGAX
	 6pZ/nhfmrUrNmtLkKLCDCQjeJ9Q/42W1rRsVusVHrvHokpWxUP5bPNQLxJNjcrl7pA
	 OZxsGBLGFfJ3WT/ExcZIEZiwO7OpmYETLkgeOwCfnbfFiTvdhR0TXXFaBLGX72MKhE
	 NKcM9WHw+NFAkKp/qqCMGLPMdFpeJzLzPPRnxMZizDMRo8cSoqB2Zzi1f/smdQC8+2
	 /rZJtOO1bI65RgyGxI/bV+g5NgzzfQUSv+aV6hy1XRl2NwrqivzHRPcTjC8Q2WhkkT
	 i/HQ5QJhA9KZw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>, Boqun Feng <boqun@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] rust: hrtimer: expose interrupt state in hard
 callbacks
In-Reply-To: <20260826162851.2497-8-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
 <vvlRCp9WRvF052uH5l_VHNzJULWceLx6qUZP8emq1gxj4vwQSBzEHRqdZuHJHjcw8ZvU7tVwktsqURiNy6N8cQ==@protonmail.internalid>
 <20260826162851.2497-8-mike@fireburn.co.uk>
Date: Thu, 27 Aug 2026 15:34:04 +0200
Message-ID: <87a4q71ycz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Mike Lothian" <mike@fireburn.co.uk> writes:

> Hard hrtimer modes guarantee that their callbacks run with local
> interrupts disabled. Carry that guarantee through HrTimerCallbackContext
> so users of IRQ-aware locks do not need to assert the callback
> context themselves.

This looks good to me. We were pondering on removing the context type
though [1]. We might have to keep it around for this to work.

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/rust-for-linux/20260825-expires-v2-v1-3-90411c6217c7@kernel.org/

