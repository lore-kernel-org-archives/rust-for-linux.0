Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB0BA4A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757022458; cv=none; b=d1HMz+g3t9Hzbv0Eh50uinrie5JugWGIM149n2OVTXO3o3nUV0molJUyW9mt9liIf0yCsFVRCbkZAG0rX0RZbvn6KPJtIdLpKK1jUf3zBt4RbGwcQT8+lXGcFIU99MA5z0UaYzHkCBAlxXgFqIFGuqj7eMDgOH/Fk0OhetKeypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757022458; c=relaxed/simple;
	bh=85V+5Vd8zmuE5csOlil9Qh5K3X3X62AEcxqxqcrDMG0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=k2MybXvOPIDG4blR3iYkE4ivIIO5lieI5P8ESSnGigTVXTmuQRjPz1cSU9Q+FMsF90cqxOlslfeazpNmzQrCmK49T2TRQSz09R7wM84mLB60HQdSAF6v1r0SOphh2CePnkwO8Nwq+O3BjvOVef6Fm9bcn56L0gcUOolFqKTZ6zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3jriAlX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3jriAlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590E4C4CEF0;
	Thu,  4 Sep 2025 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757022458;
	bh=85V+5Vd8zmuE5csOlil9Qh5K3X3X62AEcxqxqcrDMG0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=e3jriAlXQ/OE6XdZ8dexRkGOggKAapeqpk6NHJfma10UlzlvamO7SCWDG+qRXpTM6
	 d/pU5Y4szGaT3Vtjeu7wcGuHdKuLlvYNTOmXLNJPGQMfkoPoSh7ahmDaS6c2YP/llB
	 4LFQGL5J3LI8VocrR7lK4NJSitKmzmtnG9JaEv37+o7SjpJfvpAJkl7Oki5jY5lPSW
	 bTSFhkRU3nkzrzYDLX3123AWxxxnEm08cewTFMm2UcktyYCNWIiCF+6ZNFlqipqSWW
	 DfbQ/UT/WUEM7+HH03jW8T82AdfkqJE+EYja9V+xpOY28hKICpPStbn8r14XsU8XF6
	 ndErGw0yCtgyQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 23:47:33 +0200
Message-Id: <DCKCH83Z2FOB.2FVKRF7G2W2UO@kernel.org>
Subject: Re: [PATCH v5 0/7] BorrowedPage, AsPageIter and VmallocPageIter
Cc: <rust-for-linux@vger.kernel.org>
To: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250820145434.94745-1-dakr@kernel.org>
In-Reply-To: <20250820145434.94745-1-dakr@kernel.org>

On Wed Aug 20, 2025 at 4:53 PM CEST, Danilo Krummrich wrote:
> Danilo Krummrich (7):

Applied to drm-rust-next, thanks!

>   rust: page: implement BorrowedPage
>   rust: alloc: vmalloc: implement Vmalloc::to_page()
>   rust: alloc: implement VmallocPageIter

    [ Drop VmallocPageIter::base_address(), move to allocator/iter.rs and
      stub VmallocPageIter for allocator_test.rs. - Danilo ]

>   rust: page: define trait AsPageIter
>   rust: alloc: kbox: implement AsPageIter for VBox
>   rust: alloc: layout: implement ArrayLayout::size()
>   rust: alloc: kvec: implement AsPageIter for VVec
