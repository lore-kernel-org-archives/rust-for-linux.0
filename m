Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4F299928
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170805; cv=none; b=MxppaaJ6+MIlkeR7c+cP7oL+PzQnRfVj9hxhTWx/1WNyFSfhnXuICerrZ4M4a/xXrp1rD8nB43t4k8NqvXUzMPlyiU2I9vNoU7gLE3sJ4/v/oRGvpKsqBOqK7xg3hAVtyMEzmUPTWcxvWcVt7P4ZPtxYy+1ULX99JzfLPXurekY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170805; c=relaxed/simple;
	bh=q/UZmhgj57sB6wszTRChoVi4TeezF/1fAYZjjvKtNCI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=krUhehjRAByIkory27omLMsuqXRP6mRxXvBMrj2QT2A8+pkdH+ASZX6BYn2Y9Lho2hsLhlcRWdx1ogob/Nb4iDOa61P+0pV2+WHx4P2raeAXG2dr/yybZCPJ6/qAXDu9/ImSe88lReFz9jV1VimyFtPXFeoPX5GP5JKTxuqbir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNQFWb0f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNQFWb0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C900DC4CEF1;
	Fri, 23 Jan 2026 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769170805;
	bh=q/UZmhgj57sB6wszTRChoVi4TeezF/1fAYZjjvKtNCI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=LNQFWb0f+NIGeb7r95SOA6ZMzQfDxDXAnGKdvVBGbaeiwrkEShy84YNAeyVN5h0xx
	 RjeknQkYqTxiWK5FUqcYJenMu8hCA1NkOpObLGAXmJZY3bm6phBguhOkk0EMZwxJss
	 RklN7VIuTDOo0Zlq7piJYkA6hokBvXT6NMLnZqh+Itt4qlgI0HEZiKJMBoCpe/opO0
	 mnqdf+vWhV3buwKYkixSdGhltr5fXv0PFR6N6HZh/qH4o5Rq526UEYbR3220sY24Bi
	 Rg3FMDlXwT+ZO8VQ5J5j6VSd8imYJDcdYlKqEw3dqgszy7YjACIhMm0Dsitc5U96PJ
	 R4bJQk1Kf7sfg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 13:20:02 +0100
Message-Id: <DFVYPIHCN0ZC.1PFXVN4U6Y46B@kernel.org>
Subject: Re: [PATCH v8 00/13] gpu: nova-core: add Turing support
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260122222848.2555890-1-ttabi@nvidia.com>
In-Reply-To: <20260122222848.2555890-1-ttabi@nvidia.com>

On Thu Jan 22, 2026 at 11:28 PM CET, Timur Tabi wrote:
> Alexandre Courbot (1):
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>
> Timur Tabi (12):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
>   gpu: nova-core: add Falcon HAL method load_method()
>   gpu: nova-core: add FalconUCodeDescV2 support

Up until here,

Acked-by: Danilo Krummrich <dakr@kernel.org>

>   gpu: nova-core: add PIO support for loading firmware images
>   gpu: nova-core: use the Generic Bootloader to boot FWSEC
