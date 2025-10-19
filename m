Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A041EB5F8
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 09:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760867095; cv=none; b=RKWmUVXPIcKqr5iDYa5QGTgYeXvw4vv/1p4ZLYwEC3hFHHMykwv68HU5mpjRn+igKzgQ1+In0vz1dPXWcWHkHP/xqRSxZl1rip4qwY/K9CEPtECvzz3qETL2u1ebnUIxKQT/bVf+x46/L9BsNUXi4NlMwxRND/goUpg5hozxz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760867095; c=relaxed/simple;
	bh=lQvvQeX2kLxkGylcp77A9cuf2QQp/SGSYBhQmuKYDMU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p3siqQEyb2Fcal+2Vggw+C+jMiaqh/eoYpGe0cpKttj9eoFtc6C4fD4LNtvu0KlE/JGtwexmTPctWjX5h0KFFlZU2LYenhdBGXKn9YcdO8AHzw++Nd5bxe4Vc5WXgVEi72rKAnVAIVhBZfKipyDubD8XRdlnPGBbtvSxQQQ32oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mFNEMTxm; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mFNEMTxm"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ee888281c3so6982003f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760867092; x=1761471892; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnQjaUK1mh2RVCnZb68MRf/S56xRi+BMT38Zeo2yMn0=;
        b=mFNEMTxmg6reItgrmzdJnWcnA/gjSghYQMh/gFG+E2Bisx5V/Tqstq7CaObpOaestR
         0ec/BD9Voff7jGOZggVocW8y7K0vvnHNorwOAXtLQ2cEA4eXQx2wdAfVVy/ERwLtWZGW
         o6+woEEbuofhQVETSfeVi1GsSV8BMJWkAzc3IAfjah/JLcvclPEVJk4nVnIRnY/KbdmK
         +0lgjlakFwX3p+hyjJSqBywa+gHamiKPaFuup8RRvGefQwiCbZCzJHeKQdzJwg2oHKEj
         pWNtlK28CTak3tkKoEtXyaIrnObXtKkqLv8TC/T52q6UYtPSDgXh0b9Le2FPl5gXd5XX
         85ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760867092; x=1761471892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnQjaUK1mh2RVCnZb68MRf/S56xRi+BMT38Zeo2yMn0=;
        b=iRdhrti2lWB2hg71eHMQVsawSisUVmw662eXFKG5Sa99n/cY8eFFVPrH4zhQGzVC+p
         BGI9U2jwZqHeHbNKcxJQdhLWm8V8kmwELwwcummslYnCTVBX/dtKE7XtRQzla3Btvhl7
         J0HBz51M9Y6vFc6hPX4avY2WbpHedStCJI3wPEeRt8fHMSM5s+Na6zBgqxUYqgjvR0Sd
         yxtgZcani4BSq7oZKafQHOeZDpvxph7QOigpXRq5mxjtjBGxeUO6zzp5m3DLWTS0AEoz
         HDXIw448qIPwdtXvtqIXfBApwTqe67hOYjwVEpUvWnNEj5n6zQ9rGl/Tmr0HN/QuXk5h
         sDYg==
X-Forwarded-Encrypted: i=1; AJvYcCVant2PB736exrbWnuI7W9w2EdM7iI06i77xskrGHRBpdDLrn9QkGKEFD/i90a1MIoYb9kV/c3HVcGzmV2KDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfaWYQKnUKHJHKtk1wfp8FS3bONKcNlevNa18w15Ez4MYl1uQj
	SZqpf3IFAluocfhyKo9ZKod5A+5K0MWZLxPEfwdDtJwBYo7p6hV+Lgr8w2ed7Q/bhVFe7Fynbuj
	Kq3dPmXLYsXWCfSlGTw==
X-Google-Smtp-Source: AGHT+IEB+NKb0rZsgmvm2NOv4rB0HK4ykvQfmkSxFAdZGHKpHK15C4wbM5+IqqvJN/DWSj/falwjlG1RLc9Oq/8=
X-Received: from wmnb17.prod.google.com ([2002:a05:600c:6d1:b0:46e:5603:f679])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:60a5:b0:46e:1d01:11dd with SMTP id 5b1f17b1804b1-47117872658mr83316645e9.2.1760867091891;
 Sun, 19 Oct 2025 02:44:51 -0700 (PDT)
Date: Sun, 19 Oct 2025 09:44:51 +0000
In-Reply-To: <DDKOLD1897SY.84W93E6L8ITR@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251003222729.322059-1-dakr@kernel.org> <20251003222729.322059-4-dakr@kernel.org>
 <aPI9tNoh0I3KGDjl@google.com> <DDKO9M4P06HS.3UMGG3QR7BX67@kernel.org> <DDKOLD1897SY.84W93E6L8ITR@kernel.org>
Message-ID: <aPSzE7DpA7DxTHmm@google.com>
Subject: Re: [PATCH 3/7] rust: debugfs: support for binary large objects
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Oct 17, 2025 at 04:53:09PM +0200, Danilo Krummrich wrote:
> On Fri Oct 17, 2025 at 4:37 PM CEST, Danilo Krummrich wrote:
> > The reason I went with a trait is because that's consistent within the file.
> >
> > Otherwise, I don't mind one or the other. If we always want to use a struct, I'm
> > fine with that. :)
> 
> Actually, there's another reason I forgot about since I sent the series. :)
> 
> We need it because we derive it from blanket implementations:
> 
> 	impl<T: BinaryWriter + Sync> BinaryReadFile<T> for T
> 	impl<T: BinaryReader + Sync> BinaryWriteFile<T> for T
> 	impl<T: BinaryWriter + BinaryReader + Sync> BinaryReadWriteFile<T> for T

You can still use a struct:

struct BinaryWriterVtable<T: BinaryWriter + Sync>;

impl<T: BinaryWriter + Sync> BinaryWriterVtable<T> {
    const VTABLE: bindings::foo = ...;
}
