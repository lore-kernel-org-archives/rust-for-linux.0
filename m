Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925213D8B4
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Oct 2024 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992211; cv=none; b=loi33cGhMR9fFk/26Y2EDBXSChb4lwYzV00nc2bFDkX55jsOn63JJF0H2x+7PvYzU9ULBjN8xPPFgeLSF728gyaFf9xpIH4+9hT7QBKVbmc/OQVMeQ6a2l5QQlkHY51O8F/Ns3MLC9g7P2wSlaxh/jKWROe6/VBgXebuVAzHz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992211; c=relaxed/simple;
	bh=OPhFlMRQbbrsCz9iK6UqOBenHyuXkRMragr1R07yKPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOH+g7BZpETObxB9d06McF5Yf8lTAcw05Ir9MVhaeimYlGzcLiLgX1PpGxh4bQeDek329iCPLli64gcdy8cZ08Mcr1xaeh8Koeo32pMpbJST1k9bM+aQZT8DV0f958ybz930haWVdEgtsSJ996Qc7rCwPc6S64v7rTtI0kGYbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRuogVVY; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRuogVVY"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7191f1875d3so240909b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Oct 2024 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727992210; x=1728597010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPhFlMRQbbrsCz9iK6UqOBenHyuXkRMragr1R07yKPk=;
        b=bRuogVVYIW2V4AVq/2GHf+o8tID0L22HGEJlTs9r0aCydlCAlYgPn7eEi0Gtx5FDvU
         Y7Gkp9ymO9MJWrJQwzFgCTLP3+Eld3zrxPIWj6h64PoJpo7MXgOQFDb16Eameo8tPh1l
         FHcAExU1ra+zEHAr0qFIrAdDD8Xukksk5ym/Eqei/3mtVgU8hVJ1ABk/nf2i9uluYJVU
         OTDqnXfYknr0dMmkKL9/EHpjLLbFxRuZN88Vzap2TIT9wFwKpidFGeCtrzOI399LIz4s
         xsffXqgaghARC8VwD8RW+mt4swKYVMtE9O4NoY6u+s79mLThpJw3IJkDhngfZwkx7pDx
         /xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727992210; x=1728597010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPhFlMRQbbrsCz9iK6UqOBenHyuXkRMragr1R07yKPk=;
        b=ipZidCQGuuirozv0jSb87/miD0xHkD04b1trESlvHcvl4opLAJa8E68SRfBx6jnYGE
         cse5jdjUoo1kJ4qZhDshpS3ekmcJ6o14okn0LVsRrOU+d+X3qfttmXuk721CCvFkVaBx
         EdyurYqiufgV5wSiEOoIRBnCnptddlvQtBvMGYu/quKXcSY833qfMsiXb0VvzlewDM8i
         PZwe02Dl3vDtjfi5+2vugKj3WIcQxWz5LS7AZoXTBhoIbn9Hzrl6S/VdbpZX5F7XO4N2
         fBO/R3dGfTmK+Wwt23kXGTYOUY57IN8IQvi+cc5scLfCoegWVk45V/7Q4BiSmRNWYy0O
         EssQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnGdYWVl7nYQPFuCWLFCIwzVcb62sWXkgXBCrRde0MWOZhfHmuQhSGyuI5yZHyujNsx1P5FW79cNuHK2J5lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FObhnkWY+2iHRUUdXmscIsNw9mELFoqd6RygQnGlp1ZvEajP
	7rYG9N1lvgWT/lAtC4a4Xj1LEnwywzZ2SdEa3rrmIHhvJzPPRbt0nS/MmEvlz0j9fdkG7QJE8qB
	HnSbzWJp4kHe9W+YZfWlfstXzas0=
X-Google-Smtp-Source: AGHT+IGh7FyVVlr7NcgiqPAaJEowJUADQGaH2u35sg7+aHTXX5heM1w5Ecimpd3sfrgUL6L4Aom3zi/LWXLVYSzvOak=
X-Received: by 2002:a05:6a00:2190:b0:717:6bb0:53e8 with SMTP id
 d2e1a72fcca58-71de239ee55mr347325b3a.2.1727992209974; Thu, 03 Oct 2024
 14:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
In-Reply-To: <DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Oct 2024 23:49:57 +0200
Message-ID: <CANiq72=uioPPu_q8Wjyn0pwXkBmXMcyR699fkwkeFhe2twDXuA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: error: make conversion functions public
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, boqun.feng@gmail.com, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 12:20=E2=80=AFPM Filipe Xavier <felipe_life@live.co=
m> wrote:
>
> Change visibility to public of functions in error.rs:
> from_err_ptr, from_errno, from_result and to_ptr.
> Additionally, remove dead_code annotations.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1105
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Applied to `rust-next` -- thanks!

Cheers,
Miguel
