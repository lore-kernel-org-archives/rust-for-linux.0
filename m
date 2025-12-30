Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44D1A2C11;
	Tue, 30 Dec 2025 22:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767133940; cv=none; b=Esg811Q3KvCK5M0kt+9qFzRs2R2VdvxWAlRSg8H++Qo3CPyKZVKS9MLCnpoIKwbYT59kH94CVIINS8C3FCD5A01DDIICVQn3yvZorfoKKgo7WZeDVa2cKaMVVKfmNFSJqyRWUaY5+ViypZ2+QbhqW8My15KO8tecPQt0MoYm8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767133940; c=relaxed/simple;
	bh=MG+len8WZOFb10ZdQ6mvlLbVh4Jv8KPhr78ySOt64Kg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cJGcsZyeo8rK/pgfASHEup28ORZQOjCtU/bCSLZtLEivH8MYyJKlsDUD/dCZ58AVtPMom3Tnjdq37RZ3vKU6yElho21wn51ax0eXrx6d8rmcEFPB+Nr4dmT+VgPhLYQEZ8zxYmHD/urFzgLmSEMuaEPKFQjGIxDAKkPonw3y8uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqrPQ61d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqrPQ61d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C3CC4CEFB;
	Tue, 30 Dec 2025 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767133939;
	bh=MG+len8WZOFb10ZdQ6mvlLbVh4Jv8KPhr78ySOt64Kg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KqrPQ61dM5amoXi7SntIW45b5I+HuY1zJjIz1mE0j4NYoVaUtWqqVdU93GJ9aqBcK
	 uGK3uy6lwqeWDbm2zWTkDO8ox6P3Wp2WKTsnL71NeXPcz7QC0iMnT7UAJ8hZiShXE5
	 3Kv7vj/o3IlxukgBzF4RWKpCh4khuRxEHFxPkL36jiy0B7dxdKN7jVLhPVOY3QKGEi
	 xk72UpoYakCwQCh4gtcxnliJt/sZt5sVMA6yMTJIwto/YYl8rLKoXyGIohxAsTMzKx
	 fMwWErJg1LoT/Sr4BhtlF+Ek28hurOcXBbaUsCVFULaVG0p38/hCOvWptKOW33giv4
	 COvavAS7LyMbQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Dec 2025 23:32:14 +0100
Message-Id: <DFBWP6JS4FWC.1KNF1QYIX5VRQ@kernel.org>
Subject: Re: [PATCH] rust: driver: fix broken intra-doc links to example
 driver types
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251227-driver-types-v1-1-1916154fbe5e@google.com>
In-Reply-To: <20251227-driver-types-v1-1-1916154fbe5e@google.com>

On Sat Dec 27, 2025 at 4:47 PM CET, Alice Ryhl wrote:
> The `auxiliary` and `pci` modules are conditional on
> `CONFIG_AUXILIARY_BUS` and `CONFIG_PCI` respectively. When these are
> disabled, the intra-doc links to `auxiliary::Driver` and `pci::Driver`
> break, causing rustdoc warnings (or errors with `-D warnings`).
>
> error: unresolved link to `kernel::auxiliary::Driver`
>   --> rust/kernel/driver.rs:82:28
>    |
> 82 | //! [`auxiliary::Driver`]: kernel::auxiliary::Driver
>    |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ no item named `=
auxiliary` in module `kernel`
>
> Fix this by making the documentation for these examples conditional on
> the corresponding configuration options.
>
> Fixes: 970a7c68788e ("driver: rust: expand documentation for driver infra=
structure")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to driver-core-linus, thanks!
