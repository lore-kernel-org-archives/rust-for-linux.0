Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741625DB14
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742819482; cv=none; b=WR72TUtLQKiQNaE7n62VZwRjkv224zAoLoP9IAydKwMi2Fk3imF2xgrfX9/JtFsJwSKU0hM0Pj0gIJ7OUANXYcwz+bVZbe1H+E57lAtWJ5xA/HUQtbH27m90EvObb8X/zXPyURjXr25o9oInsLMsvVfhEFRE+JCyYZYKf6R0/cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742819482; c=relaxed/simple;
	bh=NuicZ6pMTHKd420gNNtUSpBvyZhaCYcXPXM+C3NCd1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xp/yJ2idPJ2AHlP+Cr8cmtc1aiLhQTSRZTwoQ7AGPVTtAQC728VbM3lNv6V8Q32AYfGs8zFqpRLjLi+H8D/Yu3oblGZw5kA5ULZB9elrmNTJwL0yakDX8Kr5573fNeTqgj9r6Xm0ripx4+pE4CMBv/LQoD4f6rr5g+T7At2233A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ddFZq+P/; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ddFZq+P/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742819477; x=1743078677;
	bh=NuicZ6pMTHKd420gNNtUSpBvyZhaCYcXPXM+C3NCd1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ddFZq+P/+U4O8bYdGYhXE5tCbvn4dK2e8Pcs1XB+c+85fzPxEdulVoh4DLj4DprU5
	 ml+D8dmJXH8IazZ+lnoAZ/K3bJETzMjjOPvENskxPe7Bu71V6ZGSROQVjLAc8PqsoF
	 n1a9e4Rl99rvEjoqk0kIYJK/aeiWcFcuBV6D1LI4kdXc8srENE8pX6sD4g6kK/vDlo
	 MpRPdBP6a1BQPAX5BNPa6/1sYzqSAyLowRIkdJEV3R/PkTmdrnWM7FN8fcexOAFhUu
	 SkhLS3prf2V1X8iJy9YF7HUqPt9kDO1MUR1ZzmlpV399qBwxlnE8S1HCr/IRRNSxib
	 Kj8vpGvDOaWxg==
Date: Mon, 24 Mar 2025 12:31:12 +0000
To: Christian <christiansantoslima21@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, ~lkcamp/patches@lists.sr.ht, richard120310@gmail.com
Subject: Re: [PATCH v5] rust: transmute: Add methods for FromBytes trait
Message-ID: <D8OHXV29F60Q.1ZFH84LLM60VS@proton.me>
In-Reply-To: <CABm2a9crNdCLnHLZ3pHQ--roaAKtM0FGL-tskyvR6rH97exqwg@mail.gmail.com>
References: <20250320014041.101470-1-christiansantoslima21@gmail.com> <D8L494ONWVO6.1V6NNJIPG7UU9@proton.me> <CABm2a9crNdCLnHLZ3pHQ--roaAKtM0FGL-tskyvR6rH97exqwg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a5132c379818f1bf5afea6d5451299c535d02ac6
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 24, 2025 at 3:41 AM CET, Christian wrote:
>> What changed in version 5? Or does "Changes in v4" mean "Changes done to
>> v4"?
>
> Changes done to v4. I misinterpreted it? If that's the case, I'll
> change in the next patch.

I was just confused by the labeling, I've normally seen headings like
"What changed in v5" as opposed to "What changed from v4".

---
Cheers,
Benno

