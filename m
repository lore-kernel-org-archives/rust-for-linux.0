Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C07413B794
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389205; cv=none; b=eDWJnaUz5l9jFOWppWJiDpb/zdn4hWxVArg2LUyPnJ6SJTdAvsgvHeNEFN98jyThjQarWbqU6j+AjMldf9bdCXG1bYwgl1hTqVUI7nvzYWTJEumKAN0CoJZUGLJ/7yfcpaqTrH1bEmXn67JsR9gc2iO0+X2QP+8RTX2/Hr0B5Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389205; c=relaxed/simple;
	bh=RL381CMiL1+J/KkyZsaTiM0M7Bd3cqIZF8ft+sacEKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iracnnrk9ylgbSw180Ugev8m0Br21E5C5xKjh/ja5WQFw29n3FgkUTnBCT/yKTsQ90nRLlsj1DhKs1XQMiCRczWuyG4O91PyKtW/gzRVgCbI6TW8jWoHhtw69kixLvOxd1JzQQYGR+0GfE3xW/ZVZqZgXp30bAmQp376Ddkn7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGThI0Bq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGThI0Bq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e7425a6714so2915501b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389204; x=1711994004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL381CMiL1+J/KkyZsaTiM0M7Bd3cqIZF8ft+sacEKM=;
        b=UGThI0BqxwQbLeL0AuOKTxyWBovmHQcDKFHIDfGAtkYfnpS6o92VHmbKl6G1wzpIku
         07dB82nkO/7NbJmrsRbwkCFUhzz7Rq9CMZQNLWjJ2LN7CDLotEX4Odk6XUBwLOFRKMW6
         LXLW5KYLY94F3N0/xRKemPhFLaIJ6AJdPOeRqmjCbQZz20DD2Z+ZfECL5sqYAMlgSg8j
         w/8GYzBtQfpbG7BLwkbU8E7EI3io8ZLaAEgL+0JuPQrnWH4gb05O/zwr9tqfizlBE1VV
         c5Vov/NSTvJpMgoDOoZ1O8S4/HLfeWmLBK0UYWeYo0g4KFtqs8CfSXtjBTdfyNOuElJz
         6Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389204; x=1711994004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RL381CMiL1+J/KkyZsaTiM0M7Bd3cqIZF8ft+sacEKM=;
        b=aetQQKXqKB253A8pF70m1NbV0k9vRDX1z1kkYO0vX2cMZgcsbYzLlG/f7HFdgZxHHy
         DozKC6s0Sz7zIwAyfQ83Qt6zjfKQRfsHzBmQQalnnLKmzFs1/33G0uWyeNqV6wmUYJgn
         7Iig3PeeSqwMg/hPZmGM7i/zdN7Skne7GU9T/mStKvlc9/OZQrnSZQyG5TgN9ni/kIL4
         e17yu2yA21T+48h6cSdcNSpEi3WtrIY5j0jv2mFlmU7eJ8f7+BLjux44tdBduOT1wEs4
         KLKZG744l5KXw0Vr3OpaAC3+NySCCtoGjnKYiiPD03j5cvOZVKH2QwpjYRZ5jp+sWIo4
         At7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWkTsEki2HEbkPUjOdhDvb2kLy6fj3PW+AYKpG/Z6HOvNwONfMLghGniN/r+h/dN9VIG7qDmImbn+KJcfTjAde2HSAabJozgbg/Mei8IY=
X-Gm-Message-State: AOJu0Yzpw16S4nOWKXIM0UXADRHJbmr3SpyFQD/V6b+fsMXejirRWk7B
	gfR6q97KkqDCYPeaWjtvYZOwOmQqpO20Pa2jLndZ7Bfhz0PI8D8DFnfYpUR80V4dxsZPry44DGK
	fo0TU23P3apYn6vR6f25Ct2n+MMc=
X-Google-Smtp-Source: AGHT+IFQE1bmPk4crd3GUs4tQTMLuZBDV0jx0HDA39MI0jruA2lRMKgEC1h77ApQtCxKsqvd6qFIq0qjt+NvhHJTwDY=
X-Received: by 2002:a05:6a20:748e:b0:1a3:c4f8:e9ab with SMTP id
 p14-20020a056a20748e00b001a3c4f8e9abmr3391328pzd.46.1711389203565; Mon, 25
 Mar 2024 10:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174743.95542-1-dakr@redhat.com> <20240325174743.95542-2-dakr@redhat.com>
In-Reply-To: <20240325174743.95542-2-dakr@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Mar 2024 18:52:55 +0100
Message-ID: <CANiq72mXO0U=XK_LvAj_HxJ5xNzHKGcaGOaL4MibHkKhZyu40g@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] arch: x86: tools: increase symbol name size
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:47=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Increase the symbol name size as the Rust compiler seems to generate
> symbol names exceeding the previous buffer size of 256.
>
> arch/x86/tools/insn_decoder_test: error: malformed line 2486512:
> 77620
> make[2]: *** [arch/x86/tools/Makefile:26: posttest] Error 3
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

For reference, this is
https://lore.kernel.org/rust-for-linux/320c4dba-9919-404b-8a26-a8af16be1845=
@app.fastmail.com/

Cheers,
Miguel
