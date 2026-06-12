Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E681891A9
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 05:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781240626; cv=pass; b=BzVNaiFlUdonI3oj94zK6R0/m5VGE+RxquhukR/1BI1/xNwnWWlwNRpHNhAgl+JcJR/v7KQfSHwIkJ6mA6qUeTf1L+WFKp5CNuXq4v5iKSc5awQPQaX1K3X7+QkMNADwTr2IKZm5LDMZjuW0uBYY7g3Zr6RlOyZD9fh8JvTv4lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781240626; c=relaxed/simple;
	bh=Xfnnse8cmM3f/1zPLhL08u62uvYYlF0LFW941crUNtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVnivR3ktsC/sY/hMRfbKzYsQaJSv6daCEWILgXn+6ILANa7stLOjNy9Ij1wMwQ85S1iW+RVpVsr9TJw+86S8viejDS5OCMg9T4ZJwiEVDUMVNsyiLt6uDIRXz43PolliAMYpBGa+gLHMMdNfIiypfTeQu0nreTIPMBEzENlpn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFNstIZV; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFNstIZV"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d4e57d33so30001eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781240624; cv=none;
        d=google.com; s=arc-20240605;
        b=B4EBBgZteIEgpMrCV4+jTQE4SXIEtueYlRKT5z1QUl+nM2n90teT62g3HPAT+vvyhv
         Ih46NPaGE0bG/DJsC50wTgiA60l9zFhv4lOM97cgNai6fmfEsh0lEFIsFWv9oPPAxrxA
         v8ABOq5Ye1NwmRAfNuz5OrsZZtesbmdDkW+CS0M41fnWlHB6z/yhUXUTKAg0B94gK/ln
         ly3fUvXw0G7cTMlihtkqTPxhES6w+aKVhytn64pGACDElpz7UR7yehChU1F5AL9AJ/vY
         l14273JVFc1PcoyV5iKiARrM+ONEcG5IdA5Pa0HMxFu3ZwJkutqSSIu5xO6mcVP3DV+m
         4vmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xfnnse8cmM3f/1zPLhL08u62uvYYlF0LFW941crUNtM=;
        fh=2LDZvrv1KHj7/OJ/hbkHbj78RasfL03r9Nddry1t/AY=;
        b=aFzgVCMwJx20O3+60vubbQkmthIcCX+kEpa4xw1q1TCZSQ9Wr+G+1bWIefPOeHlARF
         LUFU1DBgafQnnNWoRPaoU2pZOaTemlt/4Q73fG83TAf8DMIXzzuNCih33QypS92QUYU2
         akMvPFPgVTkEfiCp+xxTQpCoDLCNXiJpGO5rrOuhZgMbcVOqkXOw4FeYEGeupaIeC6tf
         tTSUZyNWR+ZlolpltmO/IB71OeYzMn4iqizbNaz5KRVmL+aUohc3FQXZassT6dsuie7J
         O6jTTY/Ha948PTgr6vzAFBD2TkOfr/WEmoBqh0mZdj6HmAM+lJtZJD5ItD/bBaOYcTeJ
         EgOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781240624; x=1781845424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfnnse8cmM3f/1zPLhL08u62uvYYlF0LFW941crUNtM=;
        b=fFNstIZVIJ+RNsOyZLURLWh5liF+FzfmnhRZRxuJH2brttqz9iO5stF2NFrvsZ/9I9
         HcKPXw3AAcuHf/TnLXUConfHIcV9C6Wg061xsUzfYmtuCEwcowgbJYBBAu/jPDLVD8ax
         0e4KbrIRUmH8I4393FoOXOSL4odU3ElbJBbZUrdf09k87519JKWtTuc2/wY9vaI+8XFl
         LqrN014y53fMK+8Z7to8LQO6UxW+8WcSMsJGx+3JsBjxkDJ9Y0nq/SNEWp5X77mHULY5
         x8eMSJKhHovmY0NxHw8p1bY3zWU/NI/Ww1zIzvZ//0bH/jhof3UvtSDEXhVhYy7Ot6mj
         voyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781240624; x=1781845424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xfnnse8cmM3f/1zPLhL08u62uvYYlF0LFW941crUNtM=;
        b=m8UiX4pVjymnVLepkZVggNMsDEQKwC9AJmhGniTv+tBstLoSWpxgzLYk0Z9apTdZXW
         9+W97GMAko3WT7AncLnoiFc9ryNOlO0JqwTj/Do5YC1U1L7/PIQhNLnjP7hh73JS+cBZ
         5iSzLUUNBTw+5j2oG0Eqtd9ck7Gy8UG80Yl3Rie2FHhqRn4S7e5NIRyTSKjgbab4ODNG
         Vo6OxvPTey/5VrrqylnMR8CA4J46EU1KNIelF7Oy0wV0Tt3SEJmcTNl2tB1F1TQgqRyC
         e19gx98MzbItm4mpsF0qzdTdIMAW6nueldHIgBwCI5fXvdv2Oct+1phsNC3VzXIXPOBt
         hWTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uOO1XchYgy68iw44UPBtTgyLj4a71zX4gTfbddJVmG8jN1JAF3snO0Vo6RZA33HlYAENDGb35FXuA79+WwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS+Y1barCCF0OW7aqEPAhDgx3McF7ORtN28VlXiZ2eo9eQ96NF
	0/+jhg9bgRt+IFloPUxSCI5SS4PnrIO/U19s2aTFPGP3xkARqFqNnzuT4uZ9PT8H+IVba29VyOL
	i4ozZDgM1DVwoGduYI1tmCqTvGCEyq0U=
X-Gm-Gg: Acq92OGR6bYWlgBIrnYk8d5TAUiZKTPe3KpPD6cRv2QmHZNYK1ITRuKl9NcJjT8urlh
	wOY8mFgIIn7DOMjyy5AzcS2ET9SAS/mia4jMnIk9HYlrR7s0O3PuZJyr25tG/Bdn+2yOQsjlBAz
	hxqoY61uzPvwqy+lzN1tx1uHwfvCgZORXK7Pkltq+zq4QQkzbJl7tL3Isp5sCWafB+TbdF2Frd9
	V/X+sLFy3bDOeo9cC3NuhNJaRifh5+252h9tiH7B1M9UBObwbN8kps1QGH5Y0m2Ve0sOaZ4jA8E
	RFSecS1Wgz1Upaw/0E1Gwxwe3V2hChvVb3AwTOOZEy/1iCwJSOA0gjcvWCY4WPwOC2Skh/OKPiM
	oo69jFmhkDvzJP4ExR5QH3oY=
X-Received: by 2002:a05:7300:80cb:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30820084c95mr349720eec.3.1781240623951; Thu, 11 Jun 2026
 22:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611055538.61425-1-ojeda@kernel.org>
In-Reply-To: <20260611055538.61425-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 12 Jun 2026 07:03:30 +0200
X-Gm-Features: AVVi8Cdbd8tp80lI6MTZXxeVl8UQMx4HALtrNLEEvKd_pkzPgtbro53gsHhAStk
Message-ID: <CANiq72kc5Kft7MPpcYfhjs1+ZsbazjHokB7NpZQW6sXmsMjptg@mail.gmail.com>
Subject: Re: [PATCH 1/4] MAINTAINERS: add Daniel Almeida as Rust reviewer
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 7:55=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Daniel has been involved with the Rust for Linux project for more than
> three years now. He is the lead of the Tyr driver for Arm Mali GPUs
> [1] and submitted many of the core abstractions that drivers need: the
> `irq` module, system resources, `IoMem`, the regulator API, the `bits`
> module, the basic USB abstractions... He is also working on the initial
> Rust V4L2 support [2].
>
> He is already a maintainer and reviewer of several Rust-related entries,
> and he has been very active reviewing Rust code in the mailing list.
>
> His experience building Rust drivers and the APIs they require will be
> very useful to have around in the future. Thus add him to the `RUST`
> entry as reviewer.
>
> Link: https://rust-for-linux.com/tyr-gpu-driver [1]
> Link: https://lore.kernel.org/rust-for-linux/20250818-v4l2-v1-0-6887e772a=
ac2@collabora.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-next` -- thanks everyone!

And welcome :)

Cheers,
Miguel
