Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611092FF14E
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166204; cv=none; b=JtOsFKTdgC4gTO6vKFhm9Ex5PVcRcynLRLnBEL9CjKGjiCve6PQCrS25RwL8D7rGCDvRKY8yPHNnTgrVx8vWJFdOGHJ/PLPQ1QB92fCpyE0KZNluwyvh1fqQ/r5hb0wDFyYx2JkJlxt7ZABwfPMWpyXdXOVpwV5vodQPUZcEZ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166204; c=relaxed/simple;
	bh=qhlXsQ2w2cGtqN4BTIN6PGYrAkWRGsh3TNb7IYqvoec=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=Oc2ESWNXPvG4xMpVzTDW38NeWaLMoHXzzAZ3UsYe6rHMkT+ehOQzr9qmIzmKojl1+jsMsnHtPJLY3X0oirPU2OzYX4I6EN1Ksx5XXR9WPSzs4tmuky3oGnnGx8pN97WdGzDBAMqyCWgTVCMAHClg4aM8fjMoHUT+SiCBiCY0RAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+EcNvUE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+EcNvUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2885EC4CEF8;
	Mon,  3 Nov 2025 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762166203;
	bh=qhlXsQ2w2cGtqN4BTIN6PGYrAkWRGsh3TNb7IYqvoec=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=J+EcNvUEAilS8iBCPPM0BYn40WgpgpEnfep+ezM0Z0u7EDnPE+wL9w99s3DLYe9cv
	 0xg7QQs3zWketLMxaKHinu9fZUSItLPKDaxPdMLhriWrkNjjom4vGfeEMwQPWRvdVB
	 CLcgNovtieeKxotAvPP0IDo5WRkxiY0Mgjt11gYfLmLR/rHqTmkd4pSsNDXVzOOmvO
	 sl6hVATvjojI0UCDIDGO88mWaUO6jufVzhKUgITGfEQec2E+y/tzfDtp+b0HWu8Qqt
	 Y3WiBtW+C6oZCGMtNbWz5s1kd1HK0OW/Aa3aUfxBzB037CtEcE56jHR1ukCFvnUoid
	 5SvIh5mlBXAjQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 11:36:40 +0100
Message-Id: <DDYZS8Q0IMHW.2THERFUD075JJ@kernel.org>
Subject: Re: [PATCH v8 3/3] rust: revocable: Documents RevocableGuard
 invariants/safety and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>,
 <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.21.0
References: <20250726183552.23098-1-marcelomoreira1905@gmail.com>
 <20250726183552.23098-4-marcelomoreira1905@gmail.com>
In-Reply-To: <20250726183552.23098-4-marcelomoreira1905@gmail.com>

On Sat Jul 26, 2025 at 8:35 PM CEST, Marcelo Moreira wrote:
> Refinements include:
> - `RevocableGuard`'s invariants are updated to precisely state that
>   `data_ref` is valid as long as the RCU read-side lock is held.
> - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
>   requiring callers to guarantee the validity of the raw pointer and
>   RCU read-side lock lifetime.
> - The `SAFETY` comment in `Revocable::try_access` is refined for
>   clarity, now explicitly stating how `Self`'s type invariants
>   and the RCU read-side lock together ensure data validity for reads.
> - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
>   is refined.
>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

Sorry for the long wait, I've been very busy (and continue to be). Let's
finish this series :)

Reviewed-by: Benno Lossin <lossin@kernel.org>

@Danilo: did revocable change substantively in the meantime? If yes, we
might need to revisit the invariants...

Cheers,
Benno

> ---
>  rust/kernel/revocable.rs | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
