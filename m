Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9194518951C
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524039; cv=none; b=BS++5bD0XF4JK8Z85T7mFzlHR0PF263dsnUrCFI5aFESp8G5gkzVz0cO0UhvWIOyx6QKnQ4PRr/gcQKHtHSgOFx2iAaJwHK1MJHsLtecY8sCFMWJVItoumq3qYZLsHnuUEHf7vX2XHQsQM/JmCOTLtIn0OIUw3d+dpyUNgchZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524039; c=relaxed/simple;
	bh=8nMbj5vMNPnZb//DYqlw97WZvVsPp1BtGEEzYeBSTYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCK3pQe3MsbYLnVN+0UuB8OcgpworxQGajK6dng/mOT6tx18FcX6WqICNW7SKJ1t/a26pILpbPQASYn672RoGWj5tsj1lqDclC2wBDPFYz5yjQ4M3A4iCqpioDUlC9qqVZ+YuJ9J4h7TnjK1GU9hnlBca1cbgJsBTdzIsgzGeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dbVg/wVN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dbVg/wVN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso4338765e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725524036; x=1726128836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmQpWs+ZpL8+nQ+M/UHkIAp2vU2mSouieb8DnlV52jg=;
        b=dbVg/wVN6+ve+H7OG3h//U3hQUwm1qAPbbE6fsuVfkpLFzkxYMqN6XjHzywHZ1SW93
         elGvMZIrj4KcqoWoMG1sMVCY4Kh4q4FHW71s0YSEPi5D/AnX7ujcxOjWmcv/9NdbVcDP
         iMKpXMjbc7CRaGGG3R4JeADyzblYuPvQwg30GKP5eGdhduYr6sEughgDzrmHkk+UVXJx
         sA3/NcPiiQZ++oWSmHKFQT/BBNeCBA7fgqq6+NmrKaGfziEpVC3WT0pevnwPGTc2k6l8
         eribJqQzA73r3++5sf0c0ciRR3iqGcctY+7HBQB0X87zl7RVBhz91ziTO0nQiadROPTC
         NtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725524036; x=1726128836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmQpWs+ZpL8+nQ+M/UHkIAp2vU2mSouieb8DnlV52jg=;
        b=TJmjOJ5sjin2uB9zZPAcrizTzOA5GOIm7zsyskXNfnYrN614OU8WxBLN9j3fP0lb1n
         Qqst7QzrdW6CH3K4W5saIN018jC/uT7zF6e2LF+ugDtv0HEMUENdFWWfN+bprpbufARh
         uLVJjnFU48Uzicofpaq0E7w6tKkgx+tN/w5Scs0vg8nbKZPdILL1IWGKPzkttCADOEAw
         3ZmCuE4qKWcXwoABu90AriGjbjfZjoCQ248IdJHatJG+bMzy9G+mEJXHuddkgTFX4Psl
         a4xZvxOy4dZAkhdk8iwiFC8M4IIs0mCMaoPGL99WDHbNK7wi7UOdY4V9KKq/RfoUCnaN
         CvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLEytOKpN3xiuvW1Cl087Zl9UT8cnYktAsyXH0CTAC8EYR/AIxpjlfgLmD2T3zUgv51W6kmJzG58HiVOB2ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9cK5ouUHkWw2Yydjd3RzKtate/mSde23ln054ZFdbNGQN5wFG
	eEpoD8T2KZTXxvlhTD2MKTkTvhjnOD9L0wTiTmx7Of0JRBzdaZfxgGrSFJrwpY9zp8+C/rAShG5
	IhNUBo/lcM3ZcLwpV2eDUPg0ouN/VqfK4KKP5
X-Google-Smtp-Source: AGHT+IF6K/OC4L3DDXFevk4nj4cdDYMB+5p9rOI5uQ5GbPzkuLbAWPEkG0lkHomDQmHZLq35i0GcrEcClCnb4a9Zdyk=
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr8641982f8f.20.1725524035618; Thu, 05 Sep 2024
 01:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-15-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-15-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 5 Sep 2024 10:13:43 +0200
Message-ID: <CAH5fLgiger4Vg4fUFfwTwmWCN8TAP9qncP8AQpyH=p-qf0u-eg@mail.gmail.com>
Subject: Re: [PATCH 14/19] rust: provide proper code documentation titles
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 10:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.82.0's Clippy is introducing [1][2] a new warn-by-default lint,
> `too_long_first_doc_paragraph` [3], which is intended to catch titles
> of code documentation items that are too long (likely because no title
> was provided and the item documentation starts with a paragraph).
>
> This lint does not currently trigger anywhere, but it does detect a coupl=
e
> cases we had in private cases if checking for private items gets enabled
> (which we will do in the next commit):
>
>     error: first doc comment paragraph is too long
>       --> rust/kernel/init/__internal.rs:18:1
>        |
>     18 | / /// This is the module-internal type implementing `PinInit` an=
d `Init`. It is unsafe to create this
>     19 | | /// type, since the closure needs to fulfill the same safety r=
equirement as the
>     20 | | /// `__pinned_init`/`__init` functions.
>        | |_
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#too_long_first_doc_paragraph
>        =3D note: `-D clippy::too-long-first-doc-paragraph` implied by `-D=
 warnings`
>        =3D help: to override `-D warnings` add `#[allow(clippy::too_long_=
first_doc_paragraph)]`
>
>     error: first doc comment paragraph is too long
>      --> rust/kernel/sync/arc/std_vendor.rs:3:1
>       |
>     3 | / //! The contents of this file come from the Rust standard libra=
ry, hosted in
>     4 | | //! the <https://github.com/rust-lang/rust> repository, license=
d under
>     5 | | //! "Apache-2.0 OR MIT" and adapted for kernel use. For copyrig=
ht details,
>     6 | | //! see <https://github.com/rust-lang/rust/blob/master/COPYRIGH=
T>.
>       | |_
>       |
>       =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/master/index.html#too_long_first_doc_paragraph
>
> Thus clean the two instances we hit and enable the lint.
>
> In addition, since we have a second `std_vendor.rs` file with a similar
> header, do the same there too (even if that one does not trigger the lint=
,
> because it is `doc(hidden)`).
>
> Link: https://github.com/rust-lang/rust/pull/129531 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/12993 [2]
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#/too_long=
_first_doc_paragraph [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
