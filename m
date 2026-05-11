Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A1313551;
	Mon, 11 May 2026 05:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778475630; cv=none; b=soRzHucsoae7KtVwgrZBAAmRSJBRgR3tUmV5GsDRn7A87vtRIcVAiG+Cyzu0Yf/6x8ybGU4eglRrJZ4tjc5zs/LOYDkzlgVgiXkZ3kxNaoXDO2bSyZr8dePXGZRZd3fGa5vlK8s+yFabO1NAvwsgxtLGvg71+Hy+H3ic8G57LQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778475630; c=relaxed/simple;
	bh=LAD/KXi2+vG4ePR/f7zmhnFdNVqCt8JAeOd9AVo1I0E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=haekdS91litcFW0fU7R+FmRBgxIif/hdOmMQYJoU7ssGNq04CWyzqymwhzTgKwesF4951WNsQWmFl36+BaGRkiP/l/y/5abjMai/AUzXWZn3UtGMEGakFh4Pmo7iFIejBVAVgRkQADeYiACq2xdlXMHe8v1GYl9fW3XZDhscmes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuLGpX9l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuLGpX9l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC536C2BCF5;
	Mon, 11 May 2026 05:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778475630;
	bh=LAD/KXi2+vG4ePR/f7zmhnFdNVqCt8JAeOd9AVo1I0E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WuLGpX9lYgw5cbFgnZChJNMTcnIEavHcB6SK+6JLzTxAx4xmLpMcQvPXjIaJydMlL
	 6Kj02rb7a8WqZXtlyNLWVxcPp0tcWAwtVs9g1+1B6iva0hCoYxgYkrJTwCms0STCUA
	 n3AI856Pterkiele61msKIcd8s10kwZ3q3Y0MBM7L1dLi0zCoQGZ3UnD1mvUxaZwVA
	 ubISbLEgq5b6BWEA4++nt8izedFDkijYhFuPaUL3Ngad2NMcGOx7mQGk91pE/RBO+5
	 diEqu8WFmTvacp8vvfLkbB8mou/ojGscbWUmhGQMK3QWyNX5rWSUQgaeJBRuKJcc1g
	 5sM7x2+bLkqMA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>, Malte Wechter
 <maltewechter@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang
 <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust-analyzer: update generate_rust_analyzer to pass
 cfg to macros crate
In-Reply-To: <87cxz56mge.fsf@t14s.mail-host-address-is-not-set>
References: <20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com>
 <tZVMtGYsm0cBcaJI0F5LiCIFXdKzw0Q7P6i8r4QQD3w9qOXUtzERcMCmufStTD8eP-3QZqdVRkv4WO6RALToRg==@protonmail.internalid>
 <CAJ-ks9=Cr1Mn1EXsWqG+KE-Y2Ed0a21PMfERjNr+M1wdgNaqjw@mail.gmail.com>
 <87cxz56mge.fsf@t14s.mail-host-address-is-not-set>
Date: Mon, 11 May 2026 07:00:20 +0200
Message-ID: <87jyta5ymz.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

<cut>

>> Directionally I think this patch is incorrect because the macros crate
>> is a host-side crate and generated_cfg is for target-side cfgs.
>
> We might want to differentiate macro implementations based on kernel
> configuration, or as in our case, skip compilation of certain macros
> when they are not used in the kernel build.

Also, the `macros` crate is actually built with these configuration
attributes applied. It is only logical that the `rust-analyzer`
configuration reflect how we build the crate.


Best regards,
Andreas Hindborg


