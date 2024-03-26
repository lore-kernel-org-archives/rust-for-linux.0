Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E41C6A4
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711472865; cv=none; b=GOjkBQA/VAzkogjQTex/zMk63cEfDxPr09sIQNF/ljueSqv3rMBAxiTrOj81c+MEtBtA3Fa3mUKbo2/hRHMmrqGoixADRh2omqBWsxGNDJ2MQnMmDkQY4KhRVFq04Q/ManPRbQ/oY0TM4JZWYHybOEj2fZW/r/UCkQjNn3ETtdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711472865; c=relaxed/simple;
	bh=PY+iDnNepQIzcpPssNMAAX0a+9c0BH22de4Owu2+TZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TX/rfkoAkMxYlHTnc4r3FrfrKIb9k1Ph5jQhLtgDfdT+vREZhKWuQiTsbuLkeMu+FxlAYLwxXrxwDLxghHRqCeVVv5LhQ3bsvL/6FLVRXIUHH/jVdTqCBJU9NEYVXrxLFGDeNajU2+fX6PjbprcLOYIxzG6OQ9ecGzURHe5gypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ee7PW8lJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ee7PW8lJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711472862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3PjCnetu90h82UbtIQF517xWsqQOKs1Xtw85f/bOI/s=;
	b=ee7PW8lJC+2oOduRnfyvPC0hkihg6M9XayT2XS4LxXH24U60us0UcR7taj93J2OLwNj57u
	NE/KC0Od2r8ktPChIIbs26G73uDO5AA14OZCQin0ZCBgGyLaTzw8cvF/H940YtgRsFX+jI
	Whwp1l1fNy7OQd4FW4e5CFoSZif+UIg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-UGuamKnNOgCtmE_TKNgBeA-1; Tue, 26 Mar 2024 13:07:40 -0400
X-MC-Unique: UGuamKnNOgCtmE_TKNgBeA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a474ac232e9so138264266b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 10:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472859; x=1712077659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PjCnetu90h82UbtIQF517xWsqQOKs1Xtw85f/bOI/s=;
        b=rW3mLfgxJBJNGFcp3zrDWVLdMuwMPYcuI6Z8tDfaCE2lOjMmt4NZnVZcUedN74qcTA
         CIHvAcB+0WqLSnbo3TTh0/OAmGQpdkNodqoLACagxlETIRt0UeNjSHRDjpgZojK1KXKE
         s7O/FnV5VBitkL6GAUYdci0HERprXyy0fqm+KuqAAdmnMwJmZ37wLhjxLt1215gZsV1M
         UWhD+w3n5HD9KReyZVBIsLaKG4dk2b32iXjexNPGbOT8wBFDesgmO0OlBZofYRWTx3l1
         QTft7petCanA54hFXOeTXRC5Ig0a1E74SW4a9f3AE+U4WGXpIaLK91YwvOJKsTMuGvV0
         vx9A==
X-Forwarded-Encrypted: i=1; AJvYcCVmqizc42YBspTiPjgIrpGDHL+gpVm+JR8xikXVF/705lfRailioO8Rc97pjGpYgGT8sp6TMpd8QBcgznHE0NpDFmP3kNhgimUIYid9z/I=
X-Gm-Message-State: AOJu0Yz4vRPU+CrLJAQLLB3pjlMMvke7Vix+te7UbJ8XymUnCfgG/uP4
	xpZHbmd6bAoN+M/n9AJfiR+DtP1eU0RtlUfv8LBpkpIX0G1TaMUNETLUk5O4rVUf5EX1aVt6+sf
	+hAVywKwF2UK0VFHYSJQhKqDl+bTKNXUqDhHdygWWWuxIi0wR0R9MY8lrnG3zc/GH
X-Received: by 2002:a17:906:2742:b0:a47:817:5225 with SMTP id a2-20020a170906274200b00a4708175225mr8195094ejd.39.1711472859476;
        Tue, 26 Mar 2024 10:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdQxq70s6N1MQCoWMIHrBCR45fvpn7s0wiPTbU6pXeVxFNjrlgs6ZA3stt05xC+0dfmE8epA==
X-Received: by 2002:a17:906:2742:b0:a47:817:5225 with SMTP id a2-20020a170906274200b00a4708175225mr8195062ejd.39.1711472859117;
        Tue, 26 Mar 2024 10:07:39 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id kh12-20020a170906f80c00b00a413d1eda4bsm4388790ejb.87.2024.03.26.10.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:07:38 -0700 (PDT)
Date: Tue, 26 Mar 2024 18:07:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 7/8] rust: add revocable objects
Message-ID: <ZgMA2AFc6mJ8g3RG@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-8-dakr@redhat.com>
 <2024032514-happier-hazelnut-4b50@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032514-happier-hazelnut-4b50@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 07:21:32PM +0100, Greg KH wrote:
> On Mon, Mar 25, 2024 at 06:49:11PM +0100, Danilo Krummrich wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > 
> > This implements the Revocable and AsyncRevocable types.
> > 
> > Revocable allows access to objects to be safely revoked at run time.
> > 
> > This is useful, for example, for resources allocated during device probe;
> > when the device is removed, the driver should stop accessing the device
> > resources even if other state is kept in memory due to existing
> > references (i.e., device context data is ref-counted and has a non-zero
> > refcount after removal of the device).
> 
> Again, device removal is different from unbinding a driver from a
> device.  Please fix this all up.

I think this isn't an "again", "[PATCH 8/8] rust: add device::Data" actually
phrased things differently (which indeed isn't great and needs to be fixed).

This comment indeed implies that device removal actually means unbinding a
driver from a device. I think "device remove" is meant here as the drivers
remove() callback is called.

Your comment seems to imply you have a different understanding of what "device
remove" means?

> 
> greg k-h
> 

