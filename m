Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C7824293C
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 20:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767905787; cv=none; b=kQ3bqEzWNAKoQn3XWsngYwgHf/vfeCiyUUNdFvOppARIxBod+otpUvazfRgQ0udEo3RZfW6JaJPcl9/SfcvBofytPRTYpQ+E5QDADId12QG5RsjS3yAhuUnHSwNx2uaKBvrZ2uttp9ClIFhcCaj59ulTOwsA5Cfd2OWKFjfGxZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767905787; c=relaxed/simple;
	bh=Ai+1VqmHWTtzDAf9XcManam8pxSl3gVLCwxDk5EXLsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhyjz0jWGzmIHA+BaQ7LuCCn2LhiS4HdTMep5bbBk6sTBRvwYiczr8OmPev2BqUsaT0sZJpUC/4vq0ITOPVBvCiK7q85bDdpdKXzItCN4D4zzGCE82FNXezBn7CpC8+Eps4KL3rvgcyVL19g0+98mD7ZxZsM+sKM5gX/PT5E6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLu8FWiV; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLu8FWiV"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5634feea416so1413233e0c.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 12:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767905785; x=1768510585; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBTSY1EEOdxfKcvbNf6L/Emq8mbP/mtnJeN4bCR0OXI=;
        b=gLu8FWiVWlpIbmXkY35F+wDblp7zPMIpw/xGrPPLDa17j1nJCHn+FkN9zFylkLFiUl
         +1h4V5UBSmG4v6x+yOsENdf1i3BjDa1P4KF+akMLx5KwfxvxvzwifGDZhr7Qb1WcD0qP
         5FzBo0uElJnRkFQlsWeR1vJUw1cEwRGdyUutIClwyPCmwNz2OXgUBtQ48odmEcWHBJsE
         gjNXQT1u0rBscA85QklOpH199pbH2zpI9labZxCxGLTFduekkqcJ5w53PKmG6rXvZKQ7
         RRmrwMOHIta6wDBpuu4vtcBr0XYPNf+F7pxKbZqTtFakGlYJRwCxjNQallroDdkawai8
         44FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767905785; x=1768510585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBTSY1EEOdxfKcvbNf6L/Emq8mbP/mtnJeN4bCR0OXI=;
        b=sszG7ZP72W9B/s9/zM+RQ1Q/jw4srgwV5OKdn3nbB/I3Fi6gHR/osk1ehRLCEMmvAa
         1jM+976RrLH9UbAj7CS5qwsnI3Rzu52PjhcKWglIZiTRR/oqGAgmztEwpEsHc5aRF+rU
         DraAi/EyOanRtd9+HEZ6GROEv50SjfFJCHtJujlckN3yv+VFmTvl40+kjvx9L6Uvkwq9
         rmrbpIJFtPGM5vMrOGBPpvZhhMB47x1qanKAJ9QtjT9CPZD7EVYBMvkH0gWYKOsjq2FU
         rtahOoF/kexpTv0JLwSGSpbeoRftPE4u64ZKxDJUsPq9/Pc0Z98XO/nMtJXwYbLvknKO
         aBDA==
X-Forwarded-Encrypted: i=1; AJvYcCX3xCOhcGYV+jTufYh+Ws3J5aqJ4GtWBOJ3dRUP8ENH8pjTekr6+1E57e1KhbBsndO91aYHmqb0DtKE1n6QzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1tnNA8rwiBth3Dx+8frDcwPwDPpBCFEvuUTdiYGEbSYEowbw
	39+tQXG3DofprEsfr+YtiH80XDcBklt7v1ZXkFJpbw3sIbSRej7mfM6HUUiCy5Rs
X-Gm-Gg: AY/fxX4SRTB2Bget9OUyyNuqes0TkEJ7pNQDaGqrNvqcfZUy2jnF2RnfBwmBd1so/ym
	4W95ascgJrji9fiUxVNHW+qk+Etsx2bWbdU9UYao7zUDjUr8g1fp/W4i2Fd5Fo7UcCZ+j2a8LmC
	mO1XMDJcL323axk6SpAXks3IjikJY0N1RMPZr7H+LhDNRyvY0Pq40LDd383xDcVl+tZwOX02MSA
	Ee+z0L2pAuk0UnHQ7HXkZ7o2fOM+mW+O+Rw0+bS3RTsUkiyslD4NnCpJYwfuC4FZJOPmZtmhIKF
	OBjeZL5z+eZOM2Zsx+whSPcuLoNhYRNurOAxLNY+3fuDv2W/0NXQoSDro801kPU4QJ3mWcg7Q+3
	9Cjy+LhTa+bc/r2FDJK0X+cylxpEN0L1dwaU21QrpifjW8kWyEN7rbKJd4VtG86UUo3IacWd1lE
	pBhCQbkiGEKzx+lPZ8X/10nBrX7j0w02A1hiUGjtrDTYZEU8rSk7JWRBcOYYEv
X-Google-Smtp-Source: AGHT+IGdbZA0YdG2pJnA5hnov44UWtqim5wNto+hPT/edngjimvjSZui4Vpfm6nIyhGaKBbaTg94tA==
X-Received: by 2002:a05:6122:208a:b0:55a:be72:7588 with SMTP id 71dfb90a1353d-56347fc9897mr2788869e0c.11.1767905785063;
        Thu, 08 Jan 2026 12:56:25 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634e959afbsm5297245e0c.1.2026.01.08.12.56.24
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 12:56:24 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5634feea416so1413219e0c.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 12:56:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4BTTRV0cge8SIloKK7X/A6GrmNvMtlG+4phtCq+/s0BrCqbd0jKAlQgjB3GMgmusBbY5UfHteR7GYrM4WtQ==@vger.kernel.org
X-Received: by 2002:a05:6870:6386:b0:3f9:b172:33e0 with SMTP id
 586e51a60fabf-3ffc098f288mr3727001fac.1.1767905303081; Thu, 08 Jan 2026
 12:48:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
In-Reply-To: <a119094f2e248587c541daf7c5b65bf4398b281b.1767818037.git.foxido@foxido.dev>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Thu, 8 Jan 2026 22:48:12 +0200
X-Gmail-Original-Message-ID: <CAKBF=psOiiakGigJj0Kee3Z5rym41eksSZTgzsO3H1gzUP6DjA@mail.gmail.com>
X-Gm-Features: AQt7F2r4y4fMQm-Re3pQui1i037A4UVXW_kQP8DIPLiO0siB7OJeE8HUcxCwU2k
Message-ID: <CAKBF=psOiiakGigJj0Kee3Z5rym41eksSZTgzsO3H1gzUP6DjA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: add WMI abstractions
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: "foxido @ foxido . dev-cc= Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 22:56, Gladyshev Ilya <foxido@foxido.dev> wrote:
<snip>

> +impl DeviceId {
> +    /// Constructs new DeviceId from GUID string.
> +    pub const fn new(guid: &[u8; bindings::UUID_STRING_LEN as usize]) -> Self {
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut inner: bindings::wmi_device_id = unsafe { MaybeUninit::zeroed().assume_init() };
> +
> +        build_assert!(inner.guid_string.len() == bindings::UUID_STRING_LEN as usize + 1);
> +
> +        // SAFETY: It's safe to copy UUID_STRING_LEN, because we validated lengths.
> +        // Also we leave last byte zeroed, so guid_string is valid C string.
> +        unsafe {
> +            ::core::ptr::copy_nonoverlapping(
> +                guid.as_ptr(),
> +                &raw mut inner.guid_string[0],
> +                bindings::UUID_STRING_LEN as usize,
> +            );
> +        }

Just use while here so no unsafe is needed at all. Then probably patch
1/3 is not needed.

> +
> +        Self(inner)
> +    }
> +}
