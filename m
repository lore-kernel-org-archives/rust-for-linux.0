Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFB2253A5
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742559126; cv=none; b=Vlww667BMk6vGbUyeHZ0dH4dCLOxSTtBIua2u1/QM6Am/Lsz3zDjEldXGyYL1KL4bQU1PXVlSx8lzTiK4PGXQAtrNbbDREReVo7+Vq3Y0yZTC27H9Hbve/4YRtwyyJ8eHrmarl0m69xHQozJ6NOWRj1w4EsdzztFRljjheQRW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742559126; c=relaxed/simple;
	bh=UNNCij3fMV5Om5k9iqqBpbqo+0QEFQXW5NWRoa/bHY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJu7SW8O+Ylv4qWOLJ0Jsqn8fKAiubF6UyDNuVTtKlY46CbtzbFr8Kqa93ClJqZRke5KwBOBvH9Y24Pt0CYz10fPz0jCJw7fEJB4KVgGFUnJ+jzQ3p6LpkHh8/7B1FBqrExbQO9uBTP/vxmfeRoL1J3Z41OZ/1OO+yOSb6ChyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqLqPeH8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqLqPeH8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f2f391864so1055530f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742559123; x=1743163923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxPHoqhgPR3ScfztQgxMw9I0oJllqAs23ggh4XWBe44=;
        b=uqLqPeH8SXL9uJ46G8BR/pzliLpuMA83/himHieOyhAMlVRP+GUKt5GXb7Sak1Uze/
         mooJuZUFpvHwBaEpNTh3EPaLaFTEK088EZgK7LmyLinuChslWfD6y9XYjl52WMSJoVu0
         jspEfWtQPzkJIjjjJFEqUppatIYeONY/4BF2GWkamBurO0lKcaxcMLc/1fYQCfLDP3WL
         HT3SHZyfn/oLUQUuyrB0Bu6DFPf7xXYmCpkOxX9WnaNetIC98UQKc/3aJPfWeEzMEqU1
         MPrAQR6R0t6egvdteO95xFsmu3YeCGafuBIPtvxtIgZtPJCJ2KagEJjOP8rma7NKW7bO
         5ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559123; x=1743163923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxPHoqhgPR3ScfztQgxMw9I0oJllqAs23ggh4XWBe44=;
        b=KGbW8xSRcoUMn48RSgbl0RNmUK+drDjCCJ7CjepS415nulHftkcyos/wbjoJ8HKuoI
         /UVe5DC8Ck7doRNBCpxyuHBuBHoX7qBtnf6DLYyPpfDQP+wsq07J+SLS2PXr2+hIhRUN
         GjwJuYNhEUH250j0L68fA4G417GtgYvbp9USr7e/pPrTP4IyBjpgQbv2d/7vJXDmgu14
         h6g8shYI2p/mjKXtxHHRVapUBIQSnDLo7wlL/+M5oka5yIbWLYkxQXh4lwElMEWSadAz
         38b3IpEvYi/l4HVgIO64neZLJsxYAU7+zsmsz0FIq37FJT3/E8HtGIKGR990J8sOiCTA
         zHyw==
X-Gm-Message-State: AOJu0Yw5wiXu8MGYl0rw75D1noJnzuuF/Im0onGliJdelw7Yx3tbE0qy
	KGshgXlLzDXnmZoJ+S3myKkUctT9a+XfJKiQS1ReXhla8IKWFYeihKyPlVJpUHbHWcBgc4e0ry+
	IpFKmH4z6QYymsSpA1p+MvsLyAH4mgkt4sasg
X-Gm-Gg: ASbGncviHV2cf13iGAmgSlue3pk6uPXhYjhRgeMxbDCYuoMpJu28Q3XW0stRS5rtqUm
	jN6wimBUHDcQd+/ppjdwqbZxEMRVkB7itypPoIQCGlUWKgAJuCph1av6ehWKKBz98B2GCLLVXqc
	I9NQIvuK9sSNKCYGzGg8gJBtSHdtH0LIQ+4Le45Q==
X-Google-Smtp-Source: AGHT+IHcoh8/QLn7mrObj0kGT04nCNT3y+m/6M10pyXOF/OwjgtcjH1lC6eTC2KVDOD+2C0+ZdF3uSQni3goOcVZ8S4=
X-Received: by 2002:a05:6000:178d:b0:394:7c55:7030 with SMTP id
 ffacd0b85a97d-3997f90e02fmr2478820f8f.30.1742559123170; Fri, 21 Mar 2025
 05:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
In-Reply-To: <20250320-vec-methods-v1-0-7dff5cf25fe8@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 21 Mar 2025 13:11:51 +0100
X-Gm-Features: AQ5f1JqeMlZW7mWOFw0Am6uJ3EhRKQScUKs9fqcHcnY5iXEdr9Vcqb8rhgOVseo
Message-ID: <CAH5fLgganhjZjoVipYtMDpVMLYy4-k+L-TRG1zo31OCWvXsZWw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Additional methods for Vec
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 2:53=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This adds various Vec methods. Some of them are needed by Rust Binder,
> and others are needed in other places. Each commit explains where it is
> needed.
>
> I'm not sure what we concluded on the set_len / dec_len changes, so I
> don't depend on that series for now.
>
> This series is based on top of Vec::truncate from
> https://lore.kernel.org/rust-for-linux/20250316111644.154602-1-andrewjbal=
lance@gmail.com/
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Alice Ryhl (5):
>       rust: alloc: add Vec::clear
>       rust: alloc: add Vec::pop
>       rust: alloc: add Vec::push_within_capacity
>       rust: alloc: add Vec::drain_all
>       rust: alloc: add Vec::retain
>
>  rust/kernel/alloc/kvec.rs | 147 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 147 insertions(+)

I went ahead and sent a new version now. It's a bit quicker than I
would normally do, but I wanted to get it out before I go on vacation.

Alice
