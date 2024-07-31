Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4877446DC
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455832; cv=none; b=K5Nh+hIPY2ZAySGupQGELmFC1LcncYk1CE6HQKcfonx8O8Aku8dU3TcfJ3cfkOzhLwMoa+8ilHg7TLfOAA6nlXTruXOQjg6ZGGXBbYOToW+fU5/0iyvndq9lSNu3AzT3lfPlCxbaCkbHNCsKar8eAujfTL+feAboYafnW1YboHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455832; c=relaxed/simple;
	bh=xqFUR2hlr0Rt/DfOJxtN0G0ZmV0JHjUDEpB0WWaRTpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I61fTnC9XqcTePtVfZJOmgxZivsdObzo+gystI91X3zvlikK07OFtuvJQTyLewyxn6asGp3t3bddYIe1Is3HCguUcJ08TuTKy3FjldOAM2IRmHiuR06/F1NWTpGWCB0gw4CNkclsxxfemReF8cU+qgvNWptLv7sFl4Nv+l7qxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=baFBnpII; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="baFBnpII"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso22638a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722455828; x=1723060628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xqFUR2hlr0Rt/DfOJxtN0G0ZmV0JHjUDEpB0WWaRTpU=;
        b=baFBnpIITHdsay3T+Shzyu4Q9dseA6XOoTvg7SFMiQtfaeCUL3oo/i1IjSkmz1l6tq
         zxdAQ++jGF75AwTvr8q3UyXwJHVq/x9dxD7YtAb1ZHm3DwpI4ZzCwZr/KxQIHsCwNaWF
         3TmwZDj9Mes4Dx1Je1qT7/4ZBIoDdoyWzm9eSaXpOn9Op5ZC13uWl8ofB4oxKZKrUfwd
         uQ5kOhzbroQb7OE3Fp7HAdtZ0aTaYPSH+7eX7CDrtW9EdUY2zXSp/HNHZrJuIgCm76Ze
         rRMgLYJz9ejxbUya6OsYThBcWtj2mZSYjYYl2GSR7CPKTcHqXueK/EjtqL76X3xqeZ1N
         Zy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722455828; x=1723060628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqFUR2hlr0Rt/DfOJxtN0G0ZmV0JHjUDEpB0WWaRTpU=;
        b=E3Hl0rbGc2q69IJs/PXRZpIrJvnAxPeOAr2rRLN4JaQL8entp9wDVVbUeMGvqnZWG2
         9Pfeg7gfzrAl5CzT8/qfvZrYoiGrvifwYURa4K7RNwDAaNpQjMleuhyfFW9pfWZDEDty
         9QR3IhZNYedbPbczQBbaUcZSSCbSRHLDuZt/nrFCrKZVQOGpnjbLJnKmJbpP+TIcGmTF
         fPH4zowbIZhRuLxWhM3oTiWgBl1b+TeB4WYlHX+pgFMiZy6GAkjtFqrvBYGDFMlNfkxu
         24NJP/EBWgD7YQrVcLWzuIO/HXmc5HzBYrWpfuEtbwuP/SG46z2dEEjlObVHkOTH9HsM
         wXMg==
X-Forwarded-Encrypted: i=1; AJvYcCWWGMW6JG8+I7PhKkk/rMMy++vbZkCtShJ4vnUw8vGayn2HUNcSwjPHOjuXMTqG47/3MIn9+KpzuYa2dYrjRjsOHRl6HQQCRHvB19/UQsg=
X-Gm-Message-State: AOJu0YzhBGXvlLQHYUJHpoiiVEYEXsZbpQO0lYaPuTLNWqfNCMEeQXlr
	Q1af3IiH1pjpkgXVbQdTEHO+uPra0tg1JNYwNCHfskYtkyHwQumgMeccz/72xkKFSArknzaKOb/
	t+3uQaJdKcEFFrj98kU0ZEnziTIzhrwmebfQh
X-Google-Smtp-Source: AGHT+IER+3B4Ti8SQlTJcNqSe6BmypSDKd6BurFI61graRZCCNQKJz0ONwaqFvJaP237gN8FbfwlFtAgMMKK02J9Hw4=
X-Received: by 2002:a05:6402:27cd:b0:57c:c3a7:dab6 with SMTP id
 4fb4d7f45d1cf-5b5b4a6a671mr196924a12.3.1722455827367; Wed, 31 Jul 2024
 12:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731034112.6060-1-zehuixu@whu.edu.cn> <CANiq72n48BvaSNvghkEMn796u4K3_1owZqD9Gjmyk7h3R9GT+A@mail.gmail.com>
In-Reply-To: <CANiq72n48BvaSNvghkEMn796u4K3_1owZqD9Gjmyk7h3R9GT+A@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 31 Jul 2024 12:56:55 -0700
Message-ID: <CAGSQo01oq+nmPFCB3bRnjcXn9fvtu8tcvjsUh55tZnyJSz6ZDg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Kbuild: Skip -fmin-function-alignment in bindgen flags
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Zehui Xu <zehuixu@whu.edu.cn>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Does it change the ABI or could change `bindgen`'s output in a way we care?
>
This should not change the calling ABI in a way bindgen would care about;
Those flags only control how functions are defined, not how they're used.
