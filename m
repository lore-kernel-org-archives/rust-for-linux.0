Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89654F94
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709020512; cv=none; b=hI+nvt2gNOeedsu6JiY5ZQkRUPU5fkp4u4Lox7WTOFlfCvsWba1D8EWOOSsfo96qyGoenZqlxFZXpYh/7W1FMe5/EQlZA9YqaJfSFcOEhW+WFly0enF2AavdozAQXYYVpOMe1uDRO0JdQDShp3R2le05082SqCPtzH1qu0CcW/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709020512; c=relaxed/simple;
	bh=xbWkD4wvguVY9u5Ayn0gXU+FmdtJqxG5pcjSnxUJL8E=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=QRUWT9jMUu5s21IQs1OrQqK1KXxncMT37d49GaGv9d15YeaFapH09jilnrhXQozRlib0F5ZDa+dC8oGxiUn7tiL54SF4piqJnESagaV/vT90VWXOiATOBC2VH3//Zl8Mj7TAQ7M05Go3XquFbi+nfNmk+QmY6EwfaR+i8uk0rkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=Jp4HxUI5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="Jp4HxUI5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a431324e84cso243010166b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Feb 2024 23:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1709020507; x=1709625307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbWkD4wvguVY9u5Ayn0gXU+FmdtJqxG5pcjSnxUJL8E=;
        b=Jp4HxUI58TZJiAGwYMXWDhNNGQXZWMauGsLNnfwRqY8jb1QTFqiJl7AvbCYZOJhVty
         BS7o54yUkZwnpiCWTJFgXEDwASbVbPWMRETKpqGRtehI2shx3aABtF5G1JGD7tt3JTJx
         eKglGJb4x1PLFRdsNukbriIxHIxiHlQFqD8e+5i4iL8Gd+XtMMtBco/WRm28pGCyeZ9C
         LNbdjy/J9QQmkl9FwnpbHedNp5i1WOVBspLHXOjeGTkw4Y69sHD22WR1CW5R9Swa/uIb
         h1IWwN0FW+yQQC+H0MknXocw7MCfJj6nHBByVBdm265jxX5BLu7UsOpRNsW0OFhFf0Lx
         6naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709020507; x=1709625307;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbWkD4wvguVY9u5Ayn0gXU+FmdtJqxG5pcjSnxUJL8E=;
        b=ShcNaw3pBVEvJ0JBLvRNCmg5ZxLAEceAsVjnh8nCBRw/QVW/pmnLkZ6aNO7CwM2var
         r9K2N0fskaXgBRzfHyHbCQxiyCrZ0agV9muspAW5LI0K9G2oOdhcdsSyVI4F0PsPss7z
         t7fyqYSWWyLJvCrg7Xg22sC3Q6q8VFdFv5PVj61BtRajvC0tdGoO0CokCiXQSk5C9txS
         iskAE+LBaEreaOlkapwNT9pCqznudX1AfAkLB77mmAcrDQG/a8qW0l/uOPI/vkOZWusr
         pEhyKpNA0EAV3whmlz5i8ZvF6S7uD9rB7LXwQIuUphkJWlFTOTR/U/gO+CiBkOjRRo7Z
         9LLw==
X-Forwarded-Encrypted: i=1; AJvYcCWkv2tBbTjLM7pziNmafl/I1hb6PWqYzTgUgsK/5lOPl1gy4JaFFofhb/iBYjK53QwMkgm60lakLF8aiWVhX1v14sxiACsuMSEiiBDcrE8=
X-Gm-Message-State: AOJu0Ywb+Vi7WYG7ZLdPljDMO9AqifWw3xcih5f+Ja/LgfkBUO8WYAMY
	4rWZ/OtCnyQZnEwm7z+Txc3zeMZMqmHaKwNhxcGaG4S/Prz0q3+nLGZ6FosrjSk=
X-Google-Smtp-Source: AGHT+IHKg0r6A1VdrZrNe9qtQFQ82Ul+9F7i7Pp7nuPZzWOtYrIU+3C5V8PmiOf6x3tZT3xbnnCCyA==
X-Received: by 2002:a17:906:3683:b0:a3e:c738:afa2 with SMTP id a3-20020a170906368300b00a3ec738afa2mr6226824ejc.76.1709020507423;
        Mon, 26 Feb 2024 23:55:07 -0800 (PST)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id lu4-20020a170906fac400b00a3ecdd0ba23sm503372ejb.52.2024.02.26.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:55:07 -0800 (PST)
References: <20240209223201.2145570-2-mcanal@igalia.com>
 <20240209223201.2145570-3-mcanal@igalia.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Andreas Hindborg <nmi@metaspace.dk>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v7 1/2] rust: types: add FOREIGN_ALIGN to ForeignOwnable
Date: Tue, 27 Feb 2024 08:53:55 +0100
In-reply-to: <20240209223201.2145570-3-mcanal@igalia.com>
Message-ID: <87ttlu9wb9.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Ma=C3=ADra Canal <mcanal@igalia.com> writes:

> There are cases where we need to check the alignment of the pointers
> returned by `into_foreign`. Currently, this is not possible to be done
> at build time. Therefore, add a property to the trait ForeignOwnable,
> which specifies the alignment of the pointers returned by
> `into_foreign`.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---


Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

