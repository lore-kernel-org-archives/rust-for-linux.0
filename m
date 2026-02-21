Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49303219FF;
	Sat, 21 Feb 2026 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771686586; cv=none; b=O48fPG+90kHLM+Oa9UoHFCKkULz8AzkmrU+mlFbZgB/7r0cUfWT4DGqTdurZO6RLDli3n6a+l6TsusgCuUBOvZKHi5XnHzyBbWpuKQM8YiswxVTV+hdSEgaL06dl1DPknAjtWih3F5O5OInCtpA4hZjMS4QJC2Bd8np4gEaf0LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771686586; c=relaxed/simple;
	bh=jTIT9NqpyoWBxCeo/vIgFgNyhqW6Cp5fG9tUy3nKyeA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FwIVVnW49BdbO5gLkPZP6VPwJmKcg6xVOXlJ/THFmDQnQCK5u9Z/8rGKgHAdx/5Xi6VLDkU8K611xchnM7QG5Jb+EjncxNa8Xva/GOGqHP0CbB1cYTPm1LlrQhpJmohEIYtKNdQo64zeyz8FI8SLmBYBDRnxiQq7GRA5XAPsPa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6/2wUb3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6/2wUb3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CAAC4CEF7;
	Sat, 21 Feb 2026 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771686585;
	bh=jTIT9NqpyoWBxCeo/vIgFgNyhqW6Cp5fG9tUy3nKyeA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=X6/2wUb3g64KQyNHy+qsGgWX/nzikXjB7/VpDNAAvMR8ct44WmuPx5mLNY1RmsZ8R
	 MgrMWVAErZZ+AWsOfakPP4iII49dIZYN5/tA7Jdq5Zgjm2f8Q/432TOUNHUk8M+KTY
	 b0QDAeXWGhZikedRflCYX+nWh4EoQQbycaKWDNHKKgn/veVn1OyoSCZiYDm2VehdWh
	 2dY3npv651mv6xSDcbhFTxEty8qvZguEGFDdUC40w0YzHNRc7LtQ9ozZ0kFk2CriBp
	 40plQQvpAI+KsmR8tYddu0xtVrVeZMHYaXFyow+n/c53V7ZwA0kDJ6S5cSCPjNbuAb
	 zUMoLfw5XF1Hg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 16:09:41 +0100
Message-Id: <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Janne Grunau" <j@jannau.net>, "Matthew
 Brost" <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Lyude Paul" <lyude@redhat.com>, "Asahi
 Lina" <lina+kernel@asahilina.net>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com>
 <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org> <aZgYY_fetgz_GDR8@google.com>
 <DGJX3FI97W1G.371MAMC60FX24@kernel.org> <aZlw3SGmLetHwaTM@google.com>
In-Reply-To: <aZlw3SGmLetHwaTM@google.com>

On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
> So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?

I wanted to avoid exposing the reference count, as I suspect drivers might =
not
need it in Rust, but I don't know for sure.

We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
GpuVmBoInner<T> is private, but I also don't want you to go back and forth =
with
this in case it turns out we do need drivers to be able to take a reference
count and I also don't think it hurts too much exposing the reference count=
,
even if not needed.

So, either is fine with me, ARef<GpuVmBo<T>> or
GpuVmBo<T>(ARef<GpuVmBoInner<T>>).
