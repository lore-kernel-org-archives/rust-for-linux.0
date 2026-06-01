Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8343403E8
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352769; cv=none; b=JljZgj60n5Wj4VyxFfPnWOJkZ+6vAc/d6Ic3dZynJHxT8srDbkVxAqBw0B3pHjvXWJJkIlQHY5G3lhcfeKeTsRgcMxMM5LcdhuZOE0o/IZIS6iiUBdbnFoUdTdrDPM9rbxH4x1G9hGKiwX3YiJ20C0pE9N2WjucHB0LosI3EGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352769; c=relaxed/simple;
	bh=KEKGZD7wPG4K2tO6rX2z5E8F6yamjZqlTqEu1Uo9K0c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVbmtTRDqZ/M8YJR4lPjXYL+0KDnRAZF8w8sXMvAJRC6pOWCBW2xp4lnZ09bwKxoC1SQ0VLpHeScw3W4cTL1J5KBJv6ArduWNth/MYQFwOjTsJGt/ygsrBFHW+jyrKR939LGPC82AxStt96LP6sjwcs3XDgs+UjyGaXLJm3Rlfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MBDFhlJa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MBDFhlJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780352767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEKGZD7wPG4K2tO6rX2z5E8F6yamjZqlTqEu1Uo9K0c=;
	b=MBDFhlJairdnFQBgaZjG6uc5tH6o5QozZW0NZ7fEG9LzxOjpARmLIPlAioPM6gINyemHx6
	jSgdFTPYbedr8yVNl9fouXGWa8lgz2OfYu5AXqs39fuP9208nMKMngcbIDKQXxn2nb4GbS
	FsI8qrOe+fkyelTjwL6+edMCF+RJCpQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-4Qk4R2MxOkW533kEpigETQ-1; Mon, 01 Jun 2026 18:26:06 -0400
X-MC-Unique: 4Qk4R2MxOkW533kEpigETQ-1
X-Mimecast-MFC-AGG-ID: 4Qk4R2MxOkW533kEpigETQ_1780352766
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccf396f53bso66162376d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 15:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780352766; x=1780957566;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEKGZD7wPG4K2tO6rX2z5E8F6yamjZqlTqEu1Uo9K0c=;
        b=CFAcG9BTJO/UPTgGYzKppJkH2B62u6nUDPdb5kLvDUsLaqeMZG8ENje3IYCTYFOW0n
         7S4tzAXfJuIE3a1plfqpXnYjgBuG1ZiQA4+LouxBp8bow907h+FSZcDO0v7vMlwfMSgF
         KliFpxssbi94Zeu806jzOVC2vaJmUCpRKB+ATapmxMBOrRHLs2cPYOT1l13Oxcf2hqgy
         MtNeN9U9pNYl92EW95FYaLl9EW6JSDdnFk2Jan7lzDB+wY+AfI8Fl0lAo8Fj0RdRurOy
         SVvV8AmjHHFW5Bn0LUzo5zkEcl96kM9d50GBXI6wMopoG8BWuoUg7oLrKDU4duvSj/fX
         NU0A==
X-Forwarded-Encrypted: i=1; AFNElJ9uZCEC++rOJTMpbhOlW25q/w3g/CAntgDKrzSuiW9H4w0GbQIWfTQGvTIdG6CI1xkB9KCkXLswhJ0ZiCWLpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyepqi/m1gwJr3DUegM0NODYOKnh/oJv2jgX1QAWrXZufH5T/oW
	bT9PrmNxHKp0Efbm/ame7PgWZoyrgVVKBcmHNRXh24ZeyJ8ySNzCAWSbHJZ3pw1bXFJYf/VjNY1
	1SLsRSkp3/OTy8a6/RGfMHbCSkEKrres3NHFmx6ilTdjgAPSfS/NNXO1uMdyuaSpv35S5
X-Gm-Gg: Acq92OHB7gD4rSe09u6eDb8dheZ3WFpca4fH4zL2+wDB4VpXL3jUNMeHDU6VCeeDhcx
	3J64OvLCLI2KezxYEChpK3fX0AhTExjYd+YfFd7Fd3EQHFWbUqzhWydKgdtC5rmSsnkwOz9kI2I
	kOrxq3/qykL/1yRlQPzbzoc1O5YK7HWmy8kOaKWGEPR7ABovItCDgOZo3YhSmXUAAuyHuM8GoZP
	ODqGPc69E2xiDc2r3hm6qmiZgL7pLVQ4ao9GeFSBMN+GheXPfhw/FYB266BoQ2OYI6CGc1aSCA+
	WGLuY9jPZU9v7GNUDKZrJjso6QM2fu09ouuRWZigWMEukpUCgzq8O9DY1ifAWaXDOcDTICUJ5mp
	QGiPYu5G+7UzlJC1keNU6lIWgneXT
X-Received: by 2002:ad4:5947:0:b0:8cc:f5b7:4e13 with SMTP id 6a1803df08f44-8cebf53afdbmr26107396d6.24.1780352765749;
        Mon, 01 Jun 2026 15:26:05 -0700 (PDT)
X-Received: by 2002:ad4:5947:0:b0:8cc:f5b7:4e13 with SMTP id 6a1803df08f44-8cebf53afdbmr26107066d6.24.1780352765346;
        Mon, 01 Jun 2026 15:26:05 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccebb681f6sm99921236d6.4.2026.06.01.15.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 15:26:04 -0700 (PDT)
Message-ID: <fe3c191db743897eace3e50d9994269b45f16d3f.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] rust: sync: Introduce LazyInit
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>, Ingo Molnar	
 <mingo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein	
 <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, Peter Zijlstra	
 <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, Benno
 Lossin	 <lossin@kernel.org>, Will Deacon <will@kernel.org>
Date: Mon, 01 Jun 2026 18:26:04 -0400
In-Reply-To: <ah1CarNtFhCvAAav@google.com>
References: <20260529173137.303717-1-lyude@redhat.com>
	 <20260529173137.303717-3-lyude@redhat.com> <ah1CarNtFhCvAAav@google.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B6vFnb99OHzQ5sROAZfg9M1_n6NNhfXH4lyMAckQvI4_1780352766
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-01 at 08:27 +0000, Alice Ryhl wrote:
> I'm not a big fan of using these kinds of tricks to access the
> contents
> of a mutex after unlocking it. Could we instead use a struct like
> this:
>=20
> struct LazyInit<T> {
> =C2=A0=C2=A0=C2=A0 data: UnsafeCell<MaybeUninit<T>>,
> =C2=A0=C2=A0=C2=A0 set: AtomicBool,
> =C2=A0=C2=A0=C2=A0 lock: Mutex<()>,
> }
>=20
> or even:
>=20
> struct LazyInit<T> {
> =C2=A0=C2=A0=C2=A0 data: SetOnce<T>,
> =C2=A0=C2=A0=C2=A0 lock: Mutex<()>,
> }
>=20
> I think this logic will be simpler for everyone.

> By the way, another option is to use a similar strategy to
> https://lore.kernel.org/rust-for-linux/20260523-upgrade-poll-v4-2-f5b4c74=
7eac2@google.com/
> where you just use SetOnce and protect calls to `populate` by another
> mutex in the structure. Then you don't need a separate LazyInit.

ooo - yeah, that definitely works for me and would be preferable. I
still will like to make one change to SetOnce that I think isn't too
crazy: writing up a `reset()` function for SetOnce that works through a
&mut like what I had here for LazyInit, since that would be quite
helpful to have in the gem shmem free_callback() function.

>=20
> Alice

