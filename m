Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E93EBF21
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185403; cv=none; b=hR4S+QXvg1ex5Of2mAz4mcd1uc9sm/EpqINseNejp1FPUhU0/J2iFtOvhlnGV5rhVCpIThRiIrnWbsZtDJQC08enyeX3+1ziuT1STAkEcj3CdAon0pYWBXEyChtg7B/NsGhF1UeC/2FQutFgeujV9nbNaD6frdtwc8dwRndCjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185403; c=relaxed/simple;
	bh=Kub5IUdQZ0gHyCCupB3lGIRpLX/NNLM/jlXCs98rgXg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rWDDhZ9phHHiafP59sQ9EdNHvUGT1XF2Q/MSz/xEdrIMcWntuYOCBGSnHkJeQjLhQhXsMgYP0gKWgF+T4TJfNSxiCYCJcNsEEY4rIRPE4twuouhYj3LNJEdgT+d+UOYwgY9RRVy8Yc2rDdMsmHEe+Ax9DhxAgOd+8U5GFdv+SX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkkNGGLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkkNGGLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9090DC4CEF1;
	Fri, 23 Jan 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769185403;
	bh=Kub5IUdQZ0gHyCCupB3lGIRpLX/NNLM/jlXCs98rgXg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dkkNGGLQcyWNl8z4J10nf1N0gvIlbg9U1521vJyLGSb5x5ry8CwRRDgaHh7BC1veA
	 nOvayn0OQkzPNQ1FmhkLFtcKU1GXWClGQzgDFQOFGsmboMloS8jWw9Gna9ywMU28Tk
	 LpXJwUQLmRF5PK1UkbjoAqAHiZKhnLXI2FZnsKp2ccRoBLMaCW1cZR3X+1IzeXfM7h
	 acwtcei9+HZWUw1p8HXnTvqLnT7oOnCzmKle91A/XjNJ3n8okd/F8RLVMcFyc0beY8
	 JN30+YFzm0Euc1/iNAOQb2aP1fy971IIzL7oIeeI7PgWMDN8AetGNpqQQBa23SUuk2
	 mbi1P76UI6ZAQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 17:23:19 +0100
Message-Id: <DFW3VSJRDEOG.374RHLBPHFVVZ@kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova-core: check for overflow to
 DMATRFBASE1
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <be1f31d3036fa12af42133dc09fa22c27cd71764.camel@nvidia.com>
In-Reply-To: <be1f31d3036fa12af42133dc09fa22c27cd71764.camel@nvidia.com>

On Fri Jan 23, 2026 at 12:44 AM CET, Timur Tabi wrote:
> On Wed, 2026-01-07 at 14:16 -0600, Timur Tabi wrote:
>> The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA addresses
>> up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
>> To mitigate, check first that the DMA address will fit.
>>=20
>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions an=
d base code")
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>
> Danilo, is it too late to make 6.20 with this patch?

This patch is already in drm-rust-next.
