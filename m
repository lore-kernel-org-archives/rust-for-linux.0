Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273409;
	b=Rk/LunCB0HPh63hrA0CHrEuOt5hVKhFoUeugh1BUSU0wqtSTaTQBVP4TE5gs/1zULKqP
	 1D12Fppn0ytfy5hVI/QC+iN7+/jQeEHKh393M9hTIZTA58mvBwfnThkYY1OIpcK16sM5P
	 6lVI5KP9DmufUgomkMKbqfhq72G9bHMLWb5Euh7MkRI/cpYPGY6pc+qIhyUtvnvol2G9Y
	 /NjeOQXrZR6kpmRLSX6yGvYxE5mo7+UjGSiAZ7AV7Psf6StTrrEynSS95jfokmmFZKAaH
	 5ptqMd9LTnfm41MDf+pjMn6nd2dAYb7IrEk1zE7W5txRtfGcSYsU/z9vSF6NK1pfKBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273409;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eQB56/5t/XA8YNjdW1AGsKpdchPczQ9QuXajQh1BUOQ=;
	b=IHO35UoBNIsWnU9TftwxkRIYz37trBypiucSkgX7/6LbJDpPT2ht77oQRUwOTY38Gysr
	 54cOg1yw46KYyClqe4lskfaHY+Mj+gXBrJam3N8VcId59R3Zgu1yuAfzSd5VYxfOmerL0
	 GwEPTP+6oVCKDPFta/wZVN6pyn0Ab6t0uIDKktgSCaOjYnSJ+mFdH+J1R/L0bhz5y3wcN
	 dT8zePHp4FpjTLSFNMFzEMoA3iLVUB5KsPD9NLNox0V6tItVJ5IEGycM7Hx1KiVIhnUf4
	 asEWT93tGnOiYzKro7HXOp1YJEgvTnl/0tLNTpr5alY7Gmdh2P0MsjLKLHtn5wHE+7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xd5S5z/o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 79C5E606A336
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xd5S5z/o
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 905791F000D0;
	Sat, 21 Nov 2026 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795273409;
	bh=eQB56/5t/XA8YNjdW1AGsKpdchPczQ9QuXajQh1BUOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd5S5z/oB4m5WYQTvAMLKfWiJWIGTHuEopAc/jQqsJrsQpXJuXHwHRkMyEfDuiVe/
	 jgM4s6nU9YncFTPYK28gQNoNdwRfxNg1RqU9HgNmfMihdm1BrKLu+/dg3tcRZd4pZl
	 n5RizFp7FbqDtVhxKjIhAbBJqkNn5ZTXGS33ZLQTJ1or3kLgwmN+zctFGHPXq3Vhie
	 5wP8bZivR+doeG+1ofZRhS0fmIE0FPpMzHMkDMxAD9pjC3sAGAndwGpEC7ykbyIYdx
	 qNE2wUY2OOjgDMBdrC8KFD6Grsqyb//RUAKaQFc6z6lr9WQMV2g7eEr4p4WWhI0z09
	 G4LxdOsndrQQA==
Date: Sat, 21 Nov 2026 10:03:27 -0500
From: Joel Fernandes <jfern@kernel.org>
To: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] rust: gpu: buddy: store the allocator inside the Mutex
Message-ID: <20261121150327.GC946893@joelbox>
References: <20261119111850.33270-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119111850.33270-1-mbkchelofficialdev@gmail.com>

On Thu, Nov 19, 2026 at 01:18:50PM +0200, Ivan Tverdokhleb wrote:

> [...]
>
> Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>

Thanks for fixing the TODO I added!

Reviewed-by: Joel Fernandes <jfern@kernel.org>

> ---
> [...]
>  rust/kernel/gpu/buddy.rs | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
