Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA2921B9C8;
	Sat, 30 Aug 2025 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756560844; cv=none; b=MQEisxCLbEJSwWkajfTOA/kvNr3tEQYb9LRoN+vVszGHajrclD/VcG54P9E8CZpQ4cl74gjZkTEpWYYeKKP+wZD/OOyznmgCrO5awC58khs6QLPK1ueL+ABInMwv7DWABe4ZALZJvccgmktkDLitt8chl/t6VHNSb1iiu56sqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756560844; c=relaxed/simple;
	bh=m857ziJYDS2LJdBLINqALQpeUC4ykDhVYy99RgzudSI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=qBBAA4dIL6r8qgyQcesNetkq3JqHFcY1Hf21amprC4A+/W4HYIQfN07LBKzf6+NFUi2qSyCH1X8Q2lUFoEedwxS3Z0Rf8duQM63RRDzBRXoUOCAQoQelaTrzR+u2y78G/6oOwKcHIhUpwqCRgUJO8rPvzfaRynmYLi/iMfrSWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlYdsF9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlYdsF9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AF6C4CEEB;
	Sat, 30 Aug 2025 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756560841;
	bh=m857ziJYDS2LJdBLINqALQpeUC4ykDhVYy99RgzudSI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=UlYdsF9mA9Kovwgnj5ra/ZO8rvwlsVeNX2R98cCuvJXYbYZrmzR2XxBTkS7/uQqVS
	 w2Dis984jHWuGNaXdIao/w2QimFOOKXoAQZaI2cxSlotBsvy3dccDMGe885jx13rp9
	 NjcFHIlGU1I5OGo6eH9RLhCd1nb7Ajjq+81tPsMYpRXQLo8Nn31eyYls7jSg9xS2Tz
	 CmpCdMEBeRwY21fP23UEJ1NOWEvaA1Lrqrh0njoJKbQIOBaUIK2+VrVPb+6TySsevb
	 nLM81CI7gUTeIyGX1zttO/MiFx0ckRXwt1iruL1vn6iWjz8ELr6tulennD9Msk2eoo
	 hUl92uJHL8xVw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 Aug 2025 15:33:52 +0200
Message-Id: <DCFSUIIRQD8M.35F6RIYV86514@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: regulator: remove Regulator<Dynamic>
References: <20250829-regulator-remove-dynamic-v1-0-deb59205e8e9@collabora.com> <20250829-regulator-remove-dynamic-v1-1-deb59205e8e9@collabora.com>
In-Reply-To: <20250829-regulator-remove-dynamic-v1-1-deb59205e8e9@collabora.com>

On Fri Aug 29, 2025 at 11:11 PM CEST, Daniel Almeida wrote:
> After some experimenting and further discussion, it is starting to look
> like Regulator<Dynamic> might be a footgun. It turns out that one can
> get the same behavior by correctly using just Regulator<Enabled> and
> Regulator<Disabled>, so there is no need to directly expose the manual
> refcounting ability of Regulator<Dynamic> to clients.
>
> Remove it while we do not have any other users.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
