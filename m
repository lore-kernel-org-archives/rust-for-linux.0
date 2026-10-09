Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF983EC819
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578017; cv=none; b=iwajSx2YYyZ68PgoksITEOBIFpP8Xdl1qiQzApcgV4Nv05knCyevv5h0MtXQ9cpJpZ4zmYLOy8IqrztoQ/07bC2ksqRf2opkxugEoAXropspjYQ1dUw0qSVM3ePsz1fRqGJc6X2s1UG0D6kyxmD3UcgaK8VvOAzEHaCp3nBd89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578017; c=relaxed/simple;
	bh=Jgl8x4oG7VcVg8oX2oG9YYc+UjFCaVf6aOm1IJKryiw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qJJSoibjm4P9i/eUtI+V50emmWk+zZf59GiWJ1TPycNPVjbLFmG9++Xvo1tuoQ7SncWfG8IQr7nNvDAW0QwA4ypiLhZ8ZxV6Xbxp74ZC08UdknwMgNEnOuNlozw8QEzGS4hYploBC+M6v3z07NkEF60swiFIpugta55zVVhHHGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFw3syuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFw3syuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BE21F00893;
	Fri,  9 Oct 2026 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791578015;
	bh=hQqeXp3qsBRnDPDWlxCQlzHFMi7SSUOn970Opi3DAMM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hFw3syuhl/ZvLlrBefOqRFv+gT7mY7vrU2eagf6DfoxIIJg2fhsG0uylSinUPlGsQ
	 sPVcgZmDplVCnClXePn3G7S1V0NrNsVdyzXn31IfYbwdCB6P27DjyxkO/tvUucH4FX
	 xncYD+SB0/ljqF1jALgIw8BEZY6OZTisdtwnQiZyHWTFkEaXrWOxGURaulp2a4N4Jm
	 rCamh7XegIq/+iPLHLH0hO/HM6RU6yKpH/Xilu2cEyAjj/R+BgmUBCkKX1WXGBsAaH
	 3uG1kFXBWs5GFCpAjM0+3qdDWcKQ3lXGDTYlwonEpqHRp8P68PhZ5OZjxvFm3dE1OZ
	 8Ot84WdMqxL+A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, Gary Guo <gary@garyguo.net>
Cc: Breno Leitao <leitao@debian.org>, boqun@kernel.org,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu,
 dzueck@uci.edu, ojeda@kernel.org
Subject: Re: [PATCH 0/1] rust: configfs: Fix reference creation from
 uninitialized data in `Attribute::show`
In-Reply-To: <CAPPBnEZBeB2cZ7_2Syt_Vy0HcXWrRF6j-M1HmZQwKkwG=1nz-Q@mail.gmail.com>
References: <cUqSvTsTaMYu_TRrAABCYTNz0HZf5JeFdIq_Vv4e_-GFMgI5NwVfZJDcy8CTgc4fH_1OoiiMg2I2LIzQX1y3Rg==@protonmail.internalid>
 <cover.1790981219.git.pgovind2@uci.edu> <87v77bcg0m.fsf@kernel.org>
 <87se2fca48.fsf@kernel.org> <DM0BMX11TPKW.3SXBKY2XRLHQJ@garyguo.net>
 <f-SD-RJDAM9vxqOj3MupDr-geggiu7qcKsYBwlTK02DS6siKkRU643dmvGb-ihkpH5LKF6zW1DH2KHAmzXjvNg==@protonmail.internalid>
 <CAPPBnEZBeB2cZ7_2Syt_Vy0HcXWrRF6j-M1HmZQwKkwG=1nz-Q@mail.gmail.com>
Date: Fri, 09 Oct 2026 22:17:18 +0200
Message-ID: <87pkxid3xt.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Priya Bala Govindasamy" <pgovind2@uci.edu> writes:

> Hi Gary,
>
> `Attribute::show` creates an `&mut [u8; PAGE_SIZE]` over a page that may be only partially initialized. Rust's array
> documentation requires all elements of an array to be initialized [1]. So this doesn't meet the documented requirements.
> Moreover, `AttributeOperations::show` is a safe trait method and could be implemented to read any bytes from that array
> without using `unsafe`. Reading an uninitialized byte would be undefined behavior. 
>
> [1] https://doc.rust-lang.org/reference/types/array.html

This was HTML, so the list will drop it.


Best regards,
Andreas Hindborg



