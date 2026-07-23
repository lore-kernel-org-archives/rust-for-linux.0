Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569B230F957
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 16:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823662; cv=pass; b=XCos+TG2sY+5UQo6obNfz0CtzFFaqaXdn959KKEPt/qG9V5EsZa5qtf1KAEs3Voj17FwkItBoFFYDkBmBxNqmua8ANcJ4rY72dcjF5NomtmJ919mT+ni1xgqwlvaM4eUGtWF2acpLEecSs/33c+qSBbZysTvvZq633lUwIZ1nkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823662; c=relaxed/simple;
	bh=P+ELKoKmw5E3+7HvnBcWotCSfG4KFl+EGoOYnJfNpqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kod/TgrwfSjGidwnXj63iIzov84RmQnspIisDh4oVMF/oMf8VRpL6qEGuvZldpC3WNcDxYIV/mAuEJHzuPXM24kgLsGqWr6YsyvPg70d7PU+VRJrfUY8/lXg4wEVvRQe0tLpCUyFfJKG6I+JrIeEmeJVIV2a1Ijb4ki7hOIwcd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REC/+dHk; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REC/+dHk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccae46de39so1753705ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 09:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784823646; cv=none;
        d=google.com; s=arc-20260327;
        b=RhHUpssSSorNmrwZh6M2WSSyquJzGGXpT5WOwc025sP7TbVZovthjFaFkc2nQpfIse
         4AYuum7y5aEBBKiquoJYGSvPArB808PpgnzO/h2KFmPnrxzwY3wsKzADmZrM25OgkKT1
         1Zv4YbBvq5SH2OPunKuD/YrjjgzVgrNKShZZU8hW5mzRr9U1LOueM2pNlz1P4Gkuv49O
         r0IbrIWhoTF37E+mP7ydYVl7tp51TMs73y/ZtDtliQ9p4M6Sg+Hx+67706CrJolAakoF
         Ztx1ACe7F75kRHHiThJnkWcQGz8UdxbJQi0TkijdJ+w1b1P7M/vJJJ1aNCXhbYx2Uhfv
         HJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P+ELKoKmw5E3+7HvnBcWotCSfG4KFl+EGoOYnJfNpqM=;
        fh=5nJQNuyUcv1aC7rexTXso5MhJ2tmdsD+3C1NYXDaROQ=;
        b=DFlmJPYLmzgUn1MqRIdpsQFuQy80XoRrMK8RZ6ARzWEF2l1lMu6I2RZscQqU8Wl81V
         hi7hzICUM+3WCsv5vMnH4BuZwROe50QtZa+HGl0foEMDCDiHjph/EOC6Mjob7XPikuLB
         yR2RtRs3WnDsM8CVSJaO7Y6++/mhhPaM632qKOX/fPc2K8O7QyhZ/d+oqMNc2rk+nR22
         GVzPrrnXpNmERTA1zXo6wPgDX1YN0zlJAbDJZGEG58bYrxKGPUM/u0ocWSjhlTvuemOB
         wikcSMi5ugBzwwvgrfhIYGacF4D/WIzw30lhPsRYQRTwnc5x9omgWI80iystY0eH7/p+
         HXSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823646; x=1785428446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+ELKoKmw5E3+7HvnBcWotCSfG4KFl+EGoOYnJfNpqM=;
        b=REC/+dHkq6jtCu/Djf67QgfcJK3dYEPMf5OSmpYBJ9VSKGzz/s244Gp7jNuyQ3AmFs
         NQFGnr+MlVvemy61Cc39MNnDrBhy4KOStRE8a4HHmlU4Uq/Bl5nyXFD3q3B5oGS33s3P
         Y2HTIJTZ6G8KMdl2cV14PdPD3Zpu9w01TyIIpX9iy9BTkVMcjcova5iGWjEhbcGKABgr
         pdZfXJnqiO6e5AgKXGFMktitF6J6elZ3JiLcXTTbyoFtToWx1Kz3++jfBsyS1SOjZgFp
         NMslZwj1K6sH2tkJJzZ0eknuEuVOZi9QjP2umF+QLEEF4DuVLeyxnsTR0Ezgcvt5WNQ/
         Il/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823646; x=1785428446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+ELKoKmw5E3+7HvnBcWotCSfG4KFl+EGoOYnJfNpqM=;
        b=A9NZh1nUuqyGM+cWTCaAAVMJpjhNdZ4IPXdri1eK6SWRN1edxdixags2MuxhCREDL3
         jnNTUGGIYFXjTf7fCLQRyEd8OD3u6sErTFGiuruFnQuqCEw8AnZMpWw4jhvHFFF1TdC8
         9cdAj27JdelutKt96FSXKihTZ6rLmOeWLJ+U58JZmGmZ/RWmwdDuNSnvFXddbQbR0L1e
         d4dMATensGHoYTCGiDtl4UdtgfMU25XVKs9TyxLfGOrPFANJR0qlIlozE3qo4xUMkrkw
         81u7wS1N51qfpljWF1JgRROO13Surrc0N1GkYeiUbqMILdR/Jq8p6hRnjGijDDifsKy6
         uwLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5iCTM5RG4RZgVrx2MRx3DESWgXsQHS8SuBi3tqm2FX0dtc2tX6yyD51hDnjGfrbYBP/5PkzciKj/rIxYsnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNteVDBNCbDcxFY+v7acc7HtxZjtkIfQ4y1UN+HJnspSOQV31
	6potdtXv1xz6kUfYeRR6qtGbkeeApCFCh4IlRta/IDKlK473RajsrHq8Xxp4aW1Vv87fdxOI2Xp
	Ze/GBj57OgC1LRPTZfiLyS7UqB0aJ1vE=
X-Gm-Gg: AR+sD11xxIrGQZMQeBed4WTSJaMFJOnVquGZWxGVI8frXhSW0d39BKvOy6Mo//dJkrs
	0ubcB9B90MbfTe1oi79HQL2csUoHpQjmPEYGMhuql79sY5mjH1kl5nYmOhGnL8CRBDyVFMQEPyq
	M+Ko7eV++OTF+X5qlSUbO/G7cWGt72jYyuWhTQmEg76U69OClxr08nTnixjZHB/oVNZYteAIprY
	oe+mg5NzSW0zByHvsOFS/kkH/iDVMTXbpas6AhfKp1ubQAMBDExG+XwbuZwX212sgK8fHIPLP8l
	yQHCMyTa5jT7C5BBs9Po5Gas3LuWcKTaRUGhELSN/+wzhbxaClMEj/UApzE4aC1R1jnY8BvFJj1
	W6A==
X-Received: by 2002:a17:902:d986:b0:2cc:df15:91e2 with SMTP id
 d9443c01a7336-2cfbd6a9657mr2470805ad.7.1784823645683; Thu, 23 Jul 2026
 09:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
 <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com> <20260720220915.GA3368142@ax162>
In-Reply-To: <20260720220915.GA3368142@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 18:20:33 +0200
X-Gm-Features: AUfX_mzmx1q5rjKQ-n8isfAVER0h69ZqIAoo2jUD7ldXQsEK1zD4-8qpgtq5IXw
Message-ID: <CANiq72=6u7iHQZ0xVuJRU=gm_p7AgNuzhiyUhf_1DiRd=xwr7w@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Burak Emir <burak.emir@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 12:09=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I have updated the README to remove '--version' from the 'cargo install'
> command to help avoid this. The warning seems like a good idea as well.

Thanks!

Cheers,
Miguel
