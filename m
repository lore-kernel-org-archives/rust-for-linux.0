Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C12BF009
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Jun 2025 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849045; cv=none; b=eeScmWsn+TmcZCtI/F0/dq1h+9KAtoQNNQ4GBd8qtMLgwdmhF+5zcfHoDMx6RgC/tjqtHlWxq694Caz3TbqnZVRhZ212mGs3Ev23GCLMCvF6W8Y7L4LkygaDJbORDuTwJpwZB1U5rJqAuF3Q9TCtt5sFGyMkm6sP3ydpjSlEPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849045; c=relaxed/simple;
	bh=j5qAZXIMtMgb/ECKU2Uwdaq58WXZ4HkEGh1K83eVZ6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5jJziIXrOFODZGj+A9klPifJ46R83m1bgoN3A1hTaCc5eIj4yad50H/0RgM99t6ndvdPbSygFk0A5FuxVAY1rcketePWQkuiM+xwqSDFh7s2+KF4NmWsi6eDoqVdcTYxIFQyYVDoUYQfOv2Jz7TbnrTPQ6PfOHYq1tVSj4S1XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=getU2KWq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="getU2KWq"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so788796a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jun 2025 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750849043; x=1751453843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5qAZXIMtMgb/ECKU2Uwdaq58WXZ4HkEGh1K83eVZ6w=;
        b=getU2KWqg5s5Tehn/pyw0mgxTxdTK65xYJFs6NOtSiEJygJUUc774Vd8tLQckC/2Nh
         SWeclA0QOyik6vCE6kXddarNixViDg8tid0C4nOv61vuFqe3VA6y4t8+ZzWfzfVDc5Ur
         2BAZ9XohMIvsK3GQE2CAW+UzO3Xf/DuFVv2hBF56ofAGsRwVpcFzyWBkNigT623v6ait
         LqEDwFpVGiIONS6CFR7va9sUudszmB5SQBd7O68vfPY/QgifZoV0QaPFjVfQy/4koB1M
         Ay5jL276YyAAKABMq/L8E3XTuZO1pCJ37n9RSiQuLkBzvfPYX5JWIiQbIeLlh3nYupb3
         5BLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849043; x=1751453843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5qAZXIMtMgb/ECKU2Uwdaq58WXZ4HkEGh1K83eVZ6w=;
        b=BgdoCQB1+T9mlTpNsXoNKh14h8lMZXXVGzKDcRnu94MxC+rP03quti+UsWANuZoHkM
         HCLmxkVxNQYXYSLqxH2v26g/8d1B01LoBRYoelzXoSckBPzWV1GaKLgNSu6WeWRW83Zc
         aMiOWfD33PjQpMPYpTP+249yw/Q+63LffX5g1jyK6ojH7fZtmCQsKYMfHb2YF9ATsMjs
         iUiOWuIjn6roO5Pd7+kwLq9KFx005oYBUMgycrvAw2ivPF3u0cKP3n5ySGYVTWh0f7nR
         jykEQlWTSnIGCV3aeubbLg/6sfMIZYaoILIgamoBGTqbsqkyGub/diwFWUt6damlZC4i
         jyWA==
X-Gm-Message-State: AOJu0YzVByBve1ZVeWUZh3E+Gm1s+pcrmUeCUPDgcqjg285j3crbsJFI
	DpqTxcY977av50Jwb0ZBFjjpcL2jfWHJS+f2TcPiS0lbzEa7RXhPLVlGfYmgDThEBwho0E1cpsF
	x3f4U0DdSqASdjr6uCpriMoFkocI9g7A=
X-Gm-Gg: ASbGncsZ170txpfMqLFfdS58vPBXr22SxNXFrWl80V4lSnHbkMLK2AHGG50ApRUCXpH
	6s1GmOrzIKMR4L/PdQw9gwkXqjOQQHICIkKC8Xp7rTvZr2FZDt9qda3VQYz/Zy+mqvmTZVzvAcP
	eNgIwn23ofg+dmb3b9XwerOQK2KhOoseUKmByc7QrXhEs=
X-Google-Smtp-Source: AGHT+IErU46XdKck+HGczUTulIPf1O1SKnXjMswIe51raivemBqN3njq1W74WFLgBdzuMDiUVqTZmP6A6QXImYDFlQA=
X-Received: by 2002:a17:90b:55c4:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-315f269c7bfmr1308030a91.4.1750849043446; Wed, 25 Jun 2025
 03:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625101805.645133-1-shankari.ak0208@gmail.com>
 <CANiq72nvnqeeteLvhgf-ZfSQN4M_dKKBB41DuOKoboV5an=1Tw@mail.gmail.com> <CAPRMd3ncagoKUyy=3aEZndDeVpbnrME9G7dc4jM1Vv+ArQJzXw@mail.gmail.com>
In-Reply-To: <CAPRMd3ncagoKUyy=3aEZndDeVpbnrME9G7dc4jM1Vv+ArQJzXw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Jun 2025 12:57:11 +0200
X-Gm-Features: Ac12FXxEop0nZDnRIptwBAv9stUTIo3iHSmekXIZF-XSboPC2Ee1MYeLU6Zkr4o
Message-ID: <CANiq72=gL_2Q7cbi3+VNLqVPaZzOJ+vCg-b3eDPSPtuwtCzWxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: move ARef and AlwaysRefCounted to sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: rust-for-linux@vger.kernel.org, patches@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:43=E2=80=AFPM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Adding in the lists.

No, adding them now is not enough -- the patches need to reach the
lists (otherwise I could have done it for you in my previous reply).

In addition, your reply (the one I am replying to) didn't seem to
arrive either, likely because you used HTML.

Also, please include linux-kernel (or did you remove it for some reason?).

> Yes, I rebased the repository to the recent HEAD in the rust-next. There =
was only one conflict (a commit adding a module to sync.rs) where in I had =
to accept the combination. Rest seemed to be fine.

Sounds good. For the next time, please mention it in the changelog,
i.e. that part is more important than the `--base` mention, and avoids
people having to do a range diff etc. to notice what changed.

Thanks!

Cheers,
Miguel
