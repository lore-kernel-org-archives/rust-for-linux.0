Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971C1A0B07
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728912340; cv=none; b=tIYK+ZJSCNrfoArzq9k2pVYRyZ0jGyRA2QB6/cslzuo3NraZtC7mwPs0AgEnZWj61zJc+supYpmJqVDkS71wHslb2QVrRDBm6GN1cYoKRm2xUHrxFRHdASiBN6e2Zyt2iuNfprhxHc3hAJdk74iiPP67cGxHynb3nrNGtcw0lyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728912340; c=relaxed/simple;
	bh=D9ULmpwo07CAG1hQ8yl0FcU2WXv6pGnxGIrk1yXQUBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDYqLsgL0VXj1PILer0y6JNBY2bp2IFLX6TzSA0ONdqbLf/KABtZ24aeOAjz+ePQP8Nkt19HiCSb4kAz2muWndoRtJ7hMPj38T/7wts4JWOxRGt21Ca7RUoKHg0KGhvEhs+MamZ6bSeqKxsLi1pfUTmUPJxluyP6X4tGwkHtFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qwkdnois; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qwkdnois"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4612da0fso3078559f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728912337; x=1729517137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcw6vFzAeM6V1uYExGMaM9DjMaXwb3dLyeYvVAn2Ehw=;
        b=qwkdnoisiZ8HyWGLX2ltPO04PWpqxbe52Ns1KcVKy9Om+k7y8CpUSHqDTZcDQwJu+H
         XLUhuBfqR0URS6iWS7xkqcH/BvH9bM45RqftYo5sZP6llVffshpRo8zpp5S4Kk7JXEsS
         AvarNxHQY8KSchz146CD9VgEZgEG3DXZXLTxW7cpuHwGe7iqKqBYKg53CgQMzjvXLEBg
         9j+oty1eM6PGw5wFXlpPANWPJ+h4ZWf6nC5bmri7q0+BzKH8Oy83o/UcqcI+u04xDlYv
         zCYX4LdajnOEfUssrEcPFBFFNcp668bu5Yx25iVEhYtYVFRAn7s4I7T6/WVadRidYghZ
         WS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728912337; x=1729517137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcw6vFzAeM6V1uYExGMaM9DjMaXwb3dLyeYvVAn2Ehw=;
        b=MyQFd3lwMNIe6pTNks3yV/HsedYg9ebCpOM47lv4Te+aQiUlstgqDaFve3ib76bD1n
         t3MqqlY5QRIdx7M0iTfjXhmA9K7L0ZqwKstbN6wvnygWcu/tjIKJZwLamW4zagNDSLtU
         hyYQXTkJb19A85ruyoNt4VwR3LmQUFELUF7DT0husIBt46Tfl+Okdn926oSXB6KuFzPa
         zmjcZ7EZw2doUIPbhB4G/MMio6mBR3u2OMSs+uKRzfwZ0QGASF2Vua4Z/GNU2r067yyC
         25Q/Y5P/T2kLCLU0ZyUJdILDoTEd0L+vzB+wjnoSPdqXbKH/7IMkybXUZp3+WxHdyqna
         UI2A==
X-Forwarded-Encrypted: i=1; AJvYcCX9SgfakRLh1m6KpWpvNG0PCk0NQhpGJAlCZqpD7AbUx1we4VBaZRFq+TnZetYOzuGmLiKjxtuDUaXxSh2OkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBe8H7/ktWfOP2ygxS1kMu7OmaQqbQaymEvSphkx9z76YjQ0I5
	JQhQTXiUzsrpArrfJOcN1fA06mh9eKV2qaRYjCrT2hp6wOrsNhGtlAtVy/3picBfyddsziZ6Sa4
	60AHdAI4Dm/why6Ghd3JCzhitQenGyxS7VRqc
X-Google-Smtp-Source: AGHT+IGh9g25AxERQtC7Q/z3tZszAdR6jVdmK0ErRScTUABwGozUjqMJMTLChIuJXgSGz4cvgAjijGBqFoiI0/5liCU=
X-Received: by 2002:a5d:53cd:0:b0:37c:ca20:52a with SMTP id
 ffacd0b85a97d-37d551d4f7cmr7789713f8f.8.1728912336980; Mon, 14 Oct 2024
 06:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912-shrinker-v1-1-18b7f1253553@google.com> <20240914140745.7b0e5d5c.gary@garyguo.net>
In-Reply-To: <20240914140745.7b0e5d5c.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 15:25:24 +0200
Message-ID: <CAH5fLgjqksLOOzEyPBDN6Ym9DKpuifdxte2a+NJ-GNQoyUe35g@mail.gmail.com>
Subject: Re: [PATCH] rust: shrinker: add shrinker abstraction
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 3:07=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 12 Sep 2024 09:54:01 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> > +/// This struct is used to pass information from page reclaim to the s=
hrinkers.
> > +pub struct ShrinkControl<'a> {
> > +    ptr: NonNull<bindings::shrink_control>,
> > +    _phantom: PhantomData<&'a bindings::shrink_control>,
> > +}
>
> I feel like this can just be a wrapper of `Opaque<ShrinkControl>` and
> we hand out `&'a ShrinkControl`?

We need mutable access, but using a pinned mutable reference is too
inconvenient. I prefer this.

Alice
