Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6A410D0F
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541942; cv=pass; b=Wq77F6X19RYAoi/JIlAX+Eh267VjVFlBrxGGdDcsp/CdDA4rHh4GHtKpc93JTJYId9Gh1jNWASq2i4RehcKlqMSD/ezjSarN6Ag/4SBs0eE6s+cHmSwvaqDvur3yppruJwDPeU6vq8LP13ehoI++HliVojrQGL6URd3YNa1DLf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541942; c=relaxed/simple;
	bh=3FzMA3JKWBt8k0bfdrkL5Fqy8elxLoHa5Rqt9wjYA3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpLF2YL5hVtRSfrFDbu4ixNq7JSJ8GAUb1RnF8SfXb6Swyu4DO7G/8QzLXBgT4uOcDRzaV83bP4V4MZ8B/OwCBc9QjnIxDXhNtzMHyz6/YcTTICpYaq4xaagwPhAqPCz5Ob8h8kn+TIWlvH0BLgVNukJK+V9BdoSfcW11Pdz9T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnWJN9y/; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnWJN9y/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304f9bc869aso385119eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 09:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781541940; cv=none;
        d=google.com; s=arc-20240605;
        b=FUQ/laF/IsSIwVh3J8hJ0B4MxhvpKfOcRD5CZUWEmhVbnzE9yenauRMp4pUXcxTor5
         a60Im55edDUwfbW5ZypZ+AEU4Bqy3v8OfXsLcY8aco+V/5fZGHyXF/jMAvRUdd5eX4vi
         zHc4eYUg+IvoqnKY0mspqOtyrhCJUW5fzepzHxUNusBWlKUA7/DCITed4CVz4INb9jcU
         bN4jGCiChE6Z+fS/mfb/SqFD806VeI41IVOQVPHPRSlREb8FgNrmwBK5XrnIvU9Q7GsW
         dJkYdnPQLVBNNcWIFbB/7DsXNdr3hjD9VwYNyHtMBKh0bU6RKGOBE5q8p9wHnaK1j+VE
         G/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c3z4ESjGCWPr0IFBiU/MI4XsGqh3mCySxsr/BHqLV90=;
        fh=5reQyo9n16YIGNUG0TVqtBYVq2JSgLPujhTKy0FHRwY=;
        b=JY4yvZiWGocYQo+nXvISmLwxd8M++pMjCziKUmtyW5PMUkBZqw3HxYKDHuoYbkQDVM
         B6eDKHjdzDgkneXt5J03Me0sj0YaPheYKdR7iP84ckEMrErC6CYzPACmdnS6kN00w9mW
         lCAjlDsUsxSfaMV3nz6yKXN7oCaRdnNbajwVGtd9xVaxusVKrE5mPe+1WlKyTt6QFNnc
         +42BvSX1LXsIEqAJ+yYIU6wmoWQn4pmd8TkWTdmiTm0Hmz19ZAU4nR3jqXdv5kUTECtM
         0GksNERGUJGKtvGwLBdjvhLZ3CQsDISJadVg6ZRqiUzsD/lKY6MzY2U75eVzD5OilIxR
         eveg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781541940; x=1782146740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3z4ESjGCWPr0IFBiU/MI4XsGqh3mCySxsr/BHqLV90=;
        b=BnWJN9y/4NcSruVlDMN192Hn9+XCbJ/4k2TsQvrnqLY6Da3sKbVA+9pQ4vyGujK9aL
         2xLBk657UCflYPJ0MPPXmaVfCM+RJ8RyWlhPnWTj/j7XeOttkTOAqvczz9KrlhrPfHhQ
         WDxjgoVdBGlt3oSeofz5e8G1lw7bTH4t/rveC4W1CgyrPmKHc5nu6YmeV/a3HnOel29t
         l0uZj61tMwGwdu7v091X8E61er6V+iCuC+/G0msu501v7/d5EOdmKOUiSEy7S9qgtLr3
         YQvUK+TJN5+Jm0ZGJRgL8nY8Iq8sV4uAxTsRvb0sufbyaWcKvnmxtm0ipIETOf3qOLxu
         4ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541940; x=1782146740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c3z4ESjGCWPr0IFBiU/MI4XsGqh3mCySxsr/BHqLV90=;
        b=Rytlgji97VCKa65fuOBPaMolPSaVTEmyCSAaU0CvIdyLj9dlmdBC0iLXa48N39bPPd
         GM69rZ0qa0G5f5DuvocYyBqN7ba8VKean6vbrfL+TxDOwwKwJpMe4Rbnap/KcorgPr+q
         5ZRqUiSXGt2yZ0rmQvHDU4IG9fmOF8aqYU+umK03R6YFlathtdy+PaXPnzHrYvhF7eU9
         fWw49PrYGY7uY25wpY8/xTtyJqFc65EZFAB7j8ZX5hqwJst3+NC0pEmJhYlNAIyu7jpz
         6AL2HbZbVhjDnjN2lFQUrQmZniWqVYN+WxBszGeD0qKvv+7S/9C/xJUo4cNA29JCZmDf
         5pAg==
X-Forwarded-Encrypted: i=1; AFNElJ/JuushTuffz9HAsDD4hpafKc9jZ8dQEE97WB7+PtVHBPYPztm555B4jYh7c7IKHBb7OmwVAYIdSAwZ9Jcb+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKDNY6xEP7QZplDPDOgQ1MSP0z/Kqy59iUNzWQ+qiHyy7aXSRZ
	R+IeIE32vrrRh41h6y0ct1hZuJl3ab3Xkxsu7n87DfRTIPUsf95hd6L+EEJfkkE7bqO20K+IEfN
	RZgA4qAPiGCew2n143fOMrn4usaWYRbM=
X-Gm-Gg: Acq92OFahL00J/KasCxMDMk7LVOZTXS01UqGEXRc1eGhw/jxx/YJOaAPl50oJEeCYk+
	mN8vkyf7uTEnVt9q5tgJc/rhFYOpdlcb4h5jR8zMBENIlCTv0922kjecv/em3KZBAdGqNac7Oio
	edXYPKsd5glydBmYSX/qUU+f6sC3I8Uis9dGxWVOvWUtU2AxyhFGIgfvahnTzvR5a+N/boqFzn3
	IOyo0ERrOwcAbad1194CWGaxP69pEhy/goond21pkAZtqm2Slu8Ek5d1Oi18ZOt/wK9UGekcUVg
	bsfvrzHJhFJFfi3p4Y3ChPXLFm3UWQ66sckjb9RX21YN5JI8LUC8KF1SykwNse1vA2Ex46RFP1t
	QiMJ/2NHeF76BkkWNQB+2Ny8=
X-Received: by 2002:a05:7300:6425:b0:2ff:b29b:87b with SMTP id
 5a478bee46e88-308200a194dmr3604961eec.5.1781541939886; Mon, 15 Jun 2026
 09:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608181451.3734956-1-japo@linux.ibm.com> <20260608181451.3734956-7-japo@linux.ibm.com>
 <20260615164013.GA249489@ax162>
In-Reply-To: <20260615164013.GA249489@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jun 2026 18:45:26 +0200
X-Gm-Features: AVVi8CfzMVJ_2rVg8MQCfGJQFulI52FvHK0vtBIlLUxIJIbKvT5bRYr4UKimBq8
Message-ID: <CANiq72nkm2YwxcV+vwDj+v0svd6e1dro-W_0ybVms3pG_oJiXg@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] s390: Enable Rust support
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Polensky <japo@linux.ibm.com>, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, ojeda@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 6:40=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> With Rust 1.96.0, I see the following warning several times when
> building Rust code in -next:
>
>   warning: unstable feature specified for `-Ctarget-feature`: `backchain`
>     |
>     =3D note: this feature is not stably supported; its behavior can chan=
ge in the future
>
>   warning: 1 warning emitted
>
> I assume this is expected? If so, is there a way to silence this warning?

Yes, it seems so -- please see this thread:

  https://lore.kernel.org/rust-for-linux/CANiq72m4GVWFYqnxNtCHTPu7XcGewHB5L=
NwOoayTfnXs9pPbNg@mail.gmail.com/

If they are OK with it, then I guess it is fine, but it does mean CIs
can suffer a bit from it.

I hope that helps.

Cheers,
Miguel
