Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702388;
	b=4wlMnONKr8jlOadjK5M2QKRSeHN5UUBexME6d5UpmF/D+yfzVqr6TOI7/2USRN6VSDuQ
	 TNGpMIaHn5hOt+KWO69xpafpia4MBjFw7WdS23v6Mj74fSXcNpRu2Kp4TvQR5H57FDi2b
	 NlbXXUPVBdcdDfWYsz8Datn8Ige/nIFhTEu4s3oao5I1sOegWasw7TT8yV62XNDSQquIJ
	 Kmxq7wN22wUoYJBDvHvmFUBwmy2Tpe075f17H52MOnYrOVRMy1VtpXJwLEJZTcxS5JBeZ
	 xv505Sp1w6hYOacbAgcuviLXr8wu91EGo+MN0JRFSg0k5AkgHS2hZ5l5mWQnP5R92rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702388;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=qUG89dvLaBk1TG3sxEMp3eqYVlR2BIAXGHYXj4BkbEU=;
	b=0nCGlZRAGWBXnoG7HfgPVZOgEiKuO3rtG2XITUWWVPZHNuzTK0Oo5OMciiPrEtB3PJ1g
	 ZZvrZXVBu5DiVMMhKZQ8tZMjKqAPcQIzMR5liBJEsl+nz4u6XuzA3LE7RZgLH6Ao6gzyj
	 CUdi+bNJjO2wa528tfJZ8h2te2yOuKJlK1fSYwZns0h/Bvx5p6beMiP7xJT/ADxyOoAQV
	 e4Gu0prwusPo0tmvH1SShih9NtGexMvFIi8YTGKVirvAYTe+/x4aqpCUFP9PHmn7g/CV1
	 9+PiQjd6KRjgsNq7MTTQcEAm+u3hzTgE0mdGL6QDF9yTqRKI8+kLRfdCRyNAL8dyOMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="akh4/0Y9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048D606A33B
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akh4/0Y9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4936A1F000EE;
	Thu, 26 Nov 2026 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702388;
	bh=qUG89dvLaBk1TG3sxEMp3eqYVlR2BIAXGHYXj4BkbEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=akh4/0Y9iqeflmz6EK431H9+A5q4955svGfheN38kytZ4RM5vDt2MF7dNRaeZAsG8
	 Wb90c1zSICD447tVKwF1nKmrt/QP7AJjtJ5g3rrqScWe4M4aPh/eiI4nU+cJP5ALlJ
	 FTpRWhYDTnHirUJmw46LHm0Wp0YWIzCVy9qY7iDzECc8W/DnDwcf2Zhzvv1GgHfq0J
	 lABVsvHbFJzbVLcBzZtLTb7o7WH/QT/rdOwY0dQx7WIqS8WPK0IKJAFejktQdGMvm2
	 ZuBImDXkNIxd9dkxQp6HGIxTlUQunhhiJhC6d3yFHG2Yo+iHC99OrO38FSp/5z4eDV
	 rsgFeWgiraJ7Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: ojeda@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net, 
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20261118035723.2380960-1-tomo@flapping.org>
References: <20261118035723.2380960-1-tomo@flapping.org>
Subject: Re: [PATCH v1 0/2] rust: time: add examples and tests for Delta
Message-Id: <179570237813.3865922.15552574552091490033.b4-ty@b4>
Date: Thu, 26 Nov 2026 15:12:58 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Wed, 18 Nov 2026 12:57:21 +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This adds the examples and tests for Delta that I promised in the
> as_micros_ceil() fix thread [1].
> 
> As agreed in that thread [2], the examples show positive and negative
> values and how the methods saturate or round, without the boundary
> values. The boundary values are tested with KUnit instead, using
> constants in the test module.
> 
> [...]

Applied, thanks!

[1/2] rust: time: add examples to Delta methods
      commit: 6af68dafac111b0863d5fd5111f11c795330a70b
[2/2] rust: time: add KUnit tests for Delta boundaries
      commit: 091dbd126927babfbbb9e4561597289e45089bea

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


