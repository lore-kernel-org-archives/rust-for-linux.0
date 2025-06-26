Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8F1A0BF1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 16:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957167; cv=none; b=FVjnsEX1eQ+CZvrddPmNxfAPKGtczRIuLIhRm8DPIdbvAfZdA5uXrQLUMbOgsteKtOtcRxUFqHjfqav5uE4+ykayZNCM4Q7Sbwt1xRZZn2HE16KwJo3WxQbGx5Aqf9CRUe1XNEyoalY/53xbAxJBSTw7dC8LkanAfi2C2fF9HqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957167; c=relaxed/simple;
	bh=PvI5gHUwVIhFv2dtw/qoLeiyWDGk8BjmnnuVTn+txO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugOwTwQUF4y0V/qSLbtJcv5Izwu/E3C6vbvW7bFfGczOkCK/XjRgrHnuDgrsnKtD8UhOt+9Z7i9ePUTe5TFLm/aQxgOz2OA+7uXod3tCY7p7rbkjMdPsUC3iHA6lnO1R4Lc9ZDad2SU8kaWgoSfcy32QANavcKGqrQK0O9eWFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCo36aYy; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCo36aYy"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ea2fee5471so723210fac.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 09:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750957165; x=1751561965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3IEyo9WONKfEiyTgck650sXXAAvZTgQqrZBF8o33MA=;
        b=FCo36aYyzOGlvye2BsejLSePoPIjs5UTHoXctDMPLR5Lv5FsM4xvXNTC5HMjdQM/1c
         SrXd3/hN2FecOaFPTCSQj6C9AYtDadRV0oW339x+mkt+E0HvJHMYVPjLO1rjI6C2DQo3
         R8UD0EZsWvTu+MqB9sqgPJeRongwr+BKLGgpPYOMZ/QzKCX5sx2wdl4rJv1b3s9LoT9E
         kDpV0PYqsLNGPFMhmB34YmtiPf48RH13Dr8/NOILFUdr3x+AnfStU8mNfN4dtniUxB6T
         wtTu5Btv+dSUMoCqcMW1/qw7qS9mXM6fTFPAgQW4NejnRkqum4pMw16LS8YkiTSKGa5s
         lb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957165; x=1751561965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3IEyo9WONKfEiyTgck650sXXAAvZTgQqrZBF8o33MA=;
        b=eoB+yLlCxnIgeMdPoMYyHD7b3iy/+G/8lPWug7aYZSS4lC7x9doZNKTxq0EBNj6o+5
         9jF3HEKMPxTKfjAuvduCBUsvnkZEd7+WOBO4Wp2kElAzCSUcoJQIjlgg1iOo98CpC9tx
         6apDCePmVIaHm5xIqldJEdEAb7SZJrgZMdB1wFJkCzw86MiMHO4czHzGfcHbWYPNtOjp
         b2PLlJH7fP03IyNZG5LXDEn8E71yANJL4QRdNYEAO6ZF6mgHfoFdbZvgT7sHZetnm4qK
         /BY4FTkUQEdOOX2z/TeLmqTCZVeemYjVGTponQZi+itCiVyQYSVy1mGuDUOV7joAqYXE
         LvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrcNU90VpFS/o4w85jow/xpZ/ZIHI19gP4s0dZAzYlGNtOWx8Uku5KvjMRjfYyMiF9iNOhmMSu9A1N7SsWLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyul1okYmNpNA5d6ZzA+B/vKCInNRZ7jCgl4TWuTJr6kIGGuIW4
	FHyy1hIfjx2CurHX2x15d1HGcsKoqlBwnWmqTONJGPuO66XLkyPx3ntKEJ4+5n6A5OKRVMB+/mr
	PKan4MW19OYPQkR6coS2THaT7lCAPt9Y=
X-Gm-Gg: ASbGnct1HWIxkk4N11jikrcg8qVnZfGIeCca37BLQgtH0kMS7xUWQWJHum6v5lpbBE7
	bnLe6ZzJjM+Zxfnr/Mrs1s3YWjmoH6a6Cd06K1j79siXO91h1eOn12QEA1C5Ed6cL2F8DTFPB8q
	62zP4nJNRDGaT/wabHyC+gFB8CV0AuGbcW9OAL3wqAdPUD7KgfgCz+XG4=
X-Google-Smtp-Source: AGHT+IEmGOFpoBJAharVpKxEGP+kT3JHv0GhBnEjE6VvCorsSJEK8B6zcLb3kqary8KNh3C0IHg1H1hO+wnnQ1jZlEg=
X-Received: by 2002:a05:6870:304a:b0:2da:b440:5b1 with SMTP id
 586e51a60fabf-2efceee0bf5mr3184497fac.5.1750957164792; Thu, 26 Jun 2025
 09:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org> <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
 <DANRU0TC3F11.30DUO1LQZUE42@kernel.org> <CAPZ3m_gBEBfnCHtcFoga=HEi_acr6-eJ1a71VgrZDJbfrCz=0A@mail.gmail.com>
 <DAOMIWBZXFO9.U353H8NWTLC5@kernel.org>
In-Reply-To: <DAOMIWBZXFO9.U353H8NWTLC5@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Thu, 26 Jun 2025 13:59:12 -0300
X-Gm-Features: Ac12FXx7be057Up6x4A_gcxS91ot4-C2g3HC8fYFf_Yj3AZzUoT-Zesxpl6HZYw
Message-ID: <CAPZ3m_ge=epGKTuQEVqr81Aq_xTa_e4Yjo_Bn0Ox1cb+zEZctQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 17 de jun. de 2025 =C3=A0s 04:18, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Tue Jun 17, 2025 at 4:49 AM CEST, Marcelo Moreira wrote:
> > Em seg., 16 de jun. de 2025 =C3=A0s 04:15, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> How about:
> >>
> >> // - `self.data` is valid for writes because of `Self`'s type invarian=
ts:
> >> //   `&mut Self` guarantees exclusive access, thus no other thread can=
 concurrently access `data`.
> >> // - this function is a drop function, thus this code is at most execu=
ted once.
> >
> > Ok! =3D)
> >
> > I thought about using "so" instead of the first "thus" so I wouldn't
> > have to repeat the use of "thus" so many times.
>
> I personally don't care about repeating those "filler" words in safety
> documentation. The clearer it is the better :)
>

Ok, thanks Benno!

> > Final version:
> > // - `self.data` is valid for writes because of `Self`'s type invariant=
s:
> > //   `&mut Self` guarantees exclusive access, so no other thread can
> > concurrently access `data`.
> > // - this function is a drop function, thus this code is at most execut=
ed once.
>
> That is fine too.

Thanks!

Guys, sorry for the delay in replying. I traveled to my parents' house
to visit them :)

I'm sending v5 now!

---
Cheers,
Marcelo Moreira
