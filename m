Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BB540846
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Apr 2024 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563085; cv=none; b=NdLRKVGGSsfoAU8uYBa9ucpD03H5lE9KthlYuagCVwqJawHCQ87fK3b8dFbck7OSLlLP4JrDyprMxbNsEWZHUaWrcdVzjMrF0iiRPpya4Xs2XzYhgFIwtL7htuL9I//aG9NuFlCdlUVeiipPWoHovLSop6KMX0GhmcsaO010TpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563085; c=relaxed/simple;
	bh=x1L73aUMPO6i5N95soDNbxSHkancB3YIPKDbA9OaKWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRJG8gW2hLh8HoTQlKfgC87Z+Aj1ck2AhUc1XVHjx0m/Vo/+ZS2L3LnYBXM8g5zF33FjwKqqMjTeEbWxfoBlhWNh3pYrLGTkWWwtIik4gN92S+TP/5BG15w2SbyAy8ALzsIDK1o1Hblx/P0Bxkqb3760uaQl0YpxjgHeP9tKJ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2vM6G+VR; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2vM6G+VR"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-479f84be13dso343784137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Apr 2024 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712563083; x=1713167883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgW8D37XCsPMSzmJzu2C5qszizlKwN38z9kZ3r2kDGc=;
        b=2vM6G+VRuL9DaRWH1YDyGco8pUgyz7SjvfYSsUh3WmdJqr1Wnhw02uuYAeet8fyN+8
         F4GkL3Ox9QvTvd5jxVT2jb5Oqqti9C0iSqbP+OR3vaTpFEPEUthdRyjLgVRST6/scdRa
         JyqQba+w4/5JSNIGlVFVIGQFn+JQPaQH9N0PydubfZmWKhXOj2JoT7UcuCDvvqN1Y0Yb
         s0EXo/eT/sme5Yjgfq9UKL1z9ep5MtNLGQ3CtThjKgAfWAlEPmZMMh3eo0/OBG0KgE/c
         eQVA3X5oNddstF6KLDwyM6HaAmULc4zkEYJJMMjxuxx/nSjcj52rJUe5cuo0IHH1hWeW
         WKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563083; x=1713167883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgW8D37XCsPMSzmJzu2C5qszizlKwN38z9kZ3r2kDGc=;
        b=WWlxEZGyK3VE/9kTZibNpnFY0N2BPXbRMvgONFTnBW6Q+kSEhmtWkgsaw5JDgXsyez
         eYuE7WRwNbNFXpXqY78pu7Bgh76u+vjPLdXj/RLTRKf2MfJIvgV3vkNPCgPW9rttfZ5V
         smZQ2GVDvOmq+UjgvYsGmLaaq2gGOtgi6XGGJxPFsI4uGDm311D33uCkRm3pSjCBC4EJ
         MTFfgJOY0ZYPuCKGEpNI5EI/S3Yd0oXDH6mMaG+jfa/b++K2vWruiXfwb7mFL917xqHk
         Tqg5+N2joXfyi3a9yQZeTDjksd9fqqPkaJqUUYH4l7q2SIREC73l2FhrPXR2rt7vVbKl
         L5Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVFlcsrfTDGYoxKki4cwYfui361+ioBAe3BtQHQiG3UbhHtAFLFQuqxjooSELWwvF7mY+E7v+smQUf1DDwoAS8ClSLJeIjtRzyYip2GS+0=
X-Gm-Message-State: AOJu0Yw5wuTDTr0K4VpdGJZUoBVk3v4x0EM0Aw5ur/kVY7FYisfS3u2/
	Ijr3TYKdxS1cl29vzspJEu1fHZ4irs5n/2EVoXAcciU5zn3N+6zElV5XYIfNRFhe3Xbj87cdTsE
	spHgOmRMigZOjfb1jgFMx07A76E1pD0UG1HxU
X-Google-Smtp-Source: AGHT+IEoxtIf/xL0aORYLAQSMXWcLZje44z3USX++8ff1KZVkknJBH9LkWCgzsPGgx0jsv6wHPMvhjXnLcIHpSVOWLw=
X-Received: by 2002:a05:6102:fa8:b0:479:c455:c021 with SMTP id
 e40-20020a0561020fa800b00479c455c021mr6828460vsv.35.1712563082786; Mon, 08
 Apr 2024 00:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402-linked-list-v1-0-b1c59ba7ae3b@google.com>
 <20240402-linked-list-v1-3-b1c59ba7ae3b@google.com> <c715d559-0f03-4659-a515-1dd58e683f31@proton.me>
In-Reply-To: <c715d559-0f03-4659-a515-1dd58e683f31@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Apr 2024 09:57:52 +0200
Message-ID: <CAH5fLggvAzf22HVEhQf8Sw=e0pqPJGu=E2HAi+SydXX_FOU5Qg@mail.gmail.com>
Subject: Re: [PATCH 3/9] rust: list: add struct with prev/next pointers
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Marco Elver <elver@google.com>, 
	Kees Cook <keescook@chromium.org>, Coly Li <colyli@suse.de>, Paolo Abeni <pabeni@redhat.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Wei Yang <richard.weiyang@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 11:47=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 02.04.24 14:17, Alice Ryhl wrote:
> > +impl<const ID: u64> ListLinks<ID> {
> > +    /// Creates a new initializer for this type.
> > +    pub fn new() -> impl PinInit<Self> {
> > +        // INVARIANT: Pin-init initializers can't be used on an existi=
ng `Arc`, so this value will
> > +        // not be constructed in an `Arc` that already has a `ListArc`=
.
> > +        ListLinks {
> > +            inner: Opaque::new(ListLinksFields {
> > +                prev: ptr::null_mut(),
> > +                next: ptr::null_mut(),
> > +            }),
>
> You might want to implement `Zeroable` (using the derive macro) for this
> struct, since then you could just return `init::zeroed()`.
> You can also use that for the `ListLinksSelfPtr` in the other patch.

Sure, that makes sense to me. I'll go for that.

Alice
