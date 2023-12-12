Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hyh58MHr"
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1F5F3
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:23:42 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7cad628ad93so1017309241.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702373021; x=1702977821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUd+xJBalOQAWlVtKqp2TzvFJgkF52NQ9jKhRyu6zf0=;
        b=Hyh58MHrRypDZ9Pb/9prTpxrvpIRvjnuFT2hIR2rVwMIkWg/qP3B7w7pMyuuUS/3+N
         9rsq7fOJH0P/lS3Ntd8D7UAmXbgxJnVZogXzONwrtkEd1lt+MDLM5pmNaFRJMBHlN/e2
         YuYa6MPPKzWl44Zp/Mp7zfZb4cmegyFwVKZFdY2tKjDua+sSUnD9Lz2Mpgn5V3ioCxRD
         CG2DuiQ71ueuevfCKg8IwXGQ5Aq93B7BL8YNVnnVMuGVTHSps08Moe4ddeuveWMC60Bt
         OWI+TeZ20U9Gaf3MLzM6DiiinGefbGiMu8B2XX26SD68DurKd8TBt/5vjIv8Ujje0dCl
         dJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702373021; x=1702977821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUd+xJBalOQAWlVtKqp2TzvFJgkF52NQ9jKhRyu6zf0=;
        b=kNwMkRnJd2fu9juSOy5H3ajVyGlYHQwjrhUURVWdQchT/Nd2Isu1tCMP94Wuody2PJ
         MiERyPCepjFaBlQYSI37G3BHQYdn5TtVt5nzZnCxyRkEwmuKQJFdPVd2c2i7YUxZMo8I
         LT05ipC+KoP934TVv61i3E5gd9KJ3/dsrbB06BpUJcmIZ/KKD2WMMOzuYUMUbcSyT2Y7
         e1x2hulgwovnHO8pwhryaQPfqfnODh34+v8rM+y2zn4j6UPtrtGkSCDZVnY5npdAkSvF
         iWjTuE8itjY5kpGgqWF0NIOLvxO+WJ5qvO59DhNEQSxSBoq8TRb1Uug+RSJQuMvJUU+i
         +UQw==
X-Gm-Message-State: AOJu0Yx6tg5FMv3BUH3082CJn30XqFtqlmaooASEO6u5H8o4NcQSEGjJ
	rDDr1tUGtvOBdRu/fqn6ikR/7/k8rdHrwv+f+1PUuw==
X-Google-Smtp-Source: AGHT+IFgUCvvmzmX278q9Co+7QDNrP8fTgs5dO167XgwKzPZkRE3j0AtMw1ja2f/aExIsIQLu3r25rvviPcmOCdi/SU=
X-Received: by 2002:a05:6102:4413:b0:464:8960:4827 with SMTP id
 df19-20020a056102441300b0046489604827mr3363440vsb.7.1702373020886; Tue, 12
 Dec 2023 01:23:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231210234924.1453917-1-fujita.tomonori@gmail.com>
 <20231210234924.1453917-2-fujita.tomonori@gmail.com> <ccf2b9af-1c8c-44c4-bb93-51dd9ea1cccf@ryhl.io>
 <20231212.081505.1423250811446494582.fujita.tomonori@gmail.com>
In-Reply-To: <20231212.081505.1423250811446494582.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:23:30 +0100
Message-ID: <CAH5fLghyo3vdrQvQgRsMHp6Hh1=L5+PqHbfBXoF7t4E4URN_vw@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/4] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: alice@ryhl.io, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, 
	benno.lossin@proton.me, wedsonaf@gmail.com, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 12:15=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Mon, 11 Dec 2023 22:46:01 +0100
> Alice Ryhl <alice@ryhl.io> wrote:
> >> +    /// Gets the state of PHY state machine states.
> >> +    pub fn state(&self) -> DeviceState {
> >> +        let phydev =3D self.0.get();
> >> +        // SAFETY: The struct invariant ensures that we may access
> >> +        // this field without additional synchronization.
> >> +        let state =3D unsafe { (*phydev).state };
> >> + // TODO: this conversion code will be replaced with automatically
> >> generated code by bindgen
> >> +        // when it becomes possible.
> >> +        // better to call WARN_ONCE() when the state is out-of-range.
> >
> > Did you mix up two comments here? This doesn't parse in my brain.
>
> I'll remove the second comment because all we have to do here is using
> bindgen.
>
>
> >> +    /// Reads a given C22 PHY register.
> >> + // This function reads a hardware register and updates the stats so
> >> takes `&mut self`.
> >> +    pub fn read(&mut self, regnum: u16) -> Result<u16> {
> >> +        let phydev =3D self.0.get();
> >> + // SAFETY: `phydev` is pointing to a valid object by the type
> >> invariant of `Self`.
> >> +        // So an FFI call with a valid pointer.
> >
> > This sentence also doesn't parse in my brain. Perhaps "So it's just an
> > FFI call" or similar?
>
> "So it's just an FFI call" looks good. I'll fix all the places that
> use the same comment.

If you make those two comment changes, then you can add

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
