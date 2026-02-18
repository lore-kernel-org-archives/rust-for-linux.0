Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29EB2F1FEA;
	Wed, 18 Feb 2026 20:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447131; cv=none; b=FGAsLwjQWI6XtBSw2Ifkhp8Le1CHF5/fYGGrkn1UJvS7OBxsbHKp/H5Hukxx45rs/r8CU+RdJP3DRUC5qS34ikH55sUI/3mhJctpgQgb8xBMZ2hwBpRfgUCQhv1mYrfgtd8pbgVWPyhYMIEeCPD1WxFcx4ScORfQAS6zM+2aKzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447131; c=relaxed/simple;
	bh=JYMlLe8ida5Pq0HcnCQmcyKxJ2OJ5wLzfI5fiKG60Jc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lzd+Pz3ZlBbYc2+N+1vQi2gxUyoWSCVWE87q+eqIbGdRMDL8j6hey2j/nLIthCq9xDsS5M3gu/h0x9Hxzah5/mBaXIXL2iMilg8brSwt9eoAKQIP3djtQ+pNQ3R+UzLV2AMQ6YT05qddjyoGzUtMwS3ZRTXMweO8nEaESc2jLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tl6hYUOc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tl6hYUOc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD065C116D0;
	Wed, 18 Feb 2026 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447131;
	bh=JYMlLe8ida5Pq0HcnCQmcyKxJ2OJ5wLzfI5fiKG60Jc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=tl6hYUOcgDpWvmpRAKATbZrPiRNguh+liGyF8Ls1+QEei7yFLpIjQabg0E7vX6nrz
	 zA3GRPLk/hD0xLsVM2gNsapvU1V+he2o7mEZ/K6Kh7FyLVbFU6HckwuE9nzthvMz39
	 ZtCvXW9vqv32HO/Xf4Z0Ss8Dpp7yyj0C8Lu9Mv3zTe9pNya6bFARTpP9iLXnv642lV
	 AAMOyjjRwpxxdCe9psJzkyhKvmKZTtATMbNNn+AWheCNhduPkOJilCSTaon63amz/Y
	 XqM1cBlycFMATwPErvYuF1LMgZb9y++C2Pr5uAg24lGRepo0tK/RCuqmoExnyYBXcZ
	 ZWWs3DP5d/U7g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 21:38:46 +0100
Message-Id: <DGIDLJD9X81J.2H1UB2EZPMO7N@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260215132232.1549861-1-lossin@kernel.org>
 <5f29715dba04c5a66195a962ffd1fb69@garyguo.net>
 <DGGCEMEX10HB.3AZIOF9M54YVR@kernel.org>
 <99556c0a6594f7ad9d9399e152d7e759@garyguo.net>
In-Reply-To: <99556c0a6594f7ad9d9399e152d7e759@garyguo.net>

On Wed Feb 18, 2026 at 4:08 PM CET, Gary Guo wrote:
> On 2026-02-16 11:17, Benno Lossin wrote:
>> On Mon Feb 16, 2026 at 2:36 AM CET, Gary Guo wrote:
>>> On 2026-02-15 13:22, Benno Lossin wrote:
>>>> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
>>>> warns about the `let_and_return` lint when a comment is placed=20
>>>> between
>>>> the let binding and the return expression. Nightly thus fails to=20
>>>> build,
>>>> because the expectation is no longer fulfilled.
>>>>=20
>>>> Thus replace the expectation with an `allow`.
>>>>=20
>>>> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
>>>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>>>=20
>>> I think it's worth adding a comment (or reason) that this is no longer=
=20
>>> needed after 1.95.
>>=20
>> We'll remove the let binding when we raise the MSRV above 1.78 and then
>> the `allow` should also be gone. Do you still want me to add it?
>>=20
>> Cheers,
>> Benno
>
> The existing comment just says that the bug exists in 1.78. So is it=20
> fixed in 1.79+? If so,
> please update the comment to say the MSRV that this is no longer needed,=
=20
> then I'm fine
> without reason for clippy allow.

We discussed this in the meeting, Miguel will pick this patch as-is and
I'll send a follow up to change the comment.

Cheers,
Benno
