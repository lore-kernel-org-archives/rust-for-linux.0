Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06832ED58
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845710; cv=pass; b=NUgO+yATY8KqwY2wmYg9nMQ6YLS3UHHGyIg5cLp47orzuuYQZJGk3qTKM6DbLkZcGFHr3HtBqJp+JfL3WWIccBaQazGD8oyU2jgY9On2JoyQbRqZI569Q10+mjWdvRlQ04+2WAOH28Xe1YWCumiKq57EWfTy7fzTnlLzq5vqAMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845710; c=relaxed/simple;
	bh=Oimec9R0aCFMLabyDlzla37quguLmEv21TSD6RGlpLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkGaPK0Qljt/7hRDWmJY1i1HCUN0X11iNR2j29pMAw4tw23HOORVQfqcWZTpM3eJNj7JNoj2GqYODVfSBVd5JkcdZhGJ3ir864FokK8dQQNCqSulamtqkCUuB//shj/hQuektF8ysXzweXxE+KkbFy9WPYnNuWs2MntaZKnH1nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJdbRge5; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJdbRge5"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12336c0ae91so411951c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 10:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768845708; cv=none;
        d=google.com; s=arc-20240605;
        b=kownJ8Jz6djy/M2rzlGGWPRkVsIXX+t+HSAIUY81lMtFmyCz7qhq7X0I9t5ELHtktB
         5BMcKimtOdabqYH+jq9uF9Y3nS4wt72PhTaTChippsIOhef1b+EHqZHKxptKcvfEcymf
         b2aZ3hKizGjy4M1s1zJoDyF8AnpOgjiHyNx1W8PLmuKBw5KJhNdbmsylCgoI71oxIhh3
         nsdBIprcTacrk/QI017CGd3Q9+wpB/av7xBYxbaZ8gqYMmc9WKik/mzR7AByQ9RWdY+q
         Z2lSSLDpacNwb/3MEnzqrJdXeu7O489YM58gxxtyhVk6oYgFynb8YiEOznuXhNeZw5it
         GyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mj1iZoozHo2mgRESpJHRS1ASPF5/w4G9hbGEhm4hd+o=;
        fh=c/AnM9r2eH+hjdOgpUbZBhhDo7ukmwIZsJ+AeNUkONI=;
        b=FcD/FRAW9tg6Ru8MA1K+0l0UwPc1obozYT0TG5VUfISnkRSOzQAWfCwTCCg4Op1zfa
         XdQKF10sQcXz0XzWAG9CRlYMKjZMsAucWGVmn3JgWY0kfO2rcvdmdIBMZxUPa0EFayrZ
         X6Kw3W6VW1GGueSL9FHlaSsuewaBE0I+df5YNq/PQ/BH0x/oJghiELwaEU+VgbDtSu1h
         JDgK+WLZshC34mvMXHstdkDP3xic/03xZPY91rIdir0jsNryOpPXtxEcNvm7kW1BkBPB
         WCjN6NrKPqH93sTQLVmd0ZBdzvHH7amb9chPLsORx9rNamK8vMZIglICGbghe9UXb6UV
         dTNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845708; x=1769450508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj1iZoozHo2mgRESpJHRS1ASPF5/w4G9hbGEhm4hd+o=;
        b=CJdbRge5s0pPvmy3/e23f6abZrXzcXc5NwsFKz4S3xyxH22dxH+zB5kDMidXoFyuMl
         sC3+6K+lzS6VirlURL/epg2X9iSjfXIF2FFXjyqaq2tE314i0L5bx+8uZxT7mgyBtOZs
         cc8gbQMj4Us5Y9zITm3Vd4TiSQSQc0nu9eKG4a+08e964A0TV/TeJHKwx7W01WO24Vx3
         HYK1bCkiZkaGCZjrqmuCIvdsurAewdRGEzikx8+HK4v5CMtsUcHgHP5EYWebfH/pvYAj
         2ZrfMTEZSRIEQ5IwA/3gFyPvb8QlKO6CBB/D5X7FVNbGzYclPDpvzxsaFDYw3t8BZN6o
         3qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845708; x=1769450508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mj1iZoozHo2mgRESpJHRS1ASPF5/w4G9hbGEhm4hd+o=;
        b=E01IifXRDlbAhTdqGYM+z+LN0OBAdKgCgDICTmwY4v07WbvB5JW2xLPhzpIHX9puW9
         oSwrgVuWzEO4lF6YMCfQ6AUK4/VDQpBGDNjJ7dtKernahOwkXWJFRi+tVwERmDXBlGUm
         G8zUlXKDtTpuCx3aCogzazt4axTLdoALtP/YCu/VgRQgcwlfQu8LGFpiROMJg3B5CtXM
         x65N0GrwAR2GLiSIqJrjBOpqsYdPlRXB5ag1GTuDUzZ2Bf64v6CwvOEWeEbsRMVMAPg9
         YY0vkGNFhSk+4yDvEu1yZo3DSw9Ys3J6HsvPT6HpVMaU9zu+idzOX23S7aWKpvt4x1Tq
         px3A==
X-Forwarded-Encrypted: i=1; AJvYcCVO4J2tO1irx1Gt2BlY09IcnO4+TRJSrE6TTSAwukbVSi3/gSwm8e/8HnGyWhCQmodKLAjLXTuw6iTj2saQzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6X3iu/+tUq/PdzylfRHk6eTCJrbgY+OVZhV+pW7EKZjNbFHI
	+yuTDE8cPAMhOaaiX1EOs7QKUt2MTM3EX6EEyVZfM4fIjT2E7eRvQaugHVYg9m5SG+vhATDTTjr
	3+4aMGkxOtCqdvuVAuKKEsuLjfbR+HFs=
X-Gm-Gg: AZuq6aLgICotDSXqt5YqpaNdpNsV2hUJ0qeWGG9d4HjiAXE+y2LaYPPCRsrzx2BgiEo
	OwPs3YPNHtE9dg4Rt+1dbN9pQuTr6cO4W6a04+X5bmM3v7sCixFtoCEfbaJJuUwdKf5iIn7nUW5
	Bl/EBCxxlJuNT5m9V/nonTqnssvfalt/SVd3OUJPZ1kkjA3bNyc9DUR5Utjbn8jietrmNTcjBR8
	SwjFfe8bxSfaxzjDHE4/MHi6LHqfBI2Mxalkc/EGUnwYpzjXxx9xM5sTeNcYxHGvyR8bG0S3IY6
	s0RHTqThxOipL7rNrkk9CM0n3MAL6/WPB0q2sjQ6kXsQZ5H88ALC4jw6ymnNuo91Qp3F7EmbJAs
	XCL/zV9q0HT05
X-Received: by 2002:a05:7300:6d06:b0:2b0:2e6:5363 with SMTP id
 5a478bee46e88-2b6f6f808a9mr129151eec.1.1768845707489; Mon, 19 Jan 2026
 10:01:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
 <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com> <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
In-Reply-To: <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 19:01:33 +0100
X-Gm-Features: AZwV_QiT9HJYrgBsJ2EfKS49UFQygV8XYXgkjsQ2HaIze_49iHqtRlkRLMtga98
Message-ID: <CANiq72mSxtO0s8xGhgYemfz9DvvwDzC0fsF2covGFspduDz5XA@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 5:53=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> I did, but given I'm more or less rust illiterate I would welcome
> feedback by Michal Wilczynski. I only now notice that he wasn't on Cc:
> up to now.

Thanks!

In case it helps, for context, this is part of a long migration:

    https://github.com/Rust-for-Linux/linux/issues/1075
    https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a9152403778=
3@gmail.com/

(@Tamir: in the future, for patches like this, and especially since
the patch was split from a series and was a multi-step/multi-cycle
migration etc., it probably helps to give maintainers some context
with Link: tags to the ones above).

Cheers,
Miguel
