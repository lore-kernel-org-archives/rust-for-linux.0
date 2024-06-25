Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13A158D76
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Jun 2024 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719321141; cv=none; b=cz/rMbQmKpnvdxknokVwH3mrXwYpL2XFki9YDy/CNZqbii/8R8vB1eyw8pz13Jwi+q4GOscj1vORide7wTUFluev+IbLRtPstOCHUeEWJgexxUrY9wOXfRvHQOkIA7uklsWKWc1Sw1GZajjrNyYzhDN80fzznyW8mmjrODdgioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719321141; c=relaxed/simple;
	bh=TFq4HLn3CLeNg6JyyyzAe6Ha+Upr2kIV3iKB8OJpY7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rKLGzzql+NmYXVHazCr0Gqy14GHGndJo7GunFMs3ySBtS/3l84rZoGwYffWKUo2yEj9+gsKKJZkOlBhTDA7GDEKJ0lKeekCih+drqyHw6laOTlyYrdMLZta5jTRofzJU4cdDqkbG38WglM3PzujoIlfLxa/W2akmBUDgOQ2WloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzeQJsgS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzeQJsgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719321138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jh/orAWdmX1f20UeUuohMffT1uAlWu31wkSvgtgeopA=;
	b=HzeQJsgSSmCqOWi16lZ0WGxQdjdYhYYDff42Xb1PXD0Ruo6o8Rk0ehmNfz0KaX7bSXctF8
	HV1n5d3aGcKZewr6bSE05i1EwjAL5E51mi1kb2++piVqtSdqJd75fEyv/ovu6PoPoZZED2
	TtjAy7PJOCdXTFC8nJM3CUKRyvxgBk4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-7T0faClLMoGYBh0Uyvph0Q-1; Tue, 25 Jun 2024 09:12:17 -0400
X-MC-Unique: 7T0faClLMoGYBh0Uyvph0Q-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52ce007cdd4so2077981e87.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Jun 2024 06:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321136; x=1719925936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jh/orAWdmX1f20UeUuohMffT1uAlWu31wkSvgtgeopA=;
        b=fvFLtF6OHXJ/q/N03aPXLUgTtQcHFXIfH12MtDiDzFMzyCUDXP5HFsaLoVYBDkhHk0
         2gdQIXhqdtuDcAsGX+QT4EeQFgQ7Bd6U79j/kYNs9vYc2CBtEUgKoAGjDv4uPgQrZOIl
         sAqHhabRvEtgoxqnzPH5qaE7J5XzBLqtnhTb0RScihRXfT3zWpLOrazF4BJD6CTrWVuf
         cRNsT/BPM4/vzq9HtsdBndFbm5RoYBftwuksz+6Tiywk/jcoGWO25dpOeycB4UT4R10b
         M4kSmCZ8O5u2c9wDRg9wZb0K2T9Nec2fzALpnfRnYjcF9Dq65eMf13Hizh/f8GHkUoae
         H17A==
X-Forwarded-Encrypted: i=1; AJvYcCV4mV96AvXG9O2K/RiRWt1xN2ZbbOU+9K4snAPlZyHPtRBlR4P0xW0opsiSGewbXanJMlaHHkIvNXEO66zHuJu/CfSGU1x0VQNgAJWCX1A=
X-Gm-Message-State: AOJu0YyyhK+xeSW4MSBS89qEar9Oio3RMoyX54Zk7XOmR7xemWySISn8
	Y36lSs9DmdtnG3DDo4X4RboGUqVeBqeT2nm3WoevUm7MUkyZ6et74AincZ2rlPpSuYUxgqc9tRW
	8O1/lnKJxPMK9SBq8Kgof9Qc+Ge/AZUoU6LdIiVbvZWXYVXmh7d3U0vQfcvSF/p7R
X-Received: by 2002:a05:6512:3285:b0:52c:df9c:5983 with SMTP id 2adb3069b0e04-52ce183b3d6mr3992071e87.40.1719321134541;
        Tue, 25 Jun 2024 06:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF35SrdNTXrkT5B2/iGfiGvj53zPOM8OB7zzQf/r/NlUat09myb8xoQxhJ+HmOKZSgeyj5WYA==
X-Received: by 2002:a05:6512:3285:b0:52c:df9c:5983 with SMTP id 2adb3069b0e04-52ce183b3d6mr3991982e87.40.1719321132655;
        Tue, 25 Jun 2024 06:12:12 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638f85922sm13038812f8f.63.2024.06.25.06.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:12:12 -0700 (PDT)
Date: Tue, 25 Jun 2024 15:12:09 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
	lyude@redhat.com, robh@kernel.org, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 07/10] rust: add `io::Io` base type
Message-ID: <ZnrCKQBaRUlIs8hp@cassiopeiae>
References: <20240618234025.15036-1-dakr@redhat.com>
 <20240618234025.15036-8-dakr@redhat.com>
 <87zfr9guer.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87zfr9guer.fsf@metaspace.dk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 12:59:24PM +0200, Andreas Hindborg wrote:
> Hi Danilo,
> 
> Danilo Krummrich <dakr@redhat.com> writes:
> 
> [...]
> 
> > +
> > +macro_rules! define_write {
> > +    ($(#[$attr:meta])* $name:ident, $try_name:ident, $type_name:ty) => {
> > +        /// Write IO data from a given offset known at compile time.
> > +        ///
> > +        /// Bound checks are performed on compile time, hence if the offset is not known at compile
> > +        /// time, the build will fail.
> > +        $(#[$attr])*
> > +        #[inline]
> > +        pub fn $name(&self, value: $type_name, offset: usize) {
> > +            let addr = self.io_addr_assert::<$type_name>(offset);
> > +
> > +            unsafe { bindings::$name(value, addr as _, ) }
> > +        }
> > +
> > +        /// Write IO data from a given offset.
> > +        ///
> > +        /// Bound checks are performed on runtime, it fails if the offset (plus the type size) is
> > +        /// out of bounds.
> > +        $(#[$attr])*
> > +        pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
> > +            let addr = self.io_addr::<$type_name>(offset)?;
> > +
> > +            unsafe { bindings::$name(value, addr as _) }
> > +            Ok(())
> > +        }
> > +    };
> > +}
> > +
> 
> I am curious why we do not need `&mut self` to write to this memory? Is
> it OK to race on these writes?

Yes, concurrent writes to the same I/O mapped memory region (within the same
driver) should be totally fine.

In the end it's only the driver that can know about (and has to ensure) the
semantics, concurrency and ordering of those writes.

> 
> 
> Best regards,
> Andreas
> 

