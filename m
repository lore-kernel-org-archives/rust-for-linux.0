Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FD2C08B6
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 19:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764356900; cv=none; b=F7Fvwot+GE2+9KpjWxbnBke43lcwuAuqHtlIP9Vy7XYvfKT9fxowwAT98DZWM2ta9EZDlL9fzDKgSXRWi5M0WnqNxNbdOHpwll8DYIctbTySP9lZOsqQmVdbX3WAbjM7yhihyCaN5jtpWpXvCtfAMCwoUsNVgYdyM+smfLdPitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764356900; c=relaxed/simple;
	bh=Gf/I5rxn2W+WIilYfezBOQhljCPVg2xIfa3oJiNvjgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VyHhpX3pZ7C6B5FnZjuErEa+abUcpQsLpEup7xfDZ1cY5iMdFD2QYWWqXU3ArdV0CIVckD3sMok9NYcpi8MkGRaLFu6miA1JiJmU2S8DFCIJ1jWxPuYeOiwat5dUHDE6lgiSueYcx3EQRdYlbOBCYF8Z0637jVUegDoKUX4Um0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3Z26hyJ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3Z26hyJ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so191152a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 11:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764356899; x=1764961699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf/I5rxn2W+WIilYfezBOQhljCPVg2xIfa3oJiNvjgc=;
        b=Y3Z26hyJy4pJ2vSHLsIms4ceZmuAECMbc4Zn5pCRU4aS9O0TUsJcBu7wlLl8XVIXJ9
         qB6ZAeeHD93Ne9T6v7UcouhkbBNywGPZ9mbQB+0jCiwwijL15MExFNlhkkztYZYNlexR
         FCPispCO64ACRTNPjbBVtSSErVdmMV70W+grjCJNEo973Nak52deMZNPjV/txI+thnRQ
         aCj46oggsC0IuhKN6C7CbMv3g73MHEA+Bo2Ukc2F9JwWHb4Zo19ncMzmd1juAsMj87WK
         17Jbttm0etsU5YzS+e5rCVT5QKXnj/c9NqBvSK/iI4xpqDSpn0Upp22jBv7MVlugcEmw
         Rtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764356899; x=1764961699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gf/I5rxn2W+WIilYfezBOQhljCPVg2xIfa3oJiNvjgc=;
        b=wA5WMZUHh9q3zj4023+H4bGPDBs4HVcrevEgaplcw06BZI4B8QCwUz3OQK/a3L9tDy
         ufapV/bUKX/T2KCkMOtmdtGtyrZLdQMdHisYXhJmUPFR4QqFYQIoLYS5dAFAisaWg7vi
         P1gaLr9tHm5mynMbd527h+XktZ1UeaUSUg+dXPri7f0aZG1DXigmrchybkGgoSwnjhGS
         XmTARw3qFxSTsosE+ksGoQwKosOY46OkTKFEKaEsCQurWQX8afqeQJDc0PAzqsdfGYxK
         QyjatiIfBs2kcIQjcrS7aMOFEAQqhFBD5pI4Wr95B9pYD8drBeK008h6of1bNHcfks3A
         2mVA==
X-Forwarded-Encrypted: i=1; AJvYcCXdFx0po6IZi4rklYgW5RG8fFxH2Xvx9cy7uCUYSG6uuQN1F/L5CRHk3DTMkfD07mzuHpdpbc7udiBxvMTuTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkW08y6TdH+DoR3bx+ypn+fubt/w6xFX9TUcqYayjdg1gEQWHK
	Z5Yd6mX72NpRLifnZd6X5jl0Kj0BZd4mWkr7eUzfkCoJYMFqX2tzJo1bEcHu4O/7vNFheOCitg/
	80buOM62uO9vs11moGq8Wof9zG0un7V8=
X-Gm-Gg: ASbGncuQdYLROfXHoxkM1zss9+WWUGFXxqePWIVlySEs8zqF34CQqyI+JLwNVkYtn+j
	ToorNTW8SqW9B/PEGJvks8uW68JI3eTKE72oHQ4mzLtifJ5nceCLZhPxvYoJKg+lRINefOs9UDV
	6jSsoOIsY76itc8roC3gQnJbrZh+VDZXql+Jw0GVccQHSAxMNzYF5WWQPqJQd3OV9KZLfDr7RkM
	b9HWB0plfR31iitytLSGfcFNmVfFYi9FJL2BjvYBecn6Sw9EOLCyyAxaF0ZpDhsDQ6xpH19FfYi
	YgSuilVIs+TjBbSo0vOG5rcoYGlI750JjpOaFvt7/kl4zHZBj5oZVCbRl4iL8jHgnkYfIYBmuft
	zPZd5Symn359yJ4bFLKIlryHf
X-Google-Smtp-Source: AGHT+IHbVkNLbU42BgoiRG0ha5wUW/dlcnD+kiOtbeC0H6uzq1X32a7HRr4i5N/HSlNUIuuRk/AYn9U1Nkn3Sc/2zTU=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr16585600eec.2.1764356898749; Fri, 28 Nov 2025
 11:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128162337.12082-1-atharvd440@gmail.com>
In-Reply-To: <20251128162337.12082-1-atharvd440@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Nov 2025 20:08:06 +0100
X-Gm-Features: AWmQ_bleXEEU0JaubzRmv2_Nj7coh8rSMhOU-5SguMIprE_P57SlgjtxU0p66SI
Message-ID: <CANiq72kmm_6fGRW9y0DXZVEmFoqi-8-YuGJifEcFF7vGQnPLHw@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: use `pin_init::zeroed()` for C type initialization
To: Atharv Dubey <atharvd440@gmail.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 5:23=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> Replace manual zero-initialization using
> `MaybeUninit::zeroed().assume_init()` with `pin_init::zeroed()`.
> The `pin_init` helper provides a safer and clearer API for
> zero-initializing C structs without requiring an `unsafe` block.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Welcome! I am glad you ended up sending a patch :)

Minor procedural nit: I think this is missing:

Suggested-by: Benno Lossin <lossin@kernel.org>

It should be picked up automatically, no need to resend a v2 just for this.

Thanks!

Cheers,
Miguel
