Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA61A76CE
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414845; cv=none; b=p2wVe10J46otB+VgWQTdDxalXJ3bR/5kHhFymxwP7PY6EcLcrfw9Wm8R/tBjHdrU/qsj3EZYVAAXMTLumfjtfp2Z64IURfHpunjAbmN6A8ICylACWM15FHgt0FNqL01HPSpQWHAWz5FW3DosCfUX23RKOQSOtSdtubXP1bnRm0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414845; c=relaxed/simple;
	bh=ghTZXqc7wSf8qfkf5igI7yrnAy6L92m/4uXbNngNwsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udobCrkcZ6FaObPN0TdarumkOQQEFqifsr+nTHSh+u1n1rYvpjNuPl5IGJ2TeVaJKiVFrk5AYidEXMJJxSiSTfzQkHTacvxJzjO1Ds197w0lKZRUOV5CXJSFV7zP2kGn8f/XMvWLqirArI49KlIqbirGXPxxIAx25mxG0+S68ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CgoccPwt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CgoccPwt"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01ec08d6so8308990e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722414842; x=1723019642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghTZXqc7wSf8qfkf5igI7yrnAy6L92m/4uXbNngNwsU=;
        b=CgoccPwtG/dCbVzyE3ADrjUdirlJc88CIuNA0F03CNB1wzI2WeAbW8CeYwxXiKjayI
         TJdnHgTHMx08vwtfFd8f8gKnRR2awZW9SjHOsWAR28mOAYibaE7Gy6n+lpYia3SQWNpO
         5Vk8xCJs3+T9IsyMe8OUuJdDbyZRcsI+Lt8LBl1edYH9oCD9ZTRW9xcfJNvrQ5yK/6T3
         IEchGyIYm/HLw1GAvSrS9bmMwHACf0TXgpVmVn7W7SYI+ss7teyWcoFIW/1V5f+CYOtj
         PM3Ge61kBSXxkgeyugUdcGsLuB9w0Q7GUZ0F4u8rVvrwCgeJl40v7POq2CSF5mkm9iMD
         rtsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414842; x=1723019642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghTZXqc7wSf8qfkf5igI7yrnAy6L92m/4uXbNngNwsU=;
        b=Z57WQAknK6hzv/PNtN5zQwoGO4TTugF1XH9989ZIZXZdYdLVnzlEo6BvmbMZS5jjH3
         H7YYGm4+BEDQcDYVGI9tAkKPovmj8HfgSXGWz/el++NAtfU/JHoRz2ZoOr6QqJxImm3Z
         pKwmti23R6XGlMnWI1kgu0XSKjGySqJNVQZsL78CcYrHiqy1gn1RNCZa8xgfjDMguH1D
         lIDG7EuOonIeGuVTl5e9QT6Y47+1q3WASCnhr4z1g6KR4CUEiawAh8KgP7AuGPJTVoJM
         tK2Qu91i/Q+eWtHtOtIKjb0iOvu/W/9AmqowxHGNWnL9+/pA9nVOaMjsLBe/U9iBvatg
         7xJw==
X-Forwarded-Encrypted: i=1; AJvYcCWlJCNP/x8KshB9wYFzw+9wgVE7sCn+utXaRcO0btKNzLdmCs5uzpUr/hMM/TWa1d5V3YoJw9y+2AXKwFQfDwlKjafUVr2slpJs83XLuMQ=
X-Gm-Message-State: AOJu0YwIQ5kFRFAn/QeOGYxnCnYBAHFOkBbA+a/wtlwYYsK8UjpgXrRe
	cYZTBkdX/KtIDrCKm0LEnhqcwoR3k2Q04Pj+7/ymJCSTyJv/9lTHl8js4/Exh/izVRGN5/o7Dpa
	t4Nf50Gj4ah9VDJ/uXsg66Fqh43TeW4CqeK77
X-Google-Smtp-Source: AGHT+IEYawFgcYaQxU7v5PN5NWGezBLeJ30TC5TnzIjv6j+zXTJ1aeMRIHVxbQU+lZD4GOr6e+bj4r2thotfMDkxq4w=
X-Received: by 2002:ac2:5b0c:0:b0:52c:d905:9645 with SMTP id
 2adb3069b0e04-5309b279f82mr8620167e87.13.1722414841599; Wed, 31 Jul 2024
 01:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731042136.201327-1-fujita.tomonori@gmail.com> <20240731042136.201327-3-fujita.tomonori@gmail.com>
In-Reply-To: <20240731042136.201327-3-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 10:33:48 +0200
Message-ID: <CAH5fLgj1vVRCmT5aFtrmVsM-gGX3X-fwHj8Yi+=Or69G=rZjcQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/6] rust: net::phy support probe callback
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 6:22=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Support phy_driver probe callback, used to set up device-specific
> structures.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
