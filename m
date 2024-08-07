Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2420012B
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038699; cv=none; b=VZO2vAdmy5eSarc0q1fDgPed6FWRRK0hvZNUttbrVGVgQ7rFxN+ZDUFB1/9lxcaOfukhLUn4RJLmTAHmo1phe/OkMrV8Xft0HY0V7VuawU0vVUFsCWkfGIKPat0PJJj/KA2XTDqhIuHHAA86LGro9T67V/3PSXJLPNBdeuRoD58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038699; c=relaxed/simple;
	bh=pBYKm4fpVfzgQhza0GcXL5Svom4ImHO9MgVTTC8V5uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9DkzzIgM4RIoTF9la18XHrBDONxCIFUoPBPzOxOmU4fj0KPpM+zM4sh5zSTCkoOf0RneVSIVQaAVvW3YwZLCF+MdC99kfbs8Cyy0RcCjO8bpAjxtcYAb3U0KVNfvNAItKJOLy+txD5BMRh/XDVsmzfDJDS6n1OiJHAfJ6d10kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o5GbbFwQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o5GbbFwQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3685b9c8998so1039676f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723038696; x=1723643496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBYKm4fpVfzgQhza0GcXL5Svom4ImHO9MgVTTC8V5uM=;
        b=o5GbbFwQVVzFnWz1njC118t6Frfs8UYBombXVHqEjzot7jm/5tUCRZZb0KeS+7oB8A
         ASxdnMUwRW2bp9H22lFrfIkEJKvQpvOZ1DjXpVREbOGsRQGH2GbAsiLFut0VRxi6FoQy
         8RyZ/ptv7/59yM07hwPOz9YCqRktyDuSyRt/PaBax2w2qrZkmm8DPOUN+prANCN0vcoi
         WQYGLvQbt5xdbEwk8g1aFAiP6FiY+unSW1v+VJ2YSzTY5fWma81HxAYSo7Ob1PHzyX19
         NbA0ITRGH93zYoV0qs6KaOazc2rU40DAaEhPoOuGemXkWIkakC5OlQJ72l/WpxqcgGgO
         dBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723038696; x=1723643496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBYKm4fpVfzgQhza0GcXL5Svom4ImHO9MgVTTC8V5uM=;
        b=bX5dV/Q4hTohhMdU1UjJyYDLgycipZrUOT0zKCOEiYkbxyW7zD7krYbxdiEQQUXBOs
         dCuuTAQ1rRR6jDvCJMozmfzEoabAsZs5T3CN9NU7WGpPBzJ7t6mSuGKnOkU2tFGCdEME
         6hDprMNhLM6C7tZLMHpDh7bGEZcLty5PdtFmmFhIvzmnQ6BYtqWZGXMY0aPTXt1hRm/2
         GxSxwd1oQQQwYQTY/NJJ1xOLvISmXJ8F2NRHDW2uONwAcDyqOQt+VG+kucwDRXqPtJy7
         2Y5DcSSUXO3qxmjRFt94ZxnI4pXfmRojE0tCYZ+jv8DmdyGpxC+Quqg0aOM26MiE5Ziy
         mweg==
X-Forwarded-Encrypted: i=1; AJvYcCWe9LyeKeG2TUCtlhp1BhHbZ4dXkMZUcGqp1ChlKwLfM91UzYVfAJ5Km86sdTCydnSFqXnJJBxZ+R/0woKiF8g9YqZiyBkilAJ9X7RELTY=
X-Gm-Message-State: AOJu0YyuvEN1S2WloxTJm47oCIObC1EJxzwVQNdfrX7DnMzZLlq818v1
	5A/h0+zLAmHCePqeJ32PkQJZaohPQDM2Tn0i2Ij37DfyHuo2bPMXujn1PKm77+WDP0CQnkgX/5y
	65oodfl+x6tj59O3fFcw3MG9fjMnv6P6LgQEf
X-Google-Smtp-Source: AGHT+IFuC3HLUp9hyD6So6+hnbU37q4OQ+Ukt6B6VnPBLXKa8C8jCu5iGy1pQ1I1JNmaotgHtfO3vh+Uwo2gUSz6CmI=
X-Received: by 2002:a05:6000:c03:b0:367:923b:656b with SMTP id
 ffacd0b85a97d-36bbc1d2019mr11524154f8f.54.1723038695630; Wed, 07 Aug 2024
 06:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-27-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-27-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 15:51:23 +0200
Message-ID: <CAH5fLgj1YjuBaenY1TN6dGGbAPWK1zGBA8e-0zVjy7amouZ3ng@mail.gmail.com>
Subject: Re: [PATCH v4 26/28] rust: str: test: replace `alloc::format`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> The current implementation of tests in str.rs use `format!` to format
> strings for comparison, which, internally, creates a new `String`.
>
> In order to prepare for getting rid of Rust's alloc crate, we have to
> cut this dependency. Instead, implement `format!` for `CString`.
>
> Note that for userspace tests, `Kmalloc`, which is backing `CString`'s
> memory, is just a type alias to `Cmalloc`.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
