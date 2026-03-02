Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCD2E7BD9
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468675; cv=none; b=h7b8LCWTVG9z90Qup3ebj8CN4ahsEm8dIbOOeRpkFztq0E0lOGhNjMdg/47FoI10o4FAKPbw7LGDoBANb2UF9LROsEZMNn7Fcks2K5OVpWEnj1/c9qhXf5owoirjUPB/CMBwGL024/TgiyqflDiyyamrrppt8YxCfQtFbfT+Bx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468675; c=relaxed/simple;
	bh=76LNM1qzHjh34fJnktK9aa34fUbLDuD+3ZlmIQ6sAP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWdlXCBMDC/YmO0yGndP1t1JqU9s7RvPzAAjq14BJXU9F9xwE3Oet/gSIgCwaVqZydxoON4KElav5xMquUk54GmZuzehjCaHK+scygKjOETl2B6ey05PeLtyVZ+4bT0UDoePwdmBXvwrJRomn6damQeinS8RuSMB5OUQxCGBEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohpGIQoG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohpGIQoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A240EC2BCAF
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772468675;
	bh=76LNM1qzHjh34fJnktK9aa34fUbLDuD+3ZlmIQ6sAP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohpGIQoGbDwLTTIvpyA3RofeuIPf45EqHCcEN/QA3Z6GG5RebXGhQFFkvJhDB2Qfb
	 2Pefr1Da8ScgR7LdBj1NpPmS74IqQO85yzSZ1UMc5m8UtQ+nmKx94XNdneTWkh0K+f
	 XwWXzcIFnQjJ4JBssZphiUocVkDQJN9HvSxfdxFVULMDEKmmAl7mDACTrzCy1tm5pP
	 I1ZZrGzP8UTJ0uvMOKz3SYRZbyUyrxGEDzGsIaUuurqIgBRU+ldl/U11JFvqMgPTLZ
	 SBgtCb4zcScQMmoMysttUOYDt4x7YypCZ7JbiUzcpLxiUi2CFOaJPLFDpTNS2o6FA1
	 mYTEK/0qgK0hw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3870902760cso74687931fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 08:24:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAeuL/p1LjHOdVPWf4GMfz9ZYIeUXj8pNYfMGuDPwnGuV6oidmSIZqpml/mMBSFtNVrZncFcM4qw5SuZWSpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpz15S7Fg9BeSHWtDE01Jb8wpgtWM+uxmaXBpcVcA7qrXR0MWs
	ex3DydViQ2poCv/GafnMonk/YDGKPyEEysGGmHX9bGhzN+lJxF95XvmuBe1v6Z32bWgE6c7Zxzn
	AkSiBXT9XtK007aLXGw0cCEkt2/RK3dc=
X-Received: by 2002:a05:651c:2121:b0:38a:921:ddfa with SMTP id
 38308e7fff4ca-38a0921e065mr58645121fa.34.1772468674372; Mon, 02 Mar 2026
 08:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
 <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
 <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com>
 <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
 <CAJ-ks9=h9qTU8Lwf8YGziE2Go800+Qqt2h=5wafYd2pedhSc4A@mail.gmail.com> <CANiq72nvzdypum2jZ535tWiWU_Dd30cBPSfODXKC8K+VA1uHNg@mail.gmail.com>
In-Reply-To: <CANiq72nvzdypum2jZ535tWiWU_Dd30cBPSfODXKC8K+VA1uHNg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 2 Mar 2026 11:23:57 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nQQYWOTO3cwXvJDwjoZ=3VJfhCz5rtSKpuGNMQ5BFM4w@mail.gmail.com>
X-Gm-Features: AaiRm53o4nVEAVLxDXMZDP_mjk8O9CY0PshzMx2Mg57N6WZw0X_K14l9gioYBDw
Message-ID: <CAJ-ks9nQQYWOTO3cwXvJDwjoZ=3VJfhCz5rtSKpuGNMQ5BFM4w@mail.gmail.com>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type hints
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:42=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 30, 2026 at 9:32=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Apologies for the whiplash, I reset the branch back to rc7. In the
> > meantime, these commits are available in
> > https://github.com/tamird/linux/tree/ra-next for folks working on the
> > next round of improvements.
>
> No worries at all, there is no harm done (linux-next was already done
> today, and it will likely be closed until Monday).
>
> We can go through the usual timelines and how to prepare a PR etc. in
> the call (i.e. the usual bits I explain to new maintainers -- in the
> first call we didn't have time for much).
>
> Thanks!
>
> Cheers,
> Miguel

This is now applied to `rust-analyzer-next` for real. Thanks all!
