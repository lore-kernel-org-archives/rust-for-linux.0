Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAAC181B88
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Sep 2024 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277388; cv=none; b=ZywuwficJULHngWE2ZbyXX7Nfub2c0hEAaPKswOixhWCjyzfQE4PDqfNXxMWRMQ9Drve4t7t+9Br9kCdiD4RLYxRRGax/BTg5K+pMjjaK+jKBWNhpjuWRN99onR1ND80KoZy+A2wFbHAncoS2Ucr5kH6NlT5uz0K1qOAMhf/0Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277388; c=relaxed/simple;
	bh=aMluMbJLhmb0IEL3J16AEDzecT8DhkBRh9kGj9W/BbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uo5z1iEinn2CxHyoPX2J1VVrXQ6t1Tw1a5cPMm7DrzrKCQq+glCK/vIDj9+rGNXEecph0cxWMfNyja0MWGyFPS5jgmmTAYtt9/1iV6xshU8oDADG/PaogGNODLDlYPli0e4VCV+U0htb/HmTyfwf53fON02UbJtD20vxaj8E5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESh/3z1K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESh/3z1K"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb4f8a4bfso22197215e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Sep 2024 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725277385; x=1725882185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJVoV8ur5E5PML26OjWYrL4zwoEkKD/ilxgSBTROy2E=;
        b=ESh/3z1KIOEVftA18H5JcLTsOpY1u9kXHa7GlM5nUSBpXH/KVnl6Tf7Leb3GY4Vo6g
         nuid1oxXHD8WUQFl8y33X8PrNgGYAu22LFH4Q7SQwmer4ZS2AV29cQlUnA3/QVMm5cb/
         eXBGoCSG9892h8r/aA6tlLhU2WcfLz6vXK1DajsSwakL9n/QT5BBk34MJlZdgJLKzydy
         qWvIog7HUKgBo2/gfhQVn2GBu+Gg8cFt7yqOQoKse5lRzMyxQ1N+/z13p2RkQ2XAEDem
         SW6mRs9/ijcdThuPJ28EWbIH0M6iy1taaOwuIfqxcQXfO5ps7Fk+d7UzYdfKw0b7QDLd
         1xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725277385; x=1725882185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJVoV8ur5E5PML26OjWYrL4zwoEkKD/ilxgSBTROy2E=;
        b=AAdDX+H8lwgEwpDxPr511gA9MvKpb+9Nzo2W/7PKer5NPLXtWNFBWCdYfJykqffr6F
         YYnaHZmVnVVuNNYi2M0z45fg10KT26vhKh+8B7Qu511JVzV6LQys24R0OyiqhD2gd1u8
         bBElfs6qo3sqPmxFPHoZwvwuDTeqbLCYsCWak3XhVvJnYWwZmJjnsn4DVcTSw4MlMapZ
         E5jKC4c0bZxlXWSCyy/jsxjf5TaT33+5egKxyf4DFXkqEhRgSsKfEH9wOBgX9nVd+d3g
         SYPQO9DVdORmM2iKfJLBw2u+rwbLXkixkQe91QZ0snQBTwPTKLBMnfmoc+NZDGGu6seN
         W9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXMnZVobjUhmoqJchbocie/7j69DAX7jOTCakmwepxOAEjXnlZCP+1xxKJFpP3Q+Ngp9894vji0+3HIQL+o5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXqN6yp9w54V4GcdxiGvm4PLqQ0Em4I9+P0V7QLz6hE4I1Ks5
	JKJKlv9LIgLQEHAAdkivm2bP+ijm5yZ2VJUWqSNfJDZVOpmSeY2fHmOD08G2kWeMC7X97HYBoWh
	mHvizvnqUH7P74xiF/zmKgaxsI83f2RCO53oI
X-Google-Smtp-Source: AGHT+IGBSIuAmK8flBxMTjfhqRpEYf59h0KGrVS2RkXNR24CE2gpartKGqUw821ZfLCdJ0tVXO06AU7ju/cNywO36CI=
X-Received: by 2002:a5d:4565:0:b0:374:c3e4:d6e3 with SMTP id
 ffacd0b85a97d-374c3e4d8a1mr2546132f8f.5.1725277384952; Mon, 02 Sep 2024
 04:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-static-mutex-v2-1-17fc32b20332@google.com>
 <10453342-d269-4b78-8962-821ef53d3cb5@proton.me> <CAH5fLgh-DYvXobXQVaQ9txYS4Rx8QhjyVvfTphk6vvnUOGzPnw@mail.gmail.com>
 <3b557f61-cead-4568-b2b4-4a56c4cbff52@proton.me> <CAH5fLggE-fWDuZXH_F3ixDSo7sQEFwnUV3cd+9_rpFH+XmnA2Q@mail.gmail.com>
In-Reply-To: <CAH5fLggE-fWDuZXH_F3ixDSo7sQEFwnUV3cd+9_rpFH+XmnA2Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Sep 2024 13:42:53 +0200
Message-ID: <CAH5fLgiZt3uVZiU1xXPcvYNR-Em2V3y+-C9EbsqrNvkScbiAYA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add global lock support
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 1:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Fri, Aug 30, 2024 at 3:22=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
> >
> > On 30.08.24 07:34, Alice Ryhl wrote:
> > > On Thu, Aug 29, 2024 at 8:17=E2=80=AFPM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> > >>
> > >> On 27.08.24 10:41, Alice Ryhl wrote:
> > >>> For architectures that don't use all-zeros for the unlocked case, w=
e
> > >>> will most likely have to hard-code the correct representation on th=
e
> > >>> Rust side.
> > >>
> > >> You mean in `unsafe_const_init`?
> > >
> > > No, I mean we would have `unsafe_const_new` directly set `state` to
> > > the right value and let `unsafe_const_init` be a no-op.
> >
> > But how do you set the right value of a list_head? The value will be
> > moved.
>
> Right ... we probably can't get around needing a macro. Can statics
> even reference themselves?

Looks like they can:

use std::ptr::addr_of;

struct MyStruct {
    ptr: *const MyStruct,
}

static mut MY_STRUCT: MyStruct =3D MyStruct {
    ptr: addr_of!(MY_STRUCT),
};

Alice
