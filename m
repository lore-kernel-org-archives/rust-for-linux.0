Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC63254AE
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767700818; cv=none; b=abh+VSdhoD5Yh2aZrkDU8/5uv1/HM4cnvf2hiGZ+TxmMrTQIoyf+MDJE/S0qls4M5FLcQ1l8uKGsUKatJ0CGtTBOJIcqsMKVfdZS4n85VdG2bALUUwHFUKZZ0HUPsMAI5XFs5AvO/S/mQY1zLovZHEfl4GFE+NQcPIMdWyGFsMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767700818; c=relaxed/simple;
	bh=uYpvdWk5ETKA6OxvesVMY219NjtdAsBNxujuYeXF/ZM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=raF2pQ0mmbNhO9ZuGYrClTAOYkWBOdxEnRxADml+yrbsp//4EKux4N4nvEq1XMOp5Lnf2sPnzZdRUkn9FRsLoj2dP/kM8lpW4bYmxUoHM4Xt4mhVrfjbzHhX2oWDNMUw6pDXO11oV91oHnHrPUXMlxCE5QfRkf1Pt1N1HZAOrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7DtGHTj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7DtGHTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3428C16AAE;
	Tue,  6 Jan 2026 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767700818;
	bh=uYpvdWk5ETKA6OxvesVMY219NjtdAsBNxujuYeXF/ZM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=d7DtGHTjveFBBMwX2Z1M98QB9LSHc+9BU3W9flVT2UtxDF4yFGJIPYGEIYgPEp3kk
	 FV4v2RPhnluffuGBjPLs/1MYS8AfPMfdUU86sA/uBKTudUBjktXDfkbwgQ8LEHlBGj
	 tTMzv7UykuV2EXphKxaFGmi7B+rIqHKqw9NjaMKs1qlsV7uBjZTHfSDPEHf5U9bS3W
	 30ocgevA43eYjiYd3azg1yh0a1E60o6ZUqp+ES1TGzQcnkeg0jQbvh7Hi6BEyARwAi
	 Vwi6HH+V581nt5l8t+Bd5OKPeOQW41/knqgrbeVbpEjd/MI/S395AW9SFTKkcbLtDw
	 oX1cc8Ai+uL8Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jan 2026 13:00:13 +0100
Message-Id: <DFHHN31J8VVY.3009MJJNDZE5Q@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1] rust: device: Remove explicit import of CStrExt
Cc: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <rafael@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
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

Fixes: 3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")

Will pick it up later on, thanks!
