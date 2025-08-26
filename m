Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7AF1F0E55;
	Tue, 26 Aug 2025 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197940; cv=none; b=ODQ2+/x7sGyFFPS9fMJbSu62nytVB5d8d7H8by2tXXpLZnlwVmMuBYoW0gOhR9a41aRzV1AOE3HOWLwmoGLGdmWBHWRztDI0xK6t3xdOvdSnQqHrjWLa6Y4JkRR67c5EeBnkdma3HUm2UlHR6xKlkHOTMyEpykeuspLA2lTSzqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197940; c=relaxed/simple;
	bh=RBnl58A5TRIsTpWbH75eLIzXRC1KN59+1EZ3+wPeIcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jl6ghPde42MDekIT5uQUny6+J5rVMYB4wfOpmpEAaxNe+t4rZMXEUceVVLNn09r8xRD+BP3AFlaxPJLuG3365/g/RrLDSB+OFaIrvyYEuLDm7swi8T+grt/CeD3jh6AI8Fm5URsEnDYcImbFnM5DLCvnucTN08gE3KBm0j1adqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjIXOxw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjIXOxw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3C9C116C6;
	Tue, 26 Aug 2025 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756197939;
	bh=RBnl58A5TRIsTpWbH75eLIzXRC1KN59+1EZ3+wPeIcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JjIXOxw/QxrVJvgMc0gGXsyTFywRZuSxwAxYsEFLVhflFoyG0PAM0EheCyZR+V3Vq
	 4LW0fiUXAaUe6b6aFqCy5lcJpNfRMi1SR2SWZv2z8HLQRxHjUQICPi5HjgT23+xdga
	 RwKNAZeevaZbj8C0zskGtEHTz4GTV4Rufrw5/RmSTaunPkYSNiyulN7mqo5gHmcMLN
	 YCD2nUr0oOIz3Mtonfi8h1IpdaRSnAncfqR24d1GkAIJ3Z74sQaDbaXjOxugZ9aPcX
	 fDUIR8qz/nyVQ3Pw1FPPL14lYgKptKW7wf7Pe4XOWhxj/R842ACZY6LcEjeRgLhxLd
	 WasVNRy1Ee/bw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 7/7] rust: hrtimer: Add HrTimer::expires()
In-Reply-To: <20250821193259.964504-8-lyude@redhat.com>
References: <20250821193259.964504-1-lyude@redhat.com>
 <NIpGrltySo0vppvE0Z80S3xXLtyrcjxuE2fjMitgnJRkZLGGAPM4uCL8YcByJwodSs99TnNIT2hDDMUgpZHzGg==@protonmail.internalid>
 <20250821193259.964504-8-lyude@redhat.com>
Date: Tue, 26 Aug 2025 10:43:31 +0200
Message-ID: <87h5xuwk0c.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> Add a simple callback for retrieving the current expiry time for an
> HrTimer. In rvkms, we use the HrTimer expiry value in order to calculate
> the approximate vblank timestamp during each emulated vblank interrupt.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



