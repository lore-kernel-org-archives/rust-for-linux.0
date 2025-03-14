Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBAC84D08
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741980142; cv=none; b=RtOay3pCO+hIU6f/koeuWOA85fdPPFG0MUI8ARSu0G8HQY8PU4WNhRC3Q/tiw/aZEnwQwwGQnylt9DqH+hbOd3fX3z7GmED5rtbXa201uKmLOfhnR6DwgZougT5C2V3Z+MrKlq4/0/w/2VWTmKWWuDVMz37HuCRhEJ40GeWxGxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741980142; c=relaxed/simple;
	bh=5wStfRse0ijF6zcJLGwhrVt53N+8xSvK12PqiJP104I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X47S56OrZxLWZg6ecolYqMDrsqvmfRAAPl6LbSpT/JlYTZld+T94BYKtkrTxGVNNrEj7Q3r8m3bU8A7tCJIHuHIOnfanr1XpzgcT32uy4KZG2EBpr+LxHMDX2raCWsVVGBHbcF5Lv8yMHvmU6ENyvuAgfKh0qOstg8PzxbpLsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nHOTwdJm; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nHOTwdJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741980137; x=1742239337;
	bh=thJECz48gUXx5fCuiQ2QxMOjva1RYIRgnYdCOp04aPY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nHOTwdJmcWno63mC9jXXayErfsOlb4jB/UTVTv2YFHjVL7+vS4gpYe2ZyPyZrVRnM
	 XnASK1Wpj3hr8Sjn/DFCl27B/vXILM94ttXwyaJSyhfRYtogn3TCVMJVHvx8iWFGzN
	 L6qUvw2bIjnWduyVJSzVs1cSM6dR3DofPS0h1VUA4yorSxN3K3mvU0kierHrXIWU1w
	 9HO1c7PzupM2+KrT6mZOAl3F6C+r5ASTdz2Ksx5ERfGLXD2BWff9+OamPIz2oON7x8
	 pOh8VmFOg9Y+2lCGcGOB+pWU+CkyHHeR7roTqxBXx9diUlv82TXvPBIh7YewNdYkn1
	 uD+IuNiAtkWVA==
Date: Fri, 14 Mar 2025 19:22:09 +0000
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: retain pointer mut-ness in `container_of!`
Message-ID: <D8G8F0X59XBY.1ZCW3BOLXCYP5@proton.me>
In-Reply-To: <20250307-no-offset-v1-1-0c728f63b69c@gmail.com>
References: <20250307-no-offset-v1-0-0c728f63b69c@gmail.com> <20250307-no-offset-v1-1-0c728f63b69c@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a5798fbb667a529e08d919bf50c046bee6c0afa8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Mar 7, 2025 at 10:58 PM CET, Tamir Duberstein wrote:
> Avoid casting the input pointer to `*const _`, allowing the output
> pointer to be `*mut` if the input is `*mut`. This allows a number of
> `*const` to `*mut` conversions to be removed at the cost of slightly
> worse ergonomics when the macro is used with a reference rather than a
> pointer; the only example of this was in the macro's own doctest.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/lib.rs      |  5 ++---
>  rust/kernel/pci.rs      |  2 +-
>  rust/kernel/platform.rs |  2 +-
>  rust/kernel/rbtree.rs   | 23 ++++++++++-------------
>  4 files changed, 14 insertions(+), 18 deletions(-)

