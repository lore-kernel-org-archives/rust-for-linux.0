Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2F18F2E8
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Oct 2024 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311715; cv=none; b=bn3i12motGdPLvCHODpBRbmgLd4xtbuEUUF79gV5VCh4RfYQmbJAH7Th7ahiL2qglnu2RkXcGNoSgfYX3w6TsopcffsFrCmb3Mi2OBxUQ3hc2iL+PkdgShNHYdGHs2tpv3XGmH46S0yhAXB7dzKkHvmmHluh5AYZke4eUcnvJ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311715; c=relaxed/simple;
	bh=YQIWDQsBjmGWt/IZ/1+qK+QOBolwzDnONBcCpa4ixGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sz2NZakutZYfOzRP/IjGzL+1sZFstB3hCuGjlJ8wnsIULNXpNiwsD75iXAychkR4YEhPY30SjEK++/zAVJRSo08aESkm8DiQb+mXqc0xKMjGprTjUWNgb/HqDdY/lIwz9bOBm9cb68DbK2A1yto+Tf44fUc3xsvYS6hrlR9OO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pJxTYD7B; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pJxTYD7B"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71dfe07489dso1040335b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Oct 2024 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728311713; x=1728916513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQIWDQsBjmGWt/IZ/1+qK+QOBolwzDnONBcCpa4ixGA=;
        b=pJxTYD7BrfnODxY8cEhOeeFuKsSnkcNvZyKB/+ldiJ1YEX4cyhf4pIyWGcInwliC4l
         Guezwm5cKqZeJ/fRGXQXliB8pY+aBjW4EGw/CpmMr9nhc32PeR0m/2m3LDcFFP26L0Ih
         aQsM3SKKOZpemaHK2sxItvKF6EilfKbKuoQ5jcPLJftFJt2mpz0x8RnnuTLcgh0mcH7A
         +Y/uP6FTslj0XWyKjCjTLXTd6IhyvmLD082pPo/z0/3fLdg+zOQSGX/sdca3gKTYA24Y
         YdazW9gsUyJQTV/XhoacbGV0XMAamUtUwRtYMa7UWmb/Tiu4lg1eNiBcwwjhshHFszfH
         MCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728311713; x=1728916513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQIWDQsBjmGWt/IZ/1+qK+QOBolwzDnONBcCpa4ixGA=;
        b=bprwZE7NKDwAYu+8qALOx3Qv0Qmy9qc04EYiTqu8fiQNUH3dbbq5Kn2ZmkwEMkkR/V
         BMYmGWi9rlxyeiI4xwc4a/YSSqtH5/Lw+BZ1p4nWP3Ku27ZV/kiNAcXM2s4LPkflkP0v
         18KTv0lqSBpeyiD1YICKJQb+i1n1vaedvrqgnARkGa5CBpvocKzvqU304Ghm/gRN0i7i
         P3qzko3EaISX3qux8BqfrIs5NG07asBbX13OQWJWLlRQNfmFIODov21S+lr92P2+xRbI
         3/BZQ1BezTCM1iYSB8Zcv+8OvumxqzLyOtYU4EHshTcS077FZX7wKfpgdFQPaJ4CW0iD
         BQsw==
X-Forwarded-Encrypted: i=1; AJvYcCU08eG3YQ8WPbStRS95ghaVjdJLuPjRIA090RX/NGQ/i/L2AoIbmbuwQJduC/GQ5jCiiYReAM/6pNQnWwQPGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4hr7LcF+dfxUVu+Kxa+rL4a5JFCV+sbV2VEzwZ+f5sF94eu3t
	dKTBInbf5EAbDoPbWOxCGVGqQAkzl6vhuQ1AdimwYVlcL/euOVOKfei4iBtwsrHPsPtj5+2dKv+
	Dl4EAIc4rTHD/lOQAwZinEc/ZLr4YyKE6Ysd0
X-Google-Smtp-Source: AGHT+IENnpbQRLAhmM9zeB/XPptPvJ9f8ZUvqcFNr/6Np7wOvHJi32Koo8lIjURY4/1ZXiXlq1bGgVLVn6dI82s6Nkw=
X-Received: by 2002:a05:6a20:db0c:b0:1cf:6d68:5654 with SMTP id
 adf61e73a8af0-1d6dfa46bbamr16309367637.25.1728311712719; Mon, 07 Oct 2024
 07:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004154149.93856-1-dakr@kernel.org> <20241004154149.93856-20-dakr@kernel.org>
In-Reply-To: <20241004154149.93856-20-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Oct 2024 16:34:59 +0200
Message-ID: <CAH5fLgida5mybAqE=4kk022ui0hmjRMnAttWrkn213XGXBWLXA@mail.gmail.com>
Subject: Re: [PATCH v9 19/29] rust: treewide: switch to the kernel `Vec` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 5:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that we got the kernel `Vec` in place, convert all existing `Vec`
> users to make use of it.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

This is missing the mm/kasan/kasan_test_rust.rs file, which was added
in v6.12-rc1.

Alice
