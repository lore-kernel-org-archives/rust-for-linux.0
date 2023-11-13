Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE153B2B5
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Nov 2023 23:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Idhqwxt5"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CA3D48
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Nov 2023 15:10:44 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5b383b4184fso59361367b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Nov 2023 15:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1699917043; x=1700521843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vm6McprD2H3oAtSmtgoDkn+BQRfFHc7Z3Tik0WqV7dY=;
        b=Idhqwxt5gWyfcQW+oAW9WJ3AYP+2XFpjkzJLDcbxYG+0bSIHSAhR4JC/kJXI7hRF9/
         uflCl90TfXs0HVQwfMmP2ScNaxrUMgY0o8qTqaGWCj6RMZcTuW9MPkT3DnxokEIOjYKZ
         UlI9graOyJ5lruPKO63g6IIHZu3gWlyqUywuyghz/tJJgfhSD0kWdK2ttgstPc0rupt9
         aBurp2Ht6KeC0MGf0KJ09nuXtugmuVeGKu0Ogo/dK36/rsWpddyvq5okjTOwWTRadxA/
         dpDRMsfKf5QWXldjR24NX27ukyvmZBpXdsBqXmWtIALmdVUFAYcKO5/erT8mZhnxIqAB
         FztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699917043; x=1700521843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm6McprD2H3oAtSmtgoDkn+BQRfFHc7Z3Tik0WqV7dY=;
        b=BTR6YfUoEDGeFUiJACAu9D7OIuXxCberriFX6IM5L+Zdz6xFPoZva3ZPVzBXCknpbi
         Hf8Yg6YYU9CqSQe6/GDrcMg3unfQ7F4QhF+CKtz/tMP2CO0S04Ybval+K+R8Mv2w5TOk
         SHD49R0KNrF2M1XoJgCNvsIrlGRI8fAFlBMSdx9NwLQ17sA8BbofzQzAMDaKD0wheg+V
         QVbX0cn+4ljTbQL5CkY8HdM7fzwGKCKvoHl5s+7YtJYwCN52VROegBPilcFWaiCXtv0u
         tZKWoU2FyT+rl96gHwjmGl7xaqS5DdSU+JTYODCa+oYMTK8ISkVPE3IQ3J1Lq6p81Xh4
         r/dA==
X-Gm-Message-State: AOJu0YwGC13GT5Rbedq7cQyNRTXzBGO/WQuZAplcXsVAlV1JKm3R2J/2
	OODtEvbNh1jlsuSnNtLZv9TOPWDPCNyHOvCEZDXlwW6/GuUqhi4whTc=
X-Google-Smtp-Source: AGHT+IGn5OjBYJDYA5citKvjx0OfX2tGUZpyEgqdy1Cnlm++nuW76bp3PhO4fIdWs8zQKzixP118tIDfAKM6euD8WXI=
X-Received: by 2002:a81:8392:0:b0:5a7:baac:7b34 with SMTP id
 t140-20020a818392000000b005a7baac7b34mr9218006ywf.28.1699917043220; Mon, 13
 Nov 2023 15:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <104f983a-57c1-ff94-607b-3a48d2e225f4@de.bosch.com>
In-Reply-To: <104f983a-57c1-ff94-607b-3a48d2e225f4@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 13 Nov 2023 18:10:31 -0500
Message-ID: <CALNs47uSVXk60BYHMd0kQ95p7RAuTe6ooQVTSD_eGu1i5caiPQ@mail.gmail.com>
Subject: Re: Usage of experimental/sample bindings?
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 8:08=E2=80=AFAM Behme Dirk (CM/ESO2)
<dirk.behme@de.bosch.com> wrote:
> [...]
> Unfortunately, I found above Rust-for-Linux rust branch with all the
> nice examples and extensive binding helper stuck at kernel 6.3 level.
>
> Taking instead the Rust-for-Linux rust-dev branch [1] which is on kernel
> 6.6 level I found the bindings_helper.h and the examples being quite
> limited. What for example results in my example module to fail building [=
2].
>
> Have I missed anything? Is there anywhere a "latest and greatest"
> bindings collection which can be used for experimenting/learning on
> recent kernel 6.6/6.7 level? Or what is the idea for such use cases with
> mainline kernel having only a quite limited number of available bindings?
>
> Many thanks :)
>
> Dirk

Hello Dirk,

The branch named `rust` is indeed no longer relevant, it was mostly
for a proof of concept before merge into the kernel. Since merge, most
development happens against either mainline or `rust-next` [1].

The branch `rust-dev` is also up to date with some more experimental
features. The RFL site has a better overview [2].

Is there anything specific you are looking to develop for? There are a
lot of abstractions that exist or are under development, but just have
not been merged since there isn't yet an in-tree use case. Some are in
`rust-dev` and a lot are PRs to the RFL repo - but it is quite dynamic
at this point, we can point you in the right direction if you are
looking for something specific. You may also like to drop by Zulip [3]
for any quick questions.

- Trevor

[1]: https://github.com/Rust-for-Linux/linux/tree/rust-next
[2]: https://rust-for-linux.com/branches
[3]: https://rust-for-linux.zulipchat.com/
