Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174F9168CF
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 17:47:13 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86FCE5
	for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 10:47:11 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59bc956b029so182188087b3.2
        for <rust-for-linux@vger.kernel.org>; Sat, 30 Sep 2023 10:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696096031; x=1696700831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bRw5quNEV0M9cb0HcdjknkRgJ/siG4MMp5H13L+Cls=;
        b=mQnoxRoolRZo3SzsJ2Sf6QDHx442H0O0UDytGSx7nAfy5aWa8ZSf8meFdmppMbUqfS
         wsYtOovh5uGvsv65gxP1yXFOdBVhyUGfzSzJV1ioIt8hsEbpSJf1ryZtzm22VMcxTtes
         S6EyDvZtFY95RZHereHjwxRuIESizrd+F6s4hAmKAG3aPKaDsIKf2gUUXGrnVRKPdGg9
         m+KVXBQhT+rQvUecW/xlvVuNhR7sJEsdxla/ARCSO3STbtJ9xH7aJGzg8/9FznEc11RX
         00Go+DbaTSWrRGxvz+WX40U3jntVfwzy7k7fElqMyNclNtBoFSobKS72PTz+Y3iqKhhu
         WypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696096031; x=1696700831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bRw5quNEV0M9cb0HcdjknkRgJ/siG4MMp5H13L+Cls=;
        b=RlHKaaomv6eKSwxbx4h9nC+fAuNApkhzMCFSpLn+dwraKyuYAMDA/IrdOBMboONs9Z
         p5wn5ETEdb1Ib4KY58qL0rtfmxmLCLk2PPcPO7eFAdS77OA6E47WQxHbntmmULhOa3rl
         fyl1stZRb2Dcf/WalqAfzN7ZwdTEX/xDA/qkXMJYlf18PAvJHXTzuF6wxXaChfH8y3BT
         AIImyn0/tvDJkWTKjymHyVtYLSNC8MTotUWx60kAC1OoVaqDv1Ld/0EYYC3HgceFsXFs
         JqPLSeWQXHkbxXuXHUomBag2x55Yj5VIsZCyj1nJT4sWMHVxS+dsDoUaLZKUS4YqZ+/g
         QrnA==
X-Gm-Message-State: AOJu0YwqvmjVEfQMnjoL+C3nyiJRdf/qDP0kxuV+w4Th9AgdwBmpMOsZ
	JZ1SEeZCKFPG0QmoBIyGGZ4qE0Mb4S/eg/4r/jPvcw==
X-Google-Smtp-Source: AGHT+IENFMeQdLk+rR/U55AmckbI5FKhXjp8G3li3k+tIvbb7G4Nd/lRvb13bcWvSJRQjCirrEzryGpeVGHfAN/lqDY=
X-Received: by 2002:a0d:d086:0:b0:598:bad6:8e67 with SMTP id
 s128-20020a0dd086000000b00598bad68e67mr6880097ywd.30.1696096030870; Sat, 30
 Sep 2023 10:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230930161443.58812-1-xubo3006@163.com>
In-Reply-To: <20230930161443.58812-1-xubo3006@163.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 30 Sep 2023 13:47:00 -0400
Message-ID: <CALNs47s7HKb7n14waq0Gyty4Py3csKrJ1YFidJht=CMiXo9gCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: add Soft-RoCE driver basic structure
To: AllenX <xubo3006@163.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 30, 2023 at 12:32=E2=80=AFPM AllenX <xubo3006@163.com> wrote:
>
> add soft-Roce rxe device net driver basic structure and Rust security abs=
tration interface

It looks like your patch hit the list twice, see [1] and [2]. Also,
the body should be hard wrapped [3].

Since it's usually the first thing to be asked, do you have a
real-world driver that this is intended for? Typically new
abstractions don't get merged upstream unless there is an in-tree use
case.

We can still give the patch a cursory review from the Rust side even
if it isn't meant for upstreaming as-is. For future reference, you can
have "RFC PATCH" in the subject to make this clear (`git format-patch
--rfc` does this)

[1]: https://lore.kernel.org/rust-for-linux/20230930163256.60779-1-xubo3006=
@163.com/
[2]: https://lore.kernel.org/rust-for-linux/20230930161443.58812-1-xubo3006=
@163.com/
[3]: https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#=
the-canonical-patch-format
