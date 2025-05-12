Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95501A316E
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050542; cv=none; b=B3lv/z8ILuVKOn6YWIQHBGfCHIdiwDOt+wln3W6vmKmIDMPD8bukvw+sRq0+BB8IKYGktQE+VnFSCBbGR0p4MRx72SibHc+WDK2DyKVTRCaf8MCG1B9ooDOilu/52IDhvQCNeFZSJHdc5sFiaNApzCDvBclGaggLqHR+jrX0MNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050542; c=relaxed/simple;
	bh=Jz0UBCw2Gju6xl3eyxWwT0kaMM/QHhhem5P5q8JBfXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyLcHvJ1UP+dkNkA5uoX1f1DGqJ350lcim5lCYIPbiBaM7qaDPeW57PM3aiUwInc2E7bPJTfqz5Z/EfyJBEzaochif/FWpAF9itEkrIk5AXKH/nBkq9A6Dl9qDHb9SqPt1MfHi21F/qPk0us50Q1xrN53p7lVOR9ugE2gGvuZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZdhdUqk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZdhdUqk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7423ee0e42dso604116b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747050540; x=1747655340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M623eh7KHrL4wzzyQ6i2eTLzXF/0x6NbLae/MPHBa0=;
        b=aZdhdUqkwqO4vN1Xfr4dA3Wvd+FW/oCQmGHRg252NkanbQG+LdgOwDr9yr7XYPjyLS
         80Pq6UKBHfJIDKqxs3abp5JfzXs1o5uRT98ZmFhdVjdonQ3jdTZZtQFZsYVPis/DFj4k
         MW8UJFMAwgMGSEvykXQOLaFDIUeIhEPWQBxbTLa8lvcaD/mGVxUeKnENJjq0ja255u03
         VdIZz3TOzRl9TapUFJtbIK3SBAAGWgLIkW3YTNgzdmbwtVlQ5stZd7l1dTfX/FZp/Wvk
         3OMKSl7IWcAA9q6pUedbEytSQeVuAbd+IXxvefrkC0KZULLGySqBQgJ5HMEHHLf54iv0
         VXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747050540; x=1747655340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/M623eh7KHrL4wzzyQ6i2eTLzXF/0x6NbLae/MPHBa0=;
        b=RWfes7av5p05xU5E8fxkyJDi3iKH2m6xPlcHChLun0Am6gAJbFFmkrf+0gaGOGDVnR
         WTNwYbvYyVqZNzVJVeUmf/PT9N0le9qYhwsK5PmJNWKUYlda6EnS6HCmt/2jn1UXmo3u
         kECbq3GnhgBD83xCF+ky1k8zWbzii8kiLJt3ftC4tI96231fduHwJfKAS04BtZs/CiUV
         XvyEQHRlp7HqKRg/QpeIf/7RdnS6WhrTq7q9jiidalg1vQRK/7c13KObvs5uvpFkfX6E
         unVWcQhtxnwj/FHe1KH8e6Ngjjr42prACP10IX6LSXM/NygJ08abDIdM54SagrOz5YeT
         h6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU215VxrfgPR2tMw7isR+UDWUFloKtqI/RQXBd9czx6/sbcTBTEkma/xM+upZF8qwU6UDHuF6pjyWncUIWjkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkoySp0VRKzpqottmGGGl1BOvDhm+wF5uzj0Mc26Gnvj2fIcLY
	wLPaOiphdMIvs333Q5QWeU5Mx8RrdNXVzaeq8m326UPCDZTvH6UAMij1TnW64a+YutEE7Ii+PsW
	R3MBlDTYwf/bWIiV5oE105xrPXDU=
X-Gm-Gg: ASbGncuNSPGv8OwNfrRHMxs0HbUYutFpmEcVlZIzKOnDOW7UNrn6qSG3wNciodsARtV
	7A42IQv9HhHhZFKZFF2mrm+bKHbLRNOBtV1tDvQULeqlgmKZrJQwPWSamqv/31Y0ufGCea2jn24
	vrlb8gjqYy2ecWkayvACt1ptQRmpLdinYB
X-Google-Smtp-Source: AGHT+IE3xgVjwdEAIWFwjMRammdXf+TLh9W1XCDBACWAC/vF9PIk9KjvDWPohy3UgDeU1ADlxcllhpba9doOob4xHMY=
X-Received: by 2002:a17:903:2f8f:b0:215:b75f:a1d8 with SMTP id
 d9443c01a7336-22fc8b0983amr72652195ad.2.1747050539941; Mon, 12 May 2025
 04:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410235546.43736-1-dakr@kernel.org> <20250410235546.43736-8-dakr@kernel.org>
 <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
In-Reply-To: <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 13:48:47 +0200
X-Gm-Features: AX0GCFvUV2CcdMAKQMOIHIM8lkXdP9qPB_xdNVjD0o2wN3nY5qX0MUHhB2Y9WpI
Message-ID: <CANiq72nPy=nAVgCZ2rgPTMEgELU1aJ17QHPWTu7M6i=YFrUpRQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, lina@asahilina.net, 
	daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 1:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Doing something unrelated, I got a Clippy warning about this public

By the way, this call (and another one here) to `container_of!` goes
through `Opaque`, so it will not pass the future `assert_same_type`
test we want to have:

error[E0308]: mismatched types
   --> rust/kernel/lib.rs:233:32
    |
233 |         assert_same_type($ptr,
::core::ptr::addr_of!((*container).$($f)*).cast_mut());
    |         ----------------
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const
drm_device`, found `*mut Opaque<drm_device>`

Cheers,
Miguel
