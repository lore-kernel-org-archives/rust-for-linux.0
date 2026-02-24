Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23837F741;
	Tue, 24 Feb 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932879; cv=none; b=mQM6SiB+s59f1CN9NU8vUU4se/Gi490tULYkVS9ra27gUaLzCZzygvJ7ydAq6uPWFFL6XZ/xktgmFIKHssHyLsiPxyk7jT971HWa/S0JYbQ+o+arQrDQ8lAnP44cIUCiK8GsHUwUT8Q7cfgY0I8m6MFcqVBorwDaXe8SUFrqAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932879; c=relaxed/simple;
	bh=Jb9nQCVlpYxbqGsn9ULbKFQVs04a6ZYRu163v7qczCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CDGS8mQYCO8E12KGB4lsJpfdEIX8K9/X4XYZNZ2N/k1RqM3xMN2JIx8gryFLGNZC3PbkteZGIOreNXlPrSYuobz+KFpaq0fL0dO99GidDypkBD6b27IU92juysYALFxw1zkZsrCZHHZNnzufDRc5Mp8Iken0eXDZPjGrZh5R7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qot31piM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qot31piM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AE1C116D0;
	Tue, 24 Feb 2026 11:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771932879;
	bh=Jb9nQCVlpYxbqGsn9ULbKFQVs04a6ZYRu163v7qczCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qot31piM3LTx1B8VYorSEhGn5Z/mk+UXPGsD7IscPUJMjIFi7fEZ60iflvJ1SF6Jc
	 bss7lOKmZ1ml5Hcc89s5IhU7KnjGOXIs0G3cMEahB/AlYrJ7N9NfI4s66ScjhEANKj
	 nducXlrPysZqD3kQaaoGF9U+fTslOCNrGug/cg7p1NOHdzzIVwwnM3CtRWvRGfeqES
	 dqAi7Q4hWKI4xdtVOOCeC8CyjCMOhcRi2Y+MKwFno8AkYPh3oXMEm4pb1e2yYInIEV
	 okN2brJvnJi0NATnkyYJoyCwpxyPqyEvFN3TTWFPtqwmz3RQBh2IilYLs3boIsFJQ0
	 1Knnh119cQveA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, =?utf-8?Q?B?=
 =?utf-8?Q?j=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/3] rust: atomic: add `fetch_sub` and update docs
In-Reply-To: <aZyWqajbCfnGmH3o@tardis.local>
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
 <C666UAr2jh0osJw9k3wU3dxzwxdNJT4Qk9jDqhfqkWuRchq4iK-QtQ4Lc8ZyAHuKOgxv-7otnjdTX0uud43Jmg==@protonmail.internalid>
 <aZyWqajbCfnGmH3o@tardis.local>
Date: Tue, 24 Feb 2026 12:34:30 +0100
Message-ID: <874in62x4p.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Fri, Feb 20, 2026 at 09:06:19AM +0100, Andreas Hindborg wrote:
>> Add `fetch_sub` and improve documentation and safety comments of of
>> `fetch_add`.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>
> I queued the whole series (with some format improvement per tip:
> Documentation/process/maintainer-tip.rst). I also added a Suggested-by
> from Miguel on patch #3 (let me know if you or Miguel disagree with
> that) and appreciate Miguel's suggestion and your effort to apply it.

Thanks for adding the proper tags!

Best regards,
Andreas Hindborg



