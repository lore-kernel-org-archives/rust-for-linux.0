Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E3B38FA3;
	Sun, 15 Feb 2026 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771189613; cv=none; b=FiPDlMq1frBfnu6dEc535stkDqBpL6rac+bog+DFaG4F3XsFFnVE/bz1oDjxlUsQ99ix4e92VQXyLLsnsrhDazVsupbe/aoHubAIImgQrOeyH/I73qyyZELzbLXbCCFWmMIBsXnNCj6FLEVJ/fxMd2HtsoIQNz9W680DtDEnXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771189613; c=relaxed/simple;
	bh=w4EpE5lCs+H/okltLzWBqHcPV4Z64jvOatzZAEsyzdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MfsiFWQ5SrtGe0S8j4MnVN7jHZtotzP99GKK+P0IsXMleAS9fGX3ArFMaiRAYbwqp664UlPOt0A/j1MzX14+v758u4XmDwPwAtBdhfEChdILU5yMEzj/tMzbg/b5iPblGMJWUPzcXQvOhZ9PLDHHZOw8y4kIUfohcZ+fMRANJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO5fDpL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO5fDpL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15100C4CEF7;
	Sun, 15 Feb 2026 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771189613;
	bh=w4EpE5lCs+H/okltLzWBqHcPV4Z64jvOatzZAEsyzdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mO5fDpL3pXDbtJErLvtLBGB9UCi2ExsawIPCVZ765ZZNe0RD+xSmB1Iv0WG74m+tP
	 qBB1iUjGmgQfIYivfhcOaxrfjWWZYhLOMsq9S1rty5iQ4WkhjflQNTt/EdjNS5gEGG
	 M+LXBH8JLv8geQImB/nEGgBLLepT7AHALq/xG60NRvnlWY3GWRJ1oe3EUgDvZGhYWb
	 aNBlbnYdv1oMMdnCa+pHUsviM16tR96TBdnkTntALzewbuMf2JiQN4upXHusIm3kZY
	 0ldS/yoOMHNDwqOuIx8BSH/cNZFhJ9WWdhr5rkE7BcqECzpg74hK66AtFNhKzt5xRy
	 8UA+Ul370xqKA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: add a few helpers
In-Reply-To: <CANiq72kH7TforZTt6kjFKKjpgg_SmT7Yxur1UP_wcZ_x-c2dGA@mail.gmail.com>
References: <20260215-cpu-helpers-v1-0-fab13d817a5e@kernel.org>
 <rdw-HxT31TkCvWozAd1QSiHy1lZpTpXgVZOdtkq3imVq5JqxY0p_VXdH_zUsavPAhENtvEPYheNsi8o0OYWRGQ==@protonmail.internalid>
 <CANiq72kH7TforZTt6kjFKKjpgg_SmT7Yxur1UP_wcZ_x-c2dGA@mail.gmail.com>
Date: Sun, 15 Feb 2026 22:06:45 +0100
Message-ID: <87o6lpemxm.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Sun, Feb 15, 2026 at 9:10=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>>  rust/kernel/lib.rs      | 17 +++++++++++++++++
>
> Please avoid adding things to the root of the crate.

Ok, I'll move them.

>
> Also, for both patches, please mention for what it will be used for.

The are for rust null block. I have sent a few today already without
this mention. I can send a follow up email for each with the details.

Best regards,
Andreas Hindborg




