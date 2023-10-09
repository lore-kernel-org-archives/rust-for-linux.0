Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3E9CA63
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY41CcjO"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E336AC
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 05:26:56 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a21ea6baccso54303097b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696854416; x=1697459216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKzt7P2iZ4LK2JwRJ9XKaHpQMPz3IdmYJdBwe7/O7io=;
        b=NY41CcjOyrZpV0V4o1FeJywwqBJnfMjnewsJeScXEj2090iN1h7S0rNo60NIS0mqA6
         GQj+LF3RvaoWUCl26NCqcTwcj87z901qA53IgVFt+kjCylAGItwR4SBoAoTnBzVTUJYG
         r4Kr44+wr6H8VdYxVwc7dEl5p2D0rIJkqXtN7dJCLpPoUwYT+FTk/mfbVAj6yLcB5Oev
         g1OmAf1Acya+oM/yRN3crBrbPegWonZ/ZEpDrGaKNufUBJeR4OLCQ3VMsMOgvS7GhzDG
         vngipTK9IMTenC+e8vrUcRl2hBWsNpYM3vI1SrgmYtWHVjqWPtXttOrUps6ZMgohTPLY
         FUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854416; x=1697459216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKzt7P2iZ4LK2JwRJ9XKaHpQMPz3IdmYJdBwe7/O7io=;
        b=A1EuvpGvmhRqEg/Ccsp2mkYwL0WjMg/7B5cYLbRPjc72j0nB63yoyPBHBBtzrG5gcp
         tfzMVL42Id7wjL7LxBQOH70Rgi6LT7nobMmi8QEuDqroD22wFCKXnMR7pu9RXyJX5X8O
         SXxF1WmwFBtDamEhCwLVxA+ukkVV19Z8jkHvsYt2/1XTNIuozvE5z3ivY5OnlDEdKLu5
         PnxlH7S7JNaXnTpc2UPBoHnH7cJgD8UV2TqTdPlMpMlRY0WiM84MwpcN7dYjirnG9EL+
         crsw2wgCphsL3/fZVO4n03vMr539PqMYRdNiitk/sz2oX23EeE4gpWx55TwjEyTsK14v
         NHhw==
X-Gm-Message-State: AOJu0YyT6k05a52flU46rb0DG+lqEFtQIY76ySPuavNJtZ1DucrXe+Me
	+BSHiHzqGHQBYt/f+1X4zOrUIFDwRx9WIOPweiLXy4bA9W8UOg==
X-Google-Smtp-Source: AGHT+IHX8bKTeTu9Bycg5yAGDJDueXtvKLVUIhIbmtC4yfqp0XZrphrKxWbHOHcpmioZW+FiE1FAsgfr7/+twvjNJ4E=
X-Received: by 2002:a05:6902:18b:b0:d6e:3544:9871 with SMTP id
 t11-20020a056902018b00b00d6e35449871mr12791135ybh.44.1696854415766; Mon, 09
 Oct 2023 05:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com> <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com> <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
 <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch> <CANiq72nkmL5jEqdnj+OoDk+Vja_jVUdD+EGneF3h+kdFSOJqPA@mail.gmail.com>
 <3dc9a1ea-fb04-4b9e-abf9-08165ea3b8c5@lunn.ch> <CANiq72nnX5T4TLVpn9g7_9EDP0gudQAAqOc1oSvotsgKYUs8Jw@mail.gmail.com>
 <4659894c-ae10-4e21-87da-6291c940af3c@lunn.ch>
In-Reply-To: <4659894c-ae10-4e21-87da-6291c940af3c@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 14:26:44 +0200
Message-ID: <CANiq72mirYM0E0qMe0xqQVJ8jqF4aa0NrwLg-CdroRtV15b0VA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file to
 the ETHERNET PHY LIBRARY
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

On Sat, Sep 23, 2023 at 4:42=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> I hope to attend LPC, so i will try to pop into some of the sessions.

That would be great -- thanks Andrew (and for the questions you are
asking!). We will be in the Refereed track as well as the Rust MC.

(Catching up on some emails...)

Cheers,
Miguel
