Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029F1E231E
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754315119; cv=none; b=S1pKqT7b0aDgNkSP+T9/WI24vjMUKi4ZifZlJ09uASznLtPzsI7Vsa5xILnwlm0veHmXWpSLWegPDIk4Bb//n87lYt9C8hTrdquG8ZTE5uuF7NOEM/EU2h/w+TeapUELxYp1VaqGMG5qpZ0PGO0LSTIocnxKn8ACJusCeTCiEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754315119; c=relaxed/simple;
	bh=1jH5khfvRzgjhCuPquHsfZtTT8xyalgl+ik0yhOuA/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsKVc+qIcN7Xe7V622EPof9HUcLLel2yOP2yW7vhH3StFhXmC8mDNMi8OGn5GpNJPe7KvqrPItt1Mzo2g511CDS+caKKNR3cW0R3ZzfciIIE3yU6ztasPdbk76fjHble+AYeBSbpep5K/nPAjbPuT0P/YeDebG6bwh5dtdJuu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cv5YlAha; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cv5YlAha"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561607166aso31309445e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754315115; x=1754919915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVxfLjqZpUxA7k2P1DVAmCagXBwL2u2PCEjKY9dcPbA=;
        b=cv5YlAhablHCtX/qr2i86/WWkxQRjwknqyG+u0FgOGCvdCEoDBrpo9XPt9cm/HLJZX
         Obkw9E6tjY2KOJMEau33wv2H2xQH7UW8sZEmpqell3KFW+dLK21fZ5px3Nd22Y/gXhTm
         WRnE8GSi90aehZiuQ2kTy4htHGnUJzK53B/BJ3dPLHlpB4TZr6RxEU+QEO2F6bNLonFJ
         g7UTRNrqnInEx57j7EabRWc9M9VmvHuYmCe8WsCG+dx0MYqmHPkFKMF10bBjaGghZ0ez
         EnUiFUZIxZqhctr9lBdpKnssTpbtDC3OSukMRY4pbon9DnXn9WSDrNPmnEbTH5z3nfAi
         euVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315115; x=1754919915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVxfLjqZpUxA7k2P1DVAmCagXBwL2u2PCEjKY9dcPbA=;
        b=XR3DHDfyGLnVLIimNuF1eXEJHbDJubj65quga+1Jn0rzcu5h610F/+9LPZtVNM6jLz
         ZQPYjiq8x1QA0EtHTe0uz3qS+Rwv2Y+Zw3evinkT8hEQOqcCF7n92bJ798XwuzwDXJR3
         UeTKs17qJS5BUnjdKT9b3n1oJgCgk/E5/33ZfvDEpcSVF0sGgTUV/L+S+5WbT8XgshRG
         rwkFxdLU+LJ9Kk/qXvAxrb4YtUmIheUuqbZ2XUWiAvTO4AN97PHo0TaBq3GVHPKe5TSm
         7uGZ0CVaE2pfOq5zCiEkr7aB/1dIdJTFIcUo/0pJYpUB5jIcHr1uxe/SM3ZHxfayQs9E
         fBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwTXEMrq8YxmKDA2geGJmpfcwBXgQbhkJNHyv2YTPrBN+9HaCH8SQAClaM7eCxJjo+gIQ7wP3BJTOcsMmbAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWBSfSyM0pr71tSNyDSCpJbChMpMX3tIrvCEUK60WsDTNXqOf
	ztvxvFIBvHmsgurDrIgQRSQbE4qhlkCH9R/KOmYCT3hZZ8Goq+pIJivPJ3a08ATZj5zAL5kElBt
	BjCxtS/uV1xN5SXa+d5owKfdEJ1t4dmW0gWXOwFFG
X-Gm-Gg: ASbGncvVKf6vCtUvo/gChhLb6+Bu/yJWw5ETfcx4sgO2EBkj/g3nExOUFq7Vq89RSeo
	c8agcafS4jLAsDYty2aquiu/bqt86M9IAGbngl7ietWpOC6RBm3ojPfWYEmtH1E1BoZDtZE51Tx
	+45Y8ZQbbEvCtfOpoHeNiAfLX7F87lByckv3PeRt02tmV1ZR6lVfLnbIZ1qtxXv9Qx9iLOeShaS
	zPDVCOoa/N/atcTn5sXAlI2lg03aJP4cVfySyOAYS3bR5U=
X-Google-Smtp-Source: AGHT+IFaotM+JyQ2Vpzm4IHwFj1sDugJTvhpJmHMDtD0C27FQSVnxByFTiRHFKX89CZ7UXKQfqoZ8hHgvXXbgq0byS8=
X-Received: by 2002:a05:600c:4692:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-458b69dd831mr67244495e9.13.1754315114601; Mon, 04 Aug 2025
 06:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org> <20250731154919.4132-3-dakr@kernel.org>
 <aIyGdr8vKV4XE6Io@google.com> <DBQZHIS4VQBN.WSKBML2WYQE@kernel.org>
In-Reply-To: <DBQZHIS4VQBN.WSKBML2WYQE@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Aug 2025 15:44:59 +0200
X-Gm-Features: Ac12FXwUx656MFEW5kmkNucJ1NlP5WVIBqML9iOkHHqR2MZNAaCDmASPCCRrZcU
Message-ID: <CAH5fLgi6W0g1mp6EyR16ayk_JT8pYJUUZbWXc-hyNxSxU_VeNQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 11:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Aug 1, 2025 at 11:18 AM CEST, Alice Ryhl wrote:
> > On Thu, Jul 31, 2025 at 05:48:07PM +0200, Danilo Krummrich wrote:
> >> drm::Device is allocated through __drm_dev_alloc() (which uses
> >> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
> >> initialized in-place.
> >>
> >> Due to the order of fields in drm::Device
> >>
> >>   pub struct Device<T: drm::Driver> {
> >>      dev: Opaque<bindings::drm_device>,
> >>      data: T::Data,
> >>   }
> >
> > I'm not convinced this patch is right.
> >
> > Imagine this scenario: T::Data has size and alignment both equal to 16,
> > and lets say that drm_device has a size that is a multiple of 8 but not
> > 16 such as 72. In that case, you will allocate 72+16=3D88 bytes for
> > Device, but actually the size of Device is 96 because there is 8 bytes
> > of padding between dev and data.
>
> Are you saying that there is an issue with
>
>   (1) the existing implementation with uses mem::size_of::<Self>() or
>
>   (2) the proper one that uses Kmalloc::aligned_layout(Layout::new::<Self=
>())?
>
> I think neither has, because we're not allocating
> size_of::<Opaque<bindings::drm_device>>() + size_of::<T::Data>() as you s=
eem to
> assume above, but size_of::<Device<T>>().

Yes, you're right. I misunderstood how __drm_dev_alloc works.

Alice
