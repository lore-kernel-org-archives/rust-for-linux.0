Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166B02ECE9B
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770405981; cv=none; b=uRXdKaTYW3tRovA89HHC5WIlWfat3+grQ8+J+ULZ/oS/0uR/rkIdpfAh1j7C8wPYYgTEWvMQQml9DoN1/eyf4AFktUCJAv2SwaeXH9/m4kGoUB/8vnHrgfRXTGh+pBRDYLJX9TinI4VY6wcpx9Lj+nzwR8Irz2tDiPSYOlVw5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770405981; c=relaxed/simple;
	bh=+47fPdf+JvkBNRw3xbw4WU28RqJEdmCvdS4zCZTayM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mHeEBUymvjHfV3GUWZzbA1gmpR+2vaUhK3cRUKoTDrokmCmcsu2UuGhjEim1079+IgHOVtUSDYpjtlzJtBA8fY56sFVh32lJ10k8pvjCJq5ypUJR3w8DpzK7sCJDp8SL1A4CsJYZ6GSV3y1tuzxkcIEl8SotgxHnGjmDrium5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqctgCp/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqctgCp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE913C116C6;
	Fri,  6 Feb 2026 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770405980;
	bh=+47fPdf+JvkBNRw3xbw4WU28RqJEdmCvdS4zCZTayM8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lqctgCp/u0XqL2CPwNAeZq60+m7JyGF1E+0QKtWP0diwSE2PtYJNEszPCXlKsnjpX
	 3kgpEMu2UFMTNGnGGgey+crYrjP7pW6R3HUzHdqbjIgdH8XJv6N8tBBMwv7NNGwtsI
	 GnVVNq3O+/2OfbaM0wIpYkPsiXWd6sdb+CimA5KWVv/M/jVgGMKC+tf8VptVcWRSZW
	 QwyJQ6HUSuFD0HSIXsa+1SQbMO9WKdcMDV2hBnfdrJH/LkEvTop9yaUKSmc9UjWQyt
	 HEkV0rlMEbHzdmQ46TKH7+fUeL7ghySPyzPXIifsxi35mdILod/WPzxtZoOoG0dg33
	 RA9PwbLM0ZiCg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 20:26:17 +0100
Message-Id: <DG84JHXTG9UG.1HIOESC6LM18K@kernel.org>
Subject: Re: [PATCH] rust: dma: add missing __rust_helper annotations
Cc: <rust-for-linux@vger.kernel.org>, <beata.michalska@arm.com>,
 <gary@garyguo.net>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260126071738.1670967-1-dirk.behme@de.bosch.com>
In-Reply-To: <20260126071738.1670967-1-dirk.behme@de.bosch.com>

On Mon Jan 26, 2026 at 8:17 AM CET, Dirk Behme wrote:
> The commit d8932355f8c5 ("rust: dma: add helpers for architectures
> without CONFIG_HAS_DMA") missed adding the __rust_helper annotations.
> Add them.
>
> Fixes: d8932355f8c5 ("rust: dma: add helpers for architectures without CO=
NFIG_HAS_DMA")
> Closes: https://lore.kernel.org/rust-for-linux/DFW4F5OSDO7A.TBUOX6RCN8G7@=
garyguo.net/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Applied to driver-core-testing, thanks!

    [ Fix minor checkpatch.pl warning. - Danilo ]
