Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467381B59A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711476801; cv=none; b=COffdcj6B4J3hPseWCcNaKgdfzv9dNGSzHsoCYxAqs3+3patvrB/C8qrqVywDEfM9rpgECmsCVDKIFnyfbgHLFXVYv33g7pRtU+Oicv9+vdBqPEAWiiOtIGnc0Ewp8mLyzpmuPBUkKSuqqcKNBVvAqC0E/jRqqvXZXAfo5Fnirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711476801; c=relaxed/simple;
	bh=B3tSQLpeJNdqTThP4+uG89cEC71ymrocwqucDalQ3oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fwkx1Z5nuIajTwHByuSydX2BCuaxj8DdQxeOkkYOOS5pSCxgBCeNcCDNoRrtXSMngeAO30AQd9BSMhriRYWCYfg8UB78XuxG7q2uzrwa0OdKVkd5msof5aozmo2aSuiJ0LVaxcn7WleAz4HdUGIi4I+zdowkNJ8WOKTLcnBJaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ffKsTXH3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ffKsTXH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711476799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SD0eXF9TifS4lVqn7AznehoimnQnptaM9qHpwlY3thQ=;
	b=ffKsTXH3ofDQBBQiOFLBHA4P5AGBx0mXRv6TG64JCA4q1q1cqO9GPaDnaOqObGrq/x7Lwe
	iZmU7Owju+8XuaQNIF0PK3+VxTA+dxOn7Syuy5ihBnysjpF+xFRq+ldq2DFI99EOithwv9
	WoC64ZU0iEM7gJmDdA7Ufn3BNI8IV1g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-ka4Vy3lNM_mAUSR_IO1K-Q-1; Tue, 26 Mar 2024 14:13:17 -0400
X-MC-Unique: ka4Vy3lNM_mAUSR_IO1K-Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a4734b06d63so315814966b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 11:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711476796; x=1712081596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD0eXF9TifS4lVqn7AznehoimnQnptaM9qHpwlY3thQ=;
        b=oAHk7QDEVOFWUf5b/h+sohAfxICVlDe+4JgGjaUIUCv05/w4KKwbyStB22AGh44ORB
         T3V/UCAeTV3qeWJQIKVWP1Rej0K8wJYav+xWhCRw1yAkJMEH1EuMBy7UWWHf5WGdob1q
         tSGKChPtYL2HIDFBM7G12PACFwYzQ7P/EDai0lQoffJ/LKGXKDNJ1N7dZ1ArofzixyDm
         tVUXkk/o9MDdbIsvgHdtdmV00gRtOa9j26XgGebQQ1k9Md+CBFqgvJH8LOtFYEnUldnn
         5u3CcGISEykw23GD+s7tVRkZsP2DyEEKtxfGy6qABc0fTloALTTYOTU+Vu5Ov47fzqRV
         TKSA==
X-Forwarded-Encrypted: i=1; AJvYcCVKJ8MVH9yMKNZGzKGnqZ35hBTSZ1D5xZ4YyWL9aeggxT91T5e+51z3BIghTgGE2b0aBErw4cg9aL3n2Ro8ibLwNwKrGKOcj78n+51Cwxo=
X-Gm-Message-State: AOJu0YyHTMxYtzETR6LMOYI59prQIloxzHyJCFaI912m2bsB4nO9tBZt
	Eyr0s8o2GRVhHM8b0k/6T5DCFaysCqIVSUe8GxB+HTnVcyzsLEb0RMPyYEjtzVbBx9roS8yGWkL
	IiR3aKcbDLwbqcL4KfU/e6LKkdwsLgVBBrnIEHr4JeRv3pUYVh11DMT3aB9MA1cfC
X-Received: by 2002:a17:906:1c04:b0:a4d:fae7:ece5 with SMTP id k4-20020a1709061c0400b00a4dfae7ece5mr353839ejg.6.1711476796509;
        Tue, 26 Mar 2024 11:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjG4HJL0GbKy8gvyW4KZVEv9sOF7RtsY99iwOmQ+dyM5Fqeey6RRgi+FSSCqK4MJGIY7OgZA==
X-Received: by 2002:a17:906:1c04:b0:a4d:fae7:ece5 with SMTP id k4-20020a1709061c0400b00a4dfae7ece5mr353830ejg.6.1711476796223;
        Tue, 26 Mar 2024 11:13:16 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id hj13-20020a170906874d00b00a474ef94fddsm3446988ejb.70.2024.03.26.11.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 11:13:15 -0700 (PDT)
Date: Tue, 26 Mar 2024 19:13:13 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 6/8] rust: add revocable mutex
Message-ID: <ZgMQOS01jMa651QO@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-7-dakr@redhat.com>
 <2024032553-facing-thaw-7048@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032553-facing-thaw-7048@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 07:22:15PM +0100, Greg KH wrote:
> On Mon, Mar 25, 2024 at 06:49:10PM +0100, Danilo Krummrich wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > 
> > This is a mutex where access to its contents can be revoked at runtime.
> > 
> > This is different from `Revocable` in a few ways:
> >   1. The caller may sleep while holding a guard.
> >   2. Accessors are all serialised.
> >   3. Accessing is not as cheap (because it involves acquiring the mutex).
> >   4. The size of the object is larger (because it involves a mutex +
> >      flag).
> > 
> > An example of where this a good fit to be used in device state that
> > holds registrations to other subsystems.
> 
> Why don't we need this in .c files if it is so needed in drivers today?

You mean revoking access to a resource in general? 

> 
> thanks,
> 
> greg k-h
> 

