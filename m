Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C632FB62A
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 22:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763332455; cv=none; b=sTsF+HJ0kdwfjCO0vqs1Gcrn/G5E1F50RD2uAsHxfSvfseyzOZTOe/DsLAmrdAqM4ph7qJCK0C+3Ei6lYvsfAYJlGVTZjnlMaOjZpwCfP8fHnAk8XNshhBmlJdWzhYV2gThQnr7MPmWI+S3tXiRi1CMjI9KxY/nvePP6PPSNUsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763332455; c=relaxed/simple;
	bh=nyREWlUJKqDuotw1vgSsjLoevGdO3KA/Gq7FsiHa0WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5v0hLtMaocWjqUPSL2fC/MyoqWpoe8iB/UJKIgSCTJvvJu+ixPdrM1W/LTChqQOnVvmiK1ifYWXYrJ4lx4+YrUKgBoYYMJFLVjuuwGK4lsx6g6tQ0+95UCf7ub2HmaUmndlW6Nwza4CQlDbP9ZOhx5ZN+CcKG8cyth3+Jxc4ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8Wi3Mq1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8Wi3Mq1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b87171370b5so318329a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 14:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763332453; x=1763937253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgXS+9s2Nfg4RhMMhSGBlZMvc/JKS2WZn0X52yFCvzk=;
        b=J8Wi3Mq1Qb5FqwG9QKZdP3YBwoIEg6lJgxRX/XLBpyVQHLo4jb9L1LJlltx0OPmohI
         LusG/sFeLxheg2DqYycSfDNVeL6r+CGyfZ/tYLeTtmEiRjiv+stCAxvqUUNK3yfTryqO
         JnFcCEalMvhrESbtcFCGqcbM79ohMKSgqGYEvn+62pmNvMcIeXBjJ9x/9/CmjRdtTp7Z
         U8PxTpdoAaNJYYmK41/Es9AlmmsERQtSqWe5zU7cfWLgqLbiabcppOFAdq67AJPMas9n
         QuZCW0S743pEBNaxsIjdGYmn7aSaqM1GQ70W10B4sVg6+uKOmqutDNMWT65Uu9NWMKQ3
         Wtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763332453; x=1763937253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BgXS+9s2Nfg4RhMMhSGBlZMvc/JKS2WZn0X52yFCvzk=;
        b=tfKhfUMdzlD1nsO/SbIGxmjEZ+wadqjSNGQ6JlJm0fUI5uFArih9dc5M5MX5Rv9lvj
         Gp5Pv/gLbna8fG2tWjOUPBRptm2BzA1FHsnDfRFzdPkl/foOLgLckQOApVa3umkin4Oe
         9r2R3ewDUf/CXdMTZ/oIhFdOWtDLrddu9T8eJ1eFFVLIMhASJUaqHZ0670DhMITp+Jy2
         BR/fwkJgPnzTLxwu+Avz57FI40KWf5ttdjMvnCMLhmjL4LnC02QL6/aMek8MQkTpAL9h
         Bm7io/BQELPUH/a1zBMrkPQtPiUvTooIWm2nctUeKWybQ9iJomqAuIB7Qm7gMweTRM3j
         iAnw==
X-Gm-Message-State: AOJu0Yxx5aXYp+/9nVlMSMjRdP/eHc1WytKduD1TW+4SL0wx9kjOiEo/
	P0BuHa4yApR5joymE5oE9z/EuYmIz8INU48/pPGxGxUepmW+kf9ManQtr6RFgTCwCFjE5lUfzzn
	487GBvmFb5gC/glayQPbAdnr4lddvUxE=
X-Gm-Gg: ASbGncuZm7u4NdZuTxfnfDooMHvIX0Ln3iJFanTF4Nt/EsP/dl0gsyQ4H4EYfk2t3HS
	QAAabmsgOR0f+knkufPyl6h08259fuFvirBT2sX9WJ12VPh4bWYtfBTfp9r79aqcgEPcKFTAwSN
	NUkLqVi7BTl1OSghzhYj7PdGzNDr3RFgkuIX2+EjfZ57Y0UzvO19yDQKOSgS5Mma+MtTx3iZRS0
	qobCvSGnuvHicoQo2AGM4I/1LTn8v2Gkr7O2ylaG7UJu3+34S8ao8onFy01rEEU7ee3AzEkmqs6
	M2T6uYeeA5lObjB3ztAUUnLhKztQTBS1qI4TnECcm9CAG11EDyUvabp3deBaAo9FpMbJuPzUmIU
	2ypND7fo/isdvKA==
X-Google-Smtp-Source: AGHT+IE7bU0kY+1JqdyEPixXHYGLQtopePNUTIi8nGEHcU4fAYQSoZhSE4Z2cFTQMrzNsliK+rCWk2jYyQb7u9sBbV0=
X-Received: by 2002:a05:7022:ff4b:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-11b49152d40mr3708251c88.1.1763332452964; Sun, 16 Nov 2025
 14:34:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014123339.2492210-1-vitaly.wool@konsulko.se>
In-Reply-To: <20251014123339.2492210-1-vitaly.wool@konsulko.se>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Nov 2025 23:34:00 +0100
X-Gm-Features: AWmQ_bnonmXg1B8_brQtG6vzRI00un6C6-Pu9c7IjYG-Mj929GtpxndjzJugwBs
Message-ID: <CANiq72mamgCYRGSQyYb-vB4sPuK+9RrMOrEmJr-hkGzTAueQ_Q@mail.gmail.com>
Subject: Re: [PATCH v5] rust: rbtree: add immutable cursor
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 2:33=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.s=
e> wrote:
>
> +                    best_links =3D Some(unsafe { NonNull::new_unchecked(=
&mut (*this).links) });

Is there a reason this kind of borrow is a `&mut` and not a `&raw mut`?

I see in the same file there are others that could be simplified too.

Cheers,
Miguel
