Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1F823ABB9;
	Sun, 28 Dec 2025 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766945474; cv=none; b=LQxiaiweDDsKkhlQq/cENJ5xUqaRBOcsgKwfFxn3knLsTnoWnieG3zPNTYj7YuY2Q0ecPIQ7lO1yFQxwvGAWAG+jm00aaGKw2Eo/QyoebIjPeihKxjCDXfmq+J8tyXd6Zh76xbNiXblRjHtuCaFQEBzb+DaX3OHaK4C9G/F1QTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766945474; c=relaxed/simple;
	bh=CyH5/pQEriG9teouXBJGthqIiM2z7I5ZNw3lALGbCi8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=ilqhutZ85moVTW7eUZ3XqqY9FGMOB8t5kIiMzB7mNFRqLQGFwAXRUPU5chK9+GaKSWR4n9JHT99Wp1Hx8JIAxve7VhgWraQHIhscOSF3z10b5aGDbXZd5JT3sDM2PXXdOT6L0Bh2gUysFeIaMVB7BTfjfPT40w3ivu0cuhwhJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7yyGXsN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7yyGXsN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27482C4CEFB;
	Sun, 28 Dec 2025 18:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766945471;
	bh=CyH5/pQEriG9teouXBJGthqIiM2z7I5ZNw3lALGbCi8=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=M7yyGXsNt8tDaaWnhn/xEJ1BBN4at+C0al5QbsGR2v1sqDqSzlx1/KiALHy1HCsQ1
	 pMRWEicGEfQ/nwE1VjswPlq71E94JJqzDVcKsYrzfFj/PmGMfEcFYqKhhPZKiqjZoW
	 4z7oNPAIovHTLSKJfpViSt8cPtURD5q+xHoAcSiLwcgM+gH7K/B4ndFps3EpcPKboY
	 sgkBd7p5KH1vuSMFVonBV+uUQixQfWWpbP1ohPzSwvmVmJ3lQihUfoEyql/+uKsVk1
	 /YlOeGmC1GYp66EzcTJ4w3Bf6qzsdEyWvZOnUs8u3Vwy5iVjofAXpIxyjob16V9byH
	 +2dsn3t4HAtjA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 19:11:07 +0100
Message-Id: <DFA1W5RRJWEF.3BZQNFKOAEJXZ@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/3] Support exporting SoC info from Rust
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lee
 Jones" <lee@kernel.org>
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
In-Reply-To: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>

On Fri Dec 26, 2025 at 9:17 PM CET, Matthew Maurer wrote:
> This is a fairly straightforward binding of `soc_device_register` and
> `soc_device_unregister` which allows a driver to export basic info about
> a SoC.
>
> The last patch is a sample demonstrating usage, and can be dropped
> without issue.

Applied to driver-core-testing, thanks!

> Matthew Maurer (3):
>       rust: Add soc_device support
>       docs: ABI: sysfs-devices-soc: Fix swapped sample values

I will pick this one up once -rc3 is out.

>       rust: Add SoC Driver Sample
