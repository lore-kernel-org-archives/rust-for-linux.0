Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF01925AE
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730276118; cv=none; b=bOsLHQUgpDKmZctCTEpkohXzhaPPTXBWtkAenf+tsLGkMIqRr+/yQf73D6RkDDec4fAQ3nsODmm115ItPJSa+vLJZl9az0f++m6kNIHDTcK74BPRcB+0Jzqok/u92kN6RQu40ER9tuGowiiuCfLIlBKaHsXRnj2mXp8UFNTi/c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730276118; c=relaxed/simple;
	bh=EtP8O/x0Pp4fo5tjaL8Nz432CQ6nOV4hnuoz2QwMiBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFGDitz+GKotk/U+l7115ALgBSwvNarK6IjTSP4kWBaaoxqX4SrU/UMOgjPFf5VbI0mT+WsGb1BSel5Oy1uyhL0VHSLv22v2D6z19eRDU56FzzZz1lJ2Kk877S1fk1A4PFauWNKliZgnbAriF4YM8q6ieFiMUZP2DpHiFw6EHX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0iC8vGB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0iC8vGB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d49a7207cso4461740f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Oct 2024 01:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730276115; x=1730880915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtP8O/x0Pp4fo5tjaL8Nz432CQ6nOV4hnuoz2QwMiBI=;
        b=Q0iC8vGBvX2hZMGXhklquzKfbX1H6TCcDMB07yMc5XQK3Uya0NrI18yRACKCQkxlID
         zdYPJ02CVby+tkSkszCHsBNTjI2VXu2AllcfWYGSHciZo3prQLmNXkVKaQOCWzW6uwmD
         Yh4knvfLiKJr06MrwCFQ3e2vSHLN3nqIxbthX86IMAa/yq/+2DazKiHlK2tHHbVG2hdP
         izJdDWrSYVlxybwCmSNmF+xNW3dBYR69LqBotUntbV3lXQlRhasuHNK+NgTdWFJQfnqp
         DKMA+s+1u+PUR7+goaWsVsEjSNbO2ulqQUiSYZunGf1JEF36SmQNG6nqGiP49G10RwTY
         8cRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730276115; x=1730880915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtP8O/x0Pp4fo5tjaL8Nz432CQ6nOV4hnuoz2QwMiBI=;
        b=N1C93KlNo9US7YcJLpzAurgjRwEjyT7k3amKqt1bEF5jB59fHW/yKcDqU1+gKb7kQz
         HNw1MAGpRTSe+0DXHnCHaPrm0LBh+iAKTeZs4PgFq/aQyeGqhKYCnum7gIgCcRxwsiAj
         RheUU0rZ/Pxi14SaBBf2mhTClsofvIO7GLQJW5XOegdBg31iQ1OSF7kMlm8Td5sAUWqf
         oiqesuzuWribyJ0FdaqUTZRVpAwL2F4hNymQXJaOzAfqu8YZ7CyWUmJPQo6m96Yz8++b
         tn8O25OoBAzAA8WIAhSuc74xR4sTZupChLSivZn0Us/LJaKUYw5RRP9CxWqIYx36ZXN4
         cqAg==
X-Forwarded-Encrypted: i=1; AJvYcCUsH+der2vadYI2gV+yKR8q41Cu4S18Qg2KNYMac5aZC1FL+Ac/w2ektujpwfWLrP3KFlYPH8beNCxJPfoanw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTYw/xQGO8d/7qezdctALmwYg8NvHsGBHgBW/8ZM/a57pTRS9G
	DtQfosUHo/UeDL3udNmDoO9ZLld0q38D6sEaZ4NAYRv1Ka7J3SNE05f7jHLNNgQYpqjqtoDP9tz
	H7tSjHC/78L+Ljku7a033iYqB5UpC2PugxTAs
X-Google-Smtp-Source: AGHT+IGTc1W3EOESo8v224TbROhEfRVa3icYeOI4MIOE5l9k1YR97UWANEJFet9a8FfcvZVbNtjMuy+NGt95fD/dCpE=
X-Received: by 2002:a5d:6dc5:0:b0:37d:415c:f27c with SMTP id
 ffacd0b85a97d-380611dc1c7mr9637357f8f.38.1730276115165; Wed, 30 Oct 2024
 01:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-rust-platform-dev-v1-0-0df8dcf7c20b@kernel.org>
 <20241025-rust-platform-dev-v1-2-0df8dcf7c20b@kernel.org> <CAH5fLgjhiLUYPgTt_Ks+L-zhWaQG5-Yjm-Y3tfh2b2+PzT=bLg@mail.gmail.com>
 <CAL_JsqJWPR-Q=vsxSvD7V9_v=+om5mRuW9yYNqfavVRUwH9JFw@mail.gmail.com>
 <CAH5fLgiXPZqKpWSSNdx-Ww-E9h2tOLcF3_8Y4C_JQ0eU8EMwFw@mail.gmail.com>
 <CANiq72kaidDJ=81+kibMNr9jNxg467HjOm9C_4G7WRvaiddGvg@mail.gmail.com> <CAL_Jsq+T6T_3p2C62U3v4aSjm_oc-Ycjxi_ckF0ufh=JJDz=rg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+T6T_3p2C62U3v4aSjm_oc-Ycjxi_ckF0ufh=JJDz=rg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Oct 2024 09:15:02 +0100
Message-ID: <CAH5fLggCDiKUu_dvJZeJr8UD5RvUpqRJbdYKf1F3_MvCdOVK6g@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] rust: Add bindings for device properties
To: Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Oct 29, 2024 at 1:57=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Oct 29, 2024 at 7:48=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > One option is to define a trait for integers:
>
> Yeah, but that doesn't feel like something I should do here. I imagine
> other things might need the same thing. Perhaps the bindings for
> readb/readw/readl for example. And essentially the crate:num already
> has the trait I need. Shouldn't the kernel mirror that? I recall
> seeing some topic of including crates in the kernel?

You can design the trait to look similar to traits in external crates.
We did that for FromBytes/AsBytes.

I assume you're referring to the PrimInt trait [1]? That trait doesn't
really let you get rid of the catch-all case, and it's not even
unreachable due to the u128 type.

[1]: https://docs.rs/num-traits/0.2.19/num_traits/int/trait.PrimInt.html

> > +1, one more thing to consider is whether it makes sense to define a
> > DT-only trait that holds all the types that can be a device property
> > (like `bool` too, not just the `Integer`s).
> >
> > Then we can avoid e.g. `property_read_bool` and simply do it in `proper=
ty_read`.
>
> Is there no way to say must have traitA or traitB?

No. What should it do if you pass it something that implements both traits?

If you want a single function name, you'll need one trait.

Alice
