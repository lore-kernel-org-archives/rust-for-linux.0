Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031752F88
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567171; cv=none; b=dgbftPYSkY6KJv3YqgBJmg9oHzQd7FP665qv3i2mylmCAcSKI/uDBn7+8qFe0uN20f/DWFBt1ReN+ldjopZNqeAeguJRXZUZuzG7cjDD/h20UDJOczVgBnvRVr5TBOnnnYQ5TMYi8ClGTUg82iFsT72TOaCkvSl/662qCpY5HCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567171; c=relaxed/simple;
	bh=nZIsLqICz78c6hfikVApP88ONB3QI5IBIqUQhs//qrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlE43rqpB8z6x6EKooF5ZNFgHR1Ouk7Tvx81Ve02pmxfawsBUTUxqFT79k6TdqZoX07JPCez7jIZIQVq4fg8s66/VwmoCzQV2uXncuX4ljVuADP6ZdGh16igsWn/h1AJam7K8QtXsAPhtYdmGsu/nmKWMTE57Styvsz1QI2jkYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBw4vzo+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBw4vzo+"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc0dd142007so155733a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567169; x=1768171969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=md7D5KY6xlogVUgeuj0EkBRnXitVmzcnuy1u/7EnOXQ=;
        b=aBw4vzo+/UpMfyuPjZKy6CW5TojJbbekCKM3QJtSS6ZvBH6yv36bEmWsQsO5gcChQk
         3mYsy+b6XtMghUB+2mepPvI3tf7Vg1hDvP6rOuz926VEtMvaxq1YNtXrVp9YlF8pXVDW
         jP6X160wxby/AtxOVRwm1xflFcNT51Y40phWlzDWB+6WHGZri65ji39i8HYcRLtHWCLl
         dFkv3q0rbWJ6lMt9vBdVkTvTSN56YZ6p+8SQkv/E/OguZebpjc8/B4PIFVALzjngZ1Sj
         TcMaHqjFvujeLVVsokwCTG1p7JCJBRVT+NDKCMo22LZiYEybL0aKVwzm8qOeSGHfO49w
         LnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567169; x=1768171969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=md7D5KY6xlogVUgeuj0EkBRnXitVmzcnuy1u/7EnOXQ=;
        b=u5RPMl6JqIXKz5qgyfKIAhBpwACpCMulUB4XZ3L4JGLgxX8+RFrmGKnMcplkH7B3RZ
         4sNDUigQEUEuIdko9r5Ig5WRW58Ao+CNo78VfEsV6NfqLMPx/iFco2Sr2H5bxzT6NnV0
         XMaMzQL7PD10UF54ByNn6QPdDTbFKmKFq1UesfhEKyoLdq1mcWAt3qXVvT1Zbqnf2TOd
         68caQjxdliUC2Ah2Hs6M18MHa3G91r7YpHUrC1aMs2radNFFdCsgsWku55adSf2JA1XP
         m1s5QZxNuCskH5RdSZy5JWglkdfII4gydKzJrZEDN2BpDkjkXXCyc+j9V2b1ElpLPBkz
         B5KA==
X-Forwarded-Encrypted: i=1; AJvYcCV4I6e0MVOl9D7czurJK4nvc3vqGA5+Ka0FlBXR16yaCjTX2n+LF6KwI5hbh9/SB6ZBlmRsgJ+T2LZDSnLjrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxROmA3UdAIc33LJWkjxTRty0uzdnnvsvlwxg2KRHvfG8od4b9e
	1C1Ye15XtqG1tvY/86X+sJLegK6Sp2BnlYUs253LG7Zau145o5hAkEVcsyfRsjBBq58zM+chsJH
	b32HGDK707GLWLbOuoA7BuNsGEYygXQo=
X-Gm-Gg: AY/fxX73yIsasM+sd7Mby6fnfvYHj0Ytr2eBDeiFLGqbuWXq6dvQVZdeCnjbGgkAkcD
	GtAM4zg5UNjQqIL3Qqy5APMsHXQoIiUMn107rD6C+Q3oVZsaXmN6BVwNN08PpK4Ql6NfzbHitRC
	f76tqVnNkg1ATAUGxRhHMwHf/pFm7o5B2eO72R7hmsYW19S5973qBCIM/1ZHuk7H0tA2AVdsFBH
	T2eE5DzgC8af+te6HcXNGgjBikcF0LN4n3zPoozHLFhHfRxZIdAsuyU5VFt8A+b2q7ge3QQQREo
	EOsIM1ZOOm2Pd2A7ZL2CGuNoIwbW9giuS38T1mXYu+wMWxY+adQUTO5I1llDV1rsSw7lOj+ZILz
	10y2X1G94RpHi
X-Google-Smtp-Source: AGHT+IHANhUYg6jXxkQAe82Bw097VV36mzv99sFEhUYjod4Bjz3QzCf1BfIuZQEY8xJ0mk2RcgHYI6mcfYoEXWGaKM4=
X-Received: by 2002:a05:7300:cf84:b0:2ae:5a24:249 with SMTP id
 5a478bee46e88-2b05ea0b213mr16184199eec.0.1767567169448; Sun, 04 Jan 2026
 14:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201165601.31484-1-atharvd440@gmail.com>
In-Reply-To: <20251201165601.31484-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 23:52:36 +0100
X-Gm-Features: AQt7F2q7YO7YQ2VvVaTLX9CnfTi33tgBuUPNXvjr8JlpWdHoc8nxJja7RW-rfac
Message-ID: <CANiq72=YzSh8+6-uVaE9sS5YFhDjnrkKww8oasrq_Zee=aAr-A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: rbtree: fix minor typos in comments
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Yutaro Ohno <yutaro.ono.418@gmail.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Borys Tyran <borys.tyran@protonmail.com>, Daniel Sedlak <daniel@sedlak.dev>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 5:56=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com> =
wrote:
>
> This patch corrects a couple of typo errors in the
> documentation comments to improve clarity and readability.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1206
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

    [ Removed one of the cases that is gone now. Reworded accordingly
      (and to avoid mentioning 'documentation', since it is just
      a comment). - Miguel ]

Cheers,
Miguel
