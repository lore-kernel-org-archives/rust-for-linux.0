Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDF27FB12
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 20:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520883; cv=none; b=iqBMim22fzc8FOnFcM2ImhP9qAPwy8pk3ZWjNUzNGie7+m819oojZDVqs2fvAZuOuqLDOIUxJ/vJbdgyFC9ftYi4A5ntwceVy/jseIMiQ1kO8ExM4+3h7D9yhLR+Z6CAxrWomEplDafjchDfdnsGIqb9QedSBUe8GmOOS7g6yYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520883; c=relaxed/simple;
	bh=BFoe3qwSO5/LtZB38ddmdLG5E8N8Ou44J43PJvOGLf8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=eNe4zWgiVRquekeD9kUG9H7xxhclxSItCnupE27ZfeVYBJYj7aV1mPAa6cTZ6jrv7WF1tNBDJH5OyuGD6Cjm3FBANqN+UXG7tid9pbvgQx9C2dyatK8y6Yda8Xyc8QeiEKNP1V7/Dp12XfH6r3BBMF2sfQUpTB/nfAq+VQ0LOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB1WAA6m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB1WAA6m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE67CC113D0;
	Tue, 23 Dec 2025 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766520882;
	bh=BFoe3qwSO5/LtZB38ddmdLG5E8N8Ou44J43PJvOGLf8=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=gB1WAA6mePkebO58lXjWgZf7OZvMqTVoouvjEjuTr94w1nZFBEiYu0CjeB2W0QfI4
	 u5Cth0H7N27eWO/B58KD6Tg+RXEknemwSAXdXYMbusH3AgZPBsRXlSPqeGB8Zl344t
	 i9WiDBJN1x6LFHAGrwKTpveVI2yshooUh0q1GHeqJ4QtmYxmreJOGQmrMqSOsnGUWj
	 KTepx/1z+/lmFG4X0nDXqon1QtrQ5b6sv1yAiityuT99W+elArffluhSrOiXFXq3Wt
	 EL6abL/VtNoH9GLBjJhnemHLhGcA6CmpeVe/P8o32E0BXRf3zzqTFR19o+jpWWNdg7
	 OXfWKGp2Uyo2Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 21:14:40 +0100
Message-Id: <DF5VE17B8HTA.1XSONUJ4XOFCY@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8] rust: Return Option from page_align and ensure no
 usize overflow
Cc: <acourbot@nvidia.com>, "Brendan Shephard" <bshephar@bne-home.net>,
 <miguel.ojeda.sandonis@gmail.com>, <daniel.almeida@collabora.com>,
 <rust-for-linux@vger.kernel.org>
To: <aliceryhl@google.com>
References: <20251223055647.9761-1-bshephar@bne-home.net>
In-Reply-To: <20251223055647.9761-1-bshephar@bne-home.net>

On Tue Dec 23, 2025 at 6:56 AM CET, Brendan Shephard wrote:
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Alice, unless you have any concerns I'd take this through the drm-rust tree=
, so
I can pick up the corresponding nova-drm patch as well.
