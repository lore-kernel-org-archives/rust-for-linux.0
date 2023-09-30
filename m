Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E421775B
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 17:30:13 +0000 (UTC)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05539F
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 10:30:11 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a1ec43870cso84362307b3.0
        for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696095011; x=1696699811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ03CJbGHZnRejpZXyOPZp+neCb9w6hnb8dzVg6yIOg=;
        b=OAMrbmwKrEG7YRJ3cEKx+EI+OSl1M50isZcwKcSMt8e4wvbkZ0/QpUGfvr8gzGkrDF
         xNi7tVR7n/V0iLHRUfNdWuRVqGdxgTDv+LPGDiJEsnh1Q+I9o/JlSV9GceR6RuEnULf9
         wIbLMYVAOjheBmXjZwTDyzQ1f44gxV5y9GJq7fsdvgV6uzynSKyOwSvaK86qh4ykYGxz
         R/9flO7lhdfegJh3DunZ+u28rsOKm/VGsmaivRaAtJg7wuhdavu94b4Cz4Kxe9Ew7WTh
         p5IYOE+PfuxJ5AL0XNVpkGIchb74SusGpClAwIVZkLhcyzKJanmk10FKl83NaxxPol5+
         dEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696095011; x=1696699811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ03CJbGHZnRejpZXyOPZp+neCb9w6hnb8dzVg6yIOg=;
        b=V0DksLZ1i1qi6yAj8nJiwF1Dhc8AopMJ7JQOTP+iJ4GsKeVn+m2gq4n55QrQkNkx8R
         FXFSKYtr+67KaHOG3cAy8OSlXgoGkOFFg/W4PxR6c+VnWjvrYNV2sLRSOx0rWx8kOEjB
         FZBLQnknt3o6R3vXfSyJWIbo4kmP4QjoFN+KHG48V3/LJO0+q+34Q5ClGWC3k+I6BDNU
         yAs7EameTiAaF6YQVdliuZu1GmldNS6mwE6LuhOiG1ayPqPqdtt+w8YPYwnDvXBCw29m
         Uflu/mi4mLNANsSCDwuEOHxY7pmI8pN7z7cqwZEwx0WyLN7FGIsMUpeQvT04OLA91oTa
         r4iQ==
X-Gm-Message-State: AOJu0Yylblb6zUeDvT69eRU1WbAxZWT5086yt2Kzx4MapvFscPx5Co1f
	DgOFZleXDGzrRKehRXlAgyiakuEf6kDZIfET2ApD6g==
X-Google-Smtp-Source: AGHT+IEnNCKJWX/s+QihCWH3/AMTnCuWfkyKlyzubAYCwcrfidYCtFsR18bBBmYwx3W9HiM/sUBtVGEWQstY9uOj94o=
X-Received: by 2002:a81:48c5:0:b0:59f:519e:3e9a with SMTP id
 v188-20020a8148c5000000b0059f519e3e9amr7751634ywa.20.1696095010887; Sat, 30
 Sep 2023 10:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230930144958.46051-1-wedsonaf@gmail.com>
In-Reply-To: <20230930144958.46051-1-wedsonaf@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 30 Sep 2023 13:30:00 -0400
Message-ID: <CALNs47tVp4xtrv_i-R69fUJQTXTpvyeK9kL6JmUeu+O_KCOqvw@mail.gmail.com>
Subject: Re: [PATCH] rust: error: fix the description for `ECHILD`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 30, 2023 at 10:50=E2=80=AFAM Wedson Almeida Filho
<wedsonaf@gmail.com> wrote:
>
> From: Wedson Almeida Filho <walmeida@microsoft.com>
>
> A mistake was made and the description of `ECHILD` is wrong (it reuses
> the description of `ENOEXEC`). This fixes it to reflect what's in
> `errno-base.h`.
>
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
> ---

Reviewed-by: Trevor Gross <tmgross@umich.edu>
