Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC62F360B
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428813; cv=none; b=MWMZx2mi7jdY693Uv5Iv8IXk/GfGAIgrDQ0HuzEaItsKgFsnsNZ8an0Jf3hr/cCmhVe+ohFN2Y2J3VDOgfgoQIRuV/Ho/JScuPO1sUYEyRLSJRI2k0Z2cqfvsC9dWjReb+80WSdfnOE1OVw1U07svc7zeqyiVe8BCUzEPaz1+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428813; c=relaxed/simple;
	bh=kskZfrnUVk0ZLO8Nc1tGxz/XbFYwKP6SavvJ3620Jng=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bsova0z2K28woJ4At3LeIvYT7AKJr8qBKdV7JTI8iBeClMiPUHcXxdoNxXawQ1+ChjjGi+poEHPmFf2crVLbaJ1qjRQlg0tCEQL4BceIa0cdpyTXKi+dnKbteLeV6Fx+YPvJv+nJf3RI4JFlUd2JsZI33bv+1WQegJXQFPktEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tadpRn1X; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tadpRn1X"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477212937eeso5196115e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 03:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762428810; x=1763033610; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T3LzpMnnz4ipgzn0EHBlLJPC1ABo5o2dTp81SvHFFqg=;
        b=tadpRn1XWHoPMOqYMF3sUTrI4iaQvp0g4JtdUKnUw31NP4ubyIBnsa00OoFjUMG/ei
         kPYgj1wWgiRuwG8J3tWGeWQXk6Lp94Gm0Lb3TOIOa7N72m88uvdGRAdW9y5kVtKCBxSf
         ZkMTBqlRtJ0SC61eBk5cPBxlVtoJVcloC2ZmZIcGVOjRe0ANR5odzXSUAcW/X0s4L1Gb
         UyH712PULN3R3iNw50LKw8JMUvEFdTtV2sjRT1txPvSUp3bJFfHXdFXa648pyMRm4t6g
         bB/JPmw18STGo2jaWY9xyy/MCd70RIccm2WcPkuAwAlV1HnoAzVj1I0kj+V6towenFVO
         VIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428810; x=1763033610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3LzpMnnz4ipgzn0EHBlLJPC1ABo5o2dTp81SvHFFqg=;
        b=BZ6+dq9mQTVpYrb7r4FTrfqKD1wvlKjJJhgWSk059ZF69lL9qDq6tz602tiY5NvlD/
         QkOtQx7wvGyx9e2gBctPRHJrgpAE9D74202ZzAwXDIb59VJgtMI9vUmA44cN4gfIpMEW
         tWEZ5BG+DLySIrkEHQorrsdShsS2JuOuBRT/vSHGiZaUTNbXMqJInzp2XVP32z+vTLra
         qtXEEPIF6uohOdd10F2FmFPglzMaHlaaDNY4PGkk/dfmzxksAjjO+z/fE0WFooI5bKWH
         cjA92lrWBnPnVlWk/zZ0TpDK0fEnseBE4Zb7kYZIgT1qraTZQzdpQVNW3e7y6miEv590
         Thsw==
X-Forwarded-Encrypted: i=1; AJvYcCXHF4LjfiCf0vgw5xoSQnkFABo3za8NyAwqa2iofef/NWlKmtruWLKzCWFE+BAbmYqjOr+32No7lfhU0Mnd7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxflQrnzJkiEOZIKjMcq7X8TQKlkZ6EOsNr6UCyrTPl6GfF9lJ8
	+TfpycbMpvdnlPiv4IZsTqXkHXn9QU/3+jwiZWQ6E6w2ZegOqMVcSxhR2IrUXHehBybHeqAXuhl
	/PZNJafIb+w+GvnYacw==
X-Google-Smtp-Source: AGHT+IHssTkDeOS2zrZoGKuLejZwLW0/HkLFxDa/KU2PrRZn+M5vKIDi/+Iwwc4V/ot2KZc7tJmUxQLHbnhZN1E=
X-Received: from wrbl18.prod.google.com ([2002:adf:a392:0:b0:429:c7d9:2f9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c07:b0:429:66bf:1475 with SMTP id ffacd0b85a97d-429e32c6cb6mr5721285f8f.3.1762428810181;
 Thu, 06 Nov 2025 03:33:30 -0800 (PST)
Date: Thu, 6 Nov 2025 11:33:29 +0000
In-Reply-To: <DE1IJMY33LSW.2X8N4PYXFITVB@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103190655.2326191-1-dakr@kernel.org> <DE1IJMY33LSW.2X8N4PYXFITVB@kernel.org>
Message-ID: <aQyHiezb9Dqsyx1G@google.com>
Subject: Re: [PATCH 1/2] rust: dma: make use of start_ptr() and start_ptr_mut()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 06, 2025 at 10:44:06AM +0100, Danilo Krummrich wrote:
> On Mon Nov 3, 2025 at 8:06 PM CET, Danilo Krummrich wrote:
> > @@ -576,7 +580,7 @@ pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
> >          // and we've just checked that the range and index is within bounds.
> >          // - `offset` can't overflow since it is smaller than `self.count` and we've checked
> >          // that `self.count` won't overflow early in the constructor.
> > -        Ok(unsafe { self.cpu_addr.add(offset) })
> > +        Ok(unsafe { self.start_ptr().cast_mut().add(offset) })
> 
> In this specific case start_ptr().cast_mut() is indeed a bit odd, I will use the
> following hunk instead and keep the raw access.
> 
> @@ -576,7 +580,7 @@ pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
>          // and we've just checked that the range and index is within bounds.
>          // - `offset` can't overflow since it is smaller than `self.count` and we've checked
>          // that `self.count` won't overflow early in the constructor.
> -        Ok(unsafe { self.cpu_addr.add(offset) })
> +        Ok(unsafe { self.cpu_addr.get().add(offset) })

Assuming you got rid of all cast_mut() instances:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
