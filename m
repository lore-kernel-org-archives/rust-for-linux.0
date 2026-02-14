Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF4285404
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771065242; cv=none; b=ls5NszjsEZ4QCZZ8AXoncP35rX8r95eL6lynAdQ4CiLX9pw9TkvEokJWzM+lFot0e8pOxuFs+u3wAnKWKJuHHbcvT/pRySGNMYEtSfU4M+e700xHlQpCGifm7y4FMYTIltOCf8y3eInNIO2fxlH2aqJm3Tu6L/J0E6Qv1mQ8Vr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771065242; c=relaxed/simple;
	bh=nBjqt8CDDd1Z2ZOdBpErijWDXZdhyjIPYWURz/MeZ0E=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=K0EmV8EUZG9XMjwcxnSncam6EeLY3yHH7idt57F2+C0wGi/YD+puM3tG87i+KAj6lVIxxCLbCG5nmJ+kq3d75hutR36j248tkF6mEjug2WwoMMU+x4XYQOMdsSMqFBee18WvU9NxUX1JGifkP3PFgyJdHyzNnDZqfypqScVfiu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjaPPNOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjaPPNOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30F2C16AAE;
	Sat, 14 Feb 2026 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771065242;
	bh=nBjqt8CDDd1Z2ZOdBpErijWDXZdhyjIPYWURz/MeZ0E=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=BjaPPNOC3jskfX59W/uEVyz0aRDrMs0hjHaPZbu/MuPWXLA0/Tm8CTH0mQfshit12
	 ZXo0eaAuKwb555SZWszqIJpVQCWW2BxD+cZ45vlEJrgV1V3aTrW6exJl3mCnl4meXD
	 84XsmOZXDUfdJRyWryN9v8iU/gjcIopkQ8HLxmFd2qcXd5w3IiCMPdQaiq2DqOm87z
	 aKrOqOMorRTOyCW9hX2/MYvMc05kiXL8yAnJifDadNL8/DgnLf8z0TWczckLj+63YW
	 0zKN/fbP6HHRQSXI6cy0lXy7dToRLRUaKgEhmzfqIHTK0l7A/XpuAaNtkKggzHxQT5
	 /cXnON6dpykbA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:33:58 +0100
Message-Id: <DGEM8AITP519.149B3IVELY7HA@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-1-gary@garyguo.net>

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>   rust: dma: generalize `dma_{read,write}` macro
>   gpu: nova-core: convert to use new `dma_write!` syntax
>   rust: dma: remove old dma_{read,write} macro compatibility syntax

As we treat soundness holes as bugs, I think it is easier to just squash th=
ose
into a single commit and stick a Fixes: tag on it.

>   rust: add projection infrastructure

Miguel: If you don't mind I would like to take this one through the driver-=
core
tree as well, as it is not only the base for this fix, but also the base fo=
r the
upcoming I/O infrastructure work.

Thanks,
Danilo
