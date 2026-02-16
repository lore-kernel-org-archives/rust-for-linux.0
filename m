Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16390253932;
	Mon, 16 Feb 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240648; cv=none; b=AEQzMAph98XBgrU7c/fRXFxLkcgb7cwWqtfTbU/tfjhxKQzOWB5UvM+Z76IXsbi46YHISuW7qXOi5GZQrCsbtqFBae9F53UFfKY5lZgmuR1vsx0gRvs06yYQSvvizw25ar2iONQ94CdNk7en44wE7j4ZIHb6jWDFsn+YNJ/MRgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240648; c=relaxed/simple;
	bh=yNm8Sy6INzuHE3oA9xfpsjwZF2cVCGNu0KE6GaBwqM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=uQtulnWUiFvK0RHSVrkQ3v5V1ixpNGnWrSEi8gZgGgr4k7/Al82d7L3/ALd6jmvXFMftrQP2DEGrY0rfPc52BW1ZazWdyMO0O9iRVDCSHjTR+K71s57rqwZZhke8Tsg+JkURaGHfB5e2ol6tKWxklSruKY9zXDVft7MdXRVmswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVR2dlLD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVR2dlLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C06C116C6;
	Mon, 16 Feb 2026 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771240647;
	bh=yNm8Sy6INzuHE3oA9xfpsjwZF2cVCGNu0KE6GaBwqM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVR2dlLDU+bCBzNFXX1ylDVXMyrQK5Mgb1YBL/Ww/Jt5K+IbRAzCDujpt4Qdz8SLt
	 9XP1AI/ScekNh/fVAfvEnPMfF17OExcjDB5X1VdVTlh6Uh2chhT+g5gHPuhDydcUX0
	 J95FTU/OjIOh8H+WDVr1XZS/mR6Nmf3km4+Np2dFG7zBiNT6E8FNZqfqNap+TI1CXz
	 AIaisTqVKCMgfPJaEJgdthOyFyx5hCgRlz/TIYV5/46Fku+UXj5/wepTq77ezXPAtC
	 B+JT7adAkeD0M/XmbQJtDb7pvi25/P3xSKpZaCM8p78dJIFnvtX4L5KPdc1IKA4Xb+
	 DHuwJC2nSPXpA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 12:17:23 +0100
Message-Id: <DGGCEMEX10HB.3AZIOF9M54YVR@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
X-Mailer: aerc 0.21.0
References: <20260215132232.1549861-1-lossin@kernel.org>
 <5f29715dba04c5a66195a962ffd1fb69@garyguo.net>
In-Reply-To: <5f29715dba04c5a66195a962ffd1fb69@garyguo.net>

On Mon Feb 16, 2026 at 2:36 AM CET, Gary Guo wrote:
> On 2026-02-15 13:22, Benno Lossin wrote:
>> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
>> warns about the `let_and_return` lint when a comment is placed between
>> the let binding and the return expression. Nightly thus fails to build,
>> because the expectation is no longer fulfilled.
>>=20
>> Thus replace the expectation with an `allow`.
>>=20
>> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>
> I think it's worth adding a comment (or reason) that this is no longer ne=
eded after 1.95.

We'll remove the let binding when we raise the MSRV above 1.78 and then
the `allow` should also be gone. Do you still want me to add it?

Cheers,
Benno
