Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F85018C10
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8saQurv"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C58C6
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 05:01:21 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59f55c276c3so55534797b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696852881; x=1697457681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8xlOdoGoANNG8/4z3J1BZ3qILcNZDx9JymkslqHebI=;
        b=H8saQurv2QJLiLoXjgZWnPya3WYtbxksuYiqeVKdOQRmdewdOOXL6qG+pvaDjWjc+O
         QHVx0Ekj7Txz3eJwMaO6vPoKgk8q1PZiEG57h6NzFEbfWKusb1M6hqu4bmoTo3R0wgE9
         1NuFTag2PZDZZ56zYiO8K9qqSjvbYjIYEoPI7Cdqbnv11l5iLqySIaR8CAvpJ1Hy2S4F
         1JxrCWKa0PcVzNf6yc14qFWxfT/xSeiftFxrsbLFeScFo6Tnntnpdkj2o4igqMqNEGu+
         JNQEEXv1ssrcvWEpS49Kmv8T9G9zKzabKP+THukd8pTyU573mnaDId7v6Y4yHINk/8vO
         KIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696852881; x=1697457681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8xlOdoGoANNG8/4z3J1BZ3qILcNZDx9JymkslqHebI=;
        b=Y/YWlUpKXWDtps1U2upvpXFdEk1vWH5Ct/J4/LbE6W2s7zg4Hz9HVztZj5rs+djHf5
         5M5qH4q75YxCQ0cL6scNWNEOQJvzKvDyHeaFH8HnmLsDxX+IFYnC/DF6Bo2vygSSIlZC
         GES2jUadzIsJaDvGpcgUiJWXD1B+pxCXThGryPqfalI2RRTz88wdS7iBLLGgvlGz8pkm
         aSCcvJAu5bti+vpRiSh6RH1LnVLk4WoEEY/iRuR4/U2JHwstb/9ebvyfvZYVbuwWonhF
         ErqTpfcuvY6lSu0mgO+OlCOtfyqp7uFzqavFJ0eO6YZfy/Bcker39R0WtF0yO33EbVp7
         JOXA==
X-Gm-Message-State: AOJu0Yz6JQqKisy8ZA8AZwzfTzR/KQKAh4xDH1zWrjTF0/ZKjpmzPHft
	RTPp0Sg6gAEeBuVarVC2k6pCzFfkKzNJCzww6T4=
X-Google-Smtp-Source: AGHT+IH7s5WFh4TVf+bXzMwSO2Y6ijsHfTYRfD4CrHh3NkMPsS9azV+Yzbvm85DpSIEmX55bgdwBCe8HGeIEzKvFNEU=
X-Received: by 2002:a0d:c886:0:b0:59f:9c08:8f12 with SMTP id
 k128-20020a0dc886000000b0059f9c088f12mr18976846ywd.38.1696852881009; Mon, 09
 Oct 2023 05:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006155739.246381-1-yakoyoku@gmail.com> <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
 <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com>
In-Reply-To: <ca2cd71c-0aa1-4365-961c-c10737a9e9a6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 14:01:10 +0200
Message-ID: <CANiq72mM2BeWtZNqhvnbA3XR_ArfAi3CG3oxMuu+C74rB0+mBA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 7, 2023 at 1:07=E2=80=AFAM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Well, there's the network PHY driver series that is stuck on this
> topic, I (and probably others) have local work that have the same issue

No, that series is not stuck on this.

> and said general case might not arrive that soon. So it'd better to
> start on a feature that will benefit API users right away and can be
> updated to fit needs. That's what I think.

If there is an in-tree use case that will really require a solution to
this very soon, then please focus on explaining that (e.g. what "local
work" do you have and what are your plans for landing it upstream?)
and we will do our best to reschedule priorities or we can provide a
workaround for the time being.

In any case, please note that this RFC breaks the kernel build and
does not really solve the overall issue.

Cheers,
Miguel
