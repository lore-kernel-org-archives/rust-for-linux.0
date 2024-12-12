Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76A6211701
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002726; cv=none; b=W+2NvAwGZ8UTqnHh3D6OFQrG/OgJsPQf4GrHkV9pAwTBHKHP8KRwpyvjlG3FOayLn8SONbGlHke/OJlri2MbObmXHiRewMSZl5TgVFfnf+n5/C+TzpZd6jJsS+bduS+0FTYbRlQTozKEk0b4Ap9agOOktFe8lunrduqhY/9MfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002726; c=relaxed/simple;
	bh=9KgjQJ50AaO9rXpAGrZTl6RUCb/f5X1pbYNnCKSoryo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6ff42X2W+8vtDnG77boBEifdpaY8QznLi6PRwyBBVq7RaiJtk4RQzWcHcRYtC74V6tT2H9qfZNpepbn6q6Fjcfk3yQQeQHUKl5AK3DjVO4Ot42PvE2H2s5Dont772mTtBK8ayYuHKDNY3N5+DrISguhYU6IKWu58H3JfUCx5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRO4lK+f; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRO4lK+f"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7eadb7f77e8so56400a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 03:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734002724; x=1734607524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozjf1zWzEu/QPJkkVVdI748SOnoCucKAr1QAR/c/2B0=;
        b=WRO4lK+f9WX7Y7bVTXycNTXjPkQ0xX6oky+RT3FQ9idNayXLd4/DObu8lK9fDqp/C6
         scn3+1xK8aalGymU+9hz468rjiqHiZf+PHrODBKkmlZCqsc5RGKO7XB1RxA2Q1MI0Q+S
         DNIEg6EW2pjtzbt3NWUaezw37Cgnl29Z0+DGz9/Isb11hphUWkIAyF/T7dIWp6ZonRhu
         EcivEfv7/brLj+6MpJjhiFLm9yO6WZ4ob7ppLxHQCMjZuf+TM4PaAO5R7TN3dPS3M4GF
         eLh1uTYPQN2LHrqhPRhBLDWzivHgBVtH7OlCnJSPoVcH53s7oHMM9kY3svIKH7McNudK
         zFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734002724; x=1734607524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozjf1zWzEu/QPJkkVVdI748SOnoCucKAr1QAR/c/2B0=;
        b=S+/2BVu087c6FQ5WgUlejsNwR0pFAJRtOM6Rem3F1F1+Hx+RL36TEPdM7whbgxZo+N
         PICOLhVPt9drYK+QIn7I9UIHWRsJgI86zhCj2IL93xmxQaLEavWe/Q5JSpXJtjGAv/m0
         U3NyHHU5M5TI4tVvpCeKZerzJ/SJrp8Vj7peYn4ieAO+1DFFwCFzyeQLZauly3IfNW6K
         bI4qBNWvgsVJupbP8AxAF3wHWuINyEqjMEf4u8ZPWCb287uU7a6IfMVRHjQCWZfWcJjP
         /bXxZDhcbNVxDa66JbU01Rz5QHPWcR1e2vSNwofcBxt/2BfQmg/Vh3qSL3HI3I0dOXr2
         5F1A==
X-Forwarded-Encrypted: i=1; AJvYcCWnpOaz/o/itWTNrREQxrOKaz3ZQgOfdH+tNFhhqJsnJpmeQpO7ajoIjhCj4ymkCxjs9zwEiiJwyEGBjBQ84w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+N9or8zSuY3yPQIE69elQdHizLxcrDjWdB8RZyfEKNlDXVCq5
	LaNZER7IXK/2bn8n3zwoslLPpobXUJxFV/nZ9XRZz5BX6Vxl2q4Eb/OsbRxtygWrNZfv0UY8gtW
	O/JLJFVGBKjwpzK7Nz8wloM0T0nE=
X-Gm-Gg: ASbGncvMBxzv4JYw4FtkMLRX8YVsFHwHL5YPAzvgT6mHkeF+YO2rTEi+ks8jAiVnMG4
	3AlnRS+jdUrPhBQI4/SXFbp+pdyRyz8m/fz6b6A==
X-Google-Smtp-Source: AGHT+IF9Ur1EodLCIJyDjYTXDrCwYrZ4KLYOe8PznAc5oyNkvA+TZpTRPZOHVIPjVYe73EeiiHfagjrPoAq4vjBImVc=
X-Received: by 2002:a17:90b:1b0f:b0:2ea:5e0c:2844 with SMTP id
 98e67ed59e1d1-2f12802cf2emr3673114a91.5.1734002723858; Thu, 12 Dec 2024
 03:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241212031118.127423-1-dev.json2@gmail.com>
In-Reply-To: <20241212031118.127423-1-dev.json2@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Dec 2024 12:25:11 +0100
Message-ID: <CANiq72kVq6aVC8QdH=dXaH1qF83H7gmDWY-3icAxNOrbTaZP8Q@mail.gmail.com>
Subject: Re: [PATCH v5] rust: sync: add #[must_use] to Lock::try_lock
To: Jason Devers <dev.json2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	boris.chen.czy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 4:11=E2=80=AFAM Jason Devers <dev.json2@gmail.com> =
wrote:
>
> +    // Note that `T` is `#[must_use]` but `Option<T>` is not.

I think the wording of the comment was not updated? If there is a
reason for not doing it, then you should normally put it in the
changelog (i.e. after the first `---` line) or you would reply to the
original feedback with the reason.

Thanks!

Cheers,
Miguel
