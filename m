Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B8CA4D
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Oct 2023 19:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFrVzD9S"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4909C1;
	Sun, 15 Oct 2023 12:36:00 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a2536adaf3so51754717b3.2;
        Sun, 15 Oct 2023 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697398560; x=1698003360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzQjQrdg7nVPiGGf2LVEENqY+cByue38zFhSb9O4FAI=;
        b=dFrVzD9SlgzM/F1MLAMEQjr1+CD5dIuX8XRtqU3C7a59TEAWMnKMTFiPh6cqEX2pt2
         INH0Tfl5pExz68vBPLhS8jAU/diydNE0ZQHtTsNx/ZYtX3iLbO7Lg8axmi3Wo1SPmwxz
         k4vkFeYpHmDs3YGxEBW1fR8bTsCzXlJY4jHu1UDcPTWu9sA2A6nTMVS9RCXV2c1AlpmK
         2taxwVi45DE7BD4p4b3swVKxs6Qw2zLtsyuiOG0/vzyBkBjOmNXXpGMqp2zWj+VK3/+b
         +Shu8rKrVAfNqoYhj6XbLWwpVg//FCqQqXoEaDIp/pHBJH1yNu9NIy8llZLTj8bkiR/K
         ZVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697398560; x=1698003360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzQjQrdg7nVPiGGf2LVEENqY+cByue38zFhSb9O4FAI=;
        b=JQ2DGYaDZL74IIqY+FwIi5oah/58jnxDdRg7aZ3qESF/DwJtVVjhkrz/sBLmmGQbSE
         yoJRQbyq/ouFza2zRsWWV2Dlqg2V6RE4m9s9R84OoGuF/0JKuBv5fS5ulSImAqPGdmDu
         X+9XRIPqCheO9QrS+IG9ukHpKPl1eOJFvrazEMk3YdCCf6RXHRw5bPNOazq0sBf0k4UB
         +redrNRgJqJS0XW5InLs9voqplGY7CjWr7KLDRhhCpUQ8vaO5JQBBTf2dy63eoWCAL+n
         g04OrbN4dx6ygRJx6MOxVM/xvhOjcH2yR0qwkhq6+6MubnqsCPriZLYgeff3A5fNYuRT
         0Caw==
X-Gm-Message-State: AOJu0Yx3+zUvqgJ9o9/MssN1FE36kwvPnaO2py42shAHR2GS6rx4XkW/
	vUUcjclEkGqgCdEXH87otl9QBrqMkTU4R2REzoc=
X-Google-Smtp-Source: AGHT+IFz6pli0XNJwt6HvsfPzBHP5yn53skXC9JUgJSrc+j7Rxpfh+YXepQf6PA6AGIH4SRhGU27cmm3dUtZEdnLg4A=
X-Received: by 2002:a81:b661:0:b0:5a7:b9b1:c0bd with SMTP id
 h33-20020a81b661000000b005a7b9b1c0bdmr17979318ywk.11.1697398559885; Sun, 15
 Oct 2023 12:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231005210556.466856-1-ojeda@kernel.org>
In-Reply-To: <20231005210556.466856-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Oct 2023 21:35:48 +0200
Message-ID: <CANiq72=dBhrZ3ZP=Awi0h5G5wAQW6s_obUqCLJF+_fjUyk-nRw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Rust 1.73.0 upgrade
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 5, 2023 at 11:06=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This is the next upgrade to the Rust toolchain since the initial Rust
> merge, from 1.72.1 to 1.73.0 (i.e. the latest, released today).
>
> Please see the main patch message for a long explanation of the upgrade,
> the policy for future upgrades and some indications on how to easily
> review this.
>
> The series is based on `rust-next`.

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
