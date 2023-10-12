Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1598DF54
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="WFWUduTj"
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99383B7
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 00:32:56 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a7dd65052aso9688787b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 00:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1697095976; x=1697700776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RSBcWKzDInxa/puXq/LpkrmEMgpoQ4RI9D0wr5YKgU=;
        b=WFWUduTjFSBTeWo9quLv0Vjfbo6R4wAKiaxBj29vg4LixrEdyu8TRiayF3arJN/yjW
         aDUJ7xkd6gNlsabnucKxyOqWiCPQOMpzwlNzirL6GPl9gTL1n95iaYaolpS2xucAhlSu
         KOYKDOCYc4qH5rVbKfclC1RRArOpfe7I/QsB5mU9Ju3A86tgwzeeYMv+tXXLq+JoWVN2
         6q8a637Ef0LZe2o4t25ox2nVByEytTQZlodsvOPExqP7yY7AKOQvpi8Jq523ALPmgUV9
         GVvsosWJF40975Ss75iO+bF+axjI4eW/iXvm506ftqVCgpT10ZDkKNOws0J42xOYn8WY
         4YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697095976; x=1697700776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RSBcWKzDInxa/puXq/LpkrmEMgpoQ4RI9D0wr5YKgU=;
        b=RuXXRKVL1/BA4pIFhvddv89BdQvoFmrHVdIDBy4ji1NsEi/KuEV0QJwL+sDDNdLtyo
         p+mehJ/pxMMoPvqMCzc90G+1TbA1ccCMuQxSZ4CVbb0iKJNkdeYgyESd2uBB4SIy30y0
         e0D196kMxXo1ieZwcNJlRkFZKOh9ZNL+B71GBQgDQxST3uLUHbcW4cPBL6pt/cEosJoW
         8zuSiK+xG2VRKlvVsUscwErBJwplFA1gn68whYULJILGRE3z2Uos+a/+dNN67D3cKn35
         pxK1eKxdzLIo2xLun7+kQXa6xRZyNt0QE1XkR2lLnZCdWvSVDLEzhEHFvf1vWsgI4I5H
         gglw==
X-Gm-Message-State: AOJu0YxXPtMFDNm0DngJWWWuWb0FKimCFJRDMXs1pBzh9SdWq54YJQTh
	YymsSCW3X5NQ280UDwTC8ZkPkMGBnVT9fLCNhYVyKg==
X-Google-Smtp-Source: AGHT+IErOAKv6IFWFct8gKddv05t/UhON/R/qbMneAluaCdZqcfrkXm6jm24iRuIc7A5cDyqV/pJZvwS31sGCNMIbRY=
X-Received: by 2002:a0d:ccc5:0:b0:5a7:e462:84ef with SMTP id
 o188-20020a0dccc5000000b005a7e46284efmr3986734ywd.19.1697095975846; Thu, 12
 Oct 2023 00:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012.145824.2016833275288545767.fujita.tomonori@gmail.com>
 <ZSeTag6jukYw-NGv@boqun-archlinux> <20231012.154444.1868411153601666717.fujita.tomonori@gmail.com>
 <20231012.160246.2019423056896039320.fujita.tomonori@gmail.com> <ZSeckzvOTyre3SVM@boqun-archlinux>
In-Reply-To: <ZSeckzvOTyre3SVM@boqun-archlinux>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 12 Oct 2023 03:32:44 -0400
Message-ID: <CALNs47tKwVE_GF-kec_mAi2NZLe53t2Jcsec=vsoJXT01AYLQQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] rust: core abstractions for network PHY drivers
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 3:13=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:

> If `Device::from_raw`'s safety requirement is "only called in callbacks
> with phydevice->lock held, etc.", then the exclusive access is
> guaranteed by the safety requirement, therefore `mut` can be drop. It's
> a matter of the exact semantics of the APIs.
>
> Regards,
> Boqun

That is correct to my understanding, the core handles
locking/unlocking and no driver functions are called if the core
doesn't hold an exclusive lock first. Which also means the wrapper
type can't be `Sync`.

Andrew said a bit about it in the second comment here:
https://lore.kernel.org/rust-for-linux/ec6d8479-f893-4a3f-bf3e-aa0c81c4adad=
@lunn.ch/
