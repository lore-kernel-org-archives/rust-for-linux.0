Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B5D2940B
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Mar 2024 18:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711220241; cv=none; b=lZaOScQ2tiM6MRuMNndjVUOBHIdPl8Fyw+OEFo843Z0UHzxuziLQEn97P9jok+mxSaMyUpqtMd9yDatlMgt1Vdgl56Zr6wqJ9DCJ3W7ySYt1GOZtcpkcBqCACVexbvEebf7YLdZHSX6xwkm4pxw+BHiMo+MpvZZQ+DpzK8Buw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711220241; c=relaxed/simple;
	bh=QRHj2kqKKLx11zx+9iZ7hIIYExHKQ2a2L4lqgJzD6MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aL2ck3rPepVfCZ+eItyI0M+fwFugdaSy3hlfB53nYh/a5gMDd/34LhacGOaTw0Rwc1sabEUi/kfa/jlKTOPHdgoAw1bAbYsPwbNNQl8XHf19qk6e0CmCjQ5OTOn0emkVylj/AzIZLWudO2CTV2UXnvxOMsgs1Mbr9IGA9wq31eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHRzAIDn; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHRzAIDn"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29c731ba369so2214213a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Mar 2024 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711220239; x=1711825039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdz3LmI26VEYpSJQi9gIFGQMp3GSRqIDdeTemC40poI=;
        b=aHRzAIDneK3uW4w79HbMDXcf73s1qRkTrh+Uv1868k23AU05SL8r9gd16+eZaf8zIK
         6o4QdETDZeDAoLqYTZiO7vvmqRQ1eW7UpPbdUICwmitGN+kpvkCODJKnA3RO4jLhwzOY
         Cs2CVEYq3YfSUA/BnSjNTbE3PGOntDWgtYrCLq5AtNVvXOQhXrflb9qD0RIzjaLiQRbU
         H/m30pQzZOHG7NOEDSDSdcr07BcHpqSNcT33ka5f9/jPqB1qFT4ue4qC9uRLV0dsdsVx
         2LhbsWOjG8ZarVlQpJZZXwDyUM+ARJBVEgO8mbBq68GThAYMGLsS1xlt+t0wu8b6dqpz
         2b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711220239; x=1711825039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdz3LmI26VEYpSJQi9gIFGQMp3GSRqIDdeTemC40poI=;
        b=NEbf0vTFVFWlyO4DiKIjX8FICENdiXnUKXLDaQ0uFhuGlC903CQl9/43UzZGxdE67a
         j240ulKQ8uX6F1UBx9xyU+6/uoLFhOCIjDU61dEPsMqEaZvAOAuuHKz0aMfBojuYxVYT
         VLan+7pxS42y0BuCGlFNCXTQ23c27AuCvN+uN+RW0SGa/oDua/vOlE0gBZGP2WdKOdTl
         m5TdaXJJxPOIyWlJl/YgwD6jVRkYQeJHyU3x31w9DlERMLjZRBc7kwH5qgqepmLhX9aw
         VbBXC1EqG7vTeNNm5TXPx1VxPkCSHRcEf6tcxtXtk1+NX3uik++Yr5kohj9UPFICreSe
         1hWw==
X-Forwarded-Encrypted: i=1; AJvYcCWMlJ6l6jwblR69mbX0qXJY5/+fPsudroponzL9iNqSwJXfh4bc/JLDKRi7zErj6a0inb6uCpvJlTHEsYaQ3wcpTAYEMPH7B/bI9X4Uc9M=
X-Gm-Message-State: AOJu0YzQkzFhAmivqnYueX+Dhss+aYE1CUrf5/f1uLw9vIRIptMxXD8U
	kEfQCDQ0irOQFK6FyoApncjoa3FUjLq25ae0buxfqG5yJ0JOW4wA03JbNdJRwM07zhES//vLqFg
	PV720PoSR0yaj4kZqVJXDrFQ4V/I=
X-Google-Smtp-Source: AGHT+IEV2SCEQfBz9PGW+AgGaGq65kHHJC3n3LRHMK/dAAr1RVdPrQYr2WD++5oGbWjBxTXzUKHhdePl9lNU/nZwV74=
X-Received: by 2002:a17:90a:f40c:b0:29c:761e:3955 with SMTP id
 ch12-20020a17090af40c00b0029c761e3955mr2339739pjb.17.1711220239006; Sat, 23
 Mar 2024 11:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323074006.2940679-1-tim.chenbw@gmail.com>
In-Reply-To: <20240323074006.2940679-1-tim.chenbw@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Mar 2024 19:56:54 +0100
Message-ID: <CANiq72=v_Hw8Nbpw9Y8V5uBTAifmwAhK_iqF_eV+5MtXe_1Ohg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: rust: Fix improper rendering in arch
 support page
To: Bo-Wei Chen <tim.chenbw@gmail.com>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 8:40=E2=80=AFAM Bo-Wei Chen <tim.chenbw@gmail.com> =
wrote:
>
> Fix improper rendering of table cell(empty bullet list). Rendering as a
> dash instead.

Thanks for the patch! I hope it was easy to set it up :)

> +``loongarch``  Maintained        ``-``

I imagine this renders as a code block, right? That would be better
and we can go with it, but did you check if there was any other way to
get a normal text dash with rST/Sphinx? e.g. perhaps escaping with a
backslash? [1]

We could also simply leave the cell empty if the escaping or similar
do not work.

[1] https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#esca=
ping-mechanism

Cheers,
Miguel
