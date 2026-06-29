Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C9B3FE36C
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724898; cv=pass; b=TC/KIqlaK2XpIb5qvZXLeQyIP9HLok6dinqIh5FRzfjy+m7FOlGjpdZAZ+eImVge4aqZ99xFiRXOPoH47vJzaNyXRCEamGe4XFfW4OcHwUvgOOTDMT8gir0JSrqb0G40dcqt3ukPj2tmFIMdjquhejWi2ZBYNwMjqeXKDTO0vd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724898; c=relaxed/simple;
	bh=3dO4U5MC+i6oScAIlMGpVaBPctNr3xlEQXU83RsYGUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6GWAg5D9XUrcx8XT1XgzZImClXdCO/hDxW4kI6f7dclkH8OUncMHmfoyR01GoMA4JqrQokpO/SMHltscp5+n+5rVdZfNDTzA41bKxsDKLdum0uTV7VO/QPeqITOTiNcTgn+0X6eQX+uoalSuXbLeLFoKP63dK7smfV2OGBeYx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBET5JWa; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBET5JWa"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30ca276118eso194571eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 02:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782724896; cv=none;
        d=google.com; s=arc-20260327;
        b=UvBtyIyRKfwNsjHAXqKREwDjf+646B9BZj5XwCEB8aToqbKSNNi52nF0ARJISIlVSy
         j1XkB223rg26Q1n7jGTbf6OT1kaJQ9ouxWJinDgtZbzFjV/oBQbR/pMg+Nvitv/8WV4s
         EXG5PQ63GXhW/mKJp9IQNW5fUa1sW5Zl2T5h4FZ7qHX5wQoZzwyj5bkAGaGa8yzpAJLk
         KalWlvEAV8XtPCQ4o28v5mV2gHcqTJkEDGplHsr9Xgh+BzOJhQCnSJs6VGhzb3mp5ZXh
         xcxu6hYNkzv4hT1rT7RihP72ZNaQ1yZJVkau2megOxe5Ck23oGy61YfEZZmjXaDsPGbp
         8m1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR7GbZeu60bGAwyiYgMlNDYxabOGkfsb2xboCxpTnhQ=;
        fh=zQ5ZzQoSF7PRkuUsNWepvFIR6bwRS6WLKaT//EyGvBU=;
        b=n5WttVSPpQzHbolSs53bJRSO+OBi3rd9rVAgk2Rf8O0kaIOIcdHxhogHPGecYlCc97
         0an5b+9uljQrz7cOAnTUIkdpsmNxN/ewFFofp+dBnnH7uFn0eKqSEpYHr9CsYEF177zv
         XGapafStRLuuYJQsAKojS5l7kUSi0ybuSYKW/QY81TeGCycIM0SLvYokKDJpG5LNBVvc
         a5zkK1vG/EC3bZkvHIoDTqfp6rGou7u06Yo/ATDLmNx+hNRvqSs60qBlbTOEO/4Key+l
         EaNRm3N+zz2dDn1PAqVMM0wTyxrFa+OOTavb//7RTLF/Bh1QoCypKrXjKx76A4MGtmR2
         O01w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782724896; x=1783329696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR7GbZeu60bGAwyiYgMlNDYxabOGkfsb2xboCxpTnhQ=;
        b=lBET5JWaZj929OYDFK63DaZm0r7HU6tX9oyd9akdfnu8Dt0LfTE86zExgJjgnDWy3M
         Dxc9rsIWvbR+x/rNZAUhpWzDqnCz433U9jLl/F5QZESyjecBeoKjyyaDDjA8oD9L3p0p
         p0ivkkzBdCuYT1drtLqByLcoZo/Tt3i5HHU+2Zf3IWgOTcKBBJaW6DoBjdDVDZs2ImUQ
         cE8zXLHcSMETDYZEqBU2642qSwfrj+HFXzMf7CLfdphr9eyfj/KzZ9dnefg1TCQ0kKx4
         /jDuFMwAmXDVEYpC0F7av0cay0n6QMPadTfIv7tFG9GdO7BQPjAL7H9jAmTYornAr9w+
         +GXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724896; x=1783329696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR7GbZeu60bGAwyiYgMlNDYxabOGkfsb2xboCxpTnhQ=;
        b=SSQvoCGXGnXoVx4tmRuV3Q9h+3eKrRd2xJ7JJOLenVGBM3Q0qndNsNoPLvatRYinCp
         voCSI+xt29QLac1Ntv/kzqf6c3HZcTfAHCXBniq7Qvp/nBls6njROcDGp0IpT9VqaAXT
         diuRP5gJlfP1xvO1+dfe4Ab5mJsb/2oiFL+MSw7bwsJIN98u/ApgGz21UJkyEed9Q+7M
         022O9Lgjdc7XBguPmRNK5/xKIXHin1j4XDKkmS9QjUYeQsWofAScx13HvPqiYieSEhlP
         DfXFJGJE5s1SBZxLmATbiVOVZJefNq5lBzRb7k+VokGSfMjdSKoFGZPw521Ue+pHvab5
         3MkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHYDpTWW2Da+uybXFDssr0fkE3Dh3q0yurnr9LmnEsRbWHO9lfmw2XGZkJvquI3HY+0AAzfx2AvoMd+3g58w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMiQqyfKJa2Ix9LoRnlD5518+pD9tuJemblJV5FJtKHwJDAsA
	PdN4Gp3z9W9NIVvzXuWZvFkd7jYxdHQZgi7VX4+UfZa/5orpYayhFvJW7pVf285Zu18blkyhop0
	nZnbzKZLuvydqQNwxJkGeIjyuq119yJQ=
X-Gm-Gg: AfdE7ckTlEK7rpjxBbhma+xNt2Wpz3jxWXZTXiLxjZfoiOXMJw4So0CksDUhHRuWspX
	3oWgcm/HBl1K7+rfxnZKPqA02fcoEj1922TdPQ/+GFz0YtodYJUvdKCBmvij/xPb/6EMpLRxxbw
	LUvcw96s8Lo20nrhACFq4EKpMlKBqElLZO+M14NnUAjS37BykMWHOG54u19GoOkiPtsqp9ybTja
	g0NGCaT8tANLbGTS1QVRyNIWTwA7+H0JmYoxjxBZDoO8BeiHNLDcw3SllJz3k7o2zzsAOzMy0z0
	uXr7hj96qQGWc1105aqWITmrNc4PCHfkplFgRzMwl97x6bftoWoD43s9qew6CWIcmgOGcySVBl9
	o6UNBkZLb3AoF
X-Received: by 2002:a05:7300:7b8a:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-30c84b16f43mr6714746eec.1.1782724896211; Mon, 29 Jun 2026
 02:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629025220.1935622-1-apopple@nvidia.com> <20260629025220.1935622-2-apopple@nvidia.com>
 <DJLD0BCHI6LK.20SNCG6M3E1D1@nvidia.com>
In-Reply-To: <DJLD0BCHI6LK.20SNCG6M3E1D1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:21:22 +0200
X-Gm-Features: AVVi8Cfm8aVYhfDJb3rjrr0wUTbEnV13F-DC2dvO8JHXzZNJoM_MaRoFaeMDg88
Message-ID: <CANiq72=CBpZ8qPRfNPq7sNQ-notJe5wHkP-ya+kxGv2MDZRvqg@mail.gmail.com>
Subject: Re: [PATCH 1/1] nova-core: Update firmware bindings to use zerocopy traits
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
	David Airlie <airlied@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Pedro Yudi Honda <niyudi.honda@usp.br>, SeungJong Ha <engineer.jjhama@gmail.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 9:37=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> This is the part my other email [1] was about: are we going, long-term,
> to replace this with a `#[derive(zerocopy_derive::most_traits)]`? If the

> This also might be something that will land soon through the Rust tree;
> Miguel, do you know what the plan is by any chance?

If you mean:

  https://lore.kernel.org/rust-for-linux/20260625231919.692444-1-ojeda@kern=
el.org/

Then yeah :)

Cheers,
Miguel
