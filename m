Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB4800
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5kWWUpe"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EBDEA;
	Mon,  9 Oct 2023 03:49:34 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a2536adaf3so52930027b3.2;
        Mon, 09 Oct 2023 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696848573; x=1697453373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zio3enSGUI5YkwLUuED6dkFSvm7p0OMulAz5jTbba1w=;
        b=S5kWWUpe71ydcBL3PF6eCFwTFe3pCooytWoRrhqs+OVwmyJN4bY6PFVQ66VdWcM9Ta
         xBRsCBjwuppkgLwuRYfBAn9c2v9FGm4/bLzCDqpsSlWcQZZI2yQ/1iW5bzaM7E8ibnsO
         +CbIbpAsWhL+KPMXMgZYaywbPyIsO9ShNgLnHdDLBiaEpODnK5wHN3PekCKE40fdLa36
         iwxnnxHogSMpkOcTyM9+N/jto1ounro7cMNBNNZDYStJ0y7fp9SH/QQ/iKE4q0R13wZF
         zC0knuKOac8GGOr9khPVewr3/8FfijG0kKmFObl9GUtJQuxPKYcXqP3iBGPkz0c8FlJD
         mX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696848573; x=1697453373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zio3enSGUI5YkwLUuED6dkFSvm7p0OMulAz5jTbba1w=;
        b=j9rANtXKlk+9CF28LciNWkJ9V05pM7H7VQM8zNVrpfwnrZcCA1qKQwv+1YTp1iLmXP
         ppLQubnt3QcyTKAbz2lowYzLDPwhVerQARzaNFQAoutbcnCyGaQCqGKxWi1WPN3/u6Jy
         n4iSuifoFgPPTABxAFXrx1ZiJUsWxkWmMJz3JOL3cUp9/3YjjsTbR9vtVA0541AbHpUZ
         62fNTTGfBtkiy2zpZblM7ofLqGjt7ecsXi4CYGStIGSdNAYmKLAuiwB0EhcjeyI4AWSv
         3247D3Y79sWBOEWoYAir2kuDMtEyq9stWW65NtWSkGzaCq6JXAxP8B+BSJnD2/sNPF4i
         TFEA==
X-Gm-Message-State: AOJu0Yx/7022pIe3G2Kd+44jRWRlup+1wwph0NuNgLRyg08FKAduYbDT
	GscJbOxx0SUwYhXtbcmLc13t3VJMzMt4XYjeTD4=
X-Google-Smtp-Source: AGHT+IGukCgbCGdVTPnLGFBf3ul2G1THfqjoqrR6lZnlgeIX2yGDf7osZF7kHaftLsa+EFi53IyK8+LRweU430Wk55U=
X-Received: by 2002:a0d:d9d6:0:b0:589:fc81:952e with SMTP id
 b205-20020a0dd9d6000000b00589fc81952emr14981515ywe.7.1696848572990; Mon, 09
 Oct 2023 03:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231008094816.320424-1-tmgross@umich.edu> <8a6a2133-92a0-4478-8f3a-e1c7ba38ff18@gmail.com>
 <CALNs47vj=whnF1FcmmXHz=msB2j=GAnrnwx-OKHciW6iR+GUMw@mail.gmail.com>
In-Reply-To: <CALNs47vj=whnF1FcmmXHz=msB2j=GAnrnwx-OKHciW6iR+GUMw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 12:49:21 +0200
Message-ID: <CANiq72mn3f1w0RZo58BrzDuDHjcGNyBr3FhygVGfSx_xbYwgLg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: update 'paste!' macro to accept string literals
To: Trevor Gross <tmgross@umich.edu>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 5:04=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wro=
te:
>
> Good point, thanks! I'll add that if there is a v2 (or Miguel can
> probably add it if not)

Yes, I add them myself when I notice they are missing (e.g. most
recently 2 of the ones in `rust-fixes`), but patches should definitely
come with the `Fixes: ` tag themselves, i.e. it should be the
exceptional case.

However, is this actually a fix? The title and commit message make it
sound like it is a new feature rather than a fix. And the docs of the
macro says literals are not supported, right?

So this probably needs to update those docs too (and ideally add an
example with the newly supported construct too). Or am I
misunderstanding?

Cheers,
Miguel
