Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69DE1802B
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Jun 2025 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749976720; cv=none; b=TyRThmv6NedgtH8W4SpZNWG5A1EelqsWSzHd4meycR8nJilPt5Xj3c0DcQjUYYLadvL+vLtVuKnzvJFEa6SBLG88DOpCQJ+GVaBWzDx60wLjLFyxDKAVPnqmop6Pnf/iBpAxkrQFUalIDZmwDLR9fZfgVLUa+a3QEWp/hbG/46w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749976720; c=relaxed/simple;
	bh=GqpdqYG3SmZeEyG0mKgTNsxyagIR3PV7QRGf5meeoEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcWmKHmV77d49lnc/weeL9+kymtf43AWMWYOR+6/VG8ZBeAJnasiqqzROJZB2k7dxDWlGBkKv2fF3al3LDA5fdYosWH7Cmleiyvg0vSZ7Pj5jhVOI+M4XjayLlHGuFskPQbz7fBmARLiwGFvS7SaUJT+28Xz37gA7JvxEgiE2Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+1mQHIu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+1mQHIu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313290ea247so619416a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Jun 2025 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749976718; x=1750581518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLvwaubuksMTRXeeJPIzvRu7bLq6nCgwepjMqI9u5bg=;
        b=k+1mQHIuC2pZ4mTny9KDxtAHVu3B5MsnytzW7dP8rX3PlD+6eOGJf3SAAlC3NHm31v
         I2b2Szog2GGIHJ41sM0OIHh31WPtNA07f9KsMWLFcKtq8qezkjBsu8x92xjtlEI3fazQ
         z3JOm9wy1rh2YDk76sarbhbih6i+3gTn4upuDTd1ZDcAGlLGW1aWdd95ex6E6YNsS3Hj
         znaEg4oDLsBGaqFu68J6qLV4YQQFqXL2+tdxePX69uUuMwgpoaNPHFQJL3Djq5ZsOZ4X
         /YUiTBV2eXJ2EtgH5CIKH3lS1jw62Vun6BJxyvGRlqz+ACApbvERi8dwu8k8pFGP+w8O
         T98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749976718; x=1750581518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLvwaubuksMTRXeeJPIzvRu7bLq6nCgwepjMqI9u5bg=;
        b=LMzrNiaCrjRsPicu1Hs6ME5B48L4WHdhlmayv/eIu6sdkR+j5W7gIFeGAg4oVwwpWz
         Q9buoHvlm6KZA26E7luSW2Xe1+vzF5o6xVWQ9zIKk7Qvdi5aH6HPsvN97uAzcr5Cp0GK
         1m8vtdpxfuHspnlCc7iyNOzBm6GxTf39i+jL75VjkO/GR1moQmRl7CWj9p50JSUhXSQl
         laZa2nDIy8LPoV+/bONz2aupydb9LQDVdGo8YiaUlIWh+JWYm6Y+DCsIoSME8WQmUX09
         8PwEzEPEBTqqwBtyO1un1S72OFft0Jit2WwTgAqRE2UkaYvGhrd6dH52tf10WSXzZfBw
         A1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIGknnqTGSll/jcsFSaYfx2CXcUpctI6Ksi1oJOlJeaIHT7bzpgD8d2s+XHH3HEmwoXrNmvX4XebZ3XduUrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQqGrzN+whsMJOUFbZVEGjL8MfvLNAU0kELIYKlxUGjLiXxTk
	PSWHABeBIqATZtFAo7Nczdae+exREWejaQfkFi0IqM54YbIbT5ex5MvMv/AHvPSJjQSoqndOy5d
	FFVZ4++bxqCw72bDhOyRHZ36T31yger0=
X-Gm-Gg: ASbGnctdhDw7rwxpTrgDWxE/lWBgh10YsZMce1YfphjXy+i7DVlECe2bESQuzRpPMfl
	3Ftxe7Mu4fvC1shuVVQ7jrhK9sWY27dLqtMMYpxoWUzok1iYpD/EnlzwosXfNbyVamMnBXfR9U0
	n6ZZ6jAOgJ+z9MKKGSrU/dMmTG2Dh8AarWqbNx5JND0gaUB0CAQGWPTg==
X-Google-Smtp-Source: AGHT+IFqGuT3SB7N+d9lUjTCkh6mp4ctxdDL9EneNY8wraSsQ3JGsO8ntgtK4uZsUqghgHpp0A/3pCBG8BQ7wLkFmVI=
X-Received: by 2002:a17:90b:3c44:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-313f1b851acmr3181879a91.0.1749976718104; Sun, 15 Jun 2025
 01:38:38 -0700 (PDT)
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
In-Reply-To: <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 10:38:26 +0200
X-Gm-Features: AX0GCFtpmq8oVPEdcMBeQ_ReuDW-BQr3pLR9aOPT-TzhTUpFUwdxKh-mOgwEF5U
Message-ID: <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> what about:
>
> // SAFETY: `self.data` is valid for writes because of `Self`'s type invar=
iants.
> // The `&mut Self` context guarantees exclusive access, meaning no other
> // thread can concurrently access `data`.
> //
> // - `drop_in_place` is valid to call because `drop` is only called once.
> unsafe { drop_in_place(p.data.get()) };
>
> I'm not sure if the line break in the comment is okay...

Benno likely meant to use bullet points for each one, rather than a
bullet point after a paragraph.

If you do e.g.

    git grep -A5 '// SAFETY:$' -- rust/kernel

you will find examples of that.

Cheers,
Miguel
