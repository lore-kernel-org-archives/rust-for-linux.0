Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A7350A02
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761088599; cv=none; b=QCVjVy9v3Mea2Nyl+42SJLIs0C+BcoVrM4XsNAlt9S2ytK53jBiZvjt1vWJARwYhT03FmUkKy3Y6PXBaWAI4KkAEsuwmOR9ymFxL6T+t2tgNa8MGNBhoHOHDeDgJI6wfvm+LS5ooxlTl1+sLP56LlP+OSVAU1uwiToNSNFoArAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761088599; c=relaxed/simple;
	bh=4Jm32qXMHIXKKOfLhgjYBhQWDQDVGDfzHihzO3VYXnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWchzAs+GSSyOu78yaEizJScVPrCOXb2el5mueQeMGvPXLlCiXM0FtWtlXszBmy/cogPrCGqbhEeEnocEbycBwsEN09Uj5TxE/tNWHYtdcArRECzrCtuWM5VXGwfLzRM1kwSp24Fs2DIymCVnXLx7Eedp4aT92p53Mvbixt1aBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkStA10V; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkStA10V"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27eca7297a7so8040495ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 16:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761088597; x=1761693397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jm32qXMHIXKKOfLhgjYBhQWDQDVGDfzHihzO3VYXnM=;
        b=OkStA10Vw3UWeBxyZJ0pQvU/iEkgE38lSXKaWoXic0SbRkNZXNv++Arxy7I8csNU3D
         b0c7Fdkm+NdRhc1MZfP+EzYbpRXFHWcybsyPLabRslNczbXYpn/VdCkhMDOGQKzy7psi
         /sKQW4/A1THyv8BGomLVfZmxoCxEJJjD1jiLDEAI+SN77qlyVttM6nK6fYpyd86ZRYCm
         647UyhAh5yK89hfPIvNLlx4rUctTEq8e3FfyNfJp8ZqkC5ILKkvZ9bO1HBtHZ+xSoJYg
         S6Gi/vMalFPnufve0j1SJcZAPWxilkM6nu7RIXw8h0lzrz48L2HVSMj5D15kGMUnVmO2
         hqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761088597; x=1761693397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jm32qXMHIXKKOfLhgjYBhQWDQDVGDfzHihzO3VYXnM=;
        b=rz7tsQfMYFGrfyuhujF0tSYXvb4qTxkIZmqIce4/mGmVVSnOc3gyGkbNORyCMBALT1
         f7WON8yZTHjaQf0X009dD7rbEWRAM3whPEDqHbi9EwmuaQEgz9L1G1TFXHpvSmnwYYxA
         Skotsn4Sm+hLggni6eTYlqVrO2LVeDLChXHf9B8goR0/Qy97QDx9MR+4LYMUgXI7vkOu
         6pUQYa+LLwIrJyfS1d+MNpwJtItf3C7PoLzaQNBMvyzwi/EdB3rSIZGRIWrCRmSr4w1H
         tLZ4nf9w5XI2vj53Fhs9OaHjkKNaodTLSoHNpkFVUw9Fk8hToPoUv8HESy/o0KBjtjLA
         0p6w==
X-Forwarded-Encrypted: i=1; AJvYcCVn+Bt+YoWJRKh2mgAJL3xMsI5Swkoja8kJLx6qMQ20Ljjeu7kkNK8UUay7jhxByT2uLMo/ud3JvhosVnlhVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkdFADPhNCyp9C0cuv5zEMbE3WtE+3nS60FlhGW9Gg21n0a8C
	CYk7QaGTGQcm7sH7x0YXxRYu3+kxMEd2AdN7FQgoru+HLYsmMKCy9jYCVpaoAje1qG/4U1TJSwJ
	y2AZUap0WQVgDs7pH2ytqIRxA2+NtDos=
X-Gm-Gg: ASbGnct9y/txqur0748BkkXOKnrExsW4jHxkszywoYb5LqjaGlLpHhE9ZuRQL3me1yf
	MM8rDf+WKhj+P5rAfcw8feS2qj3/BCq5zCn8RZS1SbAPhMOtRWuZv936ffWx6YyANc2N9mhsO1n
	gzdZRaa1XvvBVtuxoViNQ36oSOGOAcjt4EkMdfmA1cPqxvcWBm5OrmfbS6aNelFQDNO7ROKWK0p
	byLGM2TonMd711bTnGuDjh+wkNqb8APJ5o0QujzRhIFhZprotaNjE4twI1qOb/a5bJGirwZTr3Z
	1Wio2c+JSqL++hsfycLNpkKn2D3GtxGyDhMnYjXgIeg1fhhPAQCQwmyWUJt6Yh61wzGttIIhWNM
	3I4K2Vun72AjQMw==
X-Google-Smtp-Source: AGHT+IF06VtyL76w1sSXtIw9bOE6xMloj8rrlvRiJ5iGqaR5hCWDZI+RDSI94yfKuWAc4TqZzzRiWCMUqEonx1/aW+A=
X-Received: by 2002:a17:903:1ac8:b0:290:ccf2:9371 with SMTP id
 d9443c01a7336-292d3d97a7emr34673855ad.0.1761088597450; Tue, 21 Oct 2025
 16:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020222722.240473-1-dakr@kernel.org> <20251020222722.240473-2-dakr@kernel.org>
 <CANiq72m_LSbyTOg2b0mvDz4+uN+77gpL8T_yiOqi1vKm+G4FzA@mail.gmail.com>
 <DDO3T1NMVRJR.3OPF5GW5UQAGH@kernel.org> <CANiq72k-_=nhJAfzSV3rX7Tgz5KcmTdqwU9+j4M9V3rPYRmg+A@mail.gmail.com>
 <DDO521751WXE.11AAYWCL2CMP0@kernel.org> <CANiq72=N+--1bhg+nSTDhvx3mFDcvppXo9Jxa__OPQRiSgEo2w@mail.gmail.com>
 <DDO6IUEAVBR0.14AZ0UXFYQF48@kernel.org>
In-Reply-To: <DDO6IUEAVBR0.14AZ0UXFYQF48@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Oct 2025 01:16:25 +0200
X-Gm-Features: AS18NWA1db9xaE-Optx34cBClVs97tRs8EsVnoB259x46K9u88Yu8XRI6Dm9EB0
Message-ID: <CANiq72kA8ZMf4ivQa4JTt0ZDmJ5bxWdpjgNb9bfW9n27HdTQ=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] rust: fs: add file::Offset type alias
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 7:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> However, I understand where you're coming from. Even though there's not a=
 huge
> gain here, it would be good to set an example -- especially if it's somet=
hing as
> cental as a file offset type.
>
> If this is what you have in mind, let me go ahead and do it right away (a=
t least
> for the things needed by this patch series), because that's a very good r=
eason I
> think.

Yeah, exactly, it should be fairly straightforward for at least the ones he=
re.

Up to you, i.e. we can already start (the code you showed me offline
looks good) or wait for someone to send the change (or since you
started, they can still consider more operations and expand the type
etc.).

I will send a small coding guidelines note on type aliases -- I can
reference this example when added, since it is a good example I think.
:)

Thanks!

Cheers,
Miguel
