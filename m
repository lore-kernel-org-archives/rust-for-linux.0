Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF667284B36
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Aug 2025 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162553; cv=none; b=SM0yOvx2jCDBaiZ2cMBC6n4HOqbSoGyUIhR4QoiBb0mrVeNHEMNk1UhzYTIjJd/SD3MNAgdM8APMPtVQSfGw9UuFX+7R476cBxUOeLD0sBrmiQQGJzZ5/06DY0E5W8abw3NUo3wUpxDRuUh1w6+BIkfEQcSW1fD9PL61EXdhhyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162553; c=relaxed/simple;
	bh=JtulgEh6jYZtyqJxDxTVj0G4v8UXD+NesCTAkrOa2wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC+bUae7P9Ed+SORMldr4P7YnzTOAm+zt2t0R1EF2hXTTUyg3ZYIiZcfR3UjT2Gkft9LtdJwTlLuayRnZXGcpWPzIBD8Lf0IUr9NNI2V482HMoHK7t98WasRgiRUsmTS4Iu7iXA4C7/BBTpfS826MyJxqCi+rGPsoh6K+Do4FSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=EeGXvLO1; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="EeGXvLO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1756162547; x=1756421747;
	bh=HmCIauylymQ9p5rm2SUsT9VM1At8y856vEpUbWcApvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EeGXvLO15UjBXqRSxY8u/b7UQHR495zCGnhU5rOFzb9vKXn6xjr7O9MOKAbMe19qx
	 k02FnSFmmSp4gvCAH/Noks6a27OgtiXKuEaJjikcKM1DExu4rfbhhTBIbx/5v3NduB
	 ej3mjXgDZArGnoggJc4F+gtr1Zb9QgZXf6lGffrz+2lSilvHDr5biU6EHYDAOs8YXf
	 Z+U37p2PbJzItXfmoBAAPqsw6fG0lRPbce5g0dGx1oQcPFQTi2vfvywgFA/s+2a3Fz
	 8KYl//Ii6CG+2rpO4FENrMc0T16NZIaV1AT9x3h1zE29ark6UtY41THtnx4h6G7McT
	 N48S96XoIrQcA==
X-Pm-Submission-Id: 4c9mNd0XdGz2ScX6
Date: Mon, 25 Aug 2025 22:55:42 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com,
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	dakr@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: phy: use to_result for error handling
Message-ID: <aKzp7sv-73BZGUqT@archiso>
References: <20250821091235.800-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821091235.800-1-work@onurozkan.dev>

On Thu, Aug 21, 2025 at 12:12:35PM +0300, Onur Özkan wrote:
> Simplifies error handling by replacing the manual check
> of the return value with the `to_result` helper.
> 
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  rust/kernel/net/phy.rs | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 7de5cc7a0eee..c895582cd624 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -196,11 +196,8 @@ pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
>          // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>          // So it's just an FFI call.
>          let ret = unsafe { bindings::phy_read_paged(phydev, page.into(), regnum.into()) };
> -        if ret < 0 {
> -            Err(Error::from_errno(ret))
> -        } else {
> -            Ok(ret as u16)
> -        }
> +
> +        to_result(ret).map(|()| ret as u16)
>      }
> 
>      /// Resolves the advertisements into PHY settings.
> --
> 2.50.0

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
