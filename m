Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F340306B12;
	Mon, 12 Jan 2026 16:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235219; cv=none; b=TkMKzsINhl4EzcMVJhh3I3oTwd3MmQW3BWckBLKV2FhNc6wNwEAMWGuhDpcdQpOMeSv0g6WrqXQA5kotCI95yjCCzs0RjgplImoE7yV/dRFMAEFdNBxqHY9Y1iCF7+FM4GHUZ/ELPlefIj4WilNe8wuieQcRC2PGDPhZN7tSNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235219; c=relaxed/simple;
	bh=iOQ3LQzj61QetNGlfpImMH40+LMPO+8jS6s7vMtHAJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgOdes2xQaUWGXGjsr7j1ACyw5NNkp12ND2u89yJTPGcvRzBjmh7xUH7QBaZSCHwClyKsSg+690d4BHHC9gYthOKcuJFYkv58qqTAcuRSGlVfOddwx56GZrjAteshZoV3FIwXqcYnTvPr77dGvUekVxhVCd+IbJCZNxsPPmTh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qetD9cI3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qetD9cI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9717C116D0;
	Mon, 12 Jan 2026 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768235218;
	bh=iOQ3LQzj61QetNGlfpImMH40+LMPO+8jS6s7vMtHAJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qetD9cI38v4HBH8WY0GQNe4eZ07JHWSiCKPGsql56eshbyxYi8vqaBPM8Mx+izci9
	 ZtWtrkKCgkpnmeOYm07icpKRsJu/gQfDueanJ6ytm1ArZa4mfD7Ax/fp6jVLUVQOp3
	 4f0nSbBRbcBB1Wc9Tp8k45aqQjV9DM9VhXX7Hp3rgMh6olXn1R+CBhIukhG0jcSW7X
	 i5oa+ZyCAtG2aOOELwrWJUx+XkNTHaO5kkWOzwZKT5c1GyFsF+JNUqpcH+iiYq0078
	 uQYm42YWA+WKAa60uwdkuYRjc5pDDNUlY+FWDwROS4h/5HrjrE60mThCgaZJN8lFC0
	 Fah9qt8gH/urQ==
Date: Mon, 12 Jan 2026 10:26:58 -0600
From: Rob Herring <robh@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/27] rust: of: add __rust_helper to helpers
Message-ID: <20260112162658.GA472608-robh@kernel.org>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-12-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-define-rust-helper-v2-12-51da5f454a67@google.com>

On Mon, Jan 05, 2026 at 12:42:25PM +0000, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  rust/helpers/of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
