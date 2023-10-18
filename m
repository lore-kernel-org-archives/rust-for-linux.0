Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79473D393;
	Wed, 18 Oct 2023 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC5zPG5m"
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82653AB;
	Wed, 18 Oct 2023 09:36:37 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d9a7a3e17d1so8240465276.2;
        Wed, 18 Oct 2023 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697646996; x=1698251796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muPYN+h5m0NQxmc9aOMQOWiJMXRbZ7xmKLB8WJtuUBM=;
        b=PC5zPG5mS8gCOalC9G7HVItxvmnC+MhUUYuO7NIqT7CwgDDTR8/nJQOe4KGcw8siKr
         ZxozluAabM7xVpLIs5ioQIFRJzMDGpz5M5eDFEeOOqvz3KNqb6UIjG44xIv4AoorI38Q
         fQrhMy51y9ZDdFOLmYYxrQ0Unb3F1lEcFbLICSTPkZLsNf6OUQ4o6Gz76aDfzSNMTPaX
         iT+BWsDGf4bRkbd7yeJ/Tn7jxDq9C7dhvCmolr8Gmnc17n9wiM7HiKfzXl+dW4XX/Xfj
         bHrGCAFqDXbJpz//nRXwinoHpVTLc0Sm6+F7Ypzlvlotw/afr7BZf5YmgJspXOKACf7H
         zpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646996; x=1698251796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muPYN+h5m0NQxmc9aOMQOWiJMXRbZ7xmKLB8WJtuUBM=;
        b=StuKOFBh71q3j3ik5cpbWcq6jaQbMsrnf9t8nXzrkgiOicATqkQsfOQpxglm6+vRld
         f0xyWOdPptoNN3qqExUMUGKLxi/TJKwkl18rAaioRA0SZ2kzpLhHquG8OGS48jlP4Adx
         esnYx67e2rsQZoRcQW+byvs1JCYFhiAcgItrmqCjME/fA+kbQDC7XSiwIvJi7itd2c4M
         vl+QPpPybX4elsXaOdX7c3kd3Bonl2zPOrj7FWxF8pjN18uYUUwQEICMjv/QlwFGdvD/
         cmqRxKs63Ii8KeG5ZyXP5+qXihvgWTNWLyixpX2myYgmaElOALSzgFtCGzhTbqoCzLWj
         r8sQ==
X-Gm-Message-State: AOJu0Yz0Dx/1Vo4yWSPIQpH+FGncwVK0+dkAcUgMLz5TjMTbMEebkTOf
	cKkTodVm/sm99BDFsHP4niQk8yVekMadqAFxfmc=
X-Google-Smtp-Source: AGHT+IFN2ShsAR/vt4lfDeqB/Tiw89GrzRBQZEOB9gpbxR7f/kvg0uhlf4ib/npOczI8Rxj7dDdnVfkQ1znwcC9kr4Y=
X-Received: by 2002:a25:ab2d:0:b0:d81:754a:7cb8 with SMTP id
 u42-20020a25ab2d000000b00d81754a7cb8mr5743619ybi.65.1697646996757; Wed, 18
 Oct 2023 09:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231018155527.1015059-1-ojeda@kernel.org>
In-Reply-To: <20231018155527.1015059-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Oct 2023 18:36:25 +0200
Message-ID: <CANiq72=bEcVgwJ=Cyps1q09V0LYfooizR69fKJxswm=S=_FXhg@mail.gmail.com>
Subject: Re: [PATCH] rust: docs: fix logo replacement
To: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 18, 2023 at 5:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Thus update it to have the Linux logo again in the output.

Cc'ing docs and kbuild, by the way, in case they want to take a look.

Cheers,
Miguel
