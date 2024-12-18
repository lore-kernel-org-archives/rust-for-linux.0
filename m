Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B16176FB6
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515629; cv=none; b=lDPpnCAdhVeOCqTqZPNaQqM5lzl+1hjf96fEcJN5jQOgPgLUHbNtOK7ZRI7mVGrpOZa6VbUpNvm0gNS73ADIzn5/+cYrk5lD0Xna4852OlEA4wDd0VAG4hHgIxzEzq4oxiRtkbfc7TMpQDARGKlBQ7YqjjFDyrAh6Mu3P8yzQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515629; c=relaxed/simple;
	bh=zY95k2nZgJSeHsipVQ1KUTqvikt091VTMlxLR0oMw38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=livL80Sz/Qaib8sl5UDQUDiDxKtkChBN1uHh8oGeJyrFz7PHji1cz3FV9BU9lg6wQ6IlE/picxDHXdLJCooc2WFDOLmUTW+v/mcblTQGbi/3IeFvbF2fPimv/WXGR8w/tcKepSu5KoqG5avQBDedWq7RR2SmjMyePlh3muPjNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qxu6JC5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qxu6JC5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32F8C4CED4;
	Wed, 18 Dec 2024 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734515628;
	bh=zY95k2nZgJSeHsipVQ1KUTqvikt091VTMlxLR0oMw38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qxu6JC5wEFOYmIwc8ESIVEBIAy3wqBhpEn5qPpTJVZ8TkbbFYQfq+vv0++N+TopTw
	 DGNnUVhmQoOgBAm4RGrdEqiAM7JAoua38TIPCAkBTh1kalCkc3aR1goqj06Rqy0Ngq
	 Jpl8I6O8KFOtPgHaKX16cDqTGB2o3dZwI71gHSelxD/4KQGMJpc1akA/ce+V4rjL0z
	 KKD+che6ay+afTL+A0RtpJYOjWdqf6MFV11t0rFN+Tj7j28EHic4z5ZNFQDL2gKHUZ
	 K/sDKAz/fu5AkmfbxxJ9TPkaKI8XZEwo5j/FQko8vByCIg5UVwFe+YvPcsxd3IdTtz
	 vN3yNriKHxfyA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Yutaro Ohno" <yutaro.ono.418@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Jens Axboe" <axboe@kernel.dk>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
In-Reply-To: <CANiq72kyRUsUfP63PHupCCAKCFvSWdrdKo8sLcbhiM0aBBntvw@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 17 Dec 2024 23:31:03 +0100")
References: <ZxkcU5yTFCagg_lX@ohnotp>
	<CANiq72n_UpZVgcs2=bBGPX9NYbpmGA6TQgREYk+2qAD_8ksV3Q@mail.gmail.com>
	<ujywuntvO1EIAL14X7aEbK02tGSEvbhdxg8LY20YO299XWxzcLMQbwk0CMCTl09raiLLu8bzWrUN4Nh43YRLJw==@protonmail.internalid>
	<CANiq72kyRUsUfP63PHupCCAKCFvSWdrdKo8sLcbhiM0aBBntvw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:48:42 +0100
Message-ID: <878qsdmidh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Oct 24, 2024 at 4:02=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> Andreas: happy to apply this through `rust-next` if needed.
>
> Ping -- do you want me to take it?

Sure, go ahead =F0=9F=91=8D


Best regards,
Andreas Hindborg



