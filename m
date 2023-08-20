Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A89D6AA3
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Aug 2023 23:14:15 +0000 (UTC)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A8EA4;
	Sun, 20 Aug 2023 16:14:13 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d656d5e8265so2767288276.1;
        Sun, 20 Aug 2023 16:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692573253; x=1693178053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhDiFrK3+zWwpt3e9Un/dsmmqZVfbwmw3k24hfaK8x4=;
        b=oP/ZDuQfgP3TV3EvP6EPzckklS3z3d8VPQ3KSnF3ypgzokwqKjql2Ljq+jZ/lWK6HD
         RoHFy2odljf3HQOfAWEzIEjP3DDBx0jB/1cswNoZM6q9g+JdP24EAzhA0HLHbV99LpDl
         s1apYRrNcKpA+f7KEP/6c6h+rRiwYTvzQWGJc2v1ay3x96JDusWWZKUH2gWKtRxirE8v
         UAp0/FAhiu12VJpDc7uPtxSfv8YmLxdqRYfW8l5nVGH43LKAtntH+azgK9aoakZFlpt8
         zK1pIPFbca9NHjXlB2U/mHCUjUhhegh181ymICJpZr/dfLOVOmqUXLkGwzeMV2ZyLh/8
         b2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692573253; x=1693178053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhDiFrK3+zWwpt3e9Un/dsmmqZVfbwmw3k24hfaK8x4=;
        b=RAKE0OdDCD/7INR/qkEx01POWXLgRG5OpItaogKs0BRB9pZYkVBHtpRWKP7V1jvaQ9
         0ryC4RqtMli7d/SFyntzR5O9WYdPZJ1tVostn/wSd1fgWELNpjbyEnuo041Ztr/XzcIb
         33B1qGSOt0O7o3UhcJnucUK+U0z3QTwI9w1uEK7sd+6USwMbocBW/6HZ7Y/w4DRikU4L
         husvWc1Cvyu90oTCfh7tDA6Mua4CcmBftHEUxqJKy4N5hPjIi4jz9dc/9j3WqgCmPfnN
         vXjASMQEMuA38uHpinktaJt1AoMq37KbZTgz5OR/K0b8NWZcjAR03gZ56K69g1Wdg7JW
         UnsA==
X-Gm-Message-State: AOJu0Ywuc2dtFlZYjxmMN7tqlh5cwwgKgcKVSQRcG1fuRncBb9Qj7l3E
	BpSCeAGqNIIVssBCbPi4P0L7CJUB7PHeHaJLQFk=
X-Google-Smtp-Source: AGHT+IHput9LE8dKoh1ZT/0B7w2PzQb7MFgu0AJXlDmYRwz0PtUMUJooJHs2+l8bTa6J1rhzqEr754t3Ki82QM0VuAg=
X-Received: by 2002:a5b:60a:0:b0:d4c:83a8:268a with SMTP id
 d10-20020a5b060a000000b00d4c83a8268amr5134928ybq.17.1692573252959; Sun, 20
 Aug 2023 16:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230803060437.12157-1-tmgross@umich.edu>
In-Reply-To: <20230803060437.12157-1-tmgross@umich.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Aug 2023 01:14:02 +0200
Message-ID: <CANiq72nHmt5_CnLB3+3RopJ+u94pgq1Nk08j0TSk28NZmeoCPg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs: rust: update instructions for obtaining
 'core' source
To: Trevor Gross <tmgross@umich.edu>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, corbet@lwn.net, yakoyoku@gmail.com, 
	aliceryhl@google.com, linux-doc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Aug 3, 2023 at 8:12=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wro=
te:
>
> This changes the suggested method of obtaining Rust's source to using the
> tarball rather than a full clone, and adds a clarification about 'rustup
> override'.

Applied to `rust-next`, thanks!

In the second patch, I undid the `:` to `::` change -- the latter is
meant to create a literal block.

Cheers,
Miguel
