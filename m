Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F842DC76A;
	Sun, 10 May 2026 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778437200; cv=none; b=dCZV8A+NvLJRESNMa74FVDBvL883kCx22bLUhYIunUdOjLZPQGdEYmJN3Nu/58oGsgk77yRaU6UKgvreSOkkFPLDMxNpb53aSpdwJU0eKmnWKosyi7bTzssHjg5O5XjISEDKtgYWMU2DDp5ZMDYqx2DMAQcmSY6qpBqnAwNcnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778437200; c=relaxed/simple;
	bh=M3KnghEi1uNejsdwJFAaF/o9/9z7PPHpRQV1whaht7U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Lu5Qls+VCCyWRgYLj4YTlTExTpUNTMX6oo4r8d2OSR2LCkyGdSucVExXy0JZhjOsL8Wg9sDISqu8OcR+XseeViCX56pRUbsimUrZFo7fWT7dKA2P2E9WXX9y5rNS1s2OStq3NjYjo5e3AAdpnDMmQ63v1cE21nIToDlmufK1M1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=haXDA41S; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="haXDA41S"
Received: by chaosmail.tech (Postfix) with ESMTPSA id 7A80F1C81C5;
	Sun, 10 May 2026 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1778436964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kH1cVi0fCpimd2cmrJ7JlRz8opGRIdmW+m2gkskq79k=;
	b=haXDA41SeKSVZB8uVK646NQGhQ0rBIy2ZRN6PvCUjYXtq04ek2xFN0erq/dcwL9/vtdYdK
	6kyM7RFnrflNjegeUTSnoa3azYWOTCd3LhdB3DPg33K5pAgEXWPVAmg9lKj7GaJG3XqUOT
	1//ozIdTAd+mOV1vlgqPME3hSy9soEk=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: Re: [PATCH RFC] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260510175617.GA118456@robin.jannau.net>
Date: Sun, 10 May 2026 20:15:52 +0200
Cc: Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <51B59A2F-7663-4372-A0F1-3BC373C006DB@chaosmail.tech>
References: <20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech>
 <CANiq72mHGsatZLLiXAzZnKOmktOutQbC9bs1VexKm8yJ1w_p5A@mail.gmail.com>
 <DIF492AU2WJF.359GZYTFSWM1I@garyguo.net>
 <20260510175617.GA118456@robin.jannau.net>
To: Janne Grunau <j@jannau.net>


> On May 10, 2026, at 19:56, Janne Grunau <j@jannau.net> wrote:
> 
> If that's valid the patch misses to add "depends" on the architectures
> which have support Rust support in the kernel.
> 
I believe that HAVE_RUST already covers it.


