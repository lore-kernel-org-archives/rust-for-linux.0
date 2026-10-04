Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8B334692
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Oct 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791101754; cv=none; b=skpKqqVk5BAc9kwdCfFXvFm324V0NCXXJatzpPFbYHZ8kjANER5/EpTr0NfPNyOLsMmUGXH+S6WQF8zRgUJq9MYJvSeoH3DGLM8P4NSQ+0LaZOTGsOKB+X7H5ZkkAgAOsBIxtJEvvZvB2qbH2R8qckvNe2s1jft3g8GrHnKsY7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791101754; c=relaxed/simple;
	bh=CVeSz21xIighu1Da5qONRYibdufZitiVeEKV7U/b79k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lF0r4XK0TQYADnPB5RvDDHl9nL36BapNHm0AWFGeCkCdWBsdBsVJl7HJ5oM0cxPlbFOVNKb6vFtHRrLtgU6BTksz/RoyxLUjoQbttJrzZ+SZsI+sctrGdv+p5ipi2FM5wjDcEO2bQbu04q5Kl6FhexThy2XJt3eBPZHVyzVwyJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpsUhOP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpsUhOP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06DD1F000FF;
	Sun,  4 Oct 2026 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791101751;
	bh=CVeSz21xIighu1Da5qONRYibdufZitiVeEKV7U/b79k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XpsUhOP5zRUThaABGoxofnoYJ2tQ473bnqQFdfG4zr+PhrUaQqfwBr1ehOtyGs2+A
	 tm4MxlUiQzP4AEWQFysbG0YVEehkqEVR3+K1/ltMzF2HDEgFei0gUZJitMb5pFQDfE
	 7Mvw4ZfvLW6gvWJhGePdiR3rCxjXuKva4Jf8KBwit/1fqpLw+PvU/df9ekFFrngoUm
	 Qu+PFdFZ/V4ZZQkZTpJjYBV5tQQC6s6twZsnDRcdwKjx+pp3kXbavmrNbqe5wRaMMD
	 6kcxvLwczzlo+Wsbwy5kT/jlY99O1X6s0vDYhWn2RKnDFte3EAJd5WyNsB3tmIl2Nj
	 iotoSpVzDnkmA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 1/2] rust: bug: document when to use the WARN macros
In-Reply-To: <20261003123903.113572-2-tomo@flapping.org>
References: <20261003123903.113572-1-tomo@flapping.org>
 <Mpacfqhmu3AMym2dqj01zG7E-tKF1ik-XfzMu4oceek0SlVVFumr7GvwVLFd51vCs6_Cj7bnYVB_usmQsaFcjA==@protonmail.internalid>
 <20261003123903.113572-2-tomo@flapping.org>
Date: Sun, 04 Oct 2026 10:08:27 +0200
Message-ID: <87ld8danwk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add a note to the module documentation, based on the comment in
> `include/asm-generic/bug.h`: use the WARN macros only for kernel bugs,
> not for invalid inputs from user space, the network or devices.
>
> Also mention `panic_on_warn`, since a warning can then crash the
> machine.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



