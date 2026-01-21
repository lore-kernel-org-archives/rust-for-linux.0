Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4BE27E05F
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012155; cv=pass; b=UB7SG5HwBsz/cYBpB87PPwgy+lPzYkBZUeEahmcBdK9hhCqKOv4NwEZN246z0LOtfI4i4GePV3RAbI8/4enUMMjcIBf2EDq++bWDGVtBYudpUbvecquPNpBaFi1RDBopANPAsNm3r5EujU402/oq2NvV8kqQUPG2TMIebaNF/Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012155; c=relaxed/simple;
	bh=Lw5TOEBKPbC3xMIPvWvK1IG5veJJFpvyh1i0zqMsrnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkwUdY1bPI6ttl1+XFzWG21c8zB2/SBZ5dWr769kWZY8/erK/2Op+NYnM68yZec8chQV0NliZ+hk3Mz4A6poyUG8rt5oSUxmudHygNZXyLEcOkTm1AIm709Ql9f/S/XxOnYgBTyoDBicavMHKM87MdckXK7NOJs0+KPKQJuTGfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmOsUAlU; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmOsUAlU"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1233985e56aso4723c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 08:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769012153; cv=none;
        d=google.com; s=arc-20240605;
        b=LesGJC2OZ6kpLbvcg34Zp7FREbkWB8lcyNkhrgBAaBNCcDloNd2wMyZt/F06StvneY
         x6j0jZLLMbxrRZqqYol+FzqRP4HXE8Z1gckBiaQx2D0A+6jtAUFkM9Z9U2ekhT9nfPGF
         pK26Ekpn07uR6AEYQS7OggmquHuNtkHBK3V3VbkSwMQU6ZwGGY5w09ITTSEzyQdFubdX
         sBLHonGywVkXXnED9iDmRksMWd8YhSA+LpYtB8Bmr6KUgWP3DT3B5RsNqYAnOHBiNXuF
         r7nTnF0qWb/jsMsXGJGuLM2mCA6NH94Rk57WJnsV+ofmV95XTKPjJ6qp6DHlsTXfoTps
         N0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lw5TOEBKPbC3xMIPvWvK1IG5veJJFpvyh1i0zqMsrnw=;
        fh=fkgwenvTiUOdpNiYA1ROogBuZYBYCJfNZxA8nDWu5OM=;
        b=lI0jtuN4R+klEGqHUXJ5oWgDS91pIm6UoYrfoab8muoTwteWmuensiAwJd/QOKO9E3
         /+yUqbl5NBHVg09CqqzHSU2721zmRPnaAlnyL2zrMHk9RoQLKbGnb3eSY6feSzeaHcO5
         Km2LnQwjg0POMep04fPZ3xZPfC6+D0HyE8CedglX5Oi63lZRjbplmz4gZP1up11Cy9Vo
         hzEDyPyZgvX2EhIMhuA8g4oRsFt0NL+MY2vDdA+MCqUl3ySzcET5k/7Kh1SBRW3QYkGz
         4IckgQ2mjV7hVrXc2YvRERz73jsXVdatlKsFtezTibSTTFZ8vDQjImKt7ytsH5RH4rIb
         Yt5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769012153; x=1769616953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lw5TOEBKPbC3xMIPvWvK1IG5veJJFpvyh1i0zqMsrnw=;
        b=hmOsUAlU+Of/lrWiBZvwaDiESrFfS3AyT0VTfBpGUbwnCnpCc4d4ZRcSNjomnPder8
         VgExynaNMKy7vvb+n50VFoW/RNK8YsKs6GD8dUgsD7tahQAjTN8NUoWL3QoB6Ps6a4SO
         X4pMylYAAV6DZ+Cc1OdkSXzu70cvDi7Wp3piGOy3GyvBEsRzJD/CiOnM+3HldzrVyCwW
         2R8kukCJQ8ZYjOOtXMlDWBjLyaywJZkQ8pPDyDI5LK09AjN0EHnSRitlbNAW/UiUMh81
         qNzAhHY0Gp9Wh/eEaGY9+ViYrrl9QlTCsHOH5C8UZFif94N4sZjgf86YLiSMqxHAmvPO
         Cg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012153; x=1769616953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lw5TOEBKPbC3xMIPvWvK1IG5veJJFpvyh1i0zqMsrnw=;
        b=iPxpU40EzIqs3ABB98XmAH0cNKlL4F2YwB22Yu8o++DCTpqLiJdF6J+yQLPusSnF1Q
         zRcn3IFjgojwl6M+qGLX9lxSsIqQE2epDCLlx+VCPXORa0ODIEqP8/VilKfjeZQ10JMs
         DLjHvrL5ErBvExh/wDI6EeAuZP51BZA51pITBx0rPtiNcOF4VTrf0TYpKS63NMBMBrWa
         VJHe9ZoGddOZddrkYas0ScCDQcSnTdklCZED9eVVOetqzeMVSfUoGZ6mupq3hY8Qnwk/
         Bzk5buMMijljR09mHe6H2D6YuIZTVmmnbAPyTlXy4S4KfZTVpCyy5E/QSlDyTFMd71WJ
         D+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoFQpGyFwq/Va7QsgrVhniJpPgCHjnB+gH2DYaBW3Xc7NQeIU599zxwdaC2axix0Pu5ubBmgBXYd5FJhIr/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3oLq94+yR7OmUB+8c44yvV3m9J36lJQNGIzVaMuEf8/rIYNp
	EbKWqnP+t3jcFb33NnZGXv7+rATzrMfjIFjyhepWWf6JNNv5VxcoK5T9PmZPaXVkwlJniVD4UUP
	cgaSckfT21LHTdFMId//mcsURM5m2zRI=
X-Gm-Gg: AZuq6aLp0OCbC4ponS4vyVdYZTlAafFssDta7lErZGssB6upQjpgJSpS4apxUHYebIT
	61DhyFBTP4zZZh8dtjvLeCbRX5B4S++uUecxBspHph9+8SHMIQAf5jJwGOZ39wbVudTA7YHYqfD
	ztiDPCwsOV+TVKsmEvgWw26wGkM30/dDjU0Ut4Dyi9Izaq+AC0DZmrWrN5mMX0GddGsRUmlWeG0
	5TfAQrLv2KRI9WYPzRtfaxEcF6n3tpwASMwjRmJ0y/LHhrFsRwG+PRAWkT/HOFvItliFEGXQ389
	y3YqFyWxy+VlVqitNjgYPRfuz3knEtaahrv0rFKPQLV/eVD07PBuQRcIyQIYJIpvdmhtgfDwdcg
	Sx/4Yem8aV8np
X-Received: by 2002:a05:7300:3b1a:b0:2a4:3593:2c08 with SMTP id
 5a478bee46e88-2b6b3ef835cmr8206718eec.1.1769012152636; Wed, 21 Jan 2026
 08:15:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
 <20260121-register-v2-4-79d9b8d5e36a@nvidia.com> <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
In-Reply-To: <DFUCNHHYB6VV.43MOY4Y1NV06@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 17:15:38 +0100
X-Gm-Features: AZwV_Qjnn9fTKYXDhcPkjvSR5ThxGlzW_YxOJNnO82wlpzQxUtGlIq-hQBt9kvo
Message-ID: <CANiq72kkRJVsp_BNszRDy5DaQ6qKhB7e7g16qvEQK5gBtVrYug@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Another top-level question I have is whether we should define multiple re=
gisters
> (perhaps all) in one macro invocation. That's the strategy of `tock-regis=
ters`
> crate which is widely used in embedded Rust.

Yeah, I suggested a multi-register one for something similar in 2021
and even tackling extra automatic codegen there, like e.g. adjusting
the value as needed to get to the proper unit from a sensor.

Not sure how useful the multi-register part in practice it would be,
but it would allow to relate several registers together if needed (is
that even common nowadays?). Or perhaps things like the
interleaving/striding example in the patch could be done "at once".

https://lore.kernel.org/all/CANiq72mAYE6Wh8AikfuuNm8Asr4+c90_bYbj8XdBGJ1Pb4=
kzvQ@mail.gmail.com/

Cheers,
Miguel
