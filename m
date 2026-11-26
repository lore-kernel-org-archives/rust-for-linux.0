Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702393;
	b=t+2AXaAroQyIpeVqpnzZEeUBPhCV/E3T9VJEwfszbJKaQPaCgzRIf9Qt9j2EE/d4tOoY
	 JPjmTkSPE6cDQBCNhwZuJVfD2yq2yUjFyZwQlA1F/s8sBBzyu5/enUMdhSPxmdD8xMznf
	 RkGL9nyKZLoK9rtM3gk5crilkf9s7lIwtnBMIo90UtD4zWhiluQHBZJ6ugQ05/3c7Wqhu
	 FC/1BuA5pACaRNmVKqz4jh+obz0nElbNGK/Ik0LrXi6BUqNEaHYZxUlCnqZtsXA6YOeN6
	 IzR+YQ3XFPpvCEk3hLOcCoJfwhnQnd86R/dBFxNBC9Zx/nUCeRlRdaYnzqt6h6y8+rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702393;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=3YnYPrDG3MtIj/tmv9XSpUodKwdeK5KGlzh7C/4XlWI=;
	b=47dzcyD9SGWqCNySe4sDHVpbvf7uv8DcDzMmcV4+wlMkgCWTitGKyjgLHuk4j2IismF6
	 Fp8GPwWjsBYO2Aueln08LbPtjPkNHTiWxvPF7YW/kTsnpKeodppVw7mLc4PhOrmRE/f2j
	 QRQ2/5sl7AUxVoQwYQXU9ndBJ0ALTVK3Q7tUqjPcuDvOWf2feOCzWVud3TVqCV1oJs7AS
	 1xGOFIOSrmwooedXADWYW6HxNNT5ZD3Bl8dDMiq4UFRbZQN0fkTGMEltUwutC/y2HFgc2
	 InQgGTbPtEPTY0TdegiygkQQMe92lBLm3ednncDRgG2nI9wPw71gjqpNyrqsrCuYf+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWIZB1v5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5F606A329
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mWIZB1v5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509D71F000F0;
	Thu, 26 Nov 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702393;
	bh=3YnYPrDG3MtIj/tmv9XSpUodKwdeK5KGlzh7C/4XlWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mWIZB1v5xNhBCBWXwJlEE9KpdWnJYnYJ7ZZ+TqxXGfthSIbfjUNV4vw2Z59qGlrZt
	 BQsQ695UIuU5lvyy06sfleVMqTB3H2/MmhdVay5R9nSqAH84IWef3kBawwDkGsGIzQ
	 PsFrzP780Ri0oFc/ZEStSBEtMbBq3NQinDTcXLWiRXZcmSCvUGCk7OCed3gsk9gD+y
	 nnSyGEg3m9r7GjQ+l4+fHkUXZ8zgJ/Yujm2qhth2PAkZ6c33HIuJQ7k352y3gobTUJ
	 cMPn1k81K5/WZ7+fZ2+ZJ23EUanpNTlox1DbDPKLy38HPLFY+mBhDM+T2vkdk+urrn
	 IRQ8a6odUAfeQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: ojeda@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net, 
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20261118230708.2599659-1-tomo@flapping.org>
References: <20261118230708.2599659-1-tomo@flapping.org>
Subject: Re: [PATCH v1] rust: time: add #[track_caller] to Delta division
 and remainder
Message-Id: <179570237815.3865922.5425805498685614983.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:12:58 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 19 Nov 2026 08:07:08 +0900, FUJITA Tomonori wrote:
> Delta's div() and rem_nanos() panic if the divisor is zero, or if
> i64::MIN is divided by -1. In these cases the caller passed a wrong
> value, but the panic message shows a line in time.rs.
> 
> Add #[track_caller] so that the panic message shows the caller's
> location instead.
> 
> [...]

Applied, thanks!

[1/1] rust: time: add #[track_caller] to Delta division and remainder
      commit: 6d614de4288dd9738557b5bbc5be90851bf27701

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


