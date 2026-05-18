Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CE398915
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140891; cv=pass; b=RyWTHfcCLu86oIyeTDC2vPkE5zRezEMlDZPk/z8kTMUysTky1tk2Q+R5Ct4XQYJOdWk1sZSgCuL2sH9RgsZajmOMB+I9anWMzL8/xL6gbdFOzWBsjPTIS0GY3uuMKh8Qwns688wnAT9tN7wxgnt59Utli8iiBRDVwCko/MZ6Css=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140891; c=relaxed/simple;
	bh=vcGpyDCkEPxmJOtAnIlLle7uN/b+kQjTwRY8mtkvH4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InEEt7uYkNQ4FPpznL7fa/T1GEHFcK43h1/8EGqC1BwHpyE86V31vk07EGBC4h8UaLdDRiKz8APfN4U/od3Tf+korGFWvg17xNx32wPYeQR1Pnjb+cxl0mS4WsvrIzBrlV3QR6185avuYq6Mk8Zm2DoG+oQJ+nCTsOOW+/8u+qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CwepeFb/; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CwepeFb/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67bf769704eso210a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 14:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779140889; cv=none;
        d=google.com; s=arc-20240605;
        b=OQR/ESl2bUUjoF3Dz0aUBpgmNHo1Y2ivU3Rbmb1d9UNdc3Kzjhfp5Wr5d8pS73C+qO
         7cBgKODh/IzMnnWQER0tigqVUlwNncrKi3WsyaTnKczZ3b19CS6BtG9QeiyELa1u+0if
         qheC83+OCFn/GmcQ9Phj7hSriCz3GF51BFrLYX1ZY4K9i1OHAv6fNMSwn/vRSY94045B
         sbfuDWMI/7CFfzUZ/VFoi7aSto1BF8BFGoQCkP1hWMhY3N4KKX4ARPme3kIG+pE6Ks+u
         FjCjqQV+BYGNbcXUKBojEcxa6FHHyb/cr7hJUBlc/Sk/PsmmCoDQhDZ+3zS0KzgJRlXK
         PVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQHQeR0oNt4z+Pnc26f6DTS/8lDA4aUuHFzgnNxCjlo=;
        fh=Glhy3CyRdcPswhBCPceWF7asFh18usUP6o6/YJY3reM=;
        b=dIDbhKi+bs7naEBJ4y+Re7LmoxGkMaS01ejCHmiQEqdmWN0OkfNoeBJp9bTTtIkvsj
         9U9YnSbhPPO8Fs+WM6jZzgmpRR5WACvBFTJCy/4dnwu/eaQrsytJ4EnGsf5qSefwQyni
         r1fgPxNkB1lfgc8qguc4eU909roQ8dr/mdCmIfLCKe8J5jhUat5srmPbl61DAjFqWSFf
         oCC85h5Vk2XIcwu+zHolkWNVM85U5L1Lv4qKrIGQ21CBoHTNmQqUn/iMdQM3BaOuOXCa
         d7Un5DTJyUk+p6WCNy+v3389bQ1Se5D/kLgnO+syg7owMkYYiKpuCfZ3TZfuqWsx+bLO
         b/ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779140889; x=1779745689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQHQeR0oNt4z+Pnc26f6DTS/8lDA4aUuHFzgnNxCjlo=;
        b=CwepeFb/+txQ2cGdlaVzW5Q7JNEjPbwR8nC8FDHx5vbGRYLbgnV5fI/5LwVHOLaYbb
         cLhxGbDlUOGJv9uR6PT+aJ7mPFh1Cmtxp6IbYyhoB59Z4IG4PZAto+iu6/VSpQaWd4Me
         q6/a6mKAdNc8t1dyu+fkn6dFqJZEp6z5SNAdHgRWGjGn1s0gMye8XIBXP19OIKUL95ph
         dY9q2RPZz9uJ70Rj8RItnywUAUkBKZj+L6g0RIA6YzD5wGot5jDxVVxbthInfJDz1KKu
         bD0ScoMMaMVVgrc/cw247LFG+98AS/Tpy0R9HIbozBST5n9+Tc1z/NOjuLpZNrYgawdy
         e6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140889; x=1779745689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQHQeR0oNt4z+Pnc26f6DTS/8lDA4aUuHFzgnNxCjlo=;
        b=DT7VHLh+HTS/etf9MYObO81CaBk6gT9oB7Pa3zKQKXHwhvKTgfAFOZMqoHd/hOYpIR
         kG5LIuScUKFNLXVdN3qc2poudASxAnmU/eyVHhADl6SzgtwXI+ykOTE8HTi/rNdYHKHS
         PlhvcEXNVWuWI2aM91v0ianetjVI7DD1KhdA1zRwUjTYjOjardAy7v+mywtKb0KiH4BB
         nV1MnpVvurKAnisSigc7TDVTIf2kYSy0hLz4x4CPwsNqezRX8s3ZJcYwr8VRbf+h1mON
         bRAWjfc44otfH7QYDbAGO/b4MkCs5ix0Tbj1cEjtGOxduKzNXFcVLiZmGiCa8mjpCRSq
         auqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qEszOyJVJbw3IImSr/DTWmHI03zOjKiHfjddbPVaQsw9PVrinpgoSDUt7Nq9cxuCcbYQxSNDS7wSgHeFRMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxASn18IR/k2QBWiTV46S6x4RXq8PbvMiU8Xeo0LVQ8y9zAybJR
	t8jQQMmHqdm2GeIoLLbhw77/Q+lT0GyTL1Jqx985qBxU2efmz5bcerVJTF7VdfVZvde3Ww8RaO8
	fwU5n4GsO89PzLiElXR1rEzMzIgHWs44orJzuUBdw
X-Gm-Gg: Acq92OHJrA4Q6+70SGRfv3V8+GAIwVnIhsVQK0yOlVnn9I4Y2Jcv5nKQsqZsrhG8fOx
	VaLM1O5UKTHbJaLl9mKTdSqDLrHRNFiatAK1M3XySCu42tQrdwbKArI7i7W263c7xnnuh0AddHa
	IRi82qnef+c8RWySjIZrrOJHSvV1x0epXcRXZ4l0pacQn5yxu/Ye0GGqahJq7hu8e5vb0W4F9wi
	N0/8+rceN5LefrSMS92Pp4lAuL0BiZkUxY4F1nXdd1mlXuR5xYL1uvCOAij+MWPVWTj5KwVVb/t
	7rGPJlmvVXm4rVU=
X-Received: by 2002:a05:6402:4c9:b0:678:8834:1b49 with SMTP id
 4fb4d7f45d1cf-684985e96ebmr100033a12.1.1779140888421; Mon, 18 May 2026
 14:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-params-pr-once-v1-1-3a8c64704cc4@kernel.org> <CANiq72kgM+ugZsRda=xfd=So1UteKVh=tSBxZAq5ETwk2zUOwA@mail.gmail.com>
In-Reply-To: <CANiq72kgM+ugZsRda=xfd=So1UteKVh=tSBxZAq5ETwk2zUOwA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 18 May 2026 14:47:31 -0700
X-Gm-Features: AVHnY4II1hsAU7qnXJS0r6nvoIjs7jvrlB6zhTIpOAt3YFaFZ3d8WtccpA8EpJ0
Message-ID: <CABCJKufx_oCp5c1wESomYBw_ogRsamYRPbu0xbYEZz3sW2SkLw@mail.gmail.com>
Subject: Re: [PATCH] rust: module_param: use `pr_warn_once!` for null pointer warning
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Mon, May 18, 2026 at 10:43=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 27, 2026 at 10:13=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >
> > Replace `pr_warn!` and the accompanying TODO with `pr_warn_once!`, now =
that
> > the macro is available.
> >
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> This seems to be:
>
>   https://lore.kernel.org/rust-for-linux/20260226120848.82891-3-adarshdas=
950@gmail.com/
>
> Another one was also sent a few moments ago:
>
>   https://lore.kernel.org/rust-for-linux/20260518134107.4114-1-cppcoffee@=
gmail.com/
>
> Is modules going to pick the original one? Otherwise, I am happy to do so=
.

Yes, this is on my list for v7.2.

Sami
