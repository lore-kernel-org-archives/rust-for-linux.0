Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D8194123
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083057; cv=none; b=TLqsX3X76c5sDX6dFh6Pc+mEmt3rv2fR+RevPjRx1WzB5F6PD4NM8lGjRoHObn8mgLJBmkhmzeYLSRzyoRSoTYx2yoNsegJW4ipfo1hyQuehjagrwYLCoWnYKfbd5X3VNcYAjuev5x93+c5GR906uWaMa5HyiOn/l4QoqeYmjVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083057; c=relaxed/simple;
	bh=dXtU+p8lSm5203QVSlqw3BD+P2o/6IwPYH/o0HqI2a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8Z+Yu3U3c+Z0Ek5VEz8XcWNE+KEQB4DHLiL6XITZGvCh+G6qR5UUrsOOzEz6dUBjnPwk7m8cntgAZQDVwciq8m4xWQqSGBQZk4uz6KpKZVa4OGQs6RFefpj33JKXF3rqpRylvkfNvOhYcUu6KEV9UdieXPlwp1v5PzQFeE8KWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cu0/2Oxt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cu0/2Oxt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374cacf18b1so2476302f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 02:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727083054; x=1727687854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVtSaoR0biX2T9CVpvtypIFchxY0cdh/phffmHsW2PM=;
        b=Cu0/2OxtLAxf0yQk82JJqmZXNnj0Z7R1j99eH4BGHfcIimv1OKbWpkA35JyM2u7iy6
         Qw+wBQ7v+lZl11cq7tbgKwFtgKtC5IBcqUZZRhUWznKh7xDE8EiBdt3H3dvQKqTFT3dh
         sxvPHpRxfy/5ynXvi/edK3ihvtj8MbeW2SQDC7S5NHg8/THM8AxToG6z8D1feOfhySn/
         0wzTkCIz/pYZtw6x+xPqNNukQUI/ZqqaZhxp5OBRpCRFg7LyAnufNHJSKajqOM54UeeQ
         xKhR1sqCwd51/CJoSpPLUTAiMDPiZeGoEcQv5yJfUjtvcj7nhvmb6wl/gSxtSZddlVUD
         RXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083054; x=1727687854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVtSaoR0biX2T9CVpvtypIFchxY0cdh/phffmHsW2PM=;
        b=d9pu9PUTl2uk4ypajo6ovrO+fLoJ6TgMhpsJT9nqmY5iu+FrCeNbzZ1UpD7uUlSFf9
         12LSzFNV9chBmoZB1aE2yvmBDJEp6h+XplP5EebocJz6g1rQdGkhCbKBiC7aizhRy8ut
         0SgAETEE5nN49+1BG2yagXQHRCAHXuvaRVOiNdgGXjaCtaT363OU7isxapA73Vjb4Ih0
         tbFSQ5Y/RRKoBkP7EvA8Wi/1U3veZqplPdt87f29cHip20preYCUw+bBtYFUMN8nrbq8
         hSfTqSxE/v8zl5HPDL3MHXriAK37pWKq437EH+GKE0QWOzLffXmTGsL/FxU1LTm4k0uf
         tD1g==
X-Forwarded-Encrypted: i=1; AJvYcCXs2G6OMiproH1znEghx7z4w9d8QVAcpmI2R9L0K7uw1g+RozBN7jZRP174CWQCxysS8wf6eQluLPk29LWNrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/Xr1/o7HRgXc1yVhTkwhG1WFJ4tqvqYYrRmLJrnDPg4SCVUI
	VurrvbZ+zvTcwpGwWI8nJOs11RowxT4oc6BajSCwW4NGoJ8dn4K6CxzrbxD1TgXheVdMBdQEURC
	joDgZJSOFLj9L+H7WBn6/i7DhRYhZRNQyZuq/
X-Google-Smtp-Source: AGHT+IHI74AJM69zd78KpzyQE1BtUUEeyU7RmQjBJekSb/384i3CmT5ZOtSPPuGLTObOrptz9khgPTIsTLIdBob0qW8=
X-Received: by 2002:a5d:64c1:0:b0:374:c3e4:d6c5 with SMTP id
 ffacd0b85a97d-37a431a7142mr6905859f8f.57.1727083053706; Mon, 23 Sep 2024
 02:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913180622.1327656-1-masahiroy@kernel.org>
In-Reply-To: <20240913180622.1327656-1-masahiroy@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:17:20 +0200
Message-ID: <CAH5fLghY0TQWX1T2jjxEFQ0kQ9cCVVZ6hHsMFknn8RX8K0X2jA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unnecessary export of RUST_LIB_SRC
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, Finn Behrens <me@kloenk.de>, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@samsung.com>, Benno Lossin <benno.lossin@proton.me>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> If RUST_LIB_SRC is defined in the top-level Makefile (via an environment
> variable or command line), it is already exported.
>
> The only situation where it is defined but not exported is when the
> top-level Makefile is wrapped by another Makefile (e.g., GNUmakefile).
> I cannot think of any other use cases.
>
> I know some people use this tip to define custom variables. However,
> even in that case, you can export it directly in the wrapper Makefile.
>
> Example GNUmakefile:
>
>     export RUST_LIB_SRC =3D /path/to/your/sysroot/lib/rustlib/src/rust/li=
brary
>     include Makefile
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
