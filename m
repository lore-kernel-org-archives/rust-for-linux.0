Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A0278C76
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 22:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715122143; cv=none; b=loYmdVeLOa0zPa1yCCPQzB3kAm1zTpWhkhguXdBB6mDgJCU0P5nVQenuqu8u+/8VD0+56foCucuH9rVd+HjwC5TfljIWd1Vmi2V6J8fPH3B444G6h8y6nuzyqKCVmkU85IFVwPe5lWG3iAELzWL93Usg375vqATsPLPoVliCCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715122143; c=relaxed/simple;
	bh=p0gmws3+PFxKX1tyD4Sv/qAWvBFqWtQ0cGEG/+5jqao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkT5g+74WqOIDr913NHgDKdISYZ5HgtjgWN1O4VliwO7jLrbOvwV5ZUVNzOjv9H268gayO2UOCSfiW4oRob/8pVLOaqx2tIAejXYbwxrwMnBS1qBCSy1xQqfFrcDWY1imLkfAFklyFT1Yot1YmrtsLB+0nvSMOxA2N9+XK/I7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghOx8KR0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghOx8KR0"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so2856792b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 May 2024 15:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715122142; x=1715726942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0gmws3+PFxKX1tyD4Sv/qAWvBFqWtQ0cGEG/+5jqao=;
        b=ghOx8KR0vLdM6IRVxvSnXm33i7AbQueaoVdqv+DZlClLN1z3+ReeRORhjVMOg5JJ0T
         HrVFf8m3Ti348pqZ+92yXHYLlFaOX+hptx61eXoFQGGqvHw/d/3Fe4RHDg326QJNdMqF
         Sb6tX9JJMH/4O6oblUwQEWWbNX/jNBdRPTjTFZCuYajjxyWSwX4xGH269axGzWj5AhoD
         C2eRsevzFDi8h3kLzQpaaxIXXrU4DIegM7PCXksR8dmgn5mLHqQSLtG/oTU8GceW/Q96
         +NMtilo27ZJQ6TDQT1vxN3WnV2220cExdvFHCfn4a9vQLIgsT+YkZAYqEL1ysJW/z6nh
         53QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715122142; x=1715726942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0gmws3+PFxKX1tyD4Sv/qAWvBFqWtQ0cGEG/+5jqao=;
        b=QGEuq3kB9uhndp9BRFcmCQeqbWRPHEbuTrMNa7TgoQPseQzvQG2S3HwRV2dWzxcO55
         dVnI/OpgH8BYQupTrLgiYNAkbyZrVOZdcOeQjIC9eZkZMBwKWp/b4HNqaXum/q8f3HlY
         eVVLYvidsEvgXhjIAg6FFKweYEeRx6JazcbOc574raeHG9UL92xZkreK7akwWVR0Q8yV
         CU/W8lLWpckVKaJ4X0mQDxJqqrG8zMGM8ma5T8mNO9Iv+qQxiOyZmp8lA1KSvUKFPjl5
         XSRtIG1y8zuo3S64WAD+e1a2BQ9/NajDjrXrx35pK4qBBnjajTZNK5W3/He74e26hXVS
         nhMw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Qx+71kKlU/Fo3rwcY/Nr7+32DtyntZCTAmc+uek49TfUr8kePhaJiP3RY1LV5uKU+795WmffP9K3ueReLPVwTG7Qop+jMxlUuOHGymo=
X-Gm-Message-State: AOJu0Yyh22e5O31p+Ot82KKwksWqtrFaJ8aAOr8Rax5fZc6TYZrfbyyR
	4ddAF9J91oxIJVMyO7ToQQvPD8C/JZ4fStx5g7OPtkjpn66+dr44p+y7TupohXYdluuhLK8XYam
	6b1Rpq1aabj1YQOu/TI7DXrfnDIE=
X-Google-Smtp-Source: AGHT+IGT9Iag9fJ2bmjr4DUWTHwKuk8zVDbsWYpb88Ot0/Nta36dfL7G2v8j0BP0ZJhTuteLOX2ZfHhInJBnWG4kbm0=
X-Received: by 2002:a05:6a21:920d:b0:1af:86da:3f7 with SMTP id
 adf61e73a8af0-1afc8d6025cmr1218570637.4.1715122141895; Tue, 07 May 2024
 15:49:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507201709.105693-1-dakr@redhat.com>
In-Reply-To: <20240507201709.105693-1-dakr@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 May 2024 00:47:37 +0200
Message-ID: <CANiq72nBTHgg5HZOCcQ4E_0oX14MZCrLNivUcV63jiEmcRDfuQ@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: use `if` instead of `match` in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 10:17=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> In commit 1161057f53f6 ("rust: alloc: fix dangling pointer in
> VecExt<T>::reserve()") the check for zero of a vector's capacity has
> been implemented using a `match` statement. Using an `if` statement
> is the preferred style, hence change that.
>
> Link: https://lore.kernel.org/rust-for-linux/2c69a6eb-67a2-439c-ad27-70be=
130436d4@proton.me/T/
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Applied to `rust-next` as fixup for "[PATCH v3] rust: alloc: fix
dangling pointer in VecExt<T>::reserve()" -- thanks!

Cheers,
Miguel
