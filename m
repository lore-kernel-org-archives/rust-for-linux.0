Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E9E45199D
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756769; cv=pass; b=OuL7rreuYEz81IJngC/m2MgzluXOaVzoI5uYVcanDXTTlsG4SyeSYQhyHZ8stnKu/PNtcuhtHvCbR16+ED/h+YSeqW3Qy9H+5t+CVVXeG0N3MmDU5CkLx43CPRl/TPM2ecibE2SJmwuE81DPIU4vmVaYylo56gymJGgmUOL3IzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756769; c=relaxed/simple;
	bh=fKABmemTLhVq3rnCUFgsOz983VtCKrNjV3YZ5ISgLrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8DOqncdAuoQiIDjr155DUcfe5Y4z5FWVDZehoZZJhVI3dYqoaMIH7nh921l0ZE+jOwAgoVpdNuW7kWMN4QZGHmCXOy9eIcueaamUvRvM8sAs8vY0BmUEcS7qcoMoo956fOFtFSM2Bds8xequV264dIHGnGjPSWYDBKfhQrsaso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ+dM1hg; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ+dM1hg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5862bc921so2725005ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 08:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787756768; cv=none;
        d=google.com; s=arc-20260327;
        b=kQsW+QgOFIs1pXS+wC0YKz1LaHmUKdy9L+bHTOzAhvL9HzxALDB+pYHYlBDYvkcDI/
         vVnotvQETdUKswnRB8Yv+G2aovx/WTyrnZc9dLkCKq/G139T2S9yna7dUI/pQj93hxC5
         TFbm9nnznC9dLljAB+hpf9SgN9HVppG6VSua0yCq1UBtgrXpBgXV7gyYWYIcVpK8FgWr
         yEglG/anu8WQzSp8USasnSmuvzFQYpgc067jqEb8TgQLH2qJgOWsY8VC7ECgo56Jo0uz
         wUp89h69iapRlN+eWzuJcPPY5ARgfcL4B0+VSraShi1vpl5Xhx/Vox/F9HDlGDbhLbtW
         9DbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mM06737N3KEocOk1ZcR67skwuuKDg90XAA91OQOAsGQ=;
        fh=OwLw3OMzgETJfyqfQ00/27bLUPv3gygAiqkUNAD4np4=;
        b=fuVrxComTf3qWR46zel8T+HZUaZK73Zvgp9DZu6xgIvgVebzgwrDgMfVPEBqTuztOx
         EUzs51sR7UlOyjrCIGeenTgfYviTpEavrBxujHFE+h1X78e11BcIGaoI6+SEZbCLb5aB
         TJOZKopdvhaTjkTqRcQUupDFyJosAqFb3TkEkkOEAbDlc/iUUS7ac8WYHw1qUNcCIhU5
         CseUhxqn3MGeBn0UL3xxTEkxQHSSL1Dcnv8JCLsUx8M1ZUGllirStDtEGMe+blWODcqb
         OCHYdYwliyDty7GS3Hls1Cxt2326jSbcnc/TZWEjByIMD4QcV/RM0RzEheuMmosGFEmk
         kKBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787756768; x=1788361568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mM06737N3KEocOk1ZcR67skwuuKDg90XAA91OQOAsGQ=;
        b=GJ+dM1hgX/58wDJHXDa8UEzDZ3xWVgjBUiCLxGppVS3JOpVjsKDBNmebGxgZgk8LM4
         4/iUMHhvvQAHKegI1iaHUCJFzihjGUESm6hqrfpgJT4sMyYJL6nkBTKSbvz+K4qDLkFn
         /OdriwOnRFamPQspxCKOQwWPc3tptgxsba5v9eT6zNtXYgDj4WFyF/7u+ojcmqsQ7VPy
         7t5DthcAf2FU+W8EtKg70eant02XvERd0uaees1VVfJn9yiMKP2vFDmyA1VcQJc3eg0X
         D0sgDvoqcEq6uIFRdDXRpFN29I2oYnsKoSLsMU25qLUo1OFJlxjo6SQGfYTkCphsaKZh
         MqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756768; x=1788361568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mM06737N3KEocOk1ZcR67skwuuKDg90XAA91OQOAsGQ=;
        b=Vsb1JNRYsflod7nEiCnpo6SeJ5s4xzvQG0jLUNgk1zFU4BBLvUSr1gCGKdJF6I4/9n
         MqpPRfApuZQ+LE4pzVZ/CvWBmL5iPHB6qjMzHqr4MVMGNxSfNY4iVLdjxQpcJLGtAhcX
         5s78Ga2cCmGRA91XIta0cS1drRdETYrsZO74jryQLI/Jgt9Asc09v974uT8D609wFs5I
         DlJA4ZQe5XNoiRGlkNyBJSIFVvajo4sklXaU2FYxmRekxrI36fwnPGwDzNEy/YDTNEaJ
         vGsjZOgOuhZQhqU/xt1RLluMX6fnzcRjd2P+t/qYKdWY/soVXkRBRqKTz+6EwMLhrM+P
         vGvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5tGifrKiQ1VSxIFbXsWxHOo1fhCq2AzAcbWvL613M8Wt3li1zopE522R9MWsYIxmJSygAPmFpz+z+HJ0cWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mUSUSxLGeYK3qumTegc25aR7ZC68RMmFdDViNLGiiaLbxEyf0d
	6kLuhrLN1q7Lkl9bY5PWHB7C3j0txIa9mdxAIHJE91nIseEERIRyIy+v+yTpPYMEyYYBjQAJSFK
	NaHt1CBwVl37kJ/tbpJmIb9SVLXoNinM=
X-Gm-Gg: AR+sD126Spu+Z/NG1k/vNOvGklfZrGSG6IHjTQohihf4cPa7KftkAoO93yzQfLXwEvg
	wBUQTXsw747hiZiBGuzApcsl/uZjVDRioIsIisehRkPQ4aMMX/+CYdocEMnZOCYal0RepQyuJMG
	m2daRPkELkS2YLXvnSe/FhW/rAFZOkLO+XoVWzburbIPnWjFojlBMsQ4QgxqJV2QPE1WxSHz5P5
	+IO+p48OasdGe3yai+s8qas47sNKqRXcz7GDK3UoajfEazCcB1WrxOqDBCT5HQrBmIGuq9ItJG+
	jp1wMpMN6zkNoeKmcWenbvMtajuGaqzLG+oEijwZPid/8GBgj7h4fr4ND6bVAGX/ZBLeDcpHvni
	NfWGqScuefPCH2C9Yfg3hpg8TnQyo+NPDAZBT8pVnyYzBYky+xjiAqCCOlrPD
X-Received: by 2002:a17:903:4b2b:b0:2d3:a50c:5e19 with SMTP id
 d9443c01a7336-2d71e2c078cmr10095615ad.1.1787756767876; Wed, 26 Aug 2026
 08:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826145832.42387-1-elouandacostapeixoto@gmail.com> <CANiq72=NtS=YHkCbB3ui1vVkHoVpHh2S12XAC=0vqHcurJFX+Q@mail.gmail.com>
In-Reply-To: <CANiq72=NtS=YHkCbB3ui1vVkHoVpHh2S12XAC=0vqHcurJFX+Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 17:05:52 +0200
X-Gm-Features: AcwNN1UsGpHEz0OUQTEfI_QDht3IcZH63XGHNlppQWaLF0Cq9K4L96CS48RPuPE
Message-ID: <CANiq72m_XpF=ROywGCdz4vqu3TYPeN9uzvHG1NMyepWOZq7FEQ@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy-derive: Remove the BoolExt trait
To: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>, 
	Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:02=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Aug 26, 2026 at 4:58=E2=80=AFPM Elouan Da Costa Peixoto
> <elouandacostapeixoto@gmail.com> wrote:
> >
> > FIXME comment was saying that this needed to
> > be removed once the MSRV >=3D 1.62.
> > The current MSRV is 1.85.0 obtained by using:
> > `scripts/min-tool-version.sh rustc` command.
> >
> > Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
>
> Thanks for the patch!
>
> This code comes from upstream, i.e. it is intended to be vendored
> as-is, so if this were to be taken, then it should be submitted
> upstream instead.
>
> Having said that, their MSRV is different than ours:
>
>   https://github.com/google/zerocopy/blob/main/zerocopy/POLICIES.md#msrv

Cc'ing Joshua and Jack for completeness -- the full thread in case you
are curious is at:

  https://lore.kernel.org/rust-for-linux/20260826145832.42387-1-elouandacos=
tapeixoto@gmail.com/

And I see Sashiko doesn't know about our vendoring -- we could add a
hint to the prompt.

Cheers,
Miguel
