Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B83126A0
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 12:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785709; cv=pass; b=m8kR08D0QgUlwgm1i5TgTzfatHp36/misGjOMb5J4W0BcNx/vpobst+fiBBkDob7y9OddhxTkFsXMssx226moCi7OzfvGzZ+rgMJEMEkAXGQnOFbgsPkKTXF0UznXlpy4JA5wd0UmFn+TBT/xAnbHvl48l2iBOGG3hLsHU1HMew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785709; c=relaxed/simple;
	bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=temEi8PMpx5c0wa2bt50JlUHIZcEBS2FGHM3J9CsAO3ra2nSFTrqXAy3P427UqHvxac3U2M2U6OAK7jQKvrMZhrkbhPl6LPl6RIuqvt2sTazCQpnxaBqilRyMY0FVdxYgAqSML8zK6Z7dCgApEQDhX86xyxr0XKfrnS0m25Ay/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzLl65bk; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzLl65bk"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c18771d582so77457eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 05:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774785706; cv=none;
        d=google.com; s=arc-20240605;
        b=FMn0ZpUpJHnaRD6FUb/1r4ZtKNnv0Jf4L4uuyeNPANYQZnyDDxSQTzphY9wP9OiOTc
         1LrUESiJe2r1PP4xCdpurdUhavuxlcthKKkp9rDtsxve9/oeZkM+YHZK19DLIld8KvmC
         3EYmWZ2wd8rv/ljng134GIpOkWqOqFsZUwfvOHTuWjM011eON1JGE9O7tpF/pqe1CngX
         sOyvfNM0uCbwgVsGB7rtSvnNFQOrZRILkZrF+5IAU40YZ1BPpXaw5z2dZLsbNLYekuHr
         58xbYo9dlpUy3s9FyoeuxXAJe5g9uScPqV9izTNE7CGykHEE/4aL2rdonza0LLVp8Zld
         x/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
        fh=9Mt16o8leeOEvPED1w5guGzlwzHDVFu9egQEv54C1lw=;
        b=FHLHIFElrUPMHbf9byk4+IZ9CFXV2sN2sQCkwLkj+wLo8Y3JpklmgSkm33oCHt495o
         ILtFa5W4sKNo4xqj+4RT2YksRM2pCcEl1rXH1Pi8yhe+vkyfOndE/73mMCw1RJrgXBcU
         VtYS2t9LNuDL4Q20++D+nntLOHiVSf/5oN9PU3XNRxPqKEq5qR5iVTDBVmCA734JdCJJ
         TMrCbww3/23IJvAgUhWH0BqNSr1xeMpHCuAjRoS0cbI8HjlaNH2ripp2v2KQNyKjpiR1
         0SJ32g/t1H6YtkXax8A6SN66xM4H1mWoVViQ1JYMknXICQgS67syzOFZ0UUWtSMYlQy8
         dYtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785706; x=1775390506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
        b=lzLl65bkru6++BMgqvKJcC2DEfqYJ/V3UzOpi6joKUryza1UDP2Bs1qANhb+VAUZVT
         WioS/N41/lrF2f1LAgX80++yGFx2fdI9digzZeEExDD/648nz/cl6nDoYD0NJ3ZlrEfQ
         N719qIRwtkAVpcXg4NbkssMq9P1IPR1TZSPBYK4YQfs2hbMd9rKdBHKoVbcdjqIVXVTc
         Z09LBiKe1suDozipSF/9bHTvYGH7d8S4AuGtKEkvP9mP1xqtuY1zExOOf4a6FCdnmM0u
         OH6LwEpbiHUjAwVeT1RdQt07nNUd/Vr7z1zwMH6qnM1CqdHEfapOtYYT1enW9MUxbTjd
         kfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785706; x=1775390506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
        b=KcnYkxtylKNQ97wwObWABs5VUnnO0jCnyURRP6NFwNrO5uy5hRE0zDU75BjBakOJ89
         aX25oBaFT9suAlglx2IjJWqPWBifdfGeyOLdsKIbTACtCPSd8XJHCfr533wmXMPyEnf/
         ZUEnS7lthVLdC9XdKVo2AyQ3r2m3tX3WZpHRABB8MFWr7bkXlF+/7zw2odQR7aXmaQdj
         YGM0jw+hLRJjVv3fFlD9chYLmIypmLbvwbm5QHOvK9PyBxWN0oTj9SicF8sfiKsJkPdg
         7n0qZvQpKC7LuUagkiITpxvgyl5sUKDpqgP+d1u9IrTrSDbJuLIgIFmDCI5gWcfjxgGq
         eQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVPlOSeCFcFZO2+ysbw9PXwha05+bAGtO6EvHdcdS+HVOOty7nDzK6lRgXWeyH7PI5d0dAe5IWRGAJvEYTuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdbucuy+z34oEXLWnMWL5nHbXIBKTB5SM6cxE8eGoxWNOV2aMV
	e7UgLO2B+TBM+Na8qQlQo3aOIBNkCN+rxpCVl720r9vaEc1JIiJXhOUfTgM0DtuAQcqlVjazdIY
	zjsfnMUfY5/K+G+bS5ll3iLJLFRM8OE8=
X-Gm-Gg: ATEYQzzEOxYEO8EXPBheK5gherJKqsJ0EKEc21LXKCBtI3C4OZ5cyulziuY1ntdrPY/
	1qFLP09M15zGqpVkncOca/8cpcsRuTrqgUsk+tPcL0nZJ/1jrD3hb2iRlfKgHiEUKdMUe67pN6h
	JG8lymXfzckJJhmGCBe4/bKabB/wj17WmHTtiekf7S0FizB3dMchR60UkMoBI29SWb7Ku+b+1eW
	QSPtMuf37omob7cfryKdbF9ET+K2wvcT8u3YDxfyAWs95vkw6d2WHOYWaPNc3Elvxw3abx03/PS
	vjalm+HmDPtA5PZXdQtFRh9xZOsgUjKwrwjUcABLajAHeDvQ910SKodcyTHujdpjUROap2wqB4c
	4pRIH16TrGTay8yGKcG9/mZA=
X-Received: by 2002:a05:693c:3008:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c185edf989mr2246595eec.3.1774785705374; Sun, 29 Mar 2026
 05:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
 <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com> <acjVGgDLnYAg1UAc@monoceros>
In-Reply-To: <acjVGgDLnYAg1UAc@monoceros>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 14:01:32 +0200
X-Gm-Features: AQROBzC4ArywLCQm9oPk0DTBlwHpJWFCQIFrS7hccPJYCVsbdcvLs7tOCip51GM
Message-ID: <CANiq72kWu-XmFbYEGZFgTere14WjRS6JPS2vBPLB+hizi3tbAg@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 9:36=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hmm, I guess I missed that because that patch isn't on patchwork. I
> don't even find it in the list of patches that don't require action.
> (e.g.
> https://patchwork.ozlabs.org/project/linux-pwm/list/?submitter=3D83457&st=
ate=3D%2A&archive=3Dboth,
> or
> https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D&submitter=
=3D&state=3D*&q=3DCLIPPY%3D1&archive=3Dboth&delegate=3D
> )

Ah, yeah, I track things manually in a spreadsheet (which is a bit
insane... :), but this one was noticeable mostly because it appears in
CI runs etc.

> Applied with s/arithmatic/arithmetic/ in the commit log to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fo=
r-next
> now.

Thanks!

Cheers,
Miguel
