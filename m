Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5322D4A3B
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Oct 2023 06:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ST7za+wx"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF77F6A67
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Oct 2023 23:32:41 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59e88a28b98so5955837b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Oct 2023 23:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696487561; x=1697092361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGyR1Zzvv154X8Dccwt7gC98O0K89BtDve6Z1+jKdN4=;
        b=ST7za+wx14hPc8p+oEfAiYxQPwckRjhw+YiKKsBblD0cPk3ICdaaopJG2uuc9wmYJZ
         +4P4Mr4ARMZxKs6LndrbJxSmCGzMGD6IkR3mwR+5edGcK+t0xYzUAMoeJJk53QOP54rn
         txYrLgBRvu8NYny32HygIAmRVq2GjLaef/mkr0hKJZOutx6qZGv/D6Mv1dwpeou4UG6X
         dfIDZWkHxxhkJ571NLr5Xer0FjeBD7YvWApd6d9vlzYl2Fju78w9zRMJDLQr2YZyrMfo
         x6QBDxYu3aD7XTCJkdHK7NkMJ6CSveyrtEnFDjJ0jNbpmCqmHeo+beT60Cq27epMFlWQ
         fjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696487561; x=1697092361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGyR1Zzvv154X8Dccwt7gC98O0K89BtDve6Z1+jKdN4=;
        b=oMG3x9+YpxZVfBC27myecnwbyMfMtrM+gqrOgmJvEHhQPbMQbomPQP71CLEfzdRhvf
         tk12K2LdGiXA2m5m8TLuC7Y+oLbvaJI0gydy9UeCnO6wwHFsnwEHFg9ULIqWZOlL1iiL
         wBQHCVznr9ZnhAX4cRPohAXG0AJTXtVF89ypYLGsXksKsjYWLeUyzzFhOj5RP3Y3ENqV
         QJ2EBELVJ7xXNyORGDzILB8ENP7+1DQ9VYjaLGsKueM33aota6TB9N90JSpAToIwCJm5
         xgNeDfH4RPL85cHJAj9bfyL0pH6l6h9bZTu7+k6o00JVL3qd5NnVxRe7R8Qm+WS6d4Yy
         uVPg==
X-Gm-Message-State: AOJu0YxJ0Cv09CTg2pnq9rQQp/q+p+SxvkH7KAwcv6ItRek6C6/N2yoS
	PaQ9+sLnBsSgu/eHfJr5EmlcjdQVYLuRFepBD34dzg==
X-Google-Smtp-Source: AGHT+IHJAdiS+YNWfIdgWHzybEMmyvLq6s23YivEmEYidiPTA9ZiKm3Am2IIYO0pi7fIfuQ1zezOAfQglwsScJWCnr0=
X-Received: by 2002:a81:6086:0:b0:59f:6440:7eff with SMTP id
 u128-20020a816086000000b0059f64407effmr1449066ywb.15.1696487560949; Wed, 04
 Oct 2023 23:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CVZ2KU4KK5YH.2HVL1F6X93YLL@pogg> <20231003222947.374039-1-aliceryhl@google.com>
In-Reply-To: <20231003222947.374039-1-aliceryhl@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 5 Oct 2023 02:32:29 -0400
Message-ID: <CALNs47s1=fjaXjymDM__G0-Qzv0mkftJ1hzOt4SZJt5Uy0WA1Q@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] rust: workqueue: add examples
To: Alice Ryhl <aliceryhl@google.com>
Cc: k.shelekhin@ftml.net, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	jiangshanlai@gmail.com, linux-kernel@vger.kernel.org, nmi@metaspace.dk, 
	ojeda@kernel.org, patches@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	tj@kernel.org, wedsonaf@gmail.com, yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 3, 2023 at 6:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Tue, Oct 3, 2023 at 10:13PM Konstantin Shelekhin <k.shelekhin@ftml.net=
> wrote:
> > +//! #[pin_data]
> > +//! struct MyStruct {
> > +//!     value: i32,
> > +//!     #[pin]
> > +//!     work: Work<MyStruct>,
> > +//! }
> > +//!
> > +//! impl_has_work! {
> > +//!     impl HasWork<Self> for MyStruct { self.work }
> > +//! }
> > +//!
> > +//! impl MyStruct {
> > +//!     fn new(value: i32) -> Result<Arc<Self>> {
> > +//!         Arc::pin_init(pin_init!(MyStruct {
> > +//!             value,
> > +//!             work <- new_work!("MyStruct::work"),
> > +//!         }))
> > +//!     }
> > +//! }
> > +//!

For what it's worth, I think that using a binding for return items
usually looks ever so slightly more clear than passing a multiline
argument

    fn new(value: i32) -> Result<Arc<Self>> {
        let tmp =3D pin_init!(MyStruct {
            value,
            work <- new_work!("MyStruct::work")
        });
        Arc::pin_init(tmp)
    }
