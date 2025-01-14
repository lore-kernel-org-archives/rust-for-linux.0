Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE17232450;
	Tue, 14 Jan 2025 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875500; cv=none; b=qUx9JMYffQto4dE4haHgj7n+ogPp5BnRWzAkSaqsJu9SCs5jptlAauayvbih6Ff7Ogf5ugQOQKZ5B9L8dLwpQc78wrByv6qbhe7C3Ll1MY8OostbctrHE3NBPCTdkdWQaCJnamnp3X209ObU2+0uozU5rVWEmEFH6kEL9FfvRhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875500; c=relaxed/simple;
	bh=IWMYQOUedi7yBbnpWWa+uIez662WnQJWuTgtPEF/Siw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8rrS6lbtUid7amh5IjkPpksmZAiWu0O+WHBEND1PU1F3GUTTuv8bPU0RY4rAHdTQ+uvMSyQdapWAYszTacvc2CeAPoDErvwKv9CJfI59JrM+gr6jnbZwJMy5gI65XvFNIujtJ4OGALAdjEf7iHtW4JOr+1w4vchjrgMv+fa2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2GYNLIC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2GYNLIC"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401ab97206so5705427e87.3;
        Tue, 14 Jan 2025 09:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736875497; x=1737480297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWMYQOUedi7yBbnpWWa+uIez662WnQJWuTgtPEF/Siw=;
        b=a2GYNLICqUMWg42E6dr7LZNiJt8c+VkSy+rCB4jp7jJHnBM3suZzT7DVL/UeU+YFlV
         ZE1f3MrtUbiNRik4AxP4i8TLzZz0LiLhhJB7GSZ0IRq20DkWm6f0YvIha75Dssc9qiAK
         U7y+P/+r95nhUTwH2zHoR9C85ZbESXiP8J09ZYp2odmwglZrUFq7o35xIj2bpd2TFUCh
         huK+N4sWba4rQoJIVtxGSUv3j7dhYPTx5kcONlBLhtS09LHha39BOSKlGh6M5rwPtlcH
         x+nMfytRlOaT7yhvg3jEQidYiICBQx+e4rD67ZBwp5Cj82MAeZfPOrPe3/l6MgeaVG+w
         OgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736875497; x=1737480297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWMYQOUedi7yBbnpWWa+uIez662WnQJWuTgtPEF/Siw=;
        b=N9ogJzXOz17t7obujjbgIqVGodA7fK/4bWsKguWzTTEz3YPyDD6lT289W+qAooC5VF
         H0ZowcUEsElLjtZ/pUP3CetPg+Oy3rs9nXxcJr7CozJzXmfhXTmxE7WmUu7mrZhTqJ4B
         gdBLjJC8f8X4Cx+/ktTyhlmuPRTC8l9ki5cDoPFR9Xx75zoCN2tkOfjeGikYCoA1TEr8
         JmcN0Ad74p0eyuwlzghyUsIcp92SVwDEAbY2GRuMtpOyyIW5uK9CnZCe8exuipwEgu0S
         Ix4eSomd6VwkDAJfEP2XYnaA7LftRZZTuBSCrlEgUHhO3ITokNyKPpSLCTkTO4B1Gy8q
         9o0A==
X-Forwarded-Encrypted: i=1; AJvYcCURWkWT1OskiMOpJQCONxCemsFhmxXFhILovKROcUsjzg8mCG51efuofINYdlE+nSkmL2BSzPFnX+yj7xU=@vger.kernel.org, AJvYcCVu1S0bMCZbzqRzw5zgrhH/g00eJSvqI1kZ3ZBiybhHbePYuk9u48asg7uugCw3gj7GAs6r6cewjhs1NYqHmq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVt1ww4bFHHJrQOoNmlMxjuBmc3ZmJ4VzLlfLOxp1ahIJ9tFm
	508bJx0ltu8T5a2UAw+RNJZgWgQvNBrpxwMeZRmIdwECTDg13ZVDT7wRK+BOMwupB6yIFWlCsf+
	KZgHjPrc+kDfjLn2l76KJYOvMfLo=
X-Gm-Gg: ASbGnct/THz3E/m5BX17z81F2EiSgkPkMDlA2UXavvHept7QpUKrYNQmn040TReFK2h
	5DlzO8MnMKZBKp9Idu7h76qkilNJzPCQK4/cAwzfPZJMa0u9yo/2EpCSTFUFse/CrVoaEhnk=
X-Google-Smtp-Source: AGHT+IHRsDdM9/6BM0sDIdQRxIDhKtlYI1WQqqfKotYkKXihwkHROwhW+2BWTSOUWT33wmuP188RFJkNYx43nNmpxXs=
X-Received: by 2002:a05:6512:23a3:b0:53e:385c:e881 with SMTP id
 2adb3069b0e04-54284547e5cmr7712576e87.30.1736875497035; Tue, 14 Jan 2025
 09:24:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org> <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 14 Jan 2025 12:24:21 -0500
X-Gm-Features: AbW1kvZ4vI4PDcOaQStW3N9mYkkgnjnuto4QZfpTwpmF_tvHiG6WHywVVBgsxXs
Message-ID: <CAJ-ks9mygX61B=FOgQegs3uReBHDju2cs6eFRohjNEX_GPwAjQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Add a method to get a pointer to the data contained in an `Arc`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Can this mention why it is needed?
