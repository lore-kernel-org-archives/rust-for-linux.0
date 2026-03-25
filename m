Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2C3BE16E;
	Wed, 25 Mar 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452556; cv=none; b=prI/QeQvJ4psssR6/FpC+RLIS9+QNMZ6kyZBWQwFVoKcv21jR7m4LwhpnNCFLQrkaa4GnNYCvfMHdEBuUxtfkTKNzfyKCj7aJhMyLvzuZR/Dm2dPArLvEhdBJCuC9492EraIS+3TkLbJhN79OIMSSclEePdPSOHFDHiHWAr0RGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452556; c=relaxed/simple;
	bh=ve484g6dhU6LsXDCI6VZ7yBM4n/tMB36iL4yP8A2D0s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=mpd2LEQ/ZwY9YemkSfV8pphtPNNS0BkB6/JAvBl1/bRM3R9iWYTQebrJY6JeShVuU63VxIqtXFh9ZqnjciTuTfeOMAuHS7NWZHweFbr9qQXSgRFzsYPwxP0sk4qIcOcZCp1/J1YO2d8A8+FWpZee0AVueVwnkIJeUPMtZ5h0Qsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE56E6lo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE56E6lo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04700C4CEF7;
	Wed, 25 Mar 2026 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774452555;
	bh=ve484g6dhU6LsXDCI6VZ7yBM4n/tMB36iL4yP8A2D0s=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=CE56E6loNMk07p2pIo/KFBFXdLK7aLCavWvHg9HBfvujaMMnae3Fxoa20xfn9YdwU
	 usBmNKpc4cM6eTEny//HrUwqRE7FNT4MARb/4Z/M+rcRz+u3Jpg0imLlZVvn2uDUsf
	 My9T5r8e/dVoUgRl1fzRF9ZIPQlho4/DGuXAIX5ba9pnHCxxw0TFqAFLuGK9Z/kJqJ
	 ebxTSEPH18Wl0aOJ3gNninkjH1TID1fC+vDespE1IRQO3ilQ9NwetKz5TjZlm/bC3E
	 3MTRoNUCyl7Rj4oYWAADDbCKhWy+rleMu1d4Wd9wu5aL5qgFhyOrIOSGdEPrUf0fwE
	 iTR6klody3xWA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 16:29:10 +0100
Message-Id: <DHBYXK293S8Q.2WY85QMCODSYM@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] rust: Mark all from() for Error functions inline
Cc: <alistair23@gmail.com>, <gary@garyguo.net>, <ljs@kernel.org>,
 <vbabka@kernel.org>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alistair Francis"
 <alistair.francis@wdc.com>
References: <20260325005118.168814-1-alistair.francis@wdc.com>
 <CANiq72nEaqGwnRO6SPJ7Ky85+X-U3ckYa4Z5cg=Uoqi9fwHBMg@mail.gmail.com>
In-Reply-To: <CANiq72nEaqGwnRO6SPJ7Ky85+X-U3ckYa4Z5cg=Uoqi9fwHBMg@mail.gmail.com>

On Wed Mar 25, 2026 at 2:19 AM CET, Miguel Ojeda wrote:
>>  rust/kernel/alloc/kvec/errors.rs | 3 +++
>
> Thanks for Cc'ing the maintainers on this -- now the maintainers may
> give their Acked-by's! :)

Acked-by: Danilo Krummrich <dakr@kernel.org>
