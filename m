Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1141095B
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Jun 2024 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719313177; cv=none; b=e0TXMymQfY7bljcLOLiD/UJjwT2/UAcKf5WJsb2afqTzWmejXxPV3+pOj/cgFZEuvRclxZobO263i5g3EfPivaDg0TnvKGcUZWRSE3H5j+s4xm4IsVPuToWpQQlN7NhnhXa47fvTmVyeqQk94itRjHKlLfClakHXLMNaaRzcUw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719313177; c=relaxed/simple;
	bh=lS6ZzIyA3oNbhwFhi747Z/Q7sqPWYutQ9EFInl96aPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ODpDu9vagywwUC+oBcrgz+/Apj54QZbxBp+YsrERFYD8OCGrBdLq9iWyw1802SI5blBNG571CpBAJFFFWZYt6rcXIWEvr5TcIOSLi/j8EtpAcb1vSft3+7vzyNf/Og696pGSMdKSLoa9kMsSx4dXA6SqIDv/T9t/T39bILPix5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=bkLoWZUo; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="bkLoWZUo"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a725d756d41so248770366b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Jun 2024 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1719313174; x=1719917974; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIKlAQmoOg25cYHG9vFy5f/Rq74IjJJuVh/PhSpJzXI=;
        b=bkLoWZUoOKQ9UHVdVRpkMWfMT0phpxClzjG0HYDY5qgS37X+sQxblfk/FwBzIk+RX2
         2DpJqjhMTY08jEOqYI9gVgpofiAy48u4+x2k90QwazIv4XdJbT7V1V3otblLRvxfXbth
         kKGColXPgL6Y6rKIiPElfdCVswKQldDPwUVGydusv+fDYr9B/AejqxqKHE1IbHDmP9hu
         S5huPKIuxUR3fzJ0a/qx7YglEpWvxVxWbRyqHyOWwGV0cEWxdx6oSAaN1eG7laa89OCi
         /foFoM6vP07smrAltj12OCV98EpnzkpHEo0KxrKESO6lTjeqTKhDV1YxL+IHOpOH5iUV
         4Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313174; x=1719917974;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIKlAQmoOg25cYHG9vFy5f/Rq74IjJJuVh/PhSpJzXI=;
        b=eUFFZ/8CcpJ4clkBqm2zweaPeeuq1Hfzx2GHRPz1cdVVI88RKKi1wEgjxcWm3gsoWc
         g9zhvXtaGbCNNLQgxwTbKEnKhfMb9fLcsBEjCD+foGqNdPvzzvFKCRQN4wA+/C/2G1rL
         OiZpKcY3/L9zTcRkDAiu8A5uqdJPkH6/cviyeEGYYtFWYZ9nvjtiqPLhVQR2+5o8XY1c
         ykECsAkxEkEq0ZLfTAIV7ZLDG6uRsegb22druDjVutI998VB5m+n/6Ts/wIZO4aPrsj9
         8URIYlv7vO/0uvCxp25mOHsDcJkPWfAAaEZsmwyva48gKUMyfrljiAZrjB7Eum217W37
         LKdA==
X-Forwarded-Encrypted: i=1; AJvYcCX2fgdXLfgFgazDHB/RQpsUuDnDI8YgmEhulisVBay+X/euCR9Cr3iumMd9fWY0C08RlUNowMor/Qim7svpy5nANP3+baUK5+4MQLybwKw=
X-Gm-Message-State: AOJu0YyUthymcxqD3viZ0iF94Lzd2wVBNscYLQd+eDd8QhUtLVzhX7wo
	Qeui0/rkxvY2ydz1PSoG2Yq+jf+jl1zXeHYeIlfFGwo8GJjc4DwQL9QBPwk8Dc4=
X-Google-Smtp-Source: AGHT+IEE2Iu1qYKOZCpHug50kXCaLoAfzlnzKDJxNZSjGlNOc+Pt6AUUN+WtSi84pdVmVnNB8Rjk1g==
X-Received: by 2002:a17:906:57cb:b0:a6f:e3e4:e0b6 with SMTP id a640c23a62f3a-a700e70884emr689926266b.27.1719313174154;
        Tue, 25 Jun 2024 03:59:34 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da3edsm5812269a12.2.2024.06.25.03.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:59:33 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org,  rafael@kernel.org,  bhelgaas@google.com,
  ojeda@kernel.org,  alex.gaynor@gmail.com,  wedsonaf@gmail.com,
  boqun.feng@gmail.com,  gary@garyguo.net,  bjorn3_gh@protonmail.com,
  benno.lossin@proton.me,  a.hindborg@samsung.com,  aliceryhl@google.com,
  airlied@gmail.com,  fujita.tomonori@gmail.com,  lina@asahilina.net,
  pstanner@redhat.com,  ajanulgu@redhat.com,  lyude@redhat.com,
  robh@kernel.org,  daniel.almeida@collabora.com,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 07/10] rust: add `io::Io` base type
In-Reply-To: <20240618234025.15036-8-dakr@redhat.com> (Danilo Krummrich's
	message of "Wed, 19 Jun 2024 01:39:53 +0200")
References: <20240618234025.15036-1-dakr@redhat.com>
	<20240618234025.15036-8-dakr@redhat.com>
Date: Tue, 25 Jun 2024 12:59:24 +0200
Message-ID: <87zfr9guer.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Danilo,

Danilo Krummrich <dakr@redhat.com> writes:

[...]

> +
> +macro_rules! define_write {
> +    ($(#[$attr:meta])* $name:ident, $try_name:ident, $type_name:ty) => {
> +        /// Write IO data from a given offset known at compile time.
> +        ///
> +        /// Bound checks are performed on compile time, hence if the offset is not known at compile
> +        /// time, the build will fail.
> +        $(#[$attr])*
> +        #[inline]
> +        pub fn $name(&self, value: $type_name, offset: usize) {
> +            let addr = self.io_addr_assert::<$type_name>(offset);
> +
> +            unsafe { bindings::$name(value, addr as _, ) }
> +        }
> +
> +        /// Write IO data from a given offset.
> +        ///
> +        /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
> +        /// out of bounds.
> +        $(#[$attr])*
> +        pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
> +            let addr = self.io_addr::<$type_name>(offset)?;
> +
> +            unsafe { bindings::$name(value, addr as _) }
> +            Ok(())
> +        }
> +    };
> +}
> +

I am curious why we do not need `&mut self` to write to this memory? Is
it OK to race on these writes?


Best regards,
Andreas
