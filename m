Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B31EEA4B
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327517; cv=none; b=UeP52ZwVFCPFkZeS/ZZ2rsfKSP3Uq8EGP1bSnRyP69vKh4k5+wcrEG6G+gjdXaHhOugjgojTvXX7Gs4qqtU2pt/d2EhwzVkpYEplcl331H25CeTZoveM0XyKJhkw7s3lSjSEQ4hYngM7zjRfLbJgHtuRq2Juda0N12zZg1+FkMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327517; c=relaxed/simple;
	bh=hA+gj8kTos0fu4LDSf93e+eNb5MLHsshqBM5qY1+Ez0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s1oS0GEV4CGL61ZlWzH1d166ZHktE1SkYIvjVt8Do17b/OLDrDph7NLCRa0PWBQ1zum+BcvIb1HuGAwm3BV7+AWvY+BQIqV1BgUx0pCdcmjAMUoK9ilZVcXZKXKK2hJ/9RN5iMbCFhpV8DpLYCB6DLekbJNG5itn9EDg1iuBCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC+xo/os; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC+xo/os"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEEBC4CEEC;
	Tue, 22 Apr 2025 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327514;
	bh=hA+gj8kTos0fu4LDSf93e+eNb5MLHsshqBM5qY1+Ez0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MC+xo/os+KlB+YzY70800MeposRiY3PVHsQKOed9KkIGpQgNAnLvS1wCsakn5463v
	 thcoMskJrwHld5DQ8CRfIfSbcuHGYWh/vZpjUQxoshBnyh0hlu8792g/u+yYPctzKV
	 oXgEkYkx9s+wJpm7wHGDucUW2ohrEw+2dY2jlcRB1iEhuaQnt074tio7hJUXX1D4xi
	 4Seq25Mue77T313TcKrJelB5hiG4WawwIWKXvZBXjUuMshGCVGPL5Cm8xr/JFWiB04
	 ogfD3RTyWJFFk0chSyLI1CtNkq+JEha2MY5pJpdZLsAozNIJBXDbp2Fz7H0O2gMrHK
	 RiSZ7QVW6Cp7w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/3] rust: time: replace ClockId enum with
 ClockSource trait
In-Reply-To: <20250413105629.162349-2-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 13 Apr 2025 19:56:26 +0900")
References: <20250413105629.162349-1-fujita.tomonori@gmail.com>
	<yAADY-tznRXi3j0aynqCuaSPmaEG7B1MVHqKYGcmgwuIKcsZIxd3Hxty7htStdGOcLcLLqZGQEX7qs0IF8sG8g==@protonmail.internalid>
	<20250413105629.162349-2-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Apr 2025 14:51:05 +0200
Message-ID: <87v7qw9x6u.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Replace the ClockId enum with a trait-based abstraction called
> ClockSource. This change enables expressing clock sources as types and
> leveraging the Rust type system to enforce clock correctness at
> compile time.
>
> This also sets the stage for future generic abstractions over Instant
> types such as Instant<C>.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



