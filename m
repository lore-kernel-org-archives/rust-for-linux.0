Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2992C0285;
	Wed, 11 Mar 2026 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257354; cv=none; b=RWzRpyXDuWeIeOhqLhdiuL5tKZyCCeWZbRjK+WjU0taio452GnOkIaSd6Ykv2yxb66S7RD9H/2M7LrIb3W0R8S+esNeYIvrGX1gCoXbVMm2gNHEUlg1Sq1veXbYMODcV/xXCBK7hyJTHHTQhoGWw8+axN/UusiDZSySI7MYxwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257354; c=relaxed/simple;
	bh=di+E7MXWh/g25iMk/3f4KHldNwtUxHoHuLkUNpN1VAQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=kF4DPSuCvuIh0ueE44jnCj1A+R19YZs3eWsD/iPS8bpm1SZuJ3tFbkRJ1TG7pAACR7BO5c6CxYSGeWKL2iN6GJ3Xw2etQtQAovtZG5xzdZy+aKCiBHT3z0zuts5G88HrfeqcKyDDxMOjcALjal7ev6rQm4mrRBRmI3kbotf7+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDblnM3i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDblnM3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4140C4CEF7;
	Wed, 11 Mar 2026 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773257354;
	bh=di+E7MXWh/g25iMk/3f4KHldNwtUxHoHuLkUNpN1VAQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=aDblnM3iK8uybcluW+/jD87KEQs943D8NsRWUtIspKT+HJWyByWH4UagLsF5B305c
	 YKfVR7+1EiKHS8gXTF1LNxEkVvSYE0S3Uim/wqePTyRf3W4dw3ciiaXtrezmeJOrht
	 fy9fU5dC83OZnbwQa/5UMYdeftwAfR08QjxNDYIm4KGyomUdJPiCWSvxPFGqRHYDr+
	 L7k5CgnEd5nLhtYD3BbGUhP42kNkOx9d+v1W079L1JgQR45vg0QW9hMGBWYqto9w3u
	 cnJoVz0/lfwkzJv9pYvn8gW1vB73fa8+TTebkHxkv2IDP+Kl3c33Jzf8ZNpy960i55
	 e4YJO9CCsEr4A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 20:29:11 +0100
Message-Id: <DH079P4ZTAJ7.OSA93E7REMVU@kernel.org>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
References: <20260309225408.27714-1-dakr@kernel.org>
In-Reply-To: <20260309225408.27714-1-dakr@kernel.org>

On Mon Mar 9, 2026 at 11:53 PM CET, Danilo Krummrich wrote:

Applied to drm-rust-fixes, thanks!

--- commit ---

commit 0073a17b466684413ac87cf8ff6c19560db44e7a
Author: Danilo Krummrich <dakr@kernel.org>
Date:   Mon Mar 9 23:53:24 2026 +0100

    gpu: nova-core: gsp: fix UB in DmaGspMem pointer accessors

    The DmaGspMem pointer accessor methods (gsp_write_ptr, gsp_read_ptr,
    cpu_read_ptr, cpu_write_ptr, advance_cpu_read_ptr,
    advance_cpu_write_ptr) dereference a raw pointer to DMA memory, creatin=
g
    an intermediate reference before calling volatile read/write methods.

    This is undefined behavior since DMA memory can be concurrently modifie=
d
    by the device.

    Fix this by moving the implementations into a gsp_mem module in fw.rs
    that uses the dma_read!() / dma_write!() macros, making the original
    methods on DmaGspMem thin forwarding wrappers.

    An alternative approach would have been to wrap the shared memory in
    Opaque, but that would have required even more unsafe code.

    Since the gsp_mem module lives in fw.rs (to access firmware-specific
    binding field names), GspMem, Msgq and their relevant fields are
    temporarily widened to pub(super). This will be reverted once IoView
    projections are available.

    Cc: Gary Guo <gary@garyguo.net>
    Closes: https://lore.kernel.org/nouveau/DGUT14ILG35P.1UMNRKU93JUM1@kern=
el.org/
    Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindin=
gs and handling")
    Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
    Link: https://patch.msgid.link/20260309225408.27714-1-dakr@kernel.org
    [ Use pub(super) where possible; replace bitwise-and with modulo
      operator analogous to [1]. - Danilo ]
    Link: https://lore.kernel.org/all/20260129-nova-core-cmdq1-v3-1-2ede854=
93a27@nvidia.com/ [1]
    Signed-off-by: Danilo Krummrich <dakr@kernel.org>
