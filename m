Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C564A2F5A1A;
	Mon, 22 Dec 2025 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766419043; cv=none; b=ZVs2I4FqWannJt5OdHXMWv6bDyEsGts1isIXUE2LPpNIV6M1Pi4EPIqscTGVUtjoTprOhkwsE1k3PqEVGYKl11ltUTyAUN6ZWJjqi5q1UlH63R4jCMH/7OqNpPLxwYaxzYZ9SFSUKW5rk4JruwUH94PL1rSj/+dezzODbB8ARls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766419043; c=relaxed/simple;
	bh=9K+iWGBW4PtKR4TmXW27WUmWsxERSsydXcduY6NR4bQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BCW7nFPogVQPIQ/yNQ9/4NduPb36zC4t2BI7B/ZFB19zQAsQK5lcJ4zHlsLfLC7E9K6fxCmnySuCFPvlB0FIC/Gx7HlG75QhKdF4Qd2EiOmtX8d2NKIvCqcqfmBcgZrV12BOQBRO9cicJImqbY7heBvxWakUiTES8HNh7TYv+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XD/ORv+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XD/ORv+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A04C4CEF1;
	Mon, 22 Dec 2025 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766419043;
	bh=9K+iWGBW4PtKR4TmXW27WUmWsxERSsydXcduY6NR4bQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XD/ORv+jyGQGp4e1ajLCXKaxqqBFOX6srGYG+6I+fGfo7gMI53OijYDQDW2jLpz4y
	 GpzxcTQaln2CC/ZsQVumDHk5j7a94gu4oRewmYLynLGrWQ/+C6LPZi3NZ9vomJokdZ
	 UgwE+vlR++IZeZE6oZIh1koBkypcKmNRib9NmFhn4p/kspGBmMDqDRPm/6G4276iPb
	 OWo/TYDVfl2xdNxlfDrxXO7dSNpys2f16/HEb0irL2AU+9jzC8e+e5qjVim1EYwXfv
	 /9UHsJCoIRPyC8jlabUsIofP1+cgU9DRMmxRiO9gYCxXzI9RZG9JdLRPt7vLLtAs+a
	 Bv92u3zl7Cgjg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 16:57:18 +0100
Message-Id: <DF4VAFTF494G.Z8XJSKNFN25J@kernel.org>
Subject: Re: [PATCH] rust: debugfs: use "kernel vertical" style for imports
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218165626.450264-1-dakr@kernel.org>
In-Reply-To: <20251218165626.450264-1-dakr@kernel.org>

On Thu Dec 18, 2025 at 5:56 PM CET, Danilo Krummrich wrote:
> Convert all imports in the debugfs Rust module to use "kernel vertical"
> style.
>
> With this subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>
> While at it, drop unnecessary imports covered by prelude::*.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!
