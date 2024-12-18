Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE08178368;
	Wed, 18 Dec 2024 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515131; cv=none; b=oZEu5H94KMYjFDC5n+2CKpg3eptue79BVkNmThyifrvaVt4Kgm3+AS+mU1rQrSUjTRvNuyzT1ApyScUn08uq1GFQhfryjyY05QqXm1tXY5NGDU0w4MAvOxym6gf8Tor6ocXAYpQ1cm2szo7fSLF8ENrmDho9F++XDwAYRkF+xjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515131; c=relaxed/simple;
	bh=ngz/rGVS6rP5QQEuI9115IDXzsx0KfhUPltQdUs0Yvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EIMzLUDX4IU7gFi9b7PTgG8X/YfHYWpSMnVe7qKz5Ru4UJDETUc44/cn2YRrUdI7u5QBj9rKwwdXU44G/S/An4p6QSmImI4OVCPwL244qsajtmizMkcBRkiWjR3W2xoX7PyTnqgAVzovmkZi+uqTmt65/U1Dy7JgY5ILlu/gCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AILJlMTf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AILJlMTf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07E4C4CECE;
	Wed, 18 Dec 2024 09:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734515131;
	bh=ngz/rGVS6rP5QQEuI9115IDXzsx0KfhUPltQdUs0Yvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AILJlMTfyZHMUY2A7Ny8R1htseOE6yO2I3utY51dbhGgrntpiTTONPyV1BjIlG89R
	 w5q5uYeNniD6/+bXapP6h7/YjscKjcdwaX1q8vgVE0IeFyIlVngXBBsqh3qTOXRnJJ
	 3gm/SY0qtfGsAfXRTX7xB5SWawga/tQP0LKGPDHRG+FJSyeQOuhjzKjaxWsVN67d+p
	 AVv/t7GU3dSxTMyQwEQIre//LW7xqiJ2KSzG0OodxtSfMNQ4mahobflPW0WG4D2ojm
	 8D11F7RypTVON3KsUdhts01DmP1+enFmQ04DJBKQfCnUSEe8hepW/HWf9clVIR37k8
	 1zjls4kmjly5Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "Alistair Francis" <alistair@alistair23.me>,
  <linux-kernel@vger.kernel.org>,  <benno.lossin@proton.me>,
  <boqun.feng@gmail.com>,  <me@kloenk.dev>,  <alex.gaynor@gmail.com>,
  <gary@garyguo.net>,  <aliceryhl@google.com>,  <alistair.francis@wdc.com>,
  <bjorn3_gh@protonmail.com>,  <tmgross@umich.edu>,
  <rust-for-linux@vger.kernel.org>,  <ojeda@kernel.org>
Subject: Re: [PATCH v4 00/11] rust: bindings: Auto-generate inline static
 functions
In-Reply-To: <CAKmqyKN7dP=UFjP0c88wq_FMgaFzPU+5GRDz=X6H-fkc1v1Hpg@mail.gmail.com>
	(Alistair Francis's message of "Wed, 18 Dec 2024 16:32:17 +1000")
References: <yZdXTg82eCLGHsaNBfAwwYZTGa63yzxI2YXoaTndUyJzyVN60hPrWoeQoXdrrh2hnRIeugFXvrb3nbq2bpD6Ag==@protonmail.internalid>
	<20241114005631.818440-1-alistair@alistair23.me>
 <871pynfv5f.fsf@kernel.org>
	<mgdEr5XBxS-KNBtmRIKsQX4z2uZyhJMYQdRJHIOTpxH7v7Vmt88bfy2EYd8-omqRNgT7lbDMIbEtpwlVJH12Ww==@protonmail.internalid>
	<CAKmqyKN7dP=UFjP0c88wq_FMgaFzPU+5GRDz=X6H-fkc1v1Hpg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:45:20 +0100
Message-ID: <87jzbxmij3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alistair Francis" <alistair23@gmail.com> writes:

> On Wed, Dec 4, 2024 at 11:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>>
>> Hi Alistair,
>>
>> "Alistair Francis" <alistair@alistair23.me> writes:
>> >
>> > This series adds support for bindgen generating wrappers for inline st=
atics and
>> > then converts the existing helper functions to this new method. This d=
oesn't
>> > work for C macros, so we can't reamove all of the helper functions, bu=
t we
>> > can remove most.
>>
>> Are you aware of the helper LTO patches by Gary [1]? Can you tell if
>
> I was not, but that's exciting to see
>
>> this series will compose with the LTO patches?
>
> I think it will still work, although it might take some extra effort.
>
> I assume my series isn't going to be accepted though, so I'm not going
> to try and get the LTO series to work on top of it. It's a lot of work
> to rebase this series as every new binding causes a conflict and it
> seems to have stalled

I would assume that it _will_ be merged in some form. Why not? It's just
a matter of getting it reviewed and making sure that it is going to work
with the LTO inlining.

The less boiler plate code we have to write by hand, the better!


Best regards,
Andreas Hindborg



