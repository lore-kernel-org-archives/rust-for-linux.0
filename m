Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B051624E9
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503161; cv=none; b=p2Z6Ksx/X3aXF8aNBWDhAddZDg28tCfxBcdmsPgVzdMuHoG8AYxwOnm0mVO60LuOZhpvOe0G5Z6rf6hGHK0Qd2goqfpx6EAXn0URe9VFtyMCt1aZy/IIbBLzlwQA1BSOvfyHE5n1KZ529dvwtfFhqRHSXLMlAJ2jm4ngdES29oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503161; c=relaxed/simple;
	bh=AhueexCdZ3Pnze7a50gF2kNn9MUioyCZjLhbZqAGLEI=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEh6mNrDp0LIK1JtWHgpDY8oqbcJbfspdRnfOI+QLN5OuAGVfrqRMAWMQ5Uc0yN6bFiMCZF3G2w0OQjg1h9+BbLLUQF6eauhZD2NbNlfLFcox4piDv7IfBWy5raLjNpKkwq479o60dDlTrOe2C++WF2vfoCKjw9hdgTN5mrnmEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/xsMUwl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/xsMUwl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A3C4CEE3;
	Thu, 24 Apr 2025 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503160;
	bh=AhueexCdZ3Pnze7a50gF2kNn9MUioyCZjLhbZqAGLEI=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=C/xsMUwlJPq8xM76WrJpbBduJIdrXNtcyvGMe4Rcpz9UrmMM0hKlYdGXOAoozWpBk
	 gqxmgy8nF40dtloMQQtjDQuMv3Rk6e+TlUylIWwMnq8+HP4iHLCsRffntZuT/YtPW/
	 /lL9E8Kym15UcgbceYFMpPn2ui0XsSzjFfI4GkEZtTvHOcpzHhpRyQ1j6R060wwPgO
	 moOGnHGDxtIvOQASzAO1XdD6og8ZagXc5QkXVqmtFz43wOXtH7OAGzHldJwBF10j6u
	 aT5x6qOZqZJyHjtuKi1in/TedaigGpm0qMR2hBiCFlvMACoKoT8T6G2tZMgk54GZaR
	 k7IknCfeCAxPA==
Message-ID: <21445861-fcf1-4ae3-8c18-d3842712bb5f@kernel.org>
Date: Thu, 24 Apr 2025 15:59:15 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] DRM Rust abstractions
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 alyssa@rosenzweig.io, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20250410235546.43736-1-dakr@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250410235546.43736-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 1:55 AM, Danilo Krummrich wrote:
> This is the series for the initial DRM Rust abstractions, including DRM device /
> driver, IOCTL, File and GEM object abstractions.

With the changes requested by Alyssa and Lyude, applied to nova-next, thanks!
