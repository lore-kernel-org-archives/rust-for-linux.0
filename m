Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258DE217704
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767027861; cv=none; b=CmJNC00AdLaN0HIS6KuTCsIuEGSNy56owP7ILm9w9htvXjVE12h64c/t1iw/DT9QllccMeKSMeDKq/0ZRI/Z7HwbLc6d+Lwc3szrOFlSy3OPayJJGVn6wxd4bz2IKVQ8mS13Dg5CLeP91A9RUemvXRZZJUCe0j9mXar3iZN8A6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767027861; c=relaxed/simple;
	bh=zF2T1FIl8egI/W9aqc85qpNv1XV7tvAFANGtUovKdKI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hosha6UHverXL1zwDEhE3i1f7Q1Zm8l81rHihb3oNpJ5lN9uR2cYNIW5kBmEaR7yysWUqI2Dk7VONSLPFdzdi9aSDx/HGdWMj16KcYpFiCJpuWf1bmjnDwO7upkcx+/yEKREiDSFzKewKUXv5brUZyvXyePjRq6p6K2wW0qswfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=khG54HmF; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="khG54HmF"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64cfe5a2147so9820384a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 09:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767027858; x=1767632658; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1dWu0jtPAE2ll/Vi4qV+X83f54fPzcnMdMPnW/x9j4=;
        b=khG54HmFdbt25utDzpILgSpTuJcoA/4o4ZI4a+PqbkXGh1Uu5OlXVebtfZCzwjiUQi
         7M9XGneJNxM/JJM/8gsGrWdONStpOOooHaeh0AuKU5Gk/Jn/8kHzy4exOvlHEXSjYFil
         o10jctJen6Ct9J4IzvDgzubkCYaQ0aJRIRBakbnCZ02ytmAaJVBR+sHG2PIF14DCAchr
         gbhNYRqYU01w0i3f+0XTUzLWyi+Hnio8pEozZCAkGf4aUUVMbQdQROKHVBa147gHWaU3
         6aGti3iu1l9+bGDkTXc8q1Y0LZ5YL4zRDVhEU595XU9kUbb5Rjzgu0bQKN2KHKGTOuB8
         VmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767027858; x=1767632658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1dWu0jtPAE2ll/Vi4qV+X83f54fPzcnMdMPnW/x9j4=;
        b=Vw0dvGlud01pbDPZb/9x3+1jrAn7Cee4aRFPmt9nQdiktF1d27rbli7gvA50EBiP/C
         Uivam2vG7KlK1R/yTzqV9z+JGzsyvD+Llk1WA5JfHBsJ5m1DytRz7jYqzeaOuChcjTbi
         x/veVntO8H2l/1Ih8dlVJhRwQT8Yj4SFei2NC6gj4WZpMMnx0SXtHO+i/kzw8vRqa74Z
         rZ4bw7vySPmymR5QWRyVP9h0gPnv4Q5kFEVeplI9hF3L6xtvkd6givXnqePnpNKKmyy5
         uGFF5k4ijLmPk26AEK40DkMIJ9ueI9/88ErL+dDzNtWubEQOQj47i2+ze5zwzj5MrNX7
         Z66A==
X-Forwarded-Encrypted: i=1; AJvYcCVxDOu2qpLXLJlBdBXpSzpETbJxlMBVW5v9V4JCEUWl2zB2T44G62Rua8CQLivjDieu13ZhLePmjbBdapv2wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/Sd6pH+Vh2Zrfwzf59LPYb9TooV0TaUvQ81w8EPVKnqhUJYC
	kz1XV+seyaCPGRJyNDBdLnOWO2+SNiuKq/JH2nRL5fIZrvUYZwkkkFBEF/Bs04wSmzTwaDbz3LD
	/UDkCjdTrhwx1Ni5UFQ==
X-Google-Smtp-Source: AGHT+IGLicJi0comVcZ+prfwADDY35NYQ7QvSvuuC0CbbcqM5kwPagTxVkdtOrm9mfXbStXzIexWIboT7EXsQU4=
X-Received: from edvf21.prod.google.com ([2002:a05:6402:1615:b0:64b:96ec:ef6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5213:b0:640:edb3:90b5 with SMTP id 4fb4d7f45d1cf-64b8e93c176mr31064441a12.7.1767027858737;
 Mon, 29 Dec 2025 09:04:18 -0800 (PST)
Date: Mon, 29 Dec 2025 17:04:17 +0000
In-Reply-To: <20251229164544.1baf659b.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251229-fda-zero-v1-1-58a41cb0e7ec@google.com> <20251229164544.1baf659b.gary@garyguo.net>
Message-ID: <aVK0kS3KqUmpGSDz@google.com>
Subject: Re: [PATCH] rust_binder: correctly handle FDA objects of length zero
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
	DeepChirp <DeepChirp@outlook.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 29, 2025 at 04:45:44PM +0000, Gary Guo wrote:
> On Mon, 29 Dec 2025 15:38:14 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > Fix a bug where an empty FDA (fd array) object with 0 fds would cause an
> > out-of-bounds error. The previous implementation used `skip == 0` to
> > mean "this is a pointer fixup", but 0 is also the correct skip length
> > for an empty FDA. If the FDA is at the end of the buffer, then this
> > results in an attempt to write 8-bytes out of bounds. This is caught and
> > results in an EINVAL error being returned to userspace.
> > 
> > The pattern of using `skip == 0` as a special value originates from the
> > C-implementation of Binder. As part of fixing this bug, this pattern is
> > replaced with a Rust enum.
> 
> I was curious and checked the C binder implementation. Apparently the C
> binder implementation returns early when translating a FD array with
> length 0.
> 
> Would it still make sense to do something similar in the Rust binder? The
> enum change is still good to make, though.

Based on where the early return is, that'd be equivalent in wrapping
this:

	parent_entry
	    .pointer_fixups
	    .push(
	        PointerFixupEntry::Skip {
	            skip: fds_len,
	            target_offset: info.target_offset,
	        },
	        GFP_KERNEL,
	    )
	    .map_err(|_| ENOMEM)?;

in an `if fds_len > 0 {}` block. I don't believe it makes any
difference, but not having a special case may be cleaner?

Alice
