Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DE43D4E8
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020194; cv=pass; b=LcsZTd4iV3GH9loKT6cNXLP+alXm7CWVkV6lI2M9nQAQu5J8E49wvIV3DzLAg3Km0V9K1ZeiErwr/gnUao5AQ8cjiZ5Hu1awvM0ZJb+iWcVpLp8/+VvuW1wqd41Aq5ZDMptJnsvQSOQD1ldzuievoEyKbtu0dwdXMCJphJ6jW7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020194; c=relaxed/simple;
	bh=EnbfYsh5T90XwvbHVh/i+GQM7RCiB62j416AfFEzpkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxjskaWOJvTETndeVRH3zJNmiCcGRhlQZtZUa3La3SHcZRgw5Q4UL0eK4MWo/hDrT3Q2HTKZni4OqTSIiK/SOip2n5IKQYRdFPrzgPlNwhQ8YArvprgN7gt2kr6VL9n8Lz6lT3tZpLRcpIwiNXjrQo8PV6Ato5ymGc4oCTNTK/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6gItwKc; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6gItwKc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caf18d4904so9668495ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 02:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784020193; cv=none;
        d=google.com; s=arc-20260327;
        b=SincvPazUIEP1hQIcY8E3OZDwP23NZd53ktECwlSP6/YUQPLHe4WOh6bk9PQvW5Jh4
         SiOc+7uQU7uV/d+/mYI9wjzoaw8/N7k0g9ACFOwLLFmk6x/lT8XfL8sERR/0xt3WLf7J
         Ygw1cuwbxTcxwCkvG0r/0ZQ5R6VNKbV/LwUJdpcvPE5UgfB4WDLE313Xof0G4ZatlUh7
         vkojI86d1YW93Ex+gKaV3V/raGTd+ssabbgkRba43athGivJAujbyRVkmGII+9uFPW1e
         lXq/+OkoXJKGR16dpUBW0eh4/rxWJ/pIrzur718Q+Y8rOENrza/YRUeyY24/q13+Dv4h
         RHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EnbfYsh5T90XwvbHVh/i+GQM7RCiB62j416AfFEzpkk=;
        fh=sbDixaacmZBxm9FGtDZ7BHoBiNJP4++teBopI946OBw=;
        b=sYirQE3F+rBCm4uOt3yqvdxBWNvlh1cD+7hdf2OVB9yPeGgWED/RVabkjWvpoq5MVq
         8TK3qo0y//MtF4Vx3fjClabXJyOCp3timxScQ6sqpLI6PiTd0Sspm5pvh9pDE8zuNnkE
         PjVUc39FFQRi46ipLVLUh6uWNuVVpNNRdoXL2jt1XIpVJb/rt3xj33KdXWd96EfZFqDy
         FQRvDcqdKgpyxmnrmqVM9pUH+hLOltCHQ1Z+78ke9vNW8QTgPboZt7X+kZAm7PPM1+63
         MXTOqW8ID1MmF4oXQqDo2NzQggmRqDJg3k4gzffAuVcur6zE+yH8g59p3Zy2xbnOkD0X
         FdvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784020193; x=1784624993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnbfYsh5T90XwvbHVh/i+GQM7RCiB62j416AfFEzpkk=;
        b=U6gItwKc0UvFocBFgTba37auLT1q3HKk5jJ4v1m0NLa27XF/Qj9xjsj3DbSJ2zpxCj
         Y4XbDzQ5W6mAJ9sdk/bByFuhLEYsrCN72WSQ6zc0BFzvHi9OmHbiqEOiLcejEiksOJKQ
         ff8jWqCGISEFTpwJ6O9lDdPYu5ZuWGgbMxzao04Rrc4+T8VJpj/uAMoVYYlbmgrMk/Gh
         cqRKsTqth6q7hE/6quFoXjfOIXKXfDacv0Z1hSRy0wlyng4qJ1xS/cwFQBH7UIwKj3PC
         2RYWuw1NIHVw49ztIlgGjMHpp30sQb0x0J2wG1YkfgxNqbmAnQHZagX/Iysv9HDh2Hvi
         3M2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784020193; x=1784624993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnbfYsh5T90XwvbHVh/i+GQM7RCiB62j416AfFEzpkk=;
        b=IMpulOFFanKbQkUDx4dwOHRZE7WBTz2/XOsju9rvUsuOFxkvqXgRUSSlx2kGqeJTXI
         rCGmxS3v7GIIHcQmDeQhNlCs6IsUe21432pMrxRNN8jfHYvOp+y1KacbqGIXkcVfQQTv
         sbwnmJ02d8WpmmTM3ddWiLQhuTYNzwgm5B1xmHxQRsO6d7C9cl9JnOnPEhf2PXf3v36f
         HQSgSKXtNAsQEXXivyxIM05dphbtz+90a+rCAwaZNCG2xbKf6ERlKmm0NfNPZP/k5NaW
         qPxz3Sl1WEyB0tC8CBTWlf6wTfYZrYQ5FT7sxjrO159M0iPG4eabjytrloDXLApQWamv
         prpg==
X-Forwarded-Encrypted: i=1; AHgh+RpAwEY4Y+rRajgHWfUiLsiz75C8wKGlbzrsQ7dViDS3HZbEnVFVQHY55VWYh3/oYQCMoeputNA7nsPWC6GwVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlwQ7zD1jPtFnJsQGkZ9PWEdh+tNhGiUiZ3J7nWRxRcBEDEwW
	2yortpKDM4f5tEkA2+HbtJkpGbsi2I1KX3Eq2l55hcW3QXGxdVE7K+RPXEMSPJ2WZsVmSG3nI3v
	wfcW8LioaZS+4BeKFBG7MArX3hd5e6Lc=
X-Gm-Gg: AfdE7ckWgSmYwZyVWlvM/2CrYuQoL+HWuZ5gNFfNA1GfZRgH5da8MEEJaoUHBABheb7
	RnngWSWZ9iyKQJ7KvCzbEyvDCsQ4o5kitsfgVCtK+Z/TXnWtaIPGre6OmgcvSHPkWfl7jjPNdY2
	UKBOGpZ8b13VUwSCLEZrX/Jduma72UoHrcUv9htW40e0e+D1f99ESF7WWJVVnuDtcI7dSv5bjfz
	4qngJgAdYAE0Ex7GQLlVgzBcFxDM7CM8R9pQoUFO77dhRP2koR8jOrDmr9RpaGhUfbmgMgS54xf
	VhRvfy8YRX+tQbC07dR/Fjm8Flx3nL+ldzKymA9uluLfZDaZ11BgmIRpWF4C/C+UbLxqwqKTI0A
	TkfW1W6ryUmI9NaWjqYYU+tM=
X-Received: by 2002:a17:90b:2d4e:b0:368:b002:bdad with SMTP id
 98e67ed59e1d1-38dc779df28mr8849950a91.5.1784020192592; Tue, 14 Jul 2026
 02:09:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713225235.3243480-1-tomo@flapping.org>
In-Reply-To: <20260713225235.3243480-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 11:09:39 +0200
X-Gm-Features: AUfX_mysytFIwgg31dDmxLHJbl2_p1du_BThWp9NKu-2uVI8s_1p1TU7KFAKpoU
Message-ID: <CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:52=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")

Should this be Cc: stable@, then? (since this landed in v6.16) Or is
there a reason not to?

By the way, these methods should have `# Examples` showing (and thus
testing) this sort of edge cases. Probably as a separate series? (I
can create a "good first issue", but if you prefer to do it, of
course, that would be great).

Thanks!

Cheers,
Miguel
