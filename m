Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BCB24E4C3
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745677; cv=pass; b=AO0mK4RZL/Gw5x4TyS6f6mdrW5YwYdllau+DyDWnqCbDAxhKjM7+2U8oE9rwEsGUqU07j9aMm7hyxdPm41HzB/94MysUXgX9RAL6GUxZDHdr9h8ap8nONDCIghjjaY0HLCK+zdg/pM0i1dQOuauMlMQ51YlJa3W/w+AeckYMmnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745677; c=relaxed/simple;
	bh=cyI2ZPG5oq1QuCqRkgCNklQ9OU0MLtAuIzMb/oM+RMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zk2ZDIcMsL+4SUa/5ckt6uioaCcXjFcSaNsQGbZcKvzlm0BYwRsMTgU9IldMEvcagMPnk6F25UjPJVauYIHCIeI0eUwvWxDWTp6P9c7nXJjOos0diX1eUecL5z6zmSO/JTxMMFJhrXXfgvpe+SGbOnAutDCijL/D87jyf3m67rQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB+fUau/; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB+fUau/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cecdc24b1cso4977955ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 01:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785745675; cv=none;
        d=google.com; s=arc-20260327;
        b=HrkoBhhFCXUR8UMmo5GUC6Lrbp30AOrjA6XMPGDJmcmZZF6HGDshZjazI7yprUYwsw
         6/be15Pok6TakcM/IMV4Z+dZaM+DkIKV6ZsqGMMJiuRwtdBcqhgURqEPBqgoQeyovbxM
         ZZsWQKb9PIvFY+Z9PjWhsCCCJXPasLaXXMz6f4xCkMQu0YcQvpXmZkVa74gXKQz0JVh0
         e35ZKefsVxjE+2mCvAaOIjbm6pTuNYUH4dHJkCgqCVsFh51Ah6Ks/vgv+jCZI6LhClop
         RYBbjCG43gSjK4mJef4A81Wz5/gOUuc/wt2siIRlY6ygo2TQA2AM3ToihUXezNV4wrpp
         9Gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cyI2ZPG5oq1QuCqRkgCNklQ9OU0MLtAuIzMb/oM+RMc=;
        fh=1tvSO61pfGTLh1HJngk/uy6Agg2iDT9ZIgd6t95w5Lw=;
        b=isTfxjAc8TFObud/kP3SIaE85T57eWGDC3OM6yWXYrEfWDpymwizUsIHVuCCfC6Glr
         DAstdEdI4mkf8MIIMLWlhaTVV/fBo2S83vDGHnlcCeoRV+S4OWZ1oP9CB9Ov22irXrLJ
         rkuvQWF4bGKMjshgWYvpGZnxGOmuGWgdCPFdELPvwN8A7OA8QhSA0rL7AeE1xZiNlAz8
         36EZauXfkNaKQZPvHueEP2eMGqNhMUC7w3zkW6hh7kWo4zNv6lBpZdkIHG25sVxOQnLD
         DbADDDBLEhheq0XdgA73s0941jpp+58Bjd1hAnLmHHRfNuI8nEarjl/fVnyOyFggU0Mz
         ZkSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785745675; x=1786350475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyI2ZPG5oq1QuCqRkgCNklQ9OU0MLtAuIzMb/oM+RMc=;
        b=OB+fUau/TQg9aaC8Xw+4vGp7SbzYbebj9ctXld5DAPVB1EGmuuZqGAfle6QN3DrLrx
         3ojM6uXlFfHx1oSaJH39an8exkfU4xmS5jIFHUHB+hmc1zkedAMCmVeOA3GPAPO4LgZP
         7O0ZEd98mlWWkcs4PXfisE9awtqEwV4aN/uzQEU2MtQj4yhgnweUVGh16+zHS0BknUUA
         e6hq6paq5G0uD0BxwXEySvJ16R3ziFnEI9WAfKpYtLQPskYkV/YzCasvql7aBN5THElM
         wAGyb6mPdZBCiX4Q4KCkP/7mip2NbLnDToq1YwMPWs37hdDkutu1BBt55Ded8S0jjE+8
         SOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785745675; x=1786350475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyI2ZPG5oq1QuCqRkgCNklQ9OU0MLtAuIzMb/oM+RMc=;
        b=eLmyV8TUxGVmpjocOvKLcd0Nd/pBSF08rd09hlB4Ykn+JDBoKTApYrhgueF14SDeij
         vW05KB/3Z1sBdxnNfd0njBRMZueAYoyi1EYyOyonG0yGsGUWf3InemtyXF6tEcGw7q4v
         UpJScBAXaGG1zqAWQnhFclcnBLHefreJFbVDxIEdtjMc++gdW0RypucC6CDqdE07hae8
         bUW2LtSuqJXteLbBZ4QeXabZXsVW0dxov351D3L/liWPEg9hQVbS2gaxYzeDxXkdU69P
         B0C218eGt2L4XsnYBhig4rn0fRE4It7y3vzkvq3FtrdCLNMCswAy0xS5bs55Ig/8zFmj
         96Dw==
X-Forwarded-Encrypted: i=1; AHgh+RrakJ/CcWrRD4gm3knJeOwY9Vn44MjhoJlQEGWZZ7tcbDOBiuFD3BjeVkV6Hv3JZ688x6dbG2J6c/PfQ96p1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyY+3ttNXX2DIQKVZVHOM+Rr4F71JESev6bKqtTGE3KFJOb4Fe
	ibph85/MU1Nv3n/km5RvXnMDd1tzbDUHhV9tkokVSQSninHIjwIIOKzi3kHQuSVpfDRrxoG+joj
	viuMOuLvsv4ytOShQ47K//oMvLThcR4c=
X-Gm-Gg: AR+sD11Sbao77expgXnrOy8Dz6mGIh9QpjRIrwbdS1G120as+ocCg0EmlMZKXRoNOCI
	bSr7XGSMWM1BMBT8kgl0bStOrIHHuhn2LdjxL9QCFKiAvazrytdIXDC3ORjSm843aKnJ0Gt2cy4
	E4DPQLgKFUSJ0k9DF9kqQCbgHPPelyMED0wq/gdWyS6ukzcb//xWfabJQguq2AiRKRf0pNMil1P
	9ET9PcNIQ1jVjWJlMLluulfx/lNaIbdA2ECBurYlXPHlYwU3kB1wEBl8DTtxJUg1M9t0NmbZ3CC
	DolAfesyBPLZAW30V2B1DgpGXnpP9Gx3sJ4TYmYYihsSbUkhzlkMxWZpLJfXMCMnxZw62do4ICM
	wMrLU79qPjv1Z0eT1KE1uM37W65iQYYQKMPwdca9a8ZA6UPTZEZIKRgH8SSfY
X-Received: by 2002:a17:903:46cf:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d0523bcf3amr133190475ad.2.1785745675575; Mon, 03 Aug 2026
 01:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABwQupNfMAJOGqRM9ke6tj4f53dCCsBDKU7Vp+zf8mwk7bqt8Q@mail.gmail.com>
 <CANiq72krLhYi_vQJjKcEhiQP9CHwc-+d=iMZocW19+MqfW3qwA@mail.gmail.com>
 <CANiq72mj+A4PujCsMCWErASkQbG-ieiXqUpQfozBwhaVgWmV8g@mail.gmail.com>
 <CABwQupNjJCX3DqTjyG3o6wK0NktgrgwSPCWe3YLBx4BsZ+FwLA@mail.gmail.com>
 <CANiq72np0GvNBMmvzFSfYAfPWVgpVUoD945hHwrat5bQcEJ2vQ@mail.gmail.com> <CABwQupNSuc9M2am=b8=6iCNKYjjKziZ+XvWAvqBT3ftROsFF-A@mail.gmail.com>
In-Reply-To: <CABwQupNSuc9M2am=b8=6iCNKYjjKziZ+XvWAvqBT3ftROsFF-A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 10:27:41 +0200
X-Gm-Features: AUfX_mzduqWO1jwstUeNYcmpuwjx4mblNPsP6xVqW9OIXSU2ohePQZfpa5B03cM
Message-ID: <CANiq72k93N88veUiNTK98BXTQ0JYZh1NAV9jwv2_zeqS+im_UQ@mail.gmail.com>
Subject: Re: LLVM 22 needs bindgen 0.72.1
To: Burak Emir <burak.emir@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <alice@ryhl.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 10:23=E2=80=AFAM Burak Emir <burak.emir@gmail.com> w=
rote:
>
> Done.
>
> I also ran the updated cargo install command again (where Nathan
> removed the --version).
> As expected, it replaces bindgen with 0.71.1 with 0.72.1 and the
> warning from the rust_is_available script goes away, as intended.

Thanks a lot!

Cheers,
Miguel
