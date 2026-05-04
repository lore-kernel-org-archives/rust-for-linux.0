Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E659136F411;
	Mon,  4 May 2026 22:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777932497; cv=none; b=hVIL9eoZHqrYSPwSJpbR4s695xh612iDf0zBaaVoPGZ2mRY9H/ygHR2dAN1K5/6et899BqbGYwI5+UxZKzx4M7OjfH69DVEXWon5Rcw1bQ27ehNUUYWjFH8XI8Zsm8/tvHA4Y6PTd8nT/F6SfgYty/VB1qoAkZ4IiQ9mIpydpX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777932497; c=relaxed/simple;
	bh=JAp1PD9hAFnwcWU7QdQnSmYsLaDqpYHj8L7amGDwA2Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AOxLYOWqbX9cQbLLuOqkIqNyz109UqSJdF/xdQK+T7MOYIfyciUmBbsYX6HRu7gX7xJ5ioM0Fd++T24XR/WKwjKtdlR0E6oyAtfvCT/Q3nhWMaQIQoZhi/MdIjpUjv8uBNzaXfcKQZznC+9YRrHaFMA0Dh+qMObcKOxTceJl6tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLvfiRXB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLvfiRXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA12BC2BCB8;
	Mon,  4 May 2026 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777932496;
	bh=JAp1PD9hAFnwcWU7QdQnSmYsLaDqpYHj8L7amGDwA2Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=XLvfiRXBUdG2Xsjb5Sq9m5xzsAb5Bd+5iV7JKEMowRLxiklz1kaA/Ow6HU1PPhrqA
	 +JPIFLUydbn9lYmnmPNHOnlp6h0z0sI07uDUophCWpOIrclOS0RTObqk1ufRFSKWIT
	 IL1Ko6xSynO5AiDyPcXQEsznHjmthgvjPUcbtTbPPNfI57UJytGguNAKP09o+Hyh2q
	 25TcHaMb5J1WmuInNcB0vW1jtpqTRTh7iBfS02wrsOrXHhCgj0r0mcBhmIWEcDfXPV
	 /dWCZSinY+YKMG+eNtRhuNu7UpzCmZ9uC/u1UJ2uPvrOWahNtxXRJ7+7S9EyNHstYM
	 yhWlWauiQxZ0w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 00:08:12 +0200
Message-Id: <DIA8GVDGR2IK.26SX1558D0KRP@kernel.org>
Subject: Re: [PATCH] rust: io: convert `PhysAddr` type alias to newtype
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Robin Murphy" <robin.murphy@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Albab Hasan" <albabhasan276@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260504045714.59248-1-albabhasan276@gmail.com>
In-Reply-To: <20260504045714.59248-1-albabhasan276@gmail.com>

Hi Albab,

On Mon May 4, 2026 at 6:57 AM CEST, Albab Hasan wrote:
> Makes `PhysAddr` a newtype wrapper around `bindings::phys_addr_t`.
> This restricts what operations are possible with physical address
> values, helping prevent mistakes such as mixing them with other
> integer quantities.
>
> Arithmetic operations are intentionally not provided; none of the
> current users perform address arithmetic in Rust.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1204
> Signed-off-by: Albab Hasan <albabhasan276@gmail.com>

Thanks for the patch; a similar patch [1] has already been submitted slight=
ly
before this one.

May I suggest picking up another issue and / or help reviewing the other pa=
tch
in [1]?

Thanks,
Danilo

[1] https://lore.kernel.org/driver-core/20260503103050.200526-1-x@2005.tr/
