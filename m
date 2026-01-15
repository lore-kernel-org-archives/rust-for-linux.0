Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD93191C3
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513817; cv=none; b=pxLxjuW6ngTsDVbGTRBtC7d0pPQ1kTt3ltFxTOsGSiO2a5S/uoXbb8dn71Nroax7mfIKr9lzI8lXxrw/EsiPXzJDtQX5BAdAz5IxoespsevYEdeiB/AoKI3JFlQrptXQfv8sulZ5tiK2ATXNbGBIkGJt6SgF1Qbba3vmaplC7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513817; c=relaxed/simple;
	bh=EPX7b8yhwz4NLohFLfU1eKpCFrmTHP0TP/KFgLOQ5sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jL61QV2jx4qgwAfa3wfR0dPA0Dt7BfKbffoDl6rXNnMgjDYx3EMA15fO2ZqIzEZAElrPMmNmtQNYlYN8Tz1xVRnDW4Aw824jVwycuV+Kzo1xoJcqMNNmjQz88baeRwd9eX+RsW7Mycmu9kvsJQEYDCmB4jDolN9msjdGMdgmjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcRfBs7s; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcRfBs7s"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso12323591fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768513815; x=1769118615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyj9o+G71/Nmhr7h1ZzDYlI/DAp/17Am5XjjG0RkQgo=;
        b=OcRfBs7sn3BMcQkYg0B2aNXPECdI9yxmFzd4Ta67dS/zSu0GV83Htvy6Z0+k4xqK6o
         zDJ/QwxvSTBr47usZUUaGN+CCHeFdITMBG2WIU95rB4eYP4IxxgsVZB8gE9sQ9W+bYIO
         gqodKzoE/whgNm9D8l7b8gSf4easWar/wkBSXgk95X/Ezf2X6187/SJmozdQPNMk1oQC
         h9lNXdz644V0zt/DPePms34V389G6jRRT07/BiNBK+AOi13qnKNOUHsXhpSM8wsQGD3a
         8xOw/gLM6l2blzqCkEvgXoTZCNoGpRemHqL3Mqh0ZaOdo0fzRz6Af9GZybzGyisaWw9T
         F4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513815; x=1769118615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gyj9o+G71/Nmhr7h1ZzDYlI/DAp/17Am5XjjG0RkQgo=;
        b=n57ZJq66X3hQq+TCF0ePNR+SazYNywAlSlUyzXha/EbVj1CbzZztgzjyzwSaE5FyHY
         6zCH5nx6V2gOkcZ7wKXOnw4xJsqPIU+G3NWn3zMcajDJZux+ffsX/8gpN0aSVeToKmgr
         xvW40XAncEdU0bvFoRk6GBuuEe7mZyrTec/D8iGFfLPqP504rOgzXZrRS+rLOyytjWLp
         bRkxiPO1SpIfKLeNGBZFBzjbz3qWqTCt74/FgSXp7hWVdZR32o9/ElriGNmZ2Tx7ehLS
         VRoNyYZGr/MLYgQGq0o396v3kjKmqFdEvT5BG6+2vM5x0H+XkpOgOoNgz9YNVVUPdtpK
         tt5g==
X-Forwarded-Encrypted: i=1; AJvYcCXAcdTlmWwS3aWAuUp76+ocMvTC7R+bHpFLHZMzljOjCelF7HW1wE48nUwmTVsdDhiiWhYUUyKV8xdkUapzxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/skWp0yzg1yt4+iOOTrdycTJhe9oP03kqxPsT/ITBElA3zBqB
	3aPRr0OXhIi8zUeowd/IjxVajFswyt6xgnAilkMgX7Iifcnhu8Y5sMa0F/ph1OlIqVJKJiLieWZ
	QxZ4R8atqJcO5MOG3jcnHcxd/mEGI6Ms=
X-Gm-Gg: AY/fxX5VYKlkI/6Sx3H67A0JFFhsO0HSDEucl4YXZYlaZF2oFWEjZIvLALENUpuCHo/
	2pH6Wr/N8VvCLTcfforOKcTBJuOaJ2zehPS5I7Xt7dPl4/hdBFrvEo5bnEopFKCujr1X7Lx+cp1
	7AcDEiPwBqfpxyKG4SYTzDw4PLwb35xjmhsqrmbvu3ycMVve62L+J4bTrSGndLu5TYlvpiAT1qo
	tQc8Jir07jtQRhr0qSaUq34eYEd8S45gti64VIL/qKoIdnY0zbeMUnbV6dpqiJYU8LG68JgeOhS
	WcgYzKyQSAwd2ut4i5aKsvn7FgktiGQifXE3xdpfBgBG+TGuWlCfGfFu5ko8kR9QFFdOU/K2uvm
	VQDESfclOhEPgV8m1nMbJk0Z6Xn1SJ2PWjWF+WIR/Yw==
X-Received: by 2002:a2e:bc21:0:b0:378:e097:e16e with SMTP id
 38308e7fff4ca-38386c50eb2mr1210091fa.36.1768513814397; Thu, 15 Jan 2026
 13:50:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115214545.63262-1-ojeda@kernel.org> <CANiq72nYvttE6odYpaQZ466Rv97jgK7T0vybTcMNftk69iu0tA@mail.gmail.com>
In-Reply-To: <CANiq72nYvttE6odYpaQZ466Rv97jgK7T0vybTcMNftk69iu0tA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 15 Jan 2026 16:49:38 -0500
X-Gm-Features: AZwV_Qi_3OK-GKP40reIzo_OaE_4MQImxZjhwKN0sY4hQOyue8eJaReDUasjxuY
Message-ID: <CAJ-ks9mTr0oO-iCc5sC3PPWfcBc118-_K=kenEvz9sO5hzyyWA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:48=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 15, 2026 at 10:46=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > +RUST [RUST-ANALYZER]
> > +M:     Tamir Duberstein <tamird@gmail.com>
> > +R:     Jesung Yang <y.j3ms.n@gmail.com>
>
> Tamir, Jesung: if you want other addresses (e.g. the kernel.org one
> for Tamir) or other fields, please let me know.
>
> Also, thanks a lot for agreeing to handle this, and welcome!
>
> Cheers,
> Miguel

Thanks Miguel! I was just replying to say that this should probably be
my @kernel.org address. I'll start using it more consistently now, I
guess :)
