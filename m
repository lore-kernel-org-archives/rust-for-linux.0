Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BED18E1F
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652952; cv=none; b=lXDdvwb5tqMQk2l1uRCYJrA3fDyJcwAd6AEzHJ7K10CAaSAhhXfBgmQ3/nVEdO0vvF1xFIoHShE5HCEoeM35oB6GTyp7HhkoRJxqa/p0McFV3xKtwe0aSK+Y8/dwmYl2G79zE+EChvvtrDttpBFi4+Lp8E4iWuFdHTjQ+QK8Zko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652952; c=relaxed/simple;
	bh=HG5hgAyjnHeCRKwT0pEgowcnSPcvb6xXyeze46219Ds=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Lv/lcwSB7Ebd6gt8pbYxu4vbwdhAcI230JWSRC9Odg9fBwHSzZCQRS91MPTAZoch89/mdj8A5eU1Yxw0PcW/yWuNzKgIJRisKmRBlile+TUJL5Ga8r0poVELr+c0aPd3I5Xa+8nagFZAhNjkT+AD6ZG4uLqDjNNI6fwv5e8T7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8r7Yvn3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8r7Yvn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0386C4CEF7;
	Sat, 17 Jan 2026 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768652952;
	bh=HG5hgAyjnHeCRKwT0pEgowcnSPcvb6xXyeze46219Ds=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=s8r7Yvn3xHVTo++zcQUou7S4ULij0ReQmIQdjc1xUgYxx3ph6gOkmrRVmirYG8CXP
	 iRyYd4O525223VBAxmKoQC6+4YYyeG563Usjq8bF/M4EAaakf+47w87Ha9ilCQUlvm
	 0ztMIq2OAfrCIs6SCl7udctAWWKquFjy2DXM0HHB081PnXN565lhvlKYAuS9soV8Ib
	 X9qfRBNTNf1yhEKHZf66JCwwu6fFsEdJQbkLOWsQXEB2LzfS3ZS53TGz41l2WSALYW
	 OL06EpySiQUlEr1vzx8G0aCk4YzQVV44ARYI6Mke7tSwzVno0p+CWvmPjSnjllDHK3
	 j7jocZAJi7tJw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:29:08 +0100
Message-Id: <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-8-ttabi@nvidia.com>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        let dir =3D Dir::new(kernel::c_str!("nova_core"));
> +
> +        // SAFETY: we are the only driver code running, so there cannot =
be any concurrent access to
> +        // `DEBUGFS_ROOT`.
> +        unsafe { DEBUGFS_ROOT =3D Some(dir) };

I think you forgot to add a new Kconfig to nova-core to enable this and in =
case
not set leave it as None.
