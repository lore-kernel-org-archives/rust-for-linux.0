Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D884513D251
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052541; cv=none; b=nfMXBbwKLDikXUXQlHwscWy8Rt2mXs4nDZypZcCiGVBvA6ETFFqOeXDMID8tyMptZHaZiJnAZRwQ/8DMtHoKV577PDHsu/JMYOvkOLn8zK7N9lUP0GTdgS0zM6VVfG5YSYURgfrE73AcQLBIqKbrEO25liBdVL03xxPWJA13rME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052541; c=relaxed/simple;
	bh=9RpqaSW3EP8+7YSs6+tNYph9FaHPbkC6S+ZfjCCWSvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FD9r7sutkMWVVl9r2UUNfvHNwCRf9jlfVEvRByox8qPMIS9HgLcK/UrPgeB/FeFYLk9StGn3lMk+RiyA0YZAyGtDT0o941eQw/T2Rs4ejspXmivDM+0Tcy1Wv+HGfgj/vyQkXsuk3qPrsZaD+0azsRziNc8UBkb7gG4HtqiS93c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NaC6+FVL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NaC6+FVL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428243f928cso31636715e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724052537; x=1724657337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RpqaSW3EP8+7YSs6+tNYph9FaHPbkC6S+ZfjCCWSvc=;
        b=NaC6+FVLQE9PUe/A8woofJQkxb4eRv3AcLCZMkmdButhE88Z0m5AoM8dohL7qTd7UH
         4YGh3ZzaxwCTSmc6BTbZhEygtGTbfXudLqwwnBPRm8Re9w66mA2xStkcIW2eWVlS0XuE
         IGJN5oQNTj4O/knvnwWQVGF5Zm8DMqtD98MzCHDbxbpdFBLtvjmAvYAPO65OYU2ljoqo
         Q+p1ZZtiVKwUcn1KKF1uKBtPzvC24byYZa+Z6Xx5uY2aSleYQC05bX3rXaxL9ndMyFYW
         yuON27L2OVBfnV9PfsS0U5hDyP0atGUf9eQ2Xe6/cuEFJDw+Tp5kTBhB4iRlXPo9EgFE
         sdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052537; x=1724657337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RpqaSW3EP8+7YSs6+tNYph9FaHPbkC6S+ZfjCCWSvc=;
        b=h1evP6cFXMt40rderaVu/4J6L98DkvS0qZkJfJEJnhGEu/fSVN34xl5vKeQCZjcNny
         i+ASQkkmD0tDfXUwZiidRsmQMBB8/QPHPUt/Wufg4xGd65ODVyrauJvmDztmLNoXLrT+
         9Uk3a3n1iXLzX8UqobuPB90pds03RdSz/Rz5Z6A77njEEHFZ+X0QUdK5dDcXJyZU4HwM
         6oQEZW7HLCftsm1DoiQzuLa/lFyDBIgA1rnQeyOOdAJdAncpBRpN6235IKaHCqQID5b0
         gy2v7EIUo+QC6dMRtn50LRckMQz85RTWNktmVAS+Ml1O1s/FOB6CcN7Sqv79JBNuIv03
         8vxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ot/EMal8QEIqTf/VqjYWGgvhPXcNrZcVF6rax3gXeEMqxTVJB1J83yrc0zJoZeRXR/+y8N81EXwCM68lWbRfaSmSAzMnuzMWHK3cer4=
X-Gm-Message-State: AOJu0Ywh1e0NFJW/ms6xEpR/72s3qO5tYSo2GrO/A805e21m0TTic03v
	Rkg/L92oTB6iRvLz1QuIiCooUGKqEK1Dfq4xdpPgf3rAg3e752LyJKPhTrtEq0KwB0f+B9NnM6R
	B57si85ToEZopft2qA3fZDGUsi309WJi+Q9uL
X-Google-Smtp-Source: AGHT+IFbDPWP+j/rqNlthxQd7CrAdmAs9wRe0NTha3CeBwITtFOy28z/1Ffe4WKvnY7vqXrMteXUHK3icZnMnT+QQxY=
X-Received: by 2002:a5d:49cf:0:b0:371:8ca4:1b76 with SMTP id
 ffacd0b85a97d-3719465b8fcmr6024363f8f.32.1724052536815; Mon, 19 Aug 2024
 00:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 Aug 2024 09:28:42 +0200
Message-ID: <CAH5fLgh9Moq_9M+zMu300ohK=mPqkLyS6cpQ6An2Q3THCPFjaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: rust: add `RUSTC_VERSION` and
 reconfig/rebuild support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 12:12=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Hi all,
>
> This series introduces `RUSTC_VERSION` support, which is needed for
> several patch series getting upstreamed, and it will be increasingly
> useful as we now support several Rust compiler (and `bindgen`) versions.
> Later on, we will likely introduce other macros, such as
> `rustc-min-version`.
>
> In addition, the series introduces automatic reconfiguration and rebuild
> based on `RUSTC_VERSION_TEXT`, to mimic the C side, which is also good
> to have now that we support several versions.
>
> It is based on top of the current `rust-fixes`, since there are a couple
> pending changes to the version text Kconfig symbols that will be sent to
> Linus soon for an -rc.
>
> Cheers,
> Miguel

I tested this together with Rust Binder. I also ran this patchset
through Android's CI setup to verify that it works in builds with
CONFIG_RUST disabled. It passes both with and without a Rust compiler
available to the build system.

Tested-by: Alice Ryhl <aliceryhl@google.com>

I'm happy to rerun these tests for new versions.

Alice
