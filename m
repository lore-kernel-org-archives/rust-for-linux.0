Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9B3302165
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169083; cv=none; b=fji9OVHRJfVs0dpAb9Y1j0o+lwAjnZ2DP8mSlH+VSApev6DThGchfm9aEBlidbg6/ouJ5QPHFtObnefKWQ0aGcGqWK83hqmaQLg/xLqzv0zZvkiFIZY4lrpr0jkxcWBK810aPm1FlDm48OHhgKyCcWC6iVFRDqvS2rnjWGfT1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169083; c=relaxed/simple;
	bh=ygGB/YN2U+7m2mTyKycwXt7VfQMyJC+JIr2jtvOFeWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx6gvepOOrtcph5Jy+i6O+hsMbRomiBxOKWL0/mtinOMhOrlto+f79+FTjwdATxb1bZqrVJE6uSJBhw4N+Q8KcmRgt36Tao8+9Ipno+Ad0T5Un9Q2FI3BTLkFPx1+Jo4isz73ZjZyTTy5EAwGrCGs+A+BZTyz0vncWLczAE6fj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijnyZwNt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijnyZwNt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c82bf86bso1715010f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 03:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762169080; x=1762773880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JCDN6Cq9Tp4TkqXv0Efe98IMAIjlCf0jxvF8wS2LXY=;
        b=ijnyZwNtzBIqKM5Q/1u8nkEft3dm1LU/jlI7KnRBUW7cCq6AzFtwpz9DiZzRyXpHIT
         c23TsZMUQmwEwMlFgf0h+pEkc9M21Vgxlr7qyX5oFlbK2uW9ThLT97k+YHOTT8yeoSy3
         i4yowicAmT7pG1z2yVY4ie/cZU31Z2Q95Gr4WCKTMikd84/YRlKGpPdV72tYhH8mH7wX
         +uhFfv7OaXl8KPL64R/anKl0UCTZeEi16fso9m4eB9y03IXJWdDUzC/e6lyUsPL18b2m
         mb+UBuFYV5fmRAPuuy4DfQi27HszEKabvyPLREkUXV29m3StfeaQ6owvMMQCObjaAxYa
         LzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169080; x=1762773880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JCDN6Cq9Tp4TkqXv0Efe98IMAIjlCf0jxvF8wS2LXY=;
        b=kQHECuq39wJ+KM8NNJRHK7QC/BjHksKrr1BAIcluTStC3I5hN92qHngFaCFZPwF9cQ
         hmB+2WadmVhN1e+PONvPluXRUB/7C4812PJ5Cz7a/Qg48IkLl/Z2I+CevPEZPUROvEpq
         K3rMJe9W5DKRbUJEuyWNlz5F0strSsC2PJarXEG73wEHjCn4XuVQjRlq8sH7tWQXw2V8
         PhE5SfdyrxApvWHhotTc2NjohG7bPVBpr+Krlhvb1C9dq8SzSr1sTMRz2Vqvtjst6RFi
         K7xJ72yx5PFLG7K/8Xp/iYxDvx0gDyr98gBK4U9s2hsJHMyAge5MI+45PhApU0CfMLjX
         eLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3bUsNIJtR0yBCld/YubIQW9KPNuXSQFY1Vi760gDQb6Utytm0e3cXo8kpehQs7PxjOeP1+RikKys9sWl4jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ33wwQJQ6JQFNDkQ07Dc0aEWIbVoe/14WwIZwzqpGvlLqNO+9
	JLE7tLMr0PpcSBMPRByQnoDjLwrB996WUN6odwgMWx2r6yBepvlihwrX6Ow5FIjbfby+mDJSvhJ
	3jNyQ1CaBSOs7ZGcqEKLrdGT8LbzxFfiq8Ea0vNRe
X-Gm-Gg: ASbGncvkq7dzwkW831n8J6+oneYzE7Rn3IxTiZGo+LYe+Q5jkWFWEsBcQM6O9ywjidN
	7IroUyEuLhw2kXMnTHJ85ZRHAru8A//6DXlRhdyTGVPYy8ODy8JuAJxrHZA6gPY1cyOiemXyjLl
	bQhD2+l9ZP0sNF67Z8ahQexRxbX/sasJmuZbCGH9eJJG4/TNaq5Qp3davC3kTb4TEqk0rGnwuG6
	1rmd8O37VNTCAhLZZ57MyVn6NQMeqaHjLAPJROCir8f4jCP7GYtZLegc+vsGBcklEil7HDSv2tF
	83/Zy5Zp626eNocQ6x3jjWKxcg==
X-Google-Smtp-Source: AGHT+IEKKis+/HH3jWT32CB9QgsHkpjuV5cak8KRGxOaDTY12Fw5xz2D+VE21Hf3ijFUTW2OmLNrEQDGT1Em+RSKdMo=
X-Received: by 2002:a05:6000:1867:b0:429:cbf8:1765 with SMTP id
 ffacd0b85a97d-429cbf817f7mr5373560f8f.33.1762169079371; Mon, 03 Nov 2025
 03:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103110115.1925072-1-dakr@kernel.org>
In-Reply-To: <20251103110115.1925072-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Nov 2025 12:24:26 +0100
X-Gm-Features: AWmQ_bnZiZ5Fse_UVDSHcbk9FlrG8xkBgTuDizGmSR1AoCz8I_gW748IjzTe-h0
Message-ID: <CAH5fLgidquc4nkYpeSD=OHzxYjNWoX=2Uc6iYWd2J7Lr00Ma6g@mail.gmail.com>
Subject: Re: [PATCH] rust: usb: fix broken call to T::disconnect()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Leemhuis <linux@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 12:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> A refactoring of Device::drvdata_obtain() broke T::disconnect() in the
> USB abstractions.
>
> """
> error[E0599]: no method named `data` found for struct `core::pin::Pin<kbo=
x::Box<T, Kmalloc>>` in the current scope
>   --> rust/kernel/usb.rs:92:34
>    |
> 92 |         T::disconnect(intf, data.data());
>    |                                  ^^^^ method not found in `core::pin=
::Pin<kbox::Box<T, Kmalloc>>`
>
> error: aborting due to 1 previous error
>
> For more information about this error, try `rustc --explain E0599`.
> make[2]: *** [rust/Makefile:553: rust/kernel.o] Error 1
> make[1]: *** [/builddir/build/BUILD/kernel-6.18.0-build/kernel-next-20251=
103/linux-6.18.0-0.0.next.20251103.436.vanilla.fc44.x86_64/Makefile:1316: p=
repare] Error 2
> make: *** [Makefile:256: __sub-make] Error 2
> """
>
> This slipped through, since the USB abstractions are globally disabled.
> However, the USB tree recently enabled them, hence it showed up in
> linux-next.
>
> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
> Closes: https://lore.kernel.org/all/1c8afbc0-e888-4702-9e4e-fa8aef0f97ae@=
leemhuis.info/
> Fixes: 6bbaa93912bf ("rust: device: narrow the generic of drvdata_obtain(=
)")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
