Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E7730F52D;
	Mon, 16 Feb 2026 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249128; cv=none; b=O6OY+uxhjxxif6XqBw894765IVr8lYSZFKHID5A6Rxtht6xeO0BAqnt0LN0WVxiTjLlMBttsW0NNThvf57ctJamAWAvtiPUFs8xOSCqPsmJDaY/UP5KSzt7Zn67WPvycUh0y7JePu3f4ymv82417LW4nO9juU6eFkNek9tDHkfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249128; c=relaxed/simple;
	bh=P3g0yorEBV4NQO3yoDJvbVwKG5wFK3mEiKaBfwv3ukM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=okFGh8acMWP/k1yNOUuZW08uHqwjaBwrUtf0CV+zLBN5isfvd+V5kPnbrtfL2dmycN4H/ot+9n9iL3/+eQ67rdqGLcIo+NvqC45yx0HyKXkC8Nkpb7PWiqiM+WMziDwnAvbN0uRAAuSRmwpsh/cYFZWRR7z3CZDKstJ2g9ja9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfKx/Wku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfKx/Wku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D175C19424;
	Mon, 16 Feb 2026 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771249127;
	bh=P3g0yorEBV4NQO3yoDJvbVwKG5wFK3mEiKaBfwv3ukM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AfKx/WkumhwAxanKDDqv6NJzbE1357qpJ3FKHwdCADkvI7aVtg6eg8KkTvCZs8UwC
	 6F44JllS0PkXb3SHVl+yD7H1hgLLKaF13Pwalx+WTqS87G7v1kCj1/ZHO1wi9ysmpI
	 IRV8WC7siB5vAOdy5W1PhDrwnwuOBO+xkt9Z7p/HqjmVHjFipyhaaRYm3vmJ6stetu
	 Kd8gNY7/K4nu6ijgy9PQVTWcjxFSmuT5kdOietYHUnzoitDGjFQDtIDnYEUdRsVrf/
	 DJXAZ28m6SgguoHHf3qKwepROkGWszUfuQK5v0XPm8GuivuxqBHK2HqMUndrOlV5a7
	 LNLSLieC/bopg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: time: add `Delta::from_nanos`
In-Reply-To: <aZLWQsg5HstDHiGZ@google.com>
References: <20260215-time-from-nanos-v1-1-48c61b15ab4c@kernel.org>
 <LWPYSr25yMqiNScV8hQ9C3eYnRTPJYDHhaJwPeQzYI7grBQdDD_9P65QFjfCz4haXOdYzIOhJ-Th_XrSMLA6Ug==@protonmail.internalid>
 <aZLWQsg5HstDHiGZ@google.com>
Date: Mon, 16 Feb 2026 14:38:39 +0100
Message-ID: <87v7fwdd0g.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Sun, Feb 15, 2026 at 09:12:04PM +0100, Andreas Hindborg wrote:
>> Add a method to create a `Delta` from an amount of nanoseconds.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> The change itself LGTM, but what is this for?

There is a few uses in the rust null block series. For compatibility
reasons, some config options are given as nano seconds [1].

>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks.

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/r/20260216-rnull-v6-19-rc5-send-v1-8-de9a7af4b469@kernel.org

