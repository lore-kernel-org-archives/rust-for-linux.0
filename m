Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731FB848A
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 12:06:34 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145CEE3
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 05:06:33 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d81b42a3108so4529757276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695125192; x=1695729992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h65czTxpNEmu5kyl6PEroyAkCNYy2JW1nTGKHVJXDIQ=;
        b=RrUmfmmvwylJ65Sgng7P0FPR1yp3zmwCcSLRXN8A5iWQ2aSaIMF3LaaGmsVdJpzsjL
         ivITenata1ht9fsUT3LLO6NsTP1f9FS3wFYR7X7HhxcrRaifEZ8n5ObFRq8Th+dtt9zp
         al6724qW8Z92nQCM2GLGvFpKVHzMohFwfyfmZ2bKwgNbikgProBqXQsdWpZBrOYMAhrn
         RgrB64npsUXMmm1vuqMofryDK82p94hra1DKtcRlaBsRE93OphdaeGusyvBc8vjdSUvT
         DOSFGuP195D0dtEmnQVN/p4+zzNNpo1cvwQ35Yq3zmuwQs9z90WsBnmicPqXJJVSAFx/
         4m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695125192; x=1695729992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h65czTxpNEmu5kyl6PEroyAkCNYy2JW1nTGKHVJXDIQ=;
        b=Wc06FTaQiWvwQos30fl1zz9DF5Yn1rInlOX5D6vO6200PAyMrFQ/9upQmRrI72X2N+
         m0ML+79yagRt2rP7eY8/QLc8363gSfMO6WuyC/Cvpzuowe9cQSA7o63v+MR/c+5dv6oX
         wVkuzFvm5OEsLkRvKfh1nEuDvH9EgmtMKxT9cqluwEynYdVAOBhY4DV/WhbpQKCgc2qr
         MUqD1RdqFTU8uNz+p9/S1629fF48BuoNGIEdoo8grK52KuY+YTyuGq9y84kQsJmjzQLy
         qL3g//xqDZkAEgYB5zvcY10yd87g/QRiG7z5njv3kTJ6yJVJyG5BsFSaNRBmi52XFGTe
         kAgA==
X-Gm-Message-State: AOJu0YxNO02D6QDidymHt/MG/L/mqmU/EQcwaMNcBpMpRZ8tr8YGVz0b
	AjFWFEuOAvMpT9aojP6LrQ0bEKeqVvQ+JBL2f8A=
X-Google-Smtp-Source: AGHT+IF7Ra3XvUftsRez/uh0gQ/vt4MM/BgeivNgYGaqX9zCn9uQ7vhATjk77gFwWqZya6ep0lSwfGANDNUjwlQ1Fys=
X-Received: by 2002:a25:d8c6:0:b0:d71:68e4:6db8 with SMTP id
 p189-20020a25d8c6000000b00d7168e46db8mr10880369ybg.34.1695125192228; Tue, 19
 Sep 2023 05:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com> <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com>
In-Reply-To: <20230917.213248.712797486250583805.ubuntu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 Sep 2023 14:06:21 +0200
Message-ID: <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file to
 the ETHERNET PHY LIBRARY
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: andrew@lunn.ch, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 2:32=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Miguel, any concerns to put Rust files not under rust/ directory?

If it needs to be part of the `kernel` crate, then the file needs to
remain in `rust/kernel` for the time being. The plan is to relax this
restriction in the future and move the files to their respective
places.

Cheers,
Miguel
