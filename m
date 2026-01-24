Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C303B1465B4;
	Sat, 24 Jan 2026 00:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215147; cv=none; b=WQafUhnDdnldDrlVzrnYjbw1WntF8zDx6YQfxFkizPQP1IrHFtJtrYetAkrae7NhWBByaXK1+6+m2mKMNApipHorfbEC/qzxtLKxllpmgJ+PfZBNoyjRxZ5b4JLWhZAfaPGuFsCIlGa0/VDDdycF1lMrde4TW3HuBBGHksOI2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215147; c=relaxed/simple;
	bh=SKU1yfScL5Ypu0iWedIQIdD7r8yBxY0fWN6TWzp0MKI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Dy6Zch1VkCCs9PBQqHGcqybUcrAH5KDZb/79j83u92GaCXAtC+Qxvlwh3QrdPob9NbvPpV5FDRJC5QeWRxr5zXSFnJh+2XomF0zuAu8IIff/WCn16hyMm+nIWriDk0C6zbYVmNy+Sc2ZlbNQVmUrM3XQxThTIknWuy5b0k0BXQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSXnr4Vb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSXnr4Vb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5BFC4CEF1;
	Sat, 24 Jan 2026 00:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769215147;
	bh=SKU1yfScL5Ypu0iWedIQIdD7r8yBxY0fWN6TWzp0MKI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=BSXnr4VbS0Xzb2KOUOdc5V/FrFuV1p6lVex+IfGQyub7O1iXkcYufDq0jUaLPWvV5
	 SM9uJ8vNYvw3qAF+gwJvcNhDAxOQHIW5XwfW0/SVQYEUQHSKnvNCIt3iJNb0MsPbgo
	 u8aSnDsl6wgGEs6dWk+8FpWPfW+xhbtAsDDvmFasJ+7ihg7joGd/bR9fw/RPAlH+J1
	 iN0/o3MZap1jGTTxFzbfHvaTj6s+KlE9gNvfrimOpZQFZ37FslyI06ZOK5yqFAde0i
	 zBsTQWIoJRupHKrvY6om1Wu4xfaU8/QfS9o7Zl9/rKMDWf+DbELUsmLBeLnXIrU9dD
	 jyQnJ6kWJbzBA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 01:39:02 +0100
Message-Id: <DFWEFC8QQFE0.319M2OQOVGWP6@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 4/8] rust: samples: dma: remove redundant `.as_ref()`
 for `dev_*` print
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-4-gary@kernel.org>
In-Reply-To: <20260123175854.176735-4-gary@kernel.org>

On Fri Jan 23, 2026 at 6:58 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This is now handled by the macro itself.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to driver-core-testing, thanks!
