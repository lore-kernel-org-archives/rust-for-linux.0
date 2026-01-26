Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA82BEC5E
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435235; cv=none; b=AwZRXvarQQQD17+JD9j6+72XN6xBwmUji+LG40xqmBt6dfyFY/aQZi7zEjQkATF8OIpUWTevDgKEf4gN84Eiu+LI9YCrewE9rt7j9Rcwkv8jfgcLXtkl5tXXulMnlebCMJoM1o8HSKO/K07zJM8UsiLFYJKDE5XjSPTjIJ5jDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435235; c=relaxed/simple;
	bh=3LhTA0Jowmtnd73xIXtf4dZJLwkDkhc2PFWRVNBi3Ww=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Y2tJkexKtjOWwWzc4/NunKtd9rhtqRL6i01mhdro7h05EACXnY8qnLDB652PS3+i0/bq+pdQtIGIbd+rd8TT7A3fLLmhacmPtXdEU20v5NEF6dtqXXVyIyQYKUtD7xVRMBBtzYR0k9eQHRdwYTVTG4mD6hpy10gnA63f6UQSykk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xgd0CZ/D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xgd0CZ/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAECC116C6;
	Mon, 26 Jan 2026 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769435235;
	bh=3LhTA0Jowmtnd73xIXtf4dZJLwkDkhc2PFWRVNBi3Ww=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Xgd0CZ/DITeIdYPSWqCtYlalNb30isMvS91OQ5ZI1foP7o5MJtFuOx1qk5EjBYqV+
	 dBv4h0hSyQjL/oEqbQTkphVy3cFauniV6LpljT8g2wub/yp6vHNa8JHlxntjfSbjek
	 CxGQI/Pe/hLbjE900mPqQ2nr+hAOaInaE+R2X/ujYR3BjeEmqMvC9NU4a2OxG4wmLc
	 FBJYo8FT4EPPqRAuHLCt6Ax/THVbPY2KUCFVe2wXoAvr7ST0l/Id2RWKai0f5zfxvE
	 jG87Y5CyyG93FpZz8JHaFIhuuJXnXnR94hZO6rEYQ2FWXMf2yKoeUishpZLXsLpRbb
	 OTD9tC2tzULMg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 14:47:12 +0100
Message-Id: <DFYKFW4MXDGA.2SO6O2EV0IPM0@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: dma: add missing __rust_helper annotations
Cc: <rust-for-linux@vger.kernel.org>, <beata.michalska@arm.com>,
 <gary@garyguo.net>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
References: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260126071738.1670967-1-dirk.behme@de.bosch.com>

On Mon Jan 26, 2026 at 8:17 AM CET, Dirk Behme wrote:
> The commit d8932355f8c5 ("rust: dma: add helpers for architectures
> without CONFIG_HAS_DMA") missed adding the __rust_helper annotations.
> Add them.
>
> Fixes: d8932355f8c5 ("rust: dma: add helpers for architectures without CO=
NFIG_HAS_DMA")

I think we don't need a Fixes: tag for this, but given the Closes: tag belo=
w,
I'd add:

Reported-by: Gary Guo <gary@garyguo.net>

(No need to resend, I can change it when I pick this one up.)

> Closes: https://lore.kernel.org/rust-for-linux/DFW4F5OSDO7A.TBUOX6RCN8G7@=
garyguo.net/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
