Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E909C2FF;
	Sun,  5 Apr 2026 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775402144; cv=none; b=fhnGXXi68hqDjVhZwTa0Bn6O3uRILfdoB3PdbLlgY7Xsml/uKH3ESWmAVjZGvxbcDbdqB/sUOZyWMbNQ36IndG5Rm2KONUzKbRkBW5+TRx3RJ1HXiCuIJKZOxcvb3MxHkbLBPzPaT1MEjgtJzjP3dlEp+2YmjLBIAPOUibn8C54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775402144; c=relaxed/simple;
	bh=usJcO5sq1mo/2yNi7ckHKPTcHqyv8RKBCvpEEKy2yl0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LnPdA9TEXQYbvMCjTqTUUY6rExNz6MotQTaAh4xq9+io723FuQ9wH715isO/W4rKf4oTm5raM6u32nbyCO5WdIRgysOr+25o60IBHKi1OpnrzFlEXE5RZTUAOr8G/7NCsIwLtOuh73ZrhX0DWqj5Kh8xaOeeNLVrmCW3GSlPbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWWYoy2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWWYoy2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED0AC116C6;
	Sun,  5 Apr 2026 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775402144;
	bh=usJcO5sq1mo/2yNi7ckHKPTcHqyv8RKBCvpEEKy2yl0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SWWYoy2xaX53hGutTPUdf+V+4ogjzXoH1B4wyKTurlUsUKQWLkv+EQxFRVk4ndfJI
	 +PkFSf6+PEbzPJGiXVpbj+GX6oQUaTMYxUlwN81VyxBMza+zAg4tlwCjm8fa0zcLT1
	 SN/gk3gZZ6e2WXsPJnbuEYRxe92Zc/EWiQRoHKCQ3OqxX6/GqvdpU2V5BvJsKyHuIt
	 BOa7++29NVhI1ba/7m8QOnerca396gAMXMZLGcWz5qx5Of8gq8Xc47VEdueula0ZN9
	 XmBVYqIaqaYNAChr9B9K3GN+7Y/c01egERetp2zhtdXeRLcfsTtpLlB/m5IVByZFVB
	 oEaDCv21XMyyg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 17:15:39 +0200
Message-Id: <DHLBJ7FDJHZ8.XHEA93HJA53B@kernel.org>
Subject: Re: [PATCH v5] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404-cmdq-ub-fix-v5-1-53d21f4752f5@nvidia.com>
In-Reply-To: <20260404-cmdq-ub-fix-v5-1-53d21f4752f5@nvidia.com>

On Sat Apr 4, 2026 at 7:04 AM CEST, Alexandre Courbot wrote:
> `driver_read_area` and `driver_write_area` are internal methods that
> return slices containing the area of the command queue buffer that the
> driver has exclusive read or write access, respectively.
>
> While their returned value is correct and safe to use, internally they
> temporarily create a reference to the whole command-buffer slice,
> including GSP-owned regions. These regions can change without notice,
> and thus creating a slice to them, even if never accessed, is undefined
> behavior.
>
> Fix this by making these methods create slices to valid regions only.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Closes: https://lore.kernel.org/all/DH47AVPEKN06.3BERUSJIB4M1R@kernel.org=
/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to drm-rust-next, thanks!
