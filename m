Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1892F1FC8
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763462401; cv=none; b=XeVF4jExdIbnOB2Qap9Yd7eKuTJtS+k2ZQfHNjKesYgu4wFmT/WClpPd0lzQsuaAmsBnMIaICSD5M9cYai0+nb71VzRGkJA8RO9N6lm87ycs/fAxhE+9pYsEz4CxeaGs4zrfV9KNoJnGY9m1Ynzq0am7UkdMImCRAm8X+GUAN7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763462401; c=relaxed/simple;
	bh=+SOnREZLk/YIhGjG75Rxk5crrCLCCI6eHqXluWVPPoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WDjQya4EVFFmjzfaJl5eA+OC1yJoX36EHY9Ltuqh1CE9ZPUUY8rCMhX5o3Cxnj2H9UdbOFgRkzqP3kMFW1/lKFgjK+7SrpZ+SHtgevKFw6vUMf4Rc29MXwrYa/ax5mhpBFSWdjWu+IiMSYVpt4sr/EyozUGdWFzU7F2YmaPUJCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vt7DgiTs; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vt7DgiTs"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7270cab7eeso465056666b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 02:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462398; x=1764067198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=doDDQa5vMwDO3jaZ2I0IRUcnJoIRpkluvdX0QvzRn8Y=;
        b=vt7DgiTsasgyzsaCqdJfo+6FzTxEinEQaMCgOywAP7JVxfd6kG9KyRSNddTB8P8l1R
         7c4Xf2JgibihasY8rnoUKp/EdX75Flbgpbr3KH+4E7Rw179SyDHNyGU/sNi62XsefrYT
         X7QjHsMVIXA1RkD+nsKGyrxrxvNg4xidCNPGEzjzJBODZq0HTJUpyYIVbbNuhpt+eYom
         88zcpDkiBDKGFqFU0+qGrf0U7Vs1zGhla8PbWRQ2452l0AjQQFYNYSSlGg9qAbcE7swa
         JY6LlsiRs4rhQN/O9A3VE/H+YDsmr83C8hEz3KQneSiqq3FSsms8bqlYVacqMHEx/Um1
         TlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462398; x=1764067198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doDDQa5vMwDO3jaZ2I0IRUcnJoIRpkluvdX0QvzRn8Y=;
        b=Z/KrQjhlKH9/VgHrgdwww9JaOK1oFzJV1KmZlGwHgQ7/9lfixPKocTNLiOBbDJ1WvJ
         CqLpVf8GY9Mhl/AfJbn+KUaOKolVY+21OIC+mw2HuTLtqjP85/dahipwcGCzsRfk/Esj
         vuQ2WwsmfK505M5K5j43XnhDdQdc5HQGfBE/w4i8Vnne7y4hfIa25NeFi1GCxKbotxnC
         P0DCb1OYawK6GRaZzulstMlYyhBOg4xWbC5jCWcSNF41UQDZXI+UdFm2o1jj8gZG9pcB
         aPiYhR0z2+MAPe/xsPZ+jqbWiarVkrVWBG4n+i9BiGzthCqfzkugrOmTZmuVHQHML2Zn
         94nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1RyO/CKaMRH6zxYi7SLuNG8K4BWITnkiJQf13FqWqgynS/87cWhiQn8pLdkv6xHndCunrv3Wajv4b39+mYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5095Z0U0uptNByGeq20SdTaUgySLzAQYwUUjTMqMmc2OfB1BZ
	+Sj5BHEiHKpNL/Es1J5CUHh+k2Srxim+xnbrWPrbAoQ/D5KNGl2GfMqIp05MdtM1QYZ98A6hlA1
	jkTH2y+MkQmbfUJlIow==
X-Google-Smtp-Source: AGHT+IHbMRSqMv9Tih+4e9tULiSA4f17P7m8f8a3BC/docIkEDxMweYfMlD5Jtlmc8mt2C+z0JtpK/1DmwmTDN4=
X-Received: from ejctk5.prod.google.com ([2002:a17:907:c285:b0:b72:41e4:7544])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:dc8b:b0:b73:7ebd:469d with SMTP id a640c23a62f3a-b737ebd51c7mr1033732666b.18.1763462397793;
 Tue, 18 Nov 2025 02:39:57 -0800 (PST)
Date: Tue, 18 Nov 2025 10:39:56 +0000
In-Reply-To: <20251024154754.99768-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251024154754.99768-1-yury.norov@gmail.com>
Message-ID: <aRxM_NHhekMl9joH@google.com>
Subject: Re: [PATCH v2] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
From: Alice Ryhl <aliceryhl@google.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Oct 24, 2025 at 11:47:53AM -0400, Yury Norov (NVIDIA) wrote:
> Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> is enabled. This pollutes exported symbols namespace, and spreads RUST
> ifdefery in core files.
> 
> It's better to declare a corresponding helper under the rust/helpers,
> similarly to how non-underscored copy_{from,to}_user() is handled.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

It looks like this is not quite correct. The header file still has this
declaration unconditionally:

extern __must_check unsigned long
_copy_from_user(void *, const void __user *, unsigned long);

extern __must_check unsigned long
_copy_to_user(void __user *, const void *, unsigned long);

this causes:

ERROR: modpost: "_copy_from_user" [samples/rust/rust_misc_device.ko] undefined!
ERROR: modpost: "_copy_to_user" [samples/rust/rust_misc_device.ko] undefined!

This is because when Rust sees both a helper and a non-helper of the
same function, it prefers to call the non-helper version. In this case,
it saw a declaration of the function in the header file, and so it tried
to call that instead of the helper.

To fix this, we need to wrap the above declarations in:

	#ifndef INLINE_COPY_FROM_USER

Alice
