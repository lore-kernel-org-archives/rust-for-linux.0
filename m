Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49476DDC4
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 18:44:31 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FEECE
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 11:44:27 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59bebd5bdadso61283417b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695581067; x=1696185867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfUgjEZvuftPy3VPAwt+m+N3N7hIucsng0APKWwHsDs=;
        b=F/iPJ7ONtoHZLvvK3KVEmMRWN8rhqxF0bcbEQmgXGk/asx2HxDDX5RwdbFlRKNd7IL
         TNJbkJ/KWtL52K1SjXX0Oau+torvN9/udI3MuQQYlBHW1YBkSG2Tp+ny81u4B84iiQWF
         G+ZNWBsJlbCGvEr7ve/iJnhbtlAS7mMRJjNitPhaHB65CbFbOxRtIEPb2Qm4U3RgVqCa
         Hi9wAIOOsycbltGodmJ/yUUhdx+sTOFDpltq0PLYZohimGsqawao5z4zMJCa79zOWnX3
         UCeKEpM7uC24eJBtKFNeKKZK/Nsq83/4xGmaUPwo8TUs0JJk7Mgs2rGSFL8srdS5353p
         hstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695581067; x=1696185867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfUgjEZvuftPy3VPAwt+m+N3N7hIucsng0APKWwHsDs=;
        b=fxndc3SZ/cBka7HxL4Ben7F1J5j5XaxGntsBdAeFpKZJIpkDRRZxx2MZDgPymxvIFL
         nRTK+bjqpa5m4f2DORGuGZgYipY0fq9zfn7aokGgcCBZ8LAMJ549oCMlAR0kAAp5JwFy
         3vcwrlvY4F3sUxkNrh5B5JjQcN3zUHf37e3zo/jKBoyVTl1r7hMWf3KN983KcIE1jHbm
         dzaTHKkneGyp8vRTY+rR8VkQt0TpG55ovy/LGVz5zulEToitmcsj4brWMgAD4JRrJRTZ
         6Q7OmZN/fTQXARupKyIAlcPrXicyIx1gsGU+w0pypQvPvT4Z2pJ2lr+RcicsBN7uudFu
         vofA==
X-Gm-Message-State: AOJu0YygpaR5feNTEGjeCXFHbM/aK0Ylnkn4CzokJdu4JZVm1CiqktoX
	fDqLuE/j/UUogPcyDwgpqDnxNDxnHLw8+WhD2RA=
X-Google-Smtp-Source: AGHT+IGE/MKEoE7Djp/zQ6woHUZge56Dq33QUDrWKz0TaYJ5W2TiAkTpluGJEBozRDWphQpchTrLG8xQRoaqqmsbU8Y=
X-Received: by 2002:a81:7c41:0:b0:59b:fda7:9d7f with SMTP id
 x62-20020a817c41000000b0059bfda79d7fmr4825361ywc.49.1695581066918; Sun, 24
 Sep 2023 11:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch> <20230918.173527.1946752214085636243.ubuntu@gmail.com>
 <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch> <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
 <b6afe2b8-6d85-4b05-9b5f-7a3b2c402a16@lunn.ch> <CANiq72mcd7QfEh1ojBKSKQBNYAhqhfAkYRr=J6nG_D2Dj6bgdw@mail.gmail.com>
 <057cc481-01bc-475e-95d6-abdad5465801@lunn.ch>
In-Reply-To: <057cc481-01bc-475e-95d6-abdad5465801@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 24 Sep 2023 20:44:15 +0200
Message-ID: <CANiq72nN+9vEQ+shg_r6wS+vY2+XCM+GEj0ryRxeKE=ZiMvCiw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 7:44=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> As somebody who does a lot of code reviews, i like C simplicity for
> this. I don't need to know for each method if it has some implicit
> undo when something else fails. I just need to see there is a full
> collection of goto out; statements calling what looks like reasonable
> undo methods.

Yeah, it is a bit shocking at first.

The key here is that, in C, you have to write all those jumps, calling
the right functions and in the right order. Not only that, you have to
do so for all functions using a particular resource.

Worse, you need to maintain that over time. And a bug here easily
leads to a vulnerability or a leak. Even "trivial" refactors can
introduce mistakes.

In Rust, the equivalent function can be way shorter, like in the `f()`
example above. To drive this home, an important use case of Rust in
the kernel showed in Kangrejos a week ago an entire page of kernel
cleanup code in a complex function getting reduced to a single
character, `}`. That is very powerful.

As you say, an study of C vs. Rust kernel code in a few years will be
very interesting. Although, note that destructors are just part of the
whole package, e.g. the fact that these implicit calls can be part of
safe code is what makes things very interesting (e.g. unlike C++).

Cheers,
Miguel
