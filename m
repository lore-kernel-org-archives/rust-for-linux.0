Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162441D63DB
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 20:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730751314; cv=none; b=Z+ZsDx/OlPNcVnYdMyLF2N7ZNgDyM0KGdMwsS/zC67fY1mLJTwZXBXSG3PCVCxoCV4j8P6JUv79UG/WTEGFilZTayUgKQgtF09TFLY4GKRnAtyz+AqA2c4/UOqeYjMCmkMeADRSyXGgdPYk/idiK0UzjIKzFKGffflGrAcmWnLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730751314; c=relaxed/simple;
	bh=udRB4sa7l+Fg3qFPmpj+ynZdfaOHXU1LSCDyuQdLUSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELb5KiaDwyv6REOLaEFAe+BY6+RbxzeZvKAgOm9/Gg1YQWcMlUPaMnXxZSYXyqNU1YWvLbkZqzfgVtrr+8Ry0eheeNYSYel8LpAIXh6f9mtpGMrrmfXjGWhNt0HoWSuuy7SM6absWbJJjG3wk1fyxS6csmWe5KjhT/Uckkxl6WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2hpxNmS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2hpxNmS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so430121a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 12:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730751312; x=1731356112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va28h+C0dg3gTugCGkJdhdSeJW2d0SK/pFrOdH89uS8=;
        b=H2hpxNmS4diUzg883vch6UdCcX2NxgS8yrQTBrTTw2k6l+Gm/Aw73kIL34Og51Aywe
         8kzc6rdizKwVo21Sgd4tuenlLH86EbfJCisxPuCbRn4q+hcfAGQcCXOOV+9WceQCG1AO
         W9yPjHsIeRNGAkNc34rLvApSZ1t9CACdOSvrWXz91By+AxDdyAU8zOQp6YSp/oWsWwad
         o49DlLC8YpFLSQZTy6gKa88AvnAWri6Mfd7ZvUYQqX2lD4UZ2tD1Ysd6cerMqEt/F473
         DPK0RFm5LKIvxBfztxycWnhTT2LE+1XJi1OkS+ogBiXksrU9oIByzNkErWSMWI5XdO0H
         Mr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730751312; x=1731356112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va28h+C0dg3gTugCGkJdhdSeJW2d0SK/pFrOdH89uS8=;
        b=PrNfCvXYnRlDx3zxHi8zYtFNavzHG+5YM0GUga6no4zqDpIwdYzi6XE9S41AtCIGpU
         g7VL197A2sPAYkXSedJfl9CHcju2i3YUa6V2RIbqJRrLHhsbf+gQ8mNgtBVuL3ls6MMy
         oQKdPrhViODnzsvC6iG0D2VZJIOPr13bFRmjHZ9uRd4Cor6Q9/sR+ht1emT7kN3tf+N0
         Sd0Ns8YjSh6bT44R1tKTHx4Ey3fCWgZrEIv41lrebRgOVJeUk+YwL/SdcqO9kJVtlI4P
         EH6GmMjvpIrfVx4lm6jru6/VrSmZY6SVuCWgnW1vB6RZ2Kf52Vgf6BN4GF5YxuDu9VpH
         gxUg==
X-Gm-Message-State: AOJu0Yzr4qFkH7NgZZ/nEZG0JFG2inx7LFRz/GjxlnuyWBwY6kELJo8o
	dThLVjZ5chWOMnHYN/leYT4clMftIAK2d4z4fH+0mTslgrVxc9Rk/Y4wblA83ej7FJT6PoEJWDn
	j7q9Ak0yxA44bUMAnmJzd12zcq5s=
X-Google-Smtp-Source: AGHT+IEMYJI8TXKORtBlPaB55/fDVRfeAnDxXS8DIZ1ahkMweg+cm0z0YIVXK8HtMHmIo88tJD/u4SJBlS5PMHKtARI=
X-Received: by 2002:a17:90b:3cce:b0:2e2:c414:80a4 with SMTP id
 98e67ed59e1d1-2e8f12e1014mr16635701a91.9.1730751312341; Mon, 04 Nov 2024
 12:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104200014.12996-1-guilhermev2huehue@gmail.com>
In-Reply-To: <20241104200014.12996-1-guilhermev2huehue@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Nov 2024 21:14:59 +0100
Message-ID: <CANiq72=fcjmDqqYT+wLKNr1qQRgcomaBcaedUxzLXmiLvU5hrQ@mail.gmail.com>
Subject: Re: [PATCH] rust-next: make from_errno use try_from_errno
To: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>, Daniel Sedlak <daniel@sedlak.dev>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guilherme, Daniel,

On Mon, Nov 4, 2024 at 9:01=E2=80=AFPM Guilherme Augusto Martins da Silva
<guilhermev2huehue@gmail.com> wrote:
>
> Make from_errno use try_from_errno (available in rust-next).

Normally you would note the "available in rust-next" part in the
non-commit part (i.e. below the `---` line).

>  this project or the open source license(s) involved.

Spurious line from the previous Developer's Certificate of Origin you
had in the commit message (in private).

> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmai=
l.com>

Please add the Suggested-by and the Link tags as mentioned in the issue.

So I got these two at essentially the same time, but Guilherme's in
private, as we discussed.

I think you should both be co-authors, although you will need to
decide who will be the main author and send a v2 merging both patches
into the best version possible :)

Please see my notes in the other one too.

Cheers,
Miguel
