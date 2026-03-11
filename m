Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D827CCF0;
	Wed, 11 Mar 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234099; cv=none; b=f+B+eefPlb/i8oDFCpSS51ivQ/oDQk1C3yqzneYqsu5wPsj2mi/5bVcudemZbE5iVnUaZC0U9AZXjOqObQXfz4Rk9HoF9AA8R+VksbKVLDav+PuASSyDVFigaiK3tOE4ZIvZNvxT+ZG5OBmfOy9w9OdZ0sfsR1cvbI8WAwO8h8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234099; c=relaxed/simple;
	bh=lCWMvbjyU8tevvIUXKuX7UIyxKKdpPdXp+DqEchSsPU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=t3gVi2D4CGEjeYgn72g6/yU9yOp8AmOVi5UGyLS2EnFRJy94tCtXX/gBS1oUPLnqllr8eM3bLN5EjRIXecXfHAO+wFEUwJhY2W3B3qUqqAtuXl2BqCA4KQinqSLDPHuUjFgfDH7bMtyqaQy0n1Xf2JtIGPn88c68mF4ApcEIxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsRP0mEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsRP0mEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A61C4CEF7;
	Wed, 11 Mar 2026 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234099;
	bh=lCWMvbjyU8tevvIUXKuX7UIyxKKdpPdXp+DqEchSsPU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=UsRP0mEJH5oV1pyMIETFdwA0Ga5QaoLwblpZo7LHHjJiP+uXEhUN8APZf84wQINk3
	 3wbeTQBaJ46uMBIc1zR3kF6yxC6R+DllqduXoPDAHQX//em7TpESI1vS4v5PkZISPK
	 MAwKebCYeW2dL5amcoFe/fWDuN8BgaB1T+cPWphutfu9xtmZKaYL89ysc1fgT4Xmfb
	 6r6Rv2OMkoraGMcsT2N+LJVn0/OyE9tw5eRP8vGdre0OfFaj7zj8M/Pjg8BVg1OQIy
	 36+ucMd+W+HMsBYaxxIDM+trPqqz6WkzB6twq7FAx0POumI+WjlzWxERVy45IlMdPn
	 teDLAQPQGkdng==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:01:35 +0100
Message-Id: <DGZZ0XF0YYGN.1W5UIBXK16HL3@kernel.org>
Subject: Re: [PATCH] rust: pin-init: replace shadowed return token by
 `unsafe`-to-create token
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Fiona Behrens" <me@kloenk.dev>, "Tim Chirananthavat"
 <theemathas@gmail.com>, <stable@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260311105056.1425041-1-lossin@kernel.org>
In-Reply-To: <20260311105056.1425041-1-lossin@kernel.org>

On Wed Mar 11, 2026 at 11:50 AM CET, Benno Lossin wrote:
> In the face of Type Alias Impl Trait (TAIT) and the next trait solver,
> this solution no longer works [1]. The shadowed struct can be named
> through type inference. In addition, there is an RFC proposing to add
> the feature of path inference to Rust, which would similarly allow [2]

NIT: I'm not sure if the sentence is supposed to end here, at least it miss=
es a
period.

Besides that, is my understanding correct that the changes mentioned above =
are
targeting a subsequent Rust edition?
