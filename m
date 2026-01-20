Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09603876B7
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943152; cv=pass; b=dvWPp6k9cIi0aZTI8LSx+W/ji13Qq0LEv7YB142FOto2++FPiZwU1/uOthV/041e/EsOrc8YDPIfMn2EApO1ILYKUHlOomDrrDMKq+G6Gh6tEJJ7Xbv+lG1VBaKkr0y1XlPyxAXRUN0TdK4+QYepSq9qWo5WNLlfavCk/OOtgPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943152; c=relaxed/simple;
	bh=0tVRjKWlzkB/xrr8iOw/a47cVKMLaHrPAlkOWeNaEdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lY9WBgju5Q0lLSAaGXb/3n1wx+CYVrtIU9l29NrLJM+gN7lwbakIQKrfKmKDRSSDV5L9xQUO8VRfvFIQ6ojLpCQKkdFcoLaQknjhsPWYEJ18j7380lD2xE6hjKC6G2aWrqfdRnkdWEwzuOT1oVUUruqNFNVfVTp2tFryvuFRawk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRDQwF34; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRDQwF34"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so56096921fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:05:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768943149; cv=none;
        d=google.com; s=arc-20240605;
        b=TSuAhJohVpcPeKXW4OhKem0yUigSN7+oTvfJ0ifod1jxilqrEFQxl7DXOZhliPIq25
         nC7SOvr+SRKJbi84DuKQcasFbp0gta6fkTjjqsPJrRzq5YO2Ab3UcGcVoAMXptQhnxoQ
         EtN5VkMzPyFuDeq18mnmKc9145XA8myjCrI45Ra2eDm14W85MeDzyN47OcuBo7CVUs15
         2bFtz25x31OOlEV0A/Ba+fO5oEfTjK9fxiO3CrvJGszWvEGy86Stp7/A44jFXCX6BHUK
         QJv4bSnHH8TDbz457p9qAS+lV6TrNNGuTzlov+CI90DB0RUfHHUDbgzdeF3XwZiJWaO3
         YG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0tVRjKWlzkB/xrr8iOw/a47cVKMLaHrPAlkOWeNaEdc=;
        fh=4RjnGgB7GWTMOw3fcD8b4IhMRD3EwlM39fzQEZHByqA=;
        b=RIhvZvwjIP6od2ZU696Vw0iuIEUb5cFeY+jyRtJHIQDVQTr+cmlbse+9ZDdFFwacYy
         Hdv73xx1KkcFLPJkQlVSClIrVlFVdMl35B9h5GUxYze3HPEMBPGbSJMhRaEcCrdFgbw6
         AEppZvqQm+MIC9uM/qywq7iPLb4nBZCTMJHNYddBOp38VeE+2S94Z9CcL0jimcBwGIX7
         v1L4FS6He5hWagkOcoVnHY8IMQ9LQhzs+Z1WvbWhEBai+AGVhfphGTDsIZoYtKnvGNHJ
         lqgDI1FoDvUg4s5Fjjgf82ISHs+thCCbCyR0hrPBJ/PqVuEDhu0LUWv6Ct11jxtH0Kr2
         emaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768943149; x=1769547949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tVRjKWlzkB/xrr8iOw/a47cVKMLaHrPAlkOWeNaEdc=;
        b=MRDQwF34Ulb+4ebOcpa9n2i1BEmlXc8vAgCXP4HMX+oI6xbbLk8rUNSpfas3sxb9DU
         Bgi/NbYJ/1qqZsu5fAKhSfATvTE6Xy3shFioMMZTjvYrViQAhxtp7anJYkmjabRTCdAm
         XULzO5EAYHwU5Q8J+VwxDUNXtd0jSkocxIqTtdVfgcKNZUc6Q7WShsFwh96ylHdpsEnG
         OdEmzPHd5lJK4Twu3lCz2uHT00X+PaF1/l4+/xCrJcZEDEghU98aAjAro6UIL+xf4Zzu
         KYj8U8zRlHcpyvyHIAN0afMMatoBKzjuz0SN565xdSI0Ud0ub3XUbfWUhVB6ONMJvDV8
         lFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768943149; x=1769547949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0tVRjKWlzkB/xrr8iOw/a47cVKMLaHrPAlkOWeNaEdc=;
        b=tcCDv2un4W5T83EFxMzZp/Azw58jsWQ3FEZlu/9DZyB52hXWzUcMf0t6FLw8iNYuHk
         55lLvLWj2jWSFImpLOgXLgReqHBsru055VU09qk+49+dDFAvmS0awER8dPRyksgIJuMv
         Tfc6RnJDXTBmdp2Bo2h7hLRtbtZzWuVROLjHvr2V7gO7PR+8Y7O+wKCZGNmQtKFB+nT1
         LDC/nLda1NO/4dV/gyseRxsdPQU9zs/PQElsgu0OtlBI0L7OYKxEJ0WwlTR3Ie5RDIIJ
         8TvvKEl2Ujp6qtQ4xH40w5iSSZnajc6W32hfY7bRpuit+t/fY/1bXQnuXcwpMvulxnY+
         SRkg==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ2oT9/3+0jhZRdmDEezBWvilbXQxrjpuXRtLmVTE1hkSkYY2c/wyMwfbQ0l3cdvgrIzmQNxE5OJvhRjOSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxryVCVymF6PkFwcKvAKoTSS/exA4BhnjlSOAnzoFJIemUxWT
	h+CarV58P05mhzxnSXMmHWf8JAC1wPVrh7qekQq/aHDqA31girgC0zxwaHQtv37oNWcseqYqaFb
	JDXU1Y8zRevuN/k8ZZiU4YoJ5iATGwA8=
X-Gm-Gg: AZuq6aIvnNci76z81VDJ5Hk0+7D9gf4V8iUVOLTxibDYLbp5i407o6xNG0YL0bHl/AA
	JAsGHgbpEUgfiSM/R2izNF1oG38+SjotnTOA999wmky+ACXZEa/CWT4IhCsURvzDCC1ylIS97tT
	maHAsC7C75pIDuH4RGBUkN4ejARUM7CWvj6NME4VY94CTFPbXhaZQntKU+WtpxlOBL8LCpdhEcP
	hWgO4kc3E+xvlOG4Xp0+NxbEEqktIwJSrWtuuqNKE8RobUll2P4C40Mp7NAfjVePouOjuayuq/g
	KkZnX9HvUIo4YWjburqo9rESiMQ8nLFEQTDlN0XkzgpiUsg01qdFBGK68+FIye6bYDwXPz5pxkf
	kr5uAIQ==
X-Received: by 2002:a2e:b8cf:0:b0:383:7f85:8eef with SMTP id
 38308e7fff4ca-385a54a5357mr13776161fa.29.1768943148548; Tue, 20 Jan 2026
 13:05:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-lock-class-key-cleanup-v2-0-ad02b80c69e1@google.com>
 <20250728-lock-class-key-cleanup-v2-2-ad02b80c69e1@google.com>
 <DC0ALLZU4B8V.31REA4LHMQ6JL@kernel.org> <aJth6nUF0zqzNhHr@Mac.home>
In-Reply-To: <aJth6nUF0zqzNhHr@Mac.home>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 20 Jan 2026 16:05:12 -0500
X-Gm-Features: AZwV_QjRvxH1MDvrBOQJQxCuyyqCFobIl30woHmnqTd0NXkvn7yNExDo9emlXQQ
Message-ID: <CAJ-ks9m73KWJc9CuVGd96R2M1OKNAtysEpRGRyBhrV1B8d=kBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: sync: clean up LockClassKey and its docs
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 12:10=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Tue, Aug 12, 2025 at 10:05:55AM +0200, Benno Lossin wrote:
> > On Mon Jul 28, 2025 at 11:42 AM CEST, Alice Ryhl wrote:
> > > Several aspects of the code and documentation for this type is
> > > incomplete. Also several things are hidden from the docs. Thus, clean=
 it
> > > up and make it easier to read the rendered html docs.
> > >
> > > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >
> > Reviewed-by: Benno Lossin <lossin@kernel.org>
> >
>
> Thanks! I'm going to apply your tag for v3 [1], and queue for v6.18.
>
> [1]: https://lore.kernel.org/rust-for-linux/20250811-lock-class-key-clean=
up-v3-2-b12967ee1ca2@google.com/

Hey Boqun, looks like this never made it to v6.18, and is instead
headed for v7.0.

This patch introduced an instance of `c_str!("...")` which is
problematic for the c-string migration. Are there any reasonable
options for fixing this before it goes into v7.0?
