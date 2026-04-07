Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22C3A4F24;
	Tue,  7 Apr 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571729; cv=none; b=pMv2KZzWIv+v95FINe4F9d86LcJeFV04UqbaCCDhrbiybw4S26NO2RGxysSD1drtnKV7j0uq1xb+nsGSkohdRUQsOlX+1iKdLYchtNdVAFaCWQSyxD4iuki/ti0gKPdsji1zxpqqloEBkgfeUGF8dXa1CA9mzHwAmkCztlBmNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571729; c=relaxed/simple;
	bh=M4K6I43OBYzV+FMwGWYjjiE2PvKsU16zwhvg6x3f68o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Qg/6JeVIy8Tmvha3SgF1kkp6XJHLH/8hlYxdp8Gexd1U0tkUUdFAqhGqfrUF312Ul1pbqZmnN5OzLnW38xcEptCGkdjrABwZgMlco6T9jkNlwUj1rrSpMxR93BYuiuVb8qLOK+gt5lyEzPU9wfFk9KKjBiESWNG5KLwejlmt2PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6cs3Pgk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6cs3Pgk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E392AC116C6;
	Tue,  7 Apr 2026 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775571729;
	bh=M4K6I43OBYzV+FMwGWYjjiE2PvKsU16zwhvg6x3f68o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=F6cs3PgkvGLk4LZwR11KqoIMvtLJMDXlnXCH3wYh4IUHcT6kJqlJKoqTxRoBVHHYG
	 fHijR5kWo7RK279fzh5WK94Bhy/gncjo208dMeaVhVVJPfC/bHjDP4aohjvl71o5SR
	 hUSbiZnnl/3ON5rJ42mAGHmsAu10OzhjhJVyFL1f8mWXm5TBADsiiFkyKeJcqdlcPx
	 hOhQ4rPRsHVhLTK0W1ke4Y+GArgvL9pQYL/rBW+XY3e9hQK6BX1nMd7HpspXF1BL0y
	 fo7WGeoo1DOaYY0FbapmSumJNrfbfJzDNAaHeSsosBz3mLg+NrTlFFruJWgNfy1ouU
	 6i66PP2StLWcA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 16:22:05 +0200
Message-Id: <DHMZN9TEXQT5.3FIWZRAQKUO9T@kernel.org>
Subject: Re: [PATCH v2] gpu: nova: require little endian
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260407-fix-kconfig-v2-1-6b4fb06c690c@nvidia.com>
In-Reply-To: <20260407-fix-kconfig-v2-1-6b4fb06c690c@nvidia.com>

On Tue Apr 7, 2026 at 5:59 AM CEST, Eliot Courtney wrote:
> The driver already assumes little endian in a lot of locations. For
> example, all the code that reads RPCs out of the command queue just
> directly interprets the bytes.
>
> Make this explicit in Kconfig.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> The current code assumes little endian in a bunch of places. I think we
> should either explicitly decide to be generic on endianness or explicitly
> decide not to - having some handling sprinkled around in various
> locations seems confusing to me.
>
> I believe that currently e.g. `RUST` transitively depends on
> !CPU_BIG_ENDIAN, so this is more about making the decision explicit for
> nova-core rather than fixing any kind of hole.
> ---
> Changes in v2:
> - Also add to nova-drm (Thanks Danilo)
> - Did not take Reviewed-by + Acked-by because commit changed
>   substantively
> - Link to v1: https://patch.msgid.link/20260406-fix-kconfig-v1-1-8f634499=
f7f0@nvidia.com

Thanks for the new version -- I have one additional question in [1]. Otherw=
ise,
going to pick up once -rc1 is out.

[1] https://lore.kernel.org/all/DHMVA3S2MZWV.1JN7WUBZLRWLV@kernel.org/
