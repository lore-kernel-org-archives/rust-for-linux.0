Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F82FBDE7;
	Mon, 29 Sep 2025 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759156314; cv=none; b=MQ4/gQ72OFG2lSuve1366eP8hv+jyOxBlW8GNtG6H1eEtYHXWnlL6++LQR8dYhOF3abP0NQR3/iyXHQJXULuuaz5CG7WMlO+HpHalgzfbsHTuBagK6URecL0r8OTHZIYgOE4X7tefxgD7saRQFZxwldrup2XC2+0i2zbtAfXxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759156314; c=relaxed/simple;
	bh=nh9XYzrgUVb65hFURDDJgJ3UccIVJD/bwJub2TKeuS0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fuacNPXFUlypPWKfU89uHUu7D6FravwhXeDRA+UDMlsh3WlX2UNP6D234hM/J+1MZZpF3GEnQ5SmsDX4iW0qaR9BIW5RIeJbEkDBRzWiyk7U4G1NjnPv7A9jHGgYbXWCd+sekwg5UxSCFB5vDBtOigT/OMtVErgSGLQUMg4SXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rH9HmTCk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rH9HmTCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47868C4CEF4;
	Mon, 29 Sep 2025 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759156313;
	bh=nh9XYzrgUVb65hFURDDJgJ3UccIVJD/bwJub2TKeuS0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rH9HmTCkpNEk3oaXGhNZDapOz8VMLU9tvgmJbL8C+bnxihX19WR0UXw+lnzXChB/x
	 h+HCcSfsFPgJr7GtlUSiZwc/sdIHJ8CfQi8Y1e+gPGc4zHHCwq7+9KFW4dG8Ze/zpR
	 kdjfaMHa+I1yQdXnsj9C2KvrCk6gNFV8kHg6YPu2AjUPXlatw9Mtuhsxk9IC5angsC
	 JboAhsjgMvXlsvN2Yu0wahcTBIUG7m+2sYK2BwKSe6mE0jh0uVTQq9q1gKfkVd+rRh
	 /xK8Nt0GPaNjns0j1SIj+5TjC1L1IqmpGP4tmfiCb++HJVlV5uRmpOAqgdZGvF6oU5
	 RfIoEBapmw1Hw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 16:31:49 +0200
Message-Id: <DD5CV7ZXZDTA.26QKFT8OJO6SN@kernel.org>
Subject: Re: [PATCH v2] rust: of: Add basic DeviceNode abstractions,
Cc: <devicetree@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
To: "Markus Probst" <markus.probst@posteo.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <09c855b24873ba71b1c1e968d0b6d0c010843699.camel@posteo.de>
In-Reply-To: <09c855b24873ba71b1c1e968d0b6d0c010843699.camel@posteo.de>

On Mon Sep 29, 2025 at 4:00 PM CEST, Markus Probst wrote:
> Add a safe wrapper arround `struct device_node`, which is capable of:
>
> * reading string, u32 and bool properties
>
> * iterating over children
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Can you please expand on the commit message a bit? What's the motivation? W=
hy
can't you use device/fwnode properties instead?

Also, the patch seems mangled by your mail client, the corresponding MTA, e=
tc.
Please have a look into fixing this up. You can also try to send a patch to
yourself first and see if it still applies for this purpose.

Thanks,
Danilo
