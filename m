Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C21D47B4
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 20:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767731449; cv=none; b=fEt9DEReyocbrJO3doXDNpzqOaNYgu09TkEj2clNdQo39UhsUQOPKEq5LyixJ19USV9W46xLD34R8GlysTSE4xunPcb8QpKzlbaVSu/DMCLUog11d4JVVNqt6k/naSE//2mEOgviF/qhuUxyBH0B+FEg93zJYWrosZMWQd5IPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767731449; c=relaxed/simple;
	bh=9wb4wPYNRslZbNF/J5lATDpjZ0lgdBvEPJtb/oHSX5g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=JuVxfCjLRpk6yKnEK3jQiB+1D/HWz7czmNfkSrnIVvYJBwxtUSUJG68iN0UukGErPehp5w+Wg1HcHXJR5x4/NrF5bEMfW/xkg0Vj3B/NCLb2Ambs86WWis5s39Hg19RHWbjX8WMZdppsBZOdwwMOL43afPtaBDpNcLhCQmokDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnN5uzqq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnN5uzqq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2763C116C6;
	Tue,  6 Jan 2026 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767731448;
	bh=9wb4wPYNRslZbNF/J5lATDpjZ0lgdBvEPJtb/oHSX5g=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=nnN5uzqqC7/kqUzJZSWrkuqK/8bc8g4zC63rm2oFqGmLzEDDr4KUNjQEhrV3As0nT
	 67d/u/Elv/zZ088YAzt5zr4hsn7M5LJpmNN/jTDtyvK1ilrC5x9Ppjf0pSgvwdfGQ/
	 oLvXX6/gR5rjLeCTgYvZAP7aPdi0Wxaw/Sm7uq5Jd0Ux7UlNEOLvuwrkP3aRYA5+wt
	 +FDz0wDccVDd1cUHWPzmU+0eJ6Z42lwrBqb0Qm7/Tv1L/o3RKE3l9AY8Wc6PKGck5G
	 0EtTYLn9QQKVGBA1rU1p+bo0hevOHZo54H1FCnWI7rWshDeoFo8dmTZgOz3oIung07
	 MYi2kCiYeC1+g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 21:30:44 +0100
Message-Id: <DFHSHYUJ2XR5.27OJ453CXOAKH@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <rafael@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1] rust: device: Remove explicit import of CStrExt
References: <20260106000320.2593800-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260106000320.2593800-1-fujita.tomonori@gmail.com>

On Tue Jan 6, 2026 at 1:03 AM CET, FUJITA Tomonori wrote:
> Remove the explicit import of CStrExt. When CONFIG_PRINTK is disabled
> this import causes a build error:
>
> error: unused import: `crate::str::CStrExt`
>   --> rust/kernel/device.rs:17:5
>    |
> 17 | use crate::str::CStrExt as _;
>    |     ^^^^^^^^^^^^^^^^^^^
>    |
>    =3D note: `-D unused-imports` implied by `-D warnings`
>    =3D help: to override `-D warnings` add `#[allow(unused_imports)]`
>
> error: aborting due to 1 previous error
>
> CStrExt is covered by prelude::* so the explicit import is redundant.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to driver-core-linus, thanks!
