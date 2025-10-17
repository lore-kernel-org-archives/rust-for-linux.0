Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52038330328
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705977; cv=none; b=GT3/qrUs4S43hXHh0Zfcfj2JNlJmtbStzncizHMv4mqOfAhEUpVqyfpZzCQufdao8XRyeBVJRRyiw6x+iTthI2H1JZxDby9OB07EYoN/9+9zClOnKMYidYZR+2IjB51qpQHrEHiK4OCVok5pftXNOZ7nwqQZ0rkwUMJ6kw6NvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705977; c=relaxed/simple;
	bh=l4GFIm7f4CwtY0wlDOtvx7H306fjo9qh2uuYaEWaQMQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nPazOeZb22QKHBRzQpZpHcAo2Qa2dpRHa57GYnLf8aUpJ4myGrRdGwgFQwQYC9wc+6+94MraDVQ+eU9vo1c4DRTPrABrT7WLAVBeyW6pki5yrlTvNro3ugnxHabNshNiXXYPgObUGM39J+VRcA21LoDF0kyfVqaDEiuc/bfLhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rJszCSWM; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rJszCSWM"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47111dc7c5dso11650495e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760705973; x=1761310773; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UT83P2uD5TrvVVGd6VJB0Xdi2KNYIEGAXRO1Z6cxYXw=;
        b=rJszCSWMfdUecjp5MqY87uF1G7LZRRr1gtFFvadYgPbgeI3MSK0oRM5D3rOxqSHpZ3
         sfZGv11J10SRWbdl1XTmsnx9F1EVQl9WuXu9PITCGNr1II6T2FVkbYrIRlbUm92GhXs0
         qymXZZbw4IiZ9Cz9x6jEsJl2H/P5P+MUJ/MbokR12BzjZJ2KYrtjX5CO2tLP3Ob3U1Kb
         7G+pLiqVOsJpDlOb1pl7GDex5VPH6CNRA+psbWE323ye5DZlA/VJGSJfBOEEBUUQP209
         ILq207DqB7KEWXY9lUXQZYG7j2fWIDKdV4KRGcwTpI8RlRbGrMcm5uo10+M17YpWFVv9
         tWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705973; x=1761310773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UT83P2uD5TrvVVGd6VJB0Xdi2KNYIEGAXRO1Z6cxYXw=;
        b=MeUIoNU/sci99AunGaCn4U9ftMa/mZfO5OPMAOy0LmwO95eEe/ZoNWmUNHFJ5Tp/YW
         Jj1atSzZAIlH4CuQF78ZwdMX2Hni893ETRoYsE8SyuJm1BqA9hQiYtlBAOR8R0/swPiO
         yejumZgv9XfbRLpnCXYJuG7vQjbeM04dbI2tuNlhyD9pZYQaPQK3IE+EGGFA7tTlzOX6
         g1rkNNkIjpIcSTgQcYytrq3pY/eJ2Ps0pru8rxegymKtUNKTHm7ngdFOrvcORS3n2bNq
         9DSmKDFe+7IfXcZtOX0xeWJtT0UCQPEexDJLBCEyj/dFpWDVUtZpi9EpHxvDVpj6Zc5i
         oqVg==
X-Forwarded-Encrypted: i=1; AJvYcCVTstpiVJWfpwfqIdGBLlfYmA3HQLQKF0UKmEPxVFim7HckrkfPIdQbaip58ZQBVsD4CKbRscyDACQFQsCy2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHqOxUBKNV0svvn3bsNMLyY/87NuJdvsR6NXHx/GydhzrCvpn
	MZaAnP3kF9ZD5wzG6pTJN/SS5iNoFtyjL/SSS4NhuJfQ3DNSflQ8OsbF/kxuYchT6kdNUrBi6+i
	ZlUfcHyE8PU37xWnsDQ==
X-Google-Smtp-Source: AGHT+IFPk2lGWN99Ruq9BU1qrM3/rov2RiXwLUP88d5zBmG1G/Hu6Kpahj1RqZwLTFJv5EiDIoN4lFZjni35Nds=
X-Received: from wmwq24.prod.google.com ([2002:a05:600d:8358:b0:470:fd92:351d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3422:b0:471:793:e795 with SMTP id 5b1f17b1804b1-4710987730fmr33023585e9.0.1760705973572;
 Fri, 17 Oct 2025 05:59:33 -0700 (PDT)
Date: Fri, 17 Oct 2025 12:59:32 +0000
In-Reply-To: <20251003222729.322059-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-4-dakr@kernel.org>
Message-ID: <aPI9tNoh0I3KGDjl@google.com>
Subject: Re: [PATCH 3/7] rust: debugfs: support for binary large objects
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Oct 04, 2025 at 12:26:40AM +0200, Danilo Krummrich wrote:
> Introduce support for read-only, write-only, and read-write binary files
> in Rust debugfs. This adds:
> 
> - BinaryWriter and BinaryReader traits for writing to and reading from
>   user slices in binary form.
> - New Dir methods: read_binary_file(), write_binary_file(),
>   `read_write_binary_file`.
> - Corresponding FileOps implementations: BinaryReadFile,
>   BinaryWriteFile, BinaryReadWriteFile.
> 
> This allows kernel modules to expose arbitrary binary data through
> debugfs, with proper support for offsets and partial reads/writes.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

> +extern "C" fn blob_write<T: BinaryReader>(
> +    file: *mut bindings::file,
> +    buf: *const c_char,
> +    count: usize,
> +    ppos: *mut bindings::loff_t,
> +) -> isize {
> +    // SAFETY:
> +    // - `file` is a valid pointer to a `struct file`.
> +    // - The type invariant of `FileOps` guarantees that `private_data` points to a valid `T`.
> +    let this = unsafe { &*((*file).private_data.cast::<T>()) };
> +
> +    // SAFETY: `ppos` is a valid `loff_t` pointer.
> +    let pos = unsafe { &mut *ppos };
> +
> +    let mut reader = UserSlice::new(UserPtr::from_ptr(buf.cast_mut().cast()), count).reader();
> +
> +    let ret = || -> Result<isize> {
> +        let offset = (*pos).try_into()?;

So offsets larger than the buffer result in Ok(0) unless the offset
doesn't fit in an usize, in which case it's an error instead? I think we
should treat offsets that are too large in the same manner no matter
how large they are.

> +        let read = this.read_from_slice(&mut reader, offset)?;
> +        *pos += bindings::loff_t::try_from(read)?;

This addition could overflow and panic the kernel.

> +        Ok(read.try_into()?)
> +    }();
> +
> +    match ret {
> +        Ok(n) => n,
> +        Err(e) => e.to_errno() as isize,
> +    }
> +}
> +
> +pub(crate) trait BinaryWriteFile<T> {
> +    const FILE_OPS: FileOps<T>;
> +}

Hmm ... this is inconsistent with how we do vtables in other parts of
`kernel`. Normally a struct is used instead of a trait (see e.g.
miscdevice or block). But the inconsistency is already present.

Alice
