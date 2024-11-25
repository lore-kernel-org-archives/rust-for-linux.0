Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36359187849
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525884; cv=none; b=f7OJBolQhFBtUO4E/UCRralzsx+pssx1YipZ/Ky6M7m+lMN+peaF1z3AHcOGZr4L11vqbtWnD+AsMfhhVcpxJYUUwkf1D+txdqch9wfUUxUbdospsYc1l20LSwWdfNVR2+739AV+ulQ2OPMOAZlxa34tSGzt9IewFO0jUnSh2cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525884; c=relaxed/simple;
	bh=wT2QX0BLl+SGVNLChvroK93Yxa+Mm8ft6/n++IH3SKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUkfuqWcMPF3VxFDDoB6qOdn/dbWRB8exr/Jr2sNxQnuBjlJMR947/GmJY35ZDUinDUwqso9WQ/nkZCZT+YRScDu0ObCsZsDrZdkz9tuTTrv3lStJliH/vhjry8XU9TID/J8ypd+89gl9PT1eiBobeRwuKDlrECoSzetbrftPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O3K5WG7m; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O3K5WG7m"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382588b7a5cso2672130f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525882; x=1733130682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT2QX0BLl+SGVNLChvroK93Yxa+Mm8ft6/n++IH3SKg=;
        b=O3K5WG7mm/Wg/xhuw1n88U8ZiYPFBM/huCT0K5mNdAogN2McMQsT2l0xXqf0My0Qbe
         eFVsvzo+258sVQZricwUkvpxasVigyhIWqIiOiFIDAK8crBnZx8Ie5YsHAJlJbhLXjA2
         TaTCroHUd9zHLcbScwLaQtD1h/ohYJ+n7tBO/9qALh8HSLFq9566ftL87J8QjyCVEvdh
         Da1QY8jCqeg5Ncp3LSMET5i8jXvCyrCfDpFHEAxX78DgavFVpkEHgf2lK37YDS4alq7Q
         eiUOxHfxF1mnP4HsKmzJonJzGSRsrCdr4vb0DtiyO+6gzlyiYQbqR+LDR7ZIAQd/ms55
         c3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525882; x=1733130682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT2QX0BLl+SGVNLChvroK93Yxa+Mm8ft6/n++IH3SKg=;
        b=kriXoL2QrkKLfAL5LDxC0OQgFlarNaAxmkBi62gL9XIm4EUeHV7N+xzf6XIUWuaUcU
         Ykf61s61lZxyVFxfYQlHMTTZRvQHUmdbogu+HgLZY1TvC1F0nn+VoIaUsr/75emUrKST
         ZFnkcZCaX83L7miEh27CVA0x4GpS8muGjqHErTPn2w0h0gT4Yzcuvy1sXoJkZI7mRfCa
         Ki+aDJBFbpWS8CsVI97Jz66lTa92qtdhPbDEH/2O48aeuXzRi9LkGLXshiRxDIkNw2Dc
         NEjKDRINtJB8F9maHN1KlO8ATpP0tANfdsEbP7DZYVhQcD/Dgf1DBN/2uKr3Gc+9TH6q
         3cGg==
X-Forwarded-Encrypted: i=1; AJvYcCUj29TWLJliAqawIIQmioVwdgqG0nAMhriRWflGO8kN0/lzbGDl+rwYF4mnjDbhXBglt0fOJ9CoFLvpF4ZhCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOXDW+Y0JSUszYSxwtqarHlTHPZrTxmyha7WHcRi8ZRvISgK9H
	OUoKef9ypaVLdp9996DZ8yLq6+pusXFco6UH9XUtbpI7jpKIIea3Lw6/NF5Raro+pEzEDUvI2kk
	0Nj7DI14ax0RxxQ6wej8ox8qWFIT8duu9P09Z
X-Gm-Gg: ASbGncs8cRgfPLtluISfocwa0X5GwK4MkijwklrF/0xUizC0T4sqqrGEfAkngv+4+E6
	PslD6NWnZPurgfZlKcszS8/c8oe0bsi90BkIQuwhVFz3JmfW6CQ9BIHMyjdOh0g==
X-Google-Smtp-Source: AGHT+IH8xUhObePFMXX+6uJ4DZH46fnDECSOgfgui5FdlJfDvg099oVJfy7l8jGXt9Hpo3OEBqlpkGLGHf9ruibw67E=
X-Received: by 2002:a5d:5849:0:b0:382:59c1:ccdf with SMTP id
 ffacd0b85a97d-38260bcbb70mr8904576f8f.46.1732525881617; Mon, 25 Nov 2024
 01:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123222849.350287-1-ojeda@kernel.org>
In-Reply-To: <20241123222849.350287-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:11:09 +0100
Message-ID: <CAH5fLgiOHnX14CtN2rtC8ssUT03ECLOAGNLYPfA5ELSch9fONg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: use the `build_error!` macro, not the hidden function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Code and some examples were using the function, rather than the macro. Th=
e
> macro is what is documented.
>
> Thus move users to the macro.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I've introduced a few more instances of this in the miscdevices
series, so you probably want to amend this to also fix those.

Either way:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
