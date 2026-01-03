Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F710785
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767453622; cv=none; b=I5riQ37D9xsdiLUpQ3EEZ1RUXrM/zXkBz3Dv+iPN3V8NqRIhtr0chXV+rYzvmZtgH8OsqSW3Wi+sIynRKT5+RNr7wq8Ky0tKWpXXBYXKwZJ20KWk5kFcRVVQfnJ7KFTJUHjos915kNovPLFrawEB83KS/GUJgsgC3qCKH7/Xfpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767453622; c=relaxed/simple;
	bh=/A6AJIMwduVVvOJs1iq+p+Yrl5QL9++lEPPomquANsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLdfFiSzieDG5pU4p6NSyw0Y3J8R1GNwmfHeUbCqkCiiX/OaImEcuGD64rvX634uhQUgdJSwlx9NIhdDcYVUlwL9wFogFo/YbtHD4aQEvpiCJ8QlKSZmVsYn1cCLbtqGlctXlE/s2WR9keNIUpc/kvbwi5ihq7qy+ykNLT+3d78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT6q0KWr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT6q0KWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390EEC4AF09
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767453622;
	bh=/A6AJIMwduVVvOJs1iq+p+Yrl5QL9++lEPPomquANsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QT6q0KWraYtaK7onnNgNTo7tTmhLlKPxl55jxpFPmiGVhUwv9BtxZ4apOQhB1req/
	 PjcdcIFLTt8UAkMsrjaJb1xhDEzAgjct1OiNbBFZB7AtIuEm8xesKd8dZrCpprcdUv
	 3+58On8VBP+qhpQ/Ccd7FNPTLzjl3dpCGzt9C4c2w8W/HPmrlqJdk3BEGK/GT6wTkx
	 ezXN5OTkOPdoNOorIouaSpi+CX+UkmH/KbyJZ69iE/dEnWCpwTfV6la1nSOTaMv6lw
	 dNmduvzg9oVWW+t+C41TbUaBmyNvwRJgV72/n3Cg8Gh7qV295A5fP1eHmyhYiHhREA
	 IDQBfI/+AH5Fw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a2dced861so6637981fa.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 07:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0TorpC3PAM4yI3mgyCc0yhZmr6IFh+J+2WxZ3sf5RnqYhGiWN0mKLY/5dB3j6OpKLxb9H0wIDXDdc+wyxPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9g7V/QkKQzfgE4v/WfVe3+b81DXs7tQJxd7O4nfzXJGLng1ks
	WMpG9Dsqoj737UrqUxveJ3cQ5nBVvg2dJwNBAGRANQdjhEI30+rL5b2bEvqK73LaZs+wsk8LMA3
	//66H4bfW2AIN70ttqKCxxUJhRMBtvzc=
X-Google-Smtp-Source: AGHT+IFelZsdcRHrh5tUXJpidTQbiFjwrZTpQYaojQWTGe+ZeJmo1aAsjx7aySTVU2XUImMFohjBeCKxPKp0f/avJHo=
X-Received: by 2002:a05:651c:1507:b0:378:f3b6:f762 with SMTP id
 38308e7fff4ca-382c514c4a6mr6480611fa.8.1767453620811; Sat, 03 Jan 2026
 07:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>
 <DFEDG6TK5AY9.1Y9EPEYQLMCMX@kernel.org> <CAJ-ks9krE2+K0mVkG-Ao9VAuyDqdAoPbWAK7fHyoVZD6ww=zyg@mail.gmail.com>
 <DFEV6M7ZUBED.D22RP35TL64G@kernel.org>
In-Reply-To: <DFEV6M7ZUBED.D22RP35TL64G@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sat, 3 Jan 2026 10:19:44 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9ma8oWMGtELdOgj0_R01nH86FM-4AOOZ8bWjGUH-bTk_w@mail.gmail.com>
X-Gm-Features: AQt7F2qQ_NmmLkxeU6fyEASCyYslI2krmKUhOLgVYJ9GkyWumK-8YHkNod54PE0
Message-ID: <CAJ-ks9ma8oWMGtELdOgj0_R01nH86FM-4AOOZ8bWjGUH-bTk_w@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match rust/Makefile
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 4:59=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Fri Jan 2, 2026 at 9:34 PM CET, Tamir Duberstein wrote:
> > On Fri, Jan 2, 2026 at 3:05=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
> >>
> >> On Fri Jan 2, 2026 at 4:25 PM CET, Tamir Duberstein wrote:
> >> > @Benno would you mind having a look at this series?
> >>
> >> Oh wow this is an old series! Sorry for missing it.
> >>
> >> I'm not maintaining the build system for pin-init, but from my side th=
e
> >> changes look okay. The commit messages are missing some context though=
:
> >> why do we need these dependency edges? etc. If you fix that you can ad=
d
> >>
> >> Acked-by: Benno Lossin <lossin@kernel.org>
> >>
> >> Also note that this might be different in the new build system.
> >
> > Thanks for the review! I think the commits all include answers to
> > "why": the first two make RA match the actual build and the final one
> > does the same and also fixes navigation in pin_init_internal; before
> > this series, go-to-symbol from pin_init_internal to e.g.
> > proc_macro::TokenStream doesn't work.
>
> Ah I missed the explanation since its so few words.
>
> Cheers,
> Benno

Ack, thanks.

@Miguel could you please take this through rust-next? Assuming that is
OK with Benno, which is my interpretation of his earlier replies.
