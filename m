Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53931465B4;
	Sat, 24 Jan 2026 00:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215077; cv=none; b=qYdV9rws5F2hfWfYNI6HgcGnMowVFlNsgcUKLn9WG4dbEHPXK6YGDfFqslsNUmrApA+l5GhqXzKuDwN58l08cLJAxgeqnt65IkFu6I0Pa6kHM8aPlx+ILJZMWfK2eCoXdfGZKEEf+AElmNroIsVEK/W9vzS6O0kYPRWMIi1EM3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215077; c=relaxed/simple;
	bh=cKhdQmdviZqAUCks/Q+5uDKucTUS7FZyArF53Mq2Q4I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=QXgbUuU3n9wIxLnHbaS4W6ulqPh+hX7hbyXrKFtA3MTt1ZJuQ6NJ/lv8MlyGYb53O8fPBawG5hkY6mlizA1Xsk2i8to3VqhENt3xNuFw4MHhuQRcQuz7YfQv0gefzA18IYoUedHwxTiys/QDLpXcTC6VsCjG+VXkGWEMNIYLREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7gzwF/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7gzwF/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA700C4CEF1;
	Sat, 24 Jan 2026 00:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769215077;
	bh=cKhdQmdviZqAUCks/Q+5uDKucTUS7FZyArF53Mq2Q4I=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=i7gzwF/fqlfx8bpHXsS9xgcM6/k0PaT1uinpJ5tClxUep3ibj3LIlK7rDCO9yCNp/
	 1ztpMwhZkdHbRT8iytR1moeHo41hwjHUqAxM3ed7mgqbjG0UC0XaTMEb1NBs6Ukcle
	 gAs5VTtOAoY0GaOrStQVa0xEFTbtI7i82vPL2nnUuh5+T7U8250KSfma7qv1qBJAjl
	 msTFb25K+BpN9CgiSyr6RZ8ZJuKVYonxNTfFV2WJ2efIYfkic2bEtV/9MA69fE7hIM
	 QDBcM2Rwbvag+OGy1EGVox8QONQF0IgG2r0Pw8N7O6vDWJADgy9xaYZx/doFIGABOv
	 2Dju9JYjed7fQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 01:37:52 +0100
Message-Id: <DFWEEG2O31LK.1OM4B3RVINEJO@kernel.org>
To: "Gary Guo" <gary@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/8] rust: device: support `dev_printk` on all
 devices
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>

On Fri Jan 23, 2026 at 6:58 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Currently, `dev_*` only works on the core `Device`, but not on any other
> bus or class device objects. This causes a pattern of
> `dev_info!(pdev.as_ref())` which is not ideal.
>
> This adds support of using these devices directly with `dev_*` macros, by
> adding `AsRef` call inside the macro. To make sure we can still use just
> `kernel::device::Device`, as `AsRef` implementation is added for it; this
> is typical for types that is designed to use with `AsRef` anyway, for
> example, `str` implements `AsRef<str>` and `Path` implements `AsRef<Path>=
`.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to driver-core-testing, thanks!
