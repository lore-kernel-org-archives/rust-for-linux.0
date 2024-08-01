Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9897E2F32
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523517; cv=none; b=qLrRJW+upYZXs6AHHL+BaTb5LcK6FdpL2cgYMZx8eXLcVTVaf15zz2rgJhmBREE8HYlCy+oiIy4lYcZIPzopQouMtGWDUlg2VgYojT4dIShZix+KO47LD6HUBQwP+S9konhF8MCN8d8g82ztotZLiixaDV5uU6cS+KNDrEsxa4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523517; c=relaxed/simple;
	bh=XOSjN69zw10K3Fscll2PgV5ah6M1BAQQhoIZfIwIR1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cM2yOnPPoBqC79FldR0cQuz9Mgt81V4cRJqTR+dj50YOk5+OdmPg29gj1lBnV205bh/rC+jxg369OLJGO4OZ0W8ILgns3+If+Fzfeqs5KADke3WVdo21C/qvVvvjzqEndoZe4BxvCpuACQZ6b5cPO+Z3PwbcZ3RVpIVVADdWum0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VLxd+fo6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VLxd+fo6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70eec5f2401so4364748b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722523516; x=1723128316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOSjN69zw10K3Fscll2PgV5ah6M1BAQQhoIZfIwIR1k=;
        b=VLxd+fo6vjQI+VSzXp6RqWIN8YuiiaM9MS1ZXEVEi/rduHHtzy6UEycVmGLmQTYXVC
         RdlmBixWjRjwq9t6a88A1bN0CAS+faT/bPdyxOBvAXgLkOWc6zrniEj6wcV9d59SpjMk
         AENgHjijLBn23GnFvmqhNukuyYzYlEVQQKX/7Uj3T0XZkuqkB5Pc4utbxlgU40udC8oa
         X2lISmqnFXQxxI4u0UON1uVcJLe47v+yq1vn/4JoWHxrnhDSs55DMRz8AV6+/Hsekcjw
         TJxSfEFY2S19sBiFkbnSlqUi8AbLWpdhg/2AWSMssRbJDBVMxUOkEQ97HUflmfBjQ7rx
         a4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523516; x=1723128316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOSjN69zw10K3Fscll2PgV5ah6M1BAQQhoIZfIwIR1k=;
        b=vJUojcbTMd2xGtBhRMLoEL5vEl3ugO9hDCo4sQ93WG1YkvxnTx+GCn6V3p73drWJTu
         djLC2u6leIjWqTk65LndOTRlW/OgUE857sry/UuAX4P1nLF68ptnfOJhNiDxZRTyZ1vI
         zA74mB7nzyU0x6Yfg19ugCu4qaK2eaDK5+ft7PG86R7fajLgxq0boE3SAf2zWJ1ezp8P
         3/QhQKqkKk94K658b1jKP6pCNhMY3kmBadQhJewnAzgirBQDf24cjnk4oxPmxCvfiTLQ
         Vdj3jEawTISIPJOwH6+TUXxBSerEADpmhwRJOgrvl3rPb27P3jySYENbGuvU59h/X0m8
         kczA==
X-Forwarded-Encrypted: i=1; AJvYcCXNjeqyltbuqRQl3zIDgDiz93PJoFshjMY3jJ+Xiox6hxG3HhmEV8QzEzfy8k4fruDKyxoLB/OGseEDRFBUkzE8+leXy9UnVIEjR5dAjEs=
X-Gm-Message-State: AOJu0YxJeYMeq2QLei6mMQuUxPpCFNzD+VPVMCzI31s5eJUCZb9+hVlb
	E50Wpj8H5MfUM0pIA4/2wh6ePPtafS1jYjN1H0aHRzxiHQk5IOFgdO62zgTsgBf70lkk5tWdodw
	nfH1LSXooZBPDBs/Wnsa0czbmz7xSrL7QyKhyVhIEsN7pZDOeURus/4U=
X-Google-Smtp-Source: AGHT+IHg3eY4H9S6biB7z1YipVyfB4koSyvQQsNi6v0oY17gqi/bFromitBT2zMM0KriLTqOB66ZPB4n5KkEj6qSJ3o=
X-Received: by 2002:a05:6a21:78a7:b0:1bd:709:e4cc with SMTP id
 adf61e73a8af0-1c699680614mr721554637.38.1722523515569; Thu, 01 Aug 2024
 07:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-aref-into-raw-v1-1-33401e2fbac8@google.com>
In-Reply-To: <20240801-aref-into-raw-v1-1-33401e2fbac8@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:45:02 +0200
Message-ID: <CAH5fLgiHc7azNtwTKNoLP93-APMqkK6vGFKYSEPepWoyNgNjrA@mail.gmail.com>
Subject: Re: [PATCH] rust: add `ARef::into_raw`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 4:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Add a method for `ARef` that is analogous to `Arc::into_raw`. It is the
> inverse operation of `ARef::from_raw`, and allows you to convert the
> `ARef` back into a raw pointer while retaining ownership of the
> refcount.
>
> This new function will be used by [1] for converting the type in an
> `ARef` using `ARef::from_raw(ARef::into_raw(me).cast())`. The author has
> also needed the same function for other use-cases in the past, but [1]
> is the first to go upstream.
>
> Link: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com=
 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Actually I just realized that there's already another use on the list in
https://lore.kernel.org/all/20240725-alice-file-v8-0-55a2e80deaa8@google.co=
m/
