Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D995914A
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051747; cv=none; b=sgK3qQBs0bvFtJp00EY5LZYD7BVlh8/zPP9BeybwKM/9KBY9/JqDHB1IZTojiiBW5rCpK8lmVGaX2MJpU3ZYyiDXx8omVYsH874q46x/5yy9b31MCkJG8o2+WIY2JtAvs+V2a2RR71Tm0YaAvgnhvildTD16HtUIIP/4Awnxvks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051747; c=relaxed/simple;
	bh=a+YljDVrbcAwyR/tcUOKBAwbhaSbQeo8lJMXH+opy20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+0EcCJDeMzjjQGOryQsEcXWKLZKXuxzesHfahkBoxnRypzBBznDZPQMQi63qxE2ukZjXfB/5fZWVMXVcu2fvT+CuLOAnTP6ibq7wu3DlVhF5pyt8Bh6gyJcB8+GGs08iPv72zH0TY9dr0Q084uPzkjk8MbP5myHgBmQSWE76KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KsvBWpxz; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KsvBWpxz"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4765e6cf37aso1346033137.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051744; x=1712656544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+YljDVrbcAwyR/tcUOKBAwbhaSbQeo8lJMXH+opy20=;
        b=KsvBWpxzvxZIGoUiZxoyoVLoBnnOQr5jJFGAmVj6Bcex884PDy5mjSF17mTEouKYav
         YL8DKHYIb1th5ZQ15mYwGhM0GdCx1U8+dc8SjF5ao7dkQUfmENfVzzEkPSdMpSTS1RVS
         yhHVhvePqYceW4HzwvFWhAFk2tJUbyr/wDLgJQuzTrrz5kicjj/bl/icy4SxmOsPN+Un
         /J+JdCRrjw1HeEGRKtjjiAMfgYQ79JVj53+/GkX6Aonx54orFhtm3Z/z7icotcunvbnH
         vpg8IY1kSrXtrC+ecIrcYqXkXOcgDuX27ppYT07j0VSq5vnRvCv4oYodj1EkK+r/fIsn
         sEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051744; x=1712656544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+YljDVrbcAwyR/tcUOKBAwbhaSbQeo8lJMXH+opy20=;
        b=GEXQ6GdECcFX5x3yNy1ix1b1gWs8Gui0E32yo/mw2TxW+q5KTXlQpzUllniMiH2Z6s
         pKO1yBY7K9+OYryEa3ZXI1vBT3HSUy5JT3O0C4RhiCYnCzjhyYYo6n1GBiY4aW9yvSRM
         DiLuWG66QUDTOYhLKqIApcNJN8t/S8WCZ1VkDJALhiGJyFrafxhpx2dAllh+gs4aVGjI
         wjId6zH/fm65t2ALswgkmVA9u5gQb70h4t+0KYQiqlZrBn0o30AEHxzSszrbNK79C5SR
         EfoNphBYaJlaWKDhMoPbL2UZSqq28IdpUU6JWS4XZ3YPG9jtmntWsD24UM387GfFbtAM
         nj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbgj7PAVoC7VV2375HHH3JeDCu/9b7FYmUWTWZVwBcpW9KNzKwLNy7YupvhascsGPGsX3jGiimtlufMI7L//pTCN2/fbGheNusWDIe5YM=
X-Gm-Message-State: AOJu0YxKghg9A58kkfKW3eZRurXi2y9+tYtbA3M+F8dKoej0TBhcXnGv
	DBa/LM2z0EeMn5A7HprPqrnCdZRlHQKB4rlop+WZ0C0Zqqg8oQNHm9nix4Gso3tnwVxySN4yYDm
	IL+08+9Eh6Nuq5ZXSkOtj1+IvOZFGXVdFFA3k
X-Google-Smtp-Source: AGHT+IGv3VAH51GyjjtjsnXbb/DrFswdNA8szNO89cktWs1ewiqSuc3VC/AWKEjqHLDt3jRpmLOWygntlWniMVRckAo=
X-Received: by 2002:a05:6102:378:b0:475:fe59:f33 with SMTP id
 f24-20020a056102037800b00475fe590f33mr6501047vsa.29.1712051744314; Tue, 02
 Apr 2024 02:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002602.57270-1-ojeda@kernel.org>
In-Reply-To: <20240217002602.57270-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:55:33 +0200
Message-ID: <CAH5fLggb8jr2yaQwcQFmrP935_h+SRPT=xH+tRQe7dngiLB2fA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: use `-Zdwarf-version` to support DWARFv5
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:26=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.64.0 introduced (unstable) support for the `-Zdwarf-version`
> flag, which allows to select DWARFv5, thus use it.
>
> Link: https://github.com/rust-lang/rust/issues/103057
> Link: https://github.com/rust-lang/rust/pull/98350
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
