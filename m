Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E933995
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711389709; cv=none; b=eOS4ym9LGleT5YGjd45tlOEnIFV0C29HivEFBDepUhq2UKqJDGj1H21lHPhQiAtxv960qTIIt807RiGLfmkd7HjaDiL2j8rGbkmBWOb72WtkV6JQvUWt4DaCs/Ab5K8lEgRu0j+0FQk2H0Bm04ijo9B4uAbyA3cyx8NKC5urPq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711389709; c=relaxed/simple;
	bh=Rf4CMYCCrhSmpGxoGU0f1wTxO/xwfQ24i6rjBlSInO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZxziqTFIwAiGlYymTj7yGBb8O89ux8alL7R40H7sM81szOAtdGmRsSwRbonz1E7UsqGPdXvOerLvNqQ8GTs2WCQxNcDiGwBKINUOrl9dZ4jRe46xYlla3sjTsGseNTtu8dHZerraqEFxwY4LIfMYFFG57yr4MinVMksJdr1OVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gofehotY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gofehotY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711389707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vw4k3b3JA+UO7J3+aoRgwW56+e8i5OByNqJ90O6HKfk=;
	b=gofehotYJNBbiQxncd8reiXuP8TrodfYHWf2poZua9af8TOjsFXox6GLPwTZ92U9fEtbrY
	EUbKoe3QSP5wxa7nfekEOgQis8CtRK3a9GPvg2hxhXFZtJwHYQlHJad5I9Z1wLWUbUZYLx
	Mag5Ya+nbdr80PH5rE7mNxUt6jRIIK4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-oaB34A4GPMyoGSmhSxXv1Q-1; Mon, 25 Mar 2024 14:01:45 -0400
X-MC-Unique: oaB34A4GPMyoGSmhSxXv1Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-412c7ee0c97so22190895e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 11:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389704; x=1711994504;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw4k3b3JA+UO7J3+aoRgwW56+e8i5OByNqJ90O6HKfk=;
        b=p2lkNfn7GXnfy/XkS6s6dVs41VvbgBHkHXcgD8K67gAc6yLxrBdMJjKzdlV6iKLsaC
         njzYd+iDA0xpr/N4rxcTpgG3LtMYiqwF7WlgP6nebI4vqX9Rh1IDeZ8pS/sbpRRj5SuF
         bgYgvQ+bNkPTR6OaKsgId/78fKYKO/uBGL8TLCBSnvamByAc6XQWE79vB2316FrDBdMr
         +QvjG3ZRIOw907FAVZrbjWS+Gcon8hchnFzdKXAYHnCeshOlgcYH5XTUDBhYCfI6VGvC
         n+Y6oBG21r2DiooZvDkGDQ015TXAeASmiwI1mUXuWcUUhJZXkmIOmg1mmQDBoQzXBshS
         0BlA==
X-Forwarded-Encrypted: i=1; AJvYcCU3nkRpSIvgfG2obwldmefHgbVpGxwj1suE6/RPom6II+CGgUrvnI+DM/SVO8gBFMZ7Gy6KryEID47a+V3vIIv2g7sXXoR32AMip4dIjuM=
X-Gm-Message-State: AOJu0YxYRMj24+kCFZrnf5U7LQfM+1bBdF487L95bezCdlEp8sBhBDwr
	6qHUnzmMSYxzE/reI4DQ+egWJyAmltWlGkM4WfyIfXDHHtdDJEB0bIVqVfFoJO2m6Z9jL1X2jBZ
	lORCPgWnBsv8yp3ec8fA5e8//8VQqxeU8vOrnK2CqapnzdM8vmgpkdh9q+M86ekpq
X-Received: by 2002:a05:600c:4d04:b0:414:6c34:a411 with SMTP id u4-20020a05600c4d0400b004146c34a411mr5670755wmp.24.1711389704284;
        Mon, 25 Mar 2024 11:01:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv9DM11jEEfHjlll8efNSzX9F4U6hXNC/YT+QuZnq5wQvmP5i4PoIzaOsN94NOybnRG9jvDA==
X-Received: by 2002:a05:600c:4d04:b0:414:6c34:a411 with SMTP id u4-20020a05600c4d0400b004146c34a411mr5670732wmp.24.1711389703932;
        Mon, 25 Mar 2024 11:01:43 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bcd0c000000b004148090cf85sm1292580wmj.0.2024.03.25.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 11:01:43 -0700 (PDT)
Date: Mon, 25 Mar 2024 19:01:41 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 1/8] arch: x86: tools: increase symbol name size
Message-ID: <ZgG8BUk9PgvdXaYl@cassiopeiae>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-2-dakr@redhat.com>
 <CANiq72n+ufjp3HfDQKqFdbzv1_WErH+oYLF=g9gW6DYG0XAy8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANiq72n+ufjp3HfDQKqFdbzv1_WErH+oYLF=g9gW6DYG0XAy8g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 25, 2024 at 06:53:40PM +0100, Miguel Ojeda wrote:
> On Mon, Mar 25, 2024 at 6:49 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Increase the symbol name size as the Rust compiler seems to generate
> > symbol names exceeding the previous buffer size of 256.
> >
> > arch/x86/tools/insn_decoder_test: error: malformed line 2486512:
> > 77620
> > make[2]: *** [arch/x86/tools/Makefile:26: posttest] Error 3
> >
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> For reference, this is
> https://lore.kernel.org/rust-for-linux/320c4dba-9919-404b-8a26-a8af16be1845@app.fastmail.com/

Huh! The patches, especially [1], seem to be around for quite a while. Which
also means people were hitting this beforehand. Any reason a fix did not land
yet?

[1] https://lore.kernel.org/rust-for-linux/20231119180145.157455-1-sergio.collado@gmail.com/

> 
> (I repeat the comment in the resend here too so that it is clearer)
> 
> Cheers,
> Miguel
> 

