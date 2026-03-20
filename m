Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFE371053;
	Fri, 20 Mar 2026 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994563; cv=none; b=rLGvVU/NuNh8LaJyoXOsXK+/kFgrkEAzdGgAUEiVMJjEyp9bMQ9CN/UJCjOr8KVODazKhBK+ASn5yBzeumqqI3XAyk/AWcbCbpXoHPQVOGmA9BG/an6dtDcoXrxkj7YPctAV01ZUUACYTbq1gXcUQ40Yiz33J1i93abIUk/94xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994563; c=relaxed/simple;
	bh=Ci/6GNEmNSrzA4srBk+9FmYofREQ0wO0K3Z6W9LZdFw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gpK03I1dnKreVF9aUVs+pPv/be3ruonfVZs9Z5fCjrYIGcnkSqjyLM+JlZYktUobSiGE6xSGJYF9soY0U9yvzQP6uio0n6BAv/eCw4ouV4sLFY7TD/6GN+riNmuUV+HeQ6tZijTwduz9OmapKtyHbobhr48oXbZBG4s0sNduz2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnF8FPoy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnF8FPoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D215C4CEF7;
	Fri, 20 Mar 2026 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773994562;
	bh=Ci/6GNEmNSrzA4srBk+9FmYofREQ0wO0K3Z6W9LZdFw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=EnF8FPoyFb5fzyVxa1q1M2Ui5vb8o/M38Vvfe8NuiD9O/gmKXAml3vUtUUPSsP7Qf
	 RDkvPsoHGvUScWuNqaMrIzmERkGOm9hjU7n0U0D4QBH/W7gOizpVW5rcJWNvRkugHU
	 sHEI7fGRQfrpSsiQnUEM1gyvEY6QlMsrXOOMh1+Au4sWx5jKSmp5Oq+TFcGtQ1y3AB
	 ohXOj4oTY47gK4jM4mpm/bDq0/6DCbRed84HIRtkHOeQx4kninCBM9oNl2AVsvdu8V
	 0haKRgdL2Cp7IdtCD2eujjr1gR1NreOFkjcdfNkEp0eaRE3vQFV741Z5y1DoZ8h4te
	 HIMa00o57gasA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 09:15:59 +0100
Message-Id: <DH7GL60ZUTSS.3UAGWO0GIJ01O@kernel.org>
Cc: "Alistair Francis" <alistair.francis@wdc.com>
Subject: Re: [PATCH] rust: Mark all from() for Error functions inline
From: "Benno Lossin" <lossin@kernel.org>
To: <alistair23@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <aliceryhl@google.com>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260320011844.2264931-1-alistair.francis@wdc.com>
In-Reply-To: <20260320011844.2264931-1-alistair.francis@wdc.com>

On Fri Mar 20, 2026 at 2:18 AM CET, alistair23 wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Mark all of the existing
>
> impl From<...> for Error {
>     fn from(err: ...) -> Self {
>         ...
>     }
> }
>
> functions as `#[inline]`
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  rust/kernel/alloc/kvec/errors.rs        | 3 +++
>  rust/kernel/error.rs                    | 6 ++++++
>  rust/kernel/ptr/projection.rs           | 2 +-
>  rust/kernel/xarray.rs                   | 1 +
>  rust/pin-init/examples/error.rs         | 2 ++
>  rust/pin-init/examples/pthread_mutex.rs | 2 ++

Please split the pin-init changes into a separate patch.

Also note that I prefer to take patches to pin-init upstream:

    https://github.com/rust-for-linux/pin-init

I'm also open to picking it from the mailing list if you don't want to
go to GitHub.

Cheers,
Benno

>  rust/syn/error.rs                       | 1 +
>  7 files changed, 16 insertions(+), 1 deletion(-)
