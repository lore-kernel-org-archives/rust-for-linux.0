Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0447F2E0;
	Wed, 17 Jun 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712455; cv=none; b=EpPq74tpG6tlKqWK9gl/XaTMfj40T4HEvNVWsSsXw72e9+znS+80wE2apSKjXTBBx837CmIRi84hIJamFMRawixVHUysdNjtZcjolBqLl7v21BehvbzxjzhLZTF/xsAfQtzxaAuOTj5zjHMtWvnFqxR7k4O9H+kP6mZxp6Zxk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712455; c=relaxed/simple;
	bh=aWq/QEkoGDmxlMTijslmCtGIfeSHPIRFDWrnl4URJvg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=D6woxVOuP+6LIJ8mZn8K7qxOywloXskjeE9Y0ZiQvI+mJk6QQ2HLK27Fkjz3xhxwz06l94SdnXfSBF/nPi03quuRCt31Iit5BbyZ0MbYl9MyB0p1iJ3g3VKugfwESFWE/cA4yo61Dou3xCrwbfU2LBPUku18BjQubOYP73lp8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqbIEveb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqbIEveb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41E91F00A3A;
	Wed, 17 Jun 2026 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712445;
	bh=53P62tPSkAqWcCKSZdxa4fBnQU0Jt3G/vZE9f4lZBwo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DqbIEveba3gCtTg+OHfPtLQmG/Mzqnj4ghMcqdOO0H0ttJdsf07Y4ScXnzXOO+6SF
	 oo2+2KoLDqLgD8TXactIT0+JVkR8CAWV3zuSzKTHi3gcYj9g06ysWZBz/NqX7rGfIj
	 KkRwB+vAzsX+Ao3VYOYkQ/CSRUGqVTn0Rotz+1krzdi+meNs0f4kFqAVUGXMSD5811
	 oReMN1c+r2SEGBb95U0p8Yh3Xnd+gtHcXRw9vINdCr2yzDNbZW0rEhAX5xkyBzb0Xv
	 4NhuO4y0G6vwtTiM/TD1FPw6SjB8JGRlh3F5yVDjVaGufZ5GLX7j9qlrij5ffzVU2f
	 sAec4KqZTdYmQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 18:07:21 +0200
Message-Id: <DJBGCJZ3CMEX.3ORMLBEQE87LS@kernel.org>
Subject: Re: [RFC PATCH 1/9] rust: usb: add synchronous bulk transfer
 support
Cc: <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Shankari Anand" <shankari.ak0208@gmail.com>,
 <linux-kernel@vger.kernel.org>
To: "Mike Lothian" <mike@fireburn.co.uk>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260617145946.1894-2-mike@fireburn.co.uk>
In-Reply-To: <20260617145946.1894-2-mike@fireburn.co.uk>

On Wed Jun 17, 2026 at 4:59 PM CEST, Mike Lothian wrote:
> @@ -426,7 +427,7 @@ unsafe impl Sync for Interface {}
>  ///
>  /// [`struct usb_device`]: https://www.kernel.org/doc/html/latest/driver=
-api/usb/usb.html#c.usb_device
>  #[repr(transparent)]
> -struct Device<Ctx: device::DeviceContext =3D device::Normal>(
> +pub struct Device<Ctx: device::DeviceContext =3D device::Normal>(

Please see commit 22d693e45d4a ("rust: usb: keep usb::Device private for no=
w"),
this shouldn't be needed for writing a usb::Interface driver; please also s=
ee
[1].

[1] https://lore.kernel.org/all/DD08HWM0M68R.2R74OSODBIWSZ@kernel.org/

> +    pub fn bulk_send(&self, endpoint: u8, data: &[u8], timeout: Delta) -=
> Result<usize> {

This should only be exposed for a usb::Interface<Bound>, i.e. note the Boun=
d
device context.
