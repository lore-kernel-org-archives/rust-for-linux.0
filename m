Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLjNae5N"
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AF31B5
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 15:43:47 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-679fd3f76bcso22149066d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 15:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701128626; x=1701733426; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdYaL1++Ul6Qr/y2HL/X7VgyGvn05NjEKwYA8MSzMOU=;
        b=jLjNae5N3SOeM5KEnr4k9DUX48vBu0gc3BNZodh5+2UyuHY/f5C7BPVCYdEM4U7kqo
         2+Pj3PdgjGSdqFe3HhWx0CZ47ihhrcLr3nVZ7rVjMc4vO08IqZne70OfRQ9eStjSku39
         3H/8x4sGDCyf/VAdzC9gDJ2zKoemzuKHgPN8e9qxYZ3LrgZ0NyLob5CsrfrDrWNuzZ5J
         IUAxCSfR4zR96AqH201SGb4sw6A27tsfjGnDQporAei7tG8TyM+gwtWfn+clPRO9H+hE
         BwdK6e5NBc/bSOOtRM3e8nbNcV/k2Awpdns4mX6Fm2D//YBgvsTfZebndFpgjFy9w323
         iETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701128626; x=1701733426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdYaL1++Ul6Qr/y2HL/X7VgyGvn05NjEKwYA8MSzMOU=;
        b=GONdCzCGq3p0pcrmzxlceMOOipaDCZBaJfhwWgq3tiJM5UGUFmvH/qKrUtrXBdWRyC
         q/IC9a5xgW4YZKnjqqBMawpffgOmonFFGh/eLEXVmfJtK2xsA0Hv0l1UI/HHsQtgC6C3
         H4tLn9lyWykjZWLAvWBnqqy2Cc8apwvtZz3vg5rG4Oo47QyqOafoh3yGifHlF+shmWxY
         3OsPupuRBGQbA6vkbmjXeGwflfB4M0/yZf0Pz+fIgmg/RZsypp7ItmZeW8oshBtMV4GN
         wonxtqGJTjdoWFe+z9h1e1tt3OYYsjPdDmGx+XpxHQrP/SpTn8djzvIaSqknfvtFfnOA
         FV6g==
X-Gm-Message-State: AOJu0YwtjRowSqigG1vLOLr5nv3jf0hByCzOGz/+17h7XeghC05clC6r
	06/Op9xjrVjo66Onb0jDW7M=
X-Google-Smtp-Source: AGHT+IGM/4/RkmEY9OemN1gwFJ67555RyUK1LwdZpNkqFbCPM7tt4IXXEZn/FjJ3PYzZ8Ji75buKdg==
X-Received: by 2002:ad4:4503:0:b0:67a:21a6:2dd2 with SMTP id k3-20020ad44503000000b0067a21a62dd2mr10539026qvu.44.1701128626404;
        Mon, 27 Nov 2023 15:43:46 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id s2-20020ad44382000000b0067a22bb8d57sm3114942qvr.56.2023.11.27.15.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 15:43:46 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailauth.nyi.internal (Postfix) with ESMTP id 5C52227C005B;
	Mon, 27 Nov 2023 18:43:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Nov 2023 18:43:45 -0500
X-ME-Sender: <xms:sCllZfEYYEzssJq7DStbnwaOn6q6YDDxTZPkENygUH9lYepj-YHo6w>
    <xme:sCllZcVAdR8x5x4Csb_L5lTcUEHVfZL0Lc-kjdZJtN-3FaNMTxBJPwgOcg1dWRJAn
    -pNiEyX-5sHEE-WKQ>
X-ME-Received: <xmr:sCllZRLqGUDzv-XkwrUpKkNY0SEHPpZfnnq43jdhulKQvAld9fdhmjVJwOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeivddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeortddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepgfehgfffteeludevueffteetieejueefledtffekjeetteffteduueef
    fefhkedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprhhushhtqdhlrghnghdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegs
    ohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeige
    dqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihig
    mhgvrdhnrghmvg
X-ME-Proxy: <xmx:sCllZdFB0Dyh98CYqV6Jz4FLnrbVrE44Su8fDik07Uh02-locCdxhg>
    <xmx:sCllZVWQvSb1q8v725K_6WGuEfxvEUvrueG91B10Mx565pFIj2uhuw>
    <xmx:sCllZYNupRM_QTgJFDl-SROmKA7tZPIidDTvWsI3tHFzcXx7ksp9tQ>
    <xmx:sSllZes-IofRAOvh9-kTN6pHLAgG5cGNi3SJvsXGoh3LPWKZZQgzCg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 18:43:43 -0500 (EST)
Date: Mon, 27 Nov 2023 15:43:04 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Wilcox <willy@infradead.org>,
	rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4] rust: xarray: Add an abstraction for XArray
Message-ID: <ZWUpiKWEjUlvjBXs@boqun-archlinux>
References: <20231126131210.1384490-1-mcanal@igalia.com>
 <CAH5fLghV0jtXCJ2aetH9ZNvJ=Tu-48DCjNQMPxAWf1GW-1Mbcw@mail.gmail.com>
 <ZWTUi8mNvjszP7yw@boqun-archlinux>
 <cb7b2e48-0e05-483d-a964-9f895910b494@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7b2e48-0e05-483d-a964-9f895910b494@proton.me>

On Mon, Nov 27, 2023 at 08:37:12PM +0000, Benno Lossin wrote:
> On 27.11.23 18:40, Boqun Feng wrote:
> > On Mon, Nov 27, 2023 at 02:51:33PM +0100, Alice Ryhl wrote:
> >> On Sun, Nov 26, 2023 at 2:13 PM Maíra Canal <mcanal@igalia.com> wrote:
> >>> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
> >>> +// form implements Deref.
> >>> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> >>> +where
> >>> +    T::Borrowed<'static>: Deref,
> >>> +{
> >>> +    type Target = <T::Borrowed<'static> as Deref>::Target;
> >>> +
> >>> +    fn deref(&self) -> &Self::Target {
> >>> +        // SAFETY: See the `borrow()` method. The dereferenced `T::Borrowed` value
> >>> +        // must share the same lifetime, so we can return a reference to it.
> >>> +        unsafe { &*(T::borrow(self.0 as _).deref() as *const _) }
> >>> +    }
> >>> +}
> >>
> >> I don't think this is sound. Deref could return a reference into the
> >> `T::Borrowed` itself, but it doesn't outlive this function. I would
> >> either omit this impl, or provide a sub-trait for ForeignOwnable that
> > 
> > Agreed. FWIW, there was some discussion around this:
> > 
> > 	https://github.com/Rust-for-Linux/linux/pull/952#discussion_r1096791211
> > 
> > now think about it, how about the following?
> > 
> > 	impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> > 	where
> > 	    for<'b> T::Borrowed<'b>: Into<&'b T>,
> > 
> > 	{
> > 	    type Target = T;
> > 
> > 	    fn deref(&self) -> &Self::Target {
> > 		// SAFETY: See the `borrow()` method.
> > 		unsafe { T::borrow(self.0 as _) }.into()
> > 	    }
> > 	}
> 
> This one seems wrong, since `Borrowed` will be `&U` when `T = Box<U>`
> and `&U: Into<&Box<U>>` is not satisfied. And if `T = Arc<U>`, then
> `Borrowed = ArcBorrow`. If you want to take this, then you can try to

Right, I was missing that T is ForeignOwnable.

> make Gary's suggestion work (from the Github discussion that Boqun posted):
> 
>      impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
>      where
>          T::Borrowed<'a>: Deref,
>          for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Target>,
>      {
>          type Target = <T::Borrowed<'a> as Deref>::Target;
>      
>          fn deref(&self) -> &Self::Target {
>              self.borrow().into()
>          }
>      }
> 
> Also this is nicer, since there is no `unsafe` code :)
> 

One thing is that it seems impossible to impl Into<&T> for ArcBorrow,
for example, if we have an Wrapper struct representting ArcBorrow:

	struct Wrapper<'a, T>(&'a T);

`From` side doesn't work:

    impl<'a, T> From<Wrapper<'a, T>> for &'a T {
        fn from(value: Wrapper<'a, T>) -> Self {
             value.0
        }
    }

IIUC, it's because of the orphan rules.

`Into` side doesn't work either:

    impl<'a, T> Into<&'a T> for Wrapper<'a, T> {
        fn into(self) -> &'a T {
            self.0
        }
    }

I'm still trying to understand the reason:

error[E0119]: conflicting implementations of trait `Into<&_>` for type `Wrapper<'_, _>`
 --> src/lib.rs:9:1
  |
9 | impl<'a, T> Into<&'a T> for Wrapper<'a, T> {
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  |
  = note: conflicting implementation in crate `core`:
          - impl<T, U> Into<U> for T
            where U: From<T>;
  = note: downstream crates may implement trait `std::convert::From<Wrapper<'_, _>>` for type `&_`

Playground link:

	https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=36a6a94740c00ba8ca47f773a423eb9e

Interesting enough, `Into<Option<&'a T>>` works:

    impl<'a, T> Into<Option<&'a T>> for Wrapper<'a, T> {
        fn into(self) -> Option<&'a T> {
            Some(self.0)
        }
    }

Of course, we can always implement our own Into-like trait, e.g.
IntoRef.

Regards,
Boqun

> -- 
> Cheers,
> Benno
> 
> 
