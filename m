Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE028DC4;
	Thu, 19 Feb 2026 13:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507116; cv=none; b=lBlOtfFQZc1LRfwyko2r/OMRDXnigtm9+knlfqhK0ElPzGkuDLsIT/27yN5MB1PMgVPmi9NG1LIfIvLL/TBXCnO0ra/8PXkrRPyg9dm6yTSXeY8uAovDLEh2Xde70RAiDM0pnWdPT8mL08mTQRf3OlLGXLNcxMlczMGp0Jdn7ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507116; c=relaxed/simple;
	bh=3YIXB6F54AE0ihQ9V9JVrO/ZPv0+mXz2KjRiR/19JOU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=H8dDAgNYm5XLQkXr+xRnOOriIR9hGxNS5ABu7F/hKyc3z5GdllWfn8ST8ogGjghrFZAegGp0gBYTVKDMU33e5nSLrrdRXfi35zmKvo7c3kZwit0HSZB1qd8y/4eDyKQjwk1Vb720pivNcHfdKK1dbxKO0JRo0qzY1GGLwxlJGuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9E/cBVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9E/cBVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA169C4CEF7;
	Thu, 19 Feb 2026 13:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771507116;
	bh=3YIXB6F54AE0ihQ9V9JVrO/ZPv0+mXz2KjRiR/19JOU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=c9E/cBVhsP2yha8dGzGPDi1mCeRt+oOpNODKVRwDVcAxv4yMa07AGROPkPd6uO4Pf
	 ATJx5se7Ti7u/knhh6g8chHcHUD+lbooNUQrwe8kJPhHc21d5p6VA3qT7e7ni+jRD/
	 ofwsv2DoVaHKDP087DSBQzG+I2bn85QA0WFjYczdszN9BP6zerRNRpF5vKs5I/pRku
	 6ET2QaRVYKen7kEulN4wHwBB+1rnnSX45KNPlRqAIrWGejm1hcHIv0a5wh01GZxbSn
	 beem1yZjVmArIhedHCRO7s8hY4F9Kx96vVFDL5EWbFeJ01GOxMgG8tdzHO0zW0vJKf
	 mvzBlf83cWlYQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 14:18:31 +0100
Message-Id: <DGIYV00H7ZJJ.36FJ8MINCQ004@kernel.org>
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Arun Pravin"
 <arunpravin.paneerselvam@amd.com>, "Christian Koenig"
 <christian.koenig@amd.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-7-joelagnelf@nvidia.com>

(Cc: Arun, Christian)

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> Add safe Rust abstractions over the Linux kernel's GPU buddy
> allocator for physical memory management. The GPU buddy allocator
> implements a binary buddy system useful for GPU physical memory
> allocation. nova-core will use it for physical memory allocation.
>
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

The patch should also update the MAINTAINERS file accordingly.

(I will go through the code later on.)
