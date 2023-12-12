Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uwHUvICA"
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3354CF
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:17:52 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4b313cda01cso1346846e0c.0
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702372672; x=1702977472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svtfoczbUmkSk/FfAJ18Ey7YGUd6Rbf3Cb8WhCI62xw=;
        b=uwHUvICAI8d2WPm+n84vK21GeB6SqVqzswVq4xdK2uBS3I9q0EzT3kGAK3eg4Noh0a
         a/TsNab0+cajSBTAT1g1+cf+1aS1f+9OXu5Yu8Jem0RhzERTKp8p8xPL5hTKox4ZPV71
         x30+DvmonEmhHD5zSkfpxdELIP/kKEDxMw64DoiPK4p3IIHk9E3lUZaWtvWhIo/0Ro/A
         Ygu1iZHinv+btgHiK2ZShZJWa5K4ko76947OTyl7OfvBbGuP+FnBB2zCb8VjVp6yfINz
         2MdKJp6DCgFJxQBpP/ykSDD4dO4VQKWO3PTy6QlFawlppOwMRqIWK5mXSV7+cOOv5heS
         DORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372672; x=1702977472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svtfoczbUmkSk/FfAJ18Ey7YGUd6Rbf3Cb8WhCI62xw=;
        b=gYCMSVK7s6PpQPN0jMdwDWYwx7Pg3VdGq6DsNOmLPIItEiDUJ/BfUQWNRHhWyCB7tF
         0PiLE0yimyxQXIuf9cpNfYaBpVUYMWq0OANFBK6U4Wmj/QYnv164Qg/Aj3VvghsoUbxU
         6owpnYMcRpgn4m1oSD1C4n19sqO/nLl28hlpp/MRVU3HI8VaEx5sUOjgmAbk60OXy3+L
         AajQ5NmFl/IQQmhr96SBA0y3sSbXMehlj68kXHYjCWgwgWBPlUYY6HlDKkhzxgE2uxDR
         RaSENBBhZ2ZRpJWejsgNe/PHDvabxLpHcEnmgD1p5dICnABiZCd3uOPuufUheZuxopqN
         JROA==
X-Gm-Message-State: AOJu0YzZUnIikzaCoOu9v0gC3r723gjgIyOdWW+uIulOQK+sV5zvqRAS
	I1fBCZmEpyywKL41S0ou0jRAnOhUOfF4tqiDbUhg+g==
X-Google-Smtp-Source: AGHT+IFmfbeb/7rtBj6vmL4fZAAyPipB/puXyxQ1iODO38/eHVk92foyKv3DYmMfxuPRWrzRFQ6KNFcTQlnfRFHHlec=
X-Received: by 2002:a05:6122:4485:b0:4b2:a0ce:e4a3 with SMTP id
 cz5-20020a056122448500b004b2a0cee4a3mr3622791vkb.10.1702372671793; Tue, 12
 Dec 2023 01:17:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211194909.588574-1-boqun.feng@gmail.com> <c833e8c5-0787-45e6-a069-2874104fa8a7@ryhl.io>
 <ZXeZzvMszYo6ow-q@boqun-archlinux> <20231212.085505.1804120029445582408.fujita.tomonori@gmail.com>
In-Reply-To: <20231212.085505.1804120029445582408.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:17:40 +0100
Message-ID: <CAH5fLgiQd=9k5OaEKUjLw9WFSXW-kujNveN3cXdvqW-xNp5PSg@mail.gmail.com>
Subject: Re: [net-next PATCH] rust: net: phy: Correct the safety comment for
 impl Sync
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, alice@ryhl.io, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 12:55=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Mon, 11 Dec 2023 15:22:54 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
>
> > On Mon, Dec 11, 2023 at 10:50:02PM +0100, Alice Ryhl wrote:
> >> On 12/11/23 20:49, Boqun Feng wrote:
> >> > The current safety comment for impl Sync for DriverVTable has two
> >> > problem:
> >> >
> >> > * the correctness is unclear, since all types impl Any[1], therefore=
 all
> >> >    types have a `&self` method (Any::type_id).
> >> >
> >> > * it doesn't explain why useless of immutable references can ensure =
the
> >> >    safety.
> >> >
> >> > Fix this by rewritting the comment.
> >> >
> >> > [1]: https://doc.rust-lang.org/std/any/trait.Any.html
> >> >
> >> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> >>
> >> It's fine if you want to change it,
> >
> > Does it mean you are OK with the new version in this patch? If so...
> >
> >> but I think the current safety comment is good enough.
> >
> > ... let's change it since the current version doesn't look good enough
> > to me as I explained above (it's not wrong, but less straight-forward t=
o
> > me).
>
> I'll leave this alone and wait for opinions from other reviewers since
> you guys have different options. It's improvement so I don't need to
> hurry.

To clarify, the modified safety comment is also okay with me.

Alice
