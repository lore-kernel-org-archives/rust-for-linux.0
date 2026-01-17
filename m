Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB8130274B
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648931; cv=none; b=laPeUar6PfTIynacsjnqmyY19gFdZUCBiiUSCWiVATUy5jnSr5fLhWw7JlTQQHAETqc8rfdeXQqFR0BzPn9S+dQ820Hc8O5XHAbZYLaUyCvG8ZG3oamEqJXvgInt2Jvcrd8gJ5yrKh1jzqLmybduinOR/ERyk6cFGRYbCKEtR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648931; c=relaxed/simple;
	bh=gQYle7bmqsKeFxTdSshuxLs1w1nsZICRxGz1P8bBGKI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SY2S6sK36+DOEqXfaXocqE+lpacai88zhho2B49cCdqJt3mCcCKOIaA38+9H/hNAdYJ32hG+xTRr1W6bsC6jUXhEgEc4La2h8hconjmE4hrxvs52fVyLZpSthFC2t8n+efhoKxLsr+c2gq+/Leu4e9Fd9QW1k4/zi9eW+wLK/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhUk/iRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhUk/iRm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8608C4CEF7;
	Sat, 17 Jan 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648931;
	bh=gQYle7bmqsKeFxTdSshuxLs1w1nsZICRxGz1P8bBGKI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jhUk/iRmczWd0SBcURXiYN7qpZKkmECliDQ7Llt3hAwycPxuXwHbbdII+20NcXm52
	 t/IBJBWSh0zyTaCyACIfQNcEGqxYWqFMlEK7SITpJG+7QqS70SR99cwlqrBogTxsze
	 8h/kKmNsFwtOg60Pmhwn9qhK+upQY5zoSb5oq8CaNZVdA5am6xcKU+AW4rVC6FnLfB
	 VhGp+qOVEBEZBnEaqggD8JW8dOx4LmPBUWKj28nEe/cX7Nm0VeQQELx84Ye6PwGVQ7
	 276W8yds15RF+xWPT+OmmRKF+MF9p7fgtRnY3m3Zz6+AG4N0umgBgp4cRzQPglkaUX
	 lu58/5KzRC4SQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:22:08 +0100
Message-Id: <DFQTPWTDRYQF.U2OSSLI2173W@kernel.org>
Subject: Re: [PATCH v5 4/8] gpu: nova-core: implement BinaryWriter for
 LogBuffer
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-5-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-5-ttabi@nvidia.com>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
>
> `LogBuffer` is the entity we ultimately want to dump through debugfs.
> Provide a simple implementation of `BinaryWriter` for it, albeit it
> might not cut the safety requirements.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 766fd9905358..273327c33aa7 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    debugfs,
>      device,
>      dma::{
>          CoherentAllocation,
> @@ -117,6 +118,45 @@ pub(crate) struct Gsp {
>      rmargs: CoherentAllocation<GspArgumentsCached>,
>  }
> =20
> +impl debugfs::BinaryWriter for LogBuffer {

Let's move this code into rust/kernel/dma.rs and make it an impl
debugfs::BinaryWriter for CoherentAllocation<u8>.
