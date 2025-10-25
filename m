Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA93D2877FC
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761397866; cv=none; b=DkEehRtRH/r7ezjK+rWNU9fa33I6wrAX+lAHfGLG2S6L6aPp58IvhGtlyrCdIXlnR8AJ+x6Y8GcAxF4canS4Vj/au3ZbSzamJsBBdwO3YGs5YgrJpm3keaI9Uwc5cGkxE/HYehMe5JL6VkYqJh8T9WMTg+cSGQz9oQoDZEY+sOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761397866; c=relaxed/simple;
	bh=OV/AOwWin57NPBRAfOf/xnd4ugxt31IjUb8B9G2lR9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9Od20ltkHw7GzqNLtYrYk+bUJt6n5RtJAIJgeKUYRnqy77h5C5Ts7oSbDRsnDvNzIGZYC1wri40sJhyRIb1fxhmNMyijUyPGeJF5ZiP1kZFUqBDZ6ZakXrQBGPthZA5tdSCj397L2LppWEaajKTKmxY7bFvHZUCCi+IqnuIkpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBkwKpSM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBkwKpSM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29301049db3so4671425ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Oct 2025 06:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761397864; x=1762002664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV/AOwWin57NPBRAfOf/xnd4ugxt31IjUb8B9G2lR9E=;
        b=IBkwKpSMDNhH71kZx5TMy1Zjj0amNE/8gcBDMmACWuJMa0UomEkuE383DQeXNKlpD7
         b54ZnttWK88BW+3TMiEi8lY7Lh4m7rbsRZppPbLtYDSC7/AICmUSyfQaJi27h81jSKo/
         uZF5NmcUMcCWUrCrdUMUIrt0m88vqzhbp6SeFzLbOoArihL5fLX3Vhlqa/yN+GdFlQoD
         nTjiMWQenR6h50U78rCmEOswo9Rb3ACs4MV/iuQbVpBHlUrQWRp3lWInIJVW/hsZIaEa
         W93n+PeSolMTx/baL/0sWw3TzpvNZoQHVq0uoUdbhPqs1QxN6SfIWql6IGnff5lz8Q6o
         W8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761397864; x=1762002664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV/AOwWin57NPBRAfOf/xnd4ugxt31IjUb8B9G2lR9E=;
        b=BaPt2bVtZuRdIz77Zj0dlml6zILLy5cD3QapKMjdqnbNxmNGC+l6I0kwG5qVXwwxM1
         x86aqctdzKAxLZ/gE1L9w/HDUouarfn3xgONJbdDP+/CqMAx497RtRoajVkNJfHI7r/P
         sg2D0nniaVUlRv3+eNjiSHhd12VlffayKD+nlh7u2Oq3ABy+wyNpVrinCo4aa5cvDMJ2
         2dVzvAT0JaLLoQ3E6u8LmquaU7u/Q34t3IPRkaGOQtiA+D+e1IUEfh7tTCECqiiGqnVM
         0Vvezs2NWrElB28Pa49c7/mq/MAyLyH7CdoseJbSH9AFNhRzOKPTPQZK8OGg+rohxR+5
         hLyA==
X-Forwarded-Encrypted: i=1; AJvYcCWmyhaoY/Ni4rLO1c48FgBBnNSDeWyDlM3z33Ygy3Sra4XWF/xdX/L1CaHbjmoXJEN9BJ+qEjT6LjAeffb3fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5+JFPJg9HmvQFBsbwdKHTsNxlwQHA939j2JV/DofGV+k9HWb
	HYWujFjF7t6bBunDAQK4zL6EE4L49RPCm2FVxDlcSkTywjdudo1jCBF3Ikr00Uflp/G7QK9gnIM
	rscjjQvbUzIc75Kw7C9MfIgYuEyQhu6E=
X-Gm-Gg: ASbGncuQE4C1aYR0Wg3k+5Ze75oU80s/Y8ZDV9SnbvonKE0VOP1Y+I8L/622IR4gH7L
	oMxl+yAoWrogzw5pop6ELUuPBzdRcmi1G3HCqemHDWjrDrAhXI08Onq8C+6dHLG3KKpOC1yUZJX
	brh6+/A1lnNRjcBSdaL4BZPZgFVHVcRLj4RUNAN2kmzQbOnFUOeIXwRSLlvryw0ykK/Yn7UddRq
	Zs6KvIIfH7GDjhzZ/aQk7Tf3OTbNptOEyMucnzGe815cInR7tABLLoYMl4qXPu1uORBnqPxtVEu
	iUi/hY+azBfzMjexHJV0K1qOkHkCSVjVKiGcmBrduKgLxLSLNfasLyjcw+c58+96+fq3+iCRHg9
	inRc=
X-Google-Smtp-Source: AGHT+IFzJd8RPGQAAqDxTguW6iM1Xh758i2+Evq4Q8P52Rn/KlW05EaS1T12D07MW/o77QBtnLV2P0X/Trik3/PibvI=
X-Received: by 2002:a17:903:1212:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-292d3fb7f7dmr114465625ad.6.1761397864045; Sat, 25 Oct 2025
 06:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b929896b09325ffcad073edec86c3ce2048bd363.aca6009b.af09.4398.882e.a39af511d7bb@feishu.cn>
 <CANiq72nAdYX2Ja7D7QrsSeLyzgBKrSaTzSyJahXS4HAT5tNVEg@mail.gmail.com> <CAD-N9QXQ84awmtkGKz28GDUUmws+mpYVR7LsO9TNHV_D8SO0OA@mail.gmail.com>
In-Reply-To: <CAD-N9QXQ84awmtkGKz28GDUUmws+mpYVR7LsO9TNHV_D8SO0OA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Oct 2025 15:10:51 +0200
X-Gm-Features: AWmQ_bnEFqDf76e4rXFCFfa0wMjHpy0rgOEQ3KEJJHB-D3qcMP_Rg830c1L7dIc
Message-ID: <CANiq72=Sf+87hrLxO1dYevJpc=JWzWpgT-wUSRNDUJxtirtTVA@mail.gmail.com>
Subject: Re: Inquiry about Contribution Opportunities for Rust for Linux
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: =?UTF-8?B?5pu55ZCb5rO9?= <caojunze424@openatom.club>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alex Gaynor <alex.gaynor@gmail.com>, chao.liu@openatom.club, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>, dzm91@openatom.club
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 5:48=E2=80=AFPM Dongliang Mu <mudongliangabcd@gmail=
.com> wrote:
>
> Hi Miguel,
>
> Thanks for your suggestions.
>
> My name is Dongliang Mu, the director of OpenAtom Open Source Club at
> Huazhong University of Science and Technology (HUST) in China.
>
> I wanted to provide some background for Junze's email. Our club
> established a kernel contribution team in 2023 and has contributed 180
> patches to the kernel community [1][2]. I also began serving as a
> Reviewer for the Chinese Documentation Team this year.
>
> Recently, our club recruited some open source interns, and we are
> focusing our efforts on "Rust for Linux" and "Rust for QEMU" [3].
> Junze is one of the interns participating in this new initiative.

Thanks for the context -- that is great, and I appreciate that the
club is focusing on Rust for Linux. Having more people looking at
patches and contributing is good (and needed!).

I think the easiest is for members to follow the list, to start to
review patches suggesting improvements, to join Zulip and generally to
get involved in the discussions under the areas they like etc.

Junze's patch in the other thread looked good, and it seems you all
have quite some experience contributing to the kernel in general, so
please do continue! If we can help on guiding any club member getting
started, please let us know too.

Thanks!

Cheers,
Miguel
