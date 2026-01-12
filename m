Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDC33803FF;
	Mon, 12 Jan 2026 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241187; cv=none; b=Tz4IoGGvmpuuGSBvSMxckef1ThjJnaMLyfq18cQuXEM/NXOiuldOBEM7TafKQOuz9GNak91B2WigIVVvqMCOE4s/rKsXL6dSEAN69p6Ps19wHsYUeQtf+KuPLr/Kh3iMPv6RAc3bYnYQeO9ehgDBpRAW5+L1jqlhW9BQwZc3GTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241187; c=relaxed/simple;
	bh=gy5An+kiJrxH2Qq0ZeGXeVjMriUjnOnsKSjDKiZvmo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXh3VXsNmVsFi1cD4IckUrPdI6tXfJXoxV9ChXlB6HYn1QLUfh8euYuZMsIeDupn2rY8EV68XLFjbk8Jckaj/8rkq81r8PgubtRYWG+0Cxj7mji260CRbyC0BgtbrkYBNCVoD1S1GRaw36KfflK1ihbkRs19LtWwUPoC1rBBOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFqTya/b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFqTya/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD89C116D0;
	Mon, 12 Jan 2026 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768241187;
	bh=gy5An+kiJrxH2Qq0ZeGXeVjMriUjnOnsKSjDKiZvmo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFqTya/bCpY2mMSJLpIejIaKULVq+45g4kNr2UwGfa3fNBJFD6W0OU5Wiyd7UCig8
	 1wzNG4NtWtdiODo4ddwWCWSdH+2JH1D0n6ziagVhorOfGFd09FyFCgCARbCzLdpN4o
	 oM7ePK05s443F9rraDFZ2Px3M8w8/77QzvHA5Alyr/gr1xcLXbENlp4jt/qbP/VoFN
	 P2B0jA1bHy3VGMDLX/BzJBWhpxJ4nyEJSawRRxOT3mOxnfLUdMi4RLsKTqA/y6fJlB
	 /yTVS/aMAx5WA2yMecsAb2bXxcG7z2KTjKvicZ4QoWYHxJBFpfFud1OmuA6dHi+Ffz
	 Xh5E6F2b9vBkQ==
Date: Mon, 12 Jan 2026 08:06:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v2 26/27] rust: workqueue: add __rust_helper to helpers
Message-ID: <aWU4IabJJJQEzNyo@slm.duckdns.org>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-26-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-define-rust-helper-v2-26-51da5f454a67@google.com>

On Mon, Jan 05, 2026 at 12:42:39PM +0000, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Tejun Heo <tj@kernel.org>

Please route through the rust tree.

Thanks.

-- 
tejun
