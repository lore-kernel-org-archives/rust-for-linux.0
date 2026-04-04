Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58862D4B68
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775333722; cv=pass; b=OTP/173U+0C6G/379/vRdULOwAttpYFndOGo5IUo31gxBxcW5I2IoPu5vAnQDjd9sdFDjqDgkgFjSTMJjYYEcIxIce9+zbGKvQZVVHh1puieg8G/5dVR6qmVM6PtTs66x+IKvQhYLpgpnmR99VO1BhKh6APkRK+x9Jo8DXsRGBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775333722; c=relaxed/simple;
	bh=3c+AHtrviyyOh7LI+MO6oCv19TXG9AFAqv5+gtj+Ltc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCOo5jMPgouA6RhzXQ9LO/MW0gbK+U9qeh1nj+X/9OlnlLvFKQr7D7sG5/EeN9Xj+Y4T2O4iVRs+Y+ZbOKyxgiPeeY1EFpXeYLnIiCSwZRMiztB5APyyEPNucABH77BY/ehFttx4Nqe6ulusk5wPOrIzNz9M62yn+WFaHFBEShU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO65Q1eL; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO65Q1eL"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b8095668ebso199653eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 13:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775333720; cv=none;
        d=google.com; s=arc-20240605;
        b=DUQjvEjbF2sD8sz5CDHzNSqIqBJzv52t7qm8YMDjtIoaWXWt4qPINaidFjHdohE0Pr
         WWkaneLk6hs1PvLCvP//AOdVGYFbSCpCU42pYmEoZ2ornVSXGiFI0x54/IHoM8Oa5T/s
         gZGdZ07FfvzR9Kd0LKlJDlRLqUIXdG8gPahMGQFG8Z/GTKIYg2Ktkf9zDTzCcAzKNDNn
         lt7fmIrQZRPYOtvhrmMjgUY8DGSfZ8ldZyzHx+grJ1pt90jjO49KlIIY4hjuvpjiepLD
         HDOMhcq9cP/jWbrFxEg2clR6uQcf7rJAWBWnKwHUZK872cUvIkIbmRWmJmViANbKhNzi
         3Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3c+AHtrviyyOh7LI+MO6oCv19TXG9AFAqv5+gtj+Ltc=;
        fh=gIYlE9X7gCRFUDRxVl4rVYgwbXzYiW3aWH5ociP/hdg=;
        b=XcAT/aQrM1dFr9GAa/4G9VdJuIBlQBCSdvD5lXVyIIBLzkGLiYK7sU0PZb7wS9tJ0e
         CNUPI+TXf28GMfJAJB/il7irN5tffeeE9Z6RbFlWm8BrzNXKXksz2XWG3ifqhYV1NxlE
         JXZU2tXGw8UJEc+q353VX/XO5IkGsoUNn/TCulJB3bR+QNlVr+v7pOKO2H6QVVg3dldS
         L4Z/a5uAxmQ2BFgnDGyvfZ4ZHNhBlxbPN7hNWrxt9PkSHazK9350MXqCFs1lyiDvv3p5
         2L7h0dVlbbXaphlX1X4tuT+JgWQ9PaarY1rKj5lKheDVHJYIiebnU97AN5BHMeqjKWrD
         v02g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775333720; x=1775938520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c+AHtrviyyOh7LI+MO6oCv19TXG9AFAqv5+gtj+Ltc=;
        b=OO65Q1eLgwF3m2RIcBLIqQigrsfiuQFWCnv/nozgJAW6bw1z5Pf95+YZ3yJN15BRvH
         katxG/NdjMSdOvPc1tSs63v9nD6CgNmv4qJw3Msa44cU81BOCk/uJXGJUTQYFZxUYFYQ
         agH2TTEV8y2X3CHY3KAD5D3jOX8uw/ABwxidee4qgzkF+6zqDZIrJ2dUFX0plkOlWYE/
         FT/Hh5kChNAR3pw0pa62Xr8092VFoB0unJ4HN2ecgKmJz06Jjc2fSpUtZ4bsW+O7e7ID
         jD0nRRzzULDxhc2rOWX4VIovVnNQlc14RJf/zGA9VV3FROyO1kAgUag9boga55uccuCM
         o78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775333720; x=1775938520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3c+AHtrviyyOh7LI+MO6oCv19TXG9AFAqv5+gtj+Ltc=;
        b=L93+cY+on5ENUYA7AqFevoFrVEicJIKij09ANARQhr/UlJwDJOHBqlKdHTGlXY3TF6
         kalttpcTGI1lKrOb61Hdjrm3fHEKuw08urAhC5HGZq3VHT9EaF0176jLyFs4FbmiwPYG
         dLw4h6oJgyegMClr0rkBfxE0BjN9wbN/LoZiBQ6rDD0DwknAgezuru60jMmvo7ekA5Su
         9fSIvYdqWUSH4gYGGJBBxa7y3rja33X0rxLJmWrt/S5BB87gVKhD5bqhoTD39DWhmLuK
         VsWwxxs9b6LGdVPRsK1JilkAVJM14YFEJJ2xY1fqkLcYq97rMdKR5Un82oSSHrjM3HAg
         e3mA==
X-Forwarded-Encrypted: i=1; AJvYcCUIf4oNIKhSjTpuQgVdtcEklrK3ptPdkNdQk0VqHi+4NbTuDsb9KIZOxAuTnYcpZYBVbbak5BaLydZCfHfOlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhVH9vhxxy1KiYxRP3h/X/QYJavAtnF0DBaNfhbhXvO+NiM7S
	/z72GXc6uaTRf4K3BKzq3P2CWy2VbrpIDamT241MjdnpA6OEnqzHRiAOM/3dPbqGl2du8IKtnej
	p0/4IZBrZ/dw4SYQx4AC7pS1iRSQdaFo=
X-Gm-Gg: AeBDievXSJ2d9VXKR9e3TWU4/eGl01fhQ0+gX1bK9ko59K/RF9JkvGoFjwzAhKwDOcS
	xDBnHKsnNxBPwf934s0KO8gdY6S7gaSYtBg2MO/ujG7O075nouLPRxsoed1ZsyPQjQLyotwNZ0J
	1jUl0FbVWmDW6k8mJdBiNjYZfjqMqaiHPglTLQWUcatScdnczuVmgSMYINM7zYg1Zhb0Jp2HEy0
	GMpPAIINDuQsYbiR+hiPLemo5IGeW4QHd8R4aoFdoXhy6zo8ye20tX46PnIcOPe2WvDa+cqkH1e
	pe7TkwWDRHeBrUCvEgDDtJDIv9MremfGbMAf1OFcFzxKo5GrcAoqOxsOK67ZMfM3CJxO0cLKe2v
	4oe+imY3KN9pT5dSvWY4XIm+W3nNoEvIH1g==
X-Received: by 2002:a05:7301:129a:b0:2c6:2bac:8af with SMTP id
 5a478bee46e88-2cbfc958fbdmr1408909eec.6.1775333717920; Sat, 04 Apr 2026
 13:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403201941.37501-1-t1bur0n.kernel.org@protonmail.ch>
In-Reply-To: <20260403201941.37501-1-t1bur0n.kernel.org@protonmail.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 22:15:04 +0200
X-Gm-Features: AQROBzB7jVGORVSgaQlTQ64ravJhozcCOY2LsF0JF0jhTABPUPOrlHsPSfYtjFw
Message-ID: <CANiq72=SWg8SgW8B65unMJEWyM=m2j_A1JjvQB+KZgMzDURhXg@mail.gmail.com>
Subject: Re: [PATCH] rust: fs: file: add FMODE constants and stream_open for LocalFile
To: Christian Benton <t1bur0n.kernel.org@protonmail.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aliceryhl@google.com, lossin@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 10:20=E2=80=AFPM Christian Benton
<t1bur0n.kernel.org@protonmail.ch> wrote:
>
> The C function stream_open() has no Rust equivalent, requiring Rust
> drivers to manipulate f_mode directly through unsafe bindings. This adds
> the necessary FMODE constants to the bindings and implements stream_open(=
)
> natively on LocalFile, giving Rust character device drivers a safe way to
> mark a file as a stream.
>
> Add the FMODE_STREAM, FMODE_LSEEK, FMODE_PREAD, FMODE_PWRITE and
> FMODE_ATOMIC_POS constants to the bindings. These constants were not
> previously accessible to Rust code because bindgen cannot handle the
> __force cast used in their C macro definitions. They are exposed here
> using the RUST_CONST_HELPER pattern already established in
> bindings_helper.h.
>
> stream_open() should be called from the open() handler of a character
> device that produces data as a stream rather than supporting random
> access. It clears the seek-related file mode flags and sets FMODE_STREAM,
> telling the VFS layer not to validate seek positions on read_iter and
> write_iter calls. This mirrors the behavior of stream_open() in
> fs/open.c, which does not use the inode parameter and only manipulates
> f_mode on the file struct.
>
> The method is placed on LocalFile rather than File because stream_open()
> must be called during open(), before the file descriptor is installed
> into the process fd table. LocalFile is !Send, which statically
> guarantees that no other thread can concurrently access f_mode at the
> point this method is called, making the unsafe f_mode manipulation sound.
>
> Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>

Please use `scripts/get_maintainer.pl` to get a list of people to Cc,
i.e. VFS maintainers and reviewers should be included at least, plus
usually the RUST entry. Cc'ing them here for you. :)

I think one thing they may ask is whether you have an expected user of
this new API to land.

Thanks!

Cheers,
Miguel
