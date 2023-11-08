Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9507412E47
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 10:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KlP4Ae/u"
Received: from mail-lf1-x149.google.com (mail-lf1-x149.google.com [IPv6:2a00:1450:4864:20::149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB391BD4
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Nov 2023 02:42:22 -0800 (PST)
Received: by mail-lf1-x149.google.com with SMTP id 2adb3069b0e04-507ee71fc4eso6929384e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Nov 2023 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699440141; x=1700044941; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQH+j/QSCCrpDgYqCyOzAk5c+h/nVFiuOw7/pOXGj/Q=;
        b=KlP4Ae/uQHoe/jWuQz/73BpkF9kLYRY5TcP+fmx7OqmzbJiRtQRiHlXb6EKKryje4j
         kC8iAtLha4agWtCtbnKaaTkzb+sjWniWXhZW1PZGz/8ofks2Cs3mjDUtHV6eYUS3lxUg
         uAJ4AJ2sKW3ckZ7Iqy+B/OgQ+ntkOexpq/Hl8wvipYyaHnfg7vnXcQY0SaqBTBZzbKyv
         SxnEymlOfgFzOpGi6zpOvux341+dNkkEtrzgu+3dHvG0cVbk34P0+afrNTyqpznjvLBK
         OhxnWNph2bIyx9Hu7ibCFx0MD9Vo8eFUzhHg+iHnqmjNGvADNkKPgJkcspLWsbchkxsC
         1vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440141; x=1700044941;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQH+j/QSCCrpDgYqCyOzAk5c+h/nVFiuOw7/pOXGj/Q=;
        b=nFeGT/9tFqIjIyG7U4E8IWZD1KK0yUh5AaykOpN82MC4Q9OxRLMbGyfabl8h+Hw3A5
         kSE/gZm8iE2QxT4LEk40FloX8dygvADuahodEGl8SypSHXtSUdH2mkNWN5xFjMznFLUF
         PLYyATZ/AANPrIYCgwMzELKzZZ3hkL2TiezlUAMm/C7f22Cc8as6RXDeO8IU4nN4aCyv
         kd3OPrHKqJqD72U1Ad/bcU9tj+C3S0w0b8zJpV6AgmxchEJIhhzMQgB9J89OJfI4I9fz
         /h6iS7msad6SIdpS9jQy3uASCsTmzQrKn655gInvpK4gTA8MvrU9C4owebCHuVRFDLD9
         8EAA==
X-Gm-Message-State: AOJu0YwXyvG3JeyhONI3OjGxYjUt5wgxILCQk2HlS46LckCeUJ+LKtNL
	hr7X3kXsZTsU0ZiK9JVjYXqp9eRWvsKqSwA=
X-Google-Smtp-Source: AGHT+IFGFmAQ6/yq8JKqx80lksqY1Gqdf4HF789jU/G56yLAr/6PJvXS68fpeR9Vi4z2+6Kyiv6nXxA57tdMqbk=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:2036:b0:509:4ad6:95f6 with SMTP
 id s22-20020a056512203600b005094ad695f6mr6988lfs.9.1699440140861; Wed, 08 Nov
 2023 02:42:20 -0800 (PST)
Date: Wed,  8 Nov 2023 10:42:18 +0000
In-Reply-To: <2023110124-enunciate-hypnotize-2ae9@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2023110124-enunciate-hypnotize-2ae9@gregkh>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231108104218.527321-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 02/20] rust_binder: add binderfs support to Rust binder
From: Alice Ryhl <aliceryhl@google.com>
To: gregkh@linuxfoundation.org
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	gary@garyguo.net, jeffv@google.com, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, mattgilbride@google.com, 
	mmaurer@google.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tkjos@android.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> On Wed, Nov 01, 2023 at 06:01:32PM +0000, Alice Ryhl wrote:
>> +config ANDROID_BINDERFS_RUST
>> +	bool "Android Binderfs filesystem in Rust"
>> +	depends on ANDROID_BINDER_IPC_RUST
>> +	default n
> 
> Nit, the default is always 'n', so no need for this line.

Got it. I'll remove it.

> Also, it's the middle of the merge window, many of us are busy with
> other things and can't review new code until a few weeks from now,
> sorry.

That's fine. I had hoped to send it earlier to avoid this, but we wanted
performance numbers from real hardware instead of just from an emulator,
which delayed it.

Alice

