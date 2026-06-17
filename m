Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9430DED1;
	Wed, 17 Jun 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710455; cv=none; b=rxkho0vdklOGbM7q5mS22SVT8odrn0M/BFxWKbXN3Xxzj/5l60haE0VyLIGZoj8prAs+xdNREdfuMFwbzWmJFbQ7Kf7kmvMeM18tbv3uC+5sDm8hH16RCTHOsIAeKVZBjVPgLVHYbgL2BCsb05J9RbDCTceU9hSQzMx3mwt4Kco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710455; c=relaxed/simple;
	bh=1UQXXNFGVhM5H5vWJlDDEQOhg95SUabJBrHMi80Jl6o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=a+CHEk35ufsjbZAa/SaiKh+iWwUbAc2dkC8sao+LWD8M56ADJV/2Sjs8PAjak25HFxKGuIuzzj5rxGQ14CtuvWb2aXq7HzSZZqT0PFc1wMDi32haJzDgIZ0CKd6dkZloHzrViSxWcoscAhguLCragl62ko64voSIBtnkXfImUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5qzpM5S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5qzpM5S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDE41F000E9;
	Wed, 17 Jun 2026 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781710447;
	bh=1UQXXNFGVhM5H5vWJlDDEQOhg95SUabJBrHMi80Jl6o=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=D5qzpM5Sz0Qpg8O/7mD9224PmbXf37ZXhCPHhnzapfZYs1LjwbFmOZ74CW6RCm8oX
	 RYx7sQChG3sQKX4zBdV05VXKNGJlA6sGaRUmjjJ5TbBpOk4cToRCexLENK62E0v0sN
	 DJzqhiMJubKCHnJPvNYbetu7Jb+xvnE6MXpsrblPjkGmj63y0dLnVFzi1Dx9gXooyL
	 FSZKckoBfgy29aVAT0tTsdD4oB1bFRW23zNXf2ku3aY0TTdnME2Xe6JINODZPSnDnC
	 QE5rjsaDrlTGrs1sOaZtx0sHl9Dt8WEMLe6fYec3G7PI8IXzSSvEHWgEGkSm/6ci5j
	 RtDgYqfCVgKYQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 17:34:02 +0200
Message-Id: <DJBFN1GFXE75.32363U9Q83CSL@kernel.org>
To: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir Duberstein"
 <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <linux-usb@vger.kernel.org>
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>

(Cc: Greg, linux-usb)

Looks like the Rust USB code wasn't added to the USB MAINTAINERS entry.

On Wed Jun 17, 2026 at 12:36 AM CEST, Nicol=C3=A1s Antinori wrote:
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::inc_ref
> ...
>
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::inc_ref
> ...
>
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
