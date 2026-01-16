Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527C32E0B71
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554404; cv=none; b=F70h3SZcp+TT3HqW0CsX5so1mCh4b66yozoOKPVAG89u/ImbdwfXn+8vU1t31q62Z0uPX41jmzQgBEeVGXJm8VU0sKPgLRTt3qLiniVbC/3PfpSRdDbbrt5usXebbmggKVSfRjreDZN3g3+YQ/zmcsoAwq87poQQG+XDE0iqR5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554404; c=relaxed/simple;
	bh=7vSoT/loXAHTAIjQGRQ3es3FXVk/QW//HvIlyYi4KnU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o5GVtzjPbnovh6ZU1+U93b3hxmbgCOTGqkVY5oAvV2fWbkN7PaAScqNH1+srdp19b5Du0r74hdXqeaPIuIF+vKbBAzKlhZxqk2X9IfnpIugVjOkHZ/BWDog8I3mzBtdJguR/zFujeVRk7N/vsJFsztmWVMQUI50L6Cw4KHMK6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8oDvIek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8oDvIek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6ACC116C6;
	Fri, 16 Jan 2026 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554403;
	bh=7vSoT/loXAHTAIjQGRQ3es3FXVk/QW//HvIlyYi4KnU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F8oDvIekXzZlVpqipmwV8EmYOZ0VUEf1yhHERRbOqEPQhz87wYWCL9TLjvAHwVpkk
	 wtj9BZMq2L2daDInYkshDq79N6lw0vhmrzU2HMx8tETdPgpYwJOGCniCuFTmMI8EzG
	 RfVpE1CAf9woAWNtj2kH/+vPUjo6z6q9u+vL2F4URsANU8t61PHmo7+vgi3S9Qj1eK
	 YdRYMN6XFiQQGmHpfixDq2rTXTl3lLOSX+C+OuHTr0gf12nBxnfZD9F91LqIkCh81r
	 WRYtkwYLycrbLZyMUASM/xNQCmLCCOp2+oSigvS6pVxzFDRRsSolDovL7QhuFKv5tC
	 dY6Ptj9+Awf6Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
In-Reply-To: <20260115214545.63262-1-ojeda@kernel.org>
References: <QDFL6zfZfF0kRFHJTKFk18yqRzNTKHh4NRBvd8pHl97TalqvmobTbj94H8b2T5pAg-AugBbi-wlArVhiKRCjSg==@protonmail.internalid>
 <20260115214545.63262-1-ojeda@kernel.org>
Date: Fri, 16 Jan 2026 10:06:11 +0100
Message-ID: <875x92exks.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Miguel Ojeda" <ojeda@kernel.org> writes:

> This entry will handle the support for `rust-analyzer`, which at the
> moment is essentially about the `scripts/generate_rust_analyzer.py`
> script.
>
> It is one more subentry of the Rust subsystem. The new branch is
> already part of linux-next and will be used to send PRs to be merged
> into rust-next.
>
> Tamir and Jesung will take care of it. They have both been active around
> the `rust-analyzer` support for a while.
>
> Cc: Tamir Duberstein <tamird@gmail.com>
> Cc: Jesung Yang <y.j3ms.n@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



