Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8F14AB8
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395391; cv=none; b=caK+wgnE2DaGVaPTCLO+T8rjrAihWq319OKz0Q1oba5cqTpIPTUE9+dh1VXVQ6R40Vm+CH+ErN6ylR9shqCUsHr5ZD4RNFeAGYZgzIFw5if1YC+661vKzmrZLs+A2kUaf1TYjwxerLV02J9LIlwae8Uy8ApyGleoOrtHkBfAv4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395391; c=relaxed/simple;
	bh=/EE6zEdy8vSyxaXssqys9K8UV1bHGJS0xUN4BKgSbsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jr0mIGR7kvH7fnnNnwdzGmhSOZ53Sf1w7vnZTn7bvgfYFAnMSfiv4kxitZFcd3QTqqtiL10Cp3vDVlzGqQKQ3A0Imy04cgNrhkkyEBhfrU4VPNypLIr5lUb6mPuVnjoVUFxCfw0sXVQaYGCp+WMvWWdanBNufIMDQFStfjXy5D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYNBN/j9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYNBN/j9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711395388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yzwruq1dcXbmlOClzgmGYNa6UBZFuYCLjP9xxjlmShg=;
	b=KYNBN/j9R+wghjkDnMGTs9ZZ2n87zhxe45aaHjf47ISHeElPN3e9UBIANDCvGwG23DfSOa
	2bH4W77bUUDOtdmTPCYh8hN1cK9YQ4x5pNrw4mgKhk5kDwJBkowI4VYcd1XgFABjCUndGo
	XiddRS/pXiEkEigJBuwBtnmkdP0jL2Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-0jaJiwv9O2WR8rflA7p5WA-1; Mon, 25 Mar 2024 15:36:26 -0400
X-MC-Unique: 0jaJiwv9O2WR8rflA7p5WA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-430f04c2834so83056721cf.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 12:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711395385; x=1712000185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yzwruq1dcXbmlOClzgmGYNa6UBZFuYCLjP9xxjlmShg=;
        b=nUTZsD+U5x2GQE9YL+Vwj63vH7B1kSyDkaDIWb2QFoctt49uJRW7htI1K6YklYvdE0
         xpRmQrkuZU2meuG8M3Z5FCdtHxh2PczGinhl3C/eTeWlwM3rUJZ0jFNIBSZSd52Y7JUO
         jm6bp1dMUo+CXQGbrXTHmgp57Wj+Ufs5zOL9jMQVym6kJFGGrTGI2l0xe8rGtqDe+60F
         bgi1zsTwbCv4uFQLZVHIG+l9u0xdp9n4kKfXtAsGJndTGhCvNA3Z/if9THi17nCRX7MM
         fl0i1oyv758XQxiCZK6C6M4jg5Nxbj3Lpm7Z77xzO7lL/ChWR6am8d2qNTvG/vPGBb4m
         TSVA==
X-Forwarded-Encrypted: i=1; AJvYcCUNLFJhq3/wQRD3cZZ6+0ZMnW8+FzFicaFvnQctZ/vTK0Q8FrOhLiujYm5y/3tFqyZhuRiJ+N2Pur0gGQgzM6rayDxA1NOyL1RSxbkawnQ=
X-Gm-Message-State: AOJu0YzYLTBueYGzm3xLuNhiFk5NS/D7jWbsdTy6ZeFGQAjbGH3wwZ16
	RXJr8oB19IbJuC9MOjMUABqEmm00WWWShIrO+2OfQjxHgPFVoo5kQwkvZ+rBep4QZr27fesG8gD
	7hpSXyGovxACd1UAuFcmBwZVFAonsOGpn2/raeHHerbYEo0iGQ17BFxR52nWtWQsF2eFubs/bRq
	y3ncayhm6r1p2Sh4inMDzMXouzfaOZkuAqC9kEt9Q=
X-Received: by 2002:a05:622a:1cb:b0:431:27fe:12bd with SMTP id t11-20020a05622a01cb00b0043127fe12bdmr11879587qtw.3.1711395385727;
        Mon, 25 Mar 2024 12:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYYtzFF61PP2c4bICaIqKgUkU50/P3At2I+vRRcp9Usv80i7IQ0SoXmdvrhnVPICgXzkWItdvcUFg9qo1Pah4=
X-Received: by 2002:a05:622a:1cb:b0:431:27fe:12bd with SMTP id
 t11-20020a05622a01cb00b0043127fe12bdmr11879561qtw.3.1711395385502; Mon, 25
 Mar 2024 12:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh>
In-Reply-To: <2024032530-fester-dedicator-a8a9@gregkh>
From: David Airlie <airlied@redhat.com>
Date: Tue, 26 Mar 2024 05:36:14 +1000
Message-ID: <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, Asahi Lina <lina@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> I stopped here.  Please build on existing code in the kernel, and also,
> a real user of these structures is needed to see if/how any of this
> actually works.  Why not implement something that uses them that we can
> actually review?

Seems like you missed where the cover letter explained that this was
in the context of:
https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u

Can we stop feeding the chicken/egg problem? :-) This posting attempts
to focus people on *device* abstraction problem, by posting small
patch series directly affecting things in an effort to get them
reviewed, or we post the full patch series touching every subsystem
and then nobody reviews it because it's 50 patches and it isn't
focused on the one thing they care about.

Dave.

