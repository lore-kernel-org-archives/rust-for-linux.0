Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D47210FE
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 19:46:29 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428302698
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:46:29 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so179487266b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694720787; x=1695325587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXAo40ktSbE3e5kYZMqEfwPApsFzybfWvNFeUHG8UBI=;
        b=Odcf/SsXm2BvncKlf3CFM6Q0fKmHV4JRU2q3Y0n+qabXQJVQxjtrjNQc6eTi/axn5A
         knnboluOjRpIBbx4SQ7XKMk8LoKqDt6paAc3PRql8u9Qg+OnzXMCCwcqlx6ZRzlq9S7K
         HGR01P5Qebgw7O/ya4Tr2tMYBGyukqPC5mS1OwJW9idrmC2v98xDQlRi95df7iXmD49b
         h8Ql/xWJ8YiQOcvsQvwKhp8YTrj9Y6TKlNavt3YYS7tmgvDyknDr688TBdA3qASsyHiW
         zKZyJNyd8ZTC6+jSaywWVBkCFgaMIYxR1EsoUnGzYT+EQFd35EaJ+/8h/7IWLu/KnDQq
         R50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694720787; x=1695325587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXAo40ktSbE3e5kYZMqEfwPApsFzybfWvNFeUHG8UBI=;
        b=CNs9nc5VzhS2Q2se2mltyJEulJAICCUec/sySHux4ptgUy/6qCIfzkh65EbBL/4RQP
         /YUBh1vLIsU2l5cJvNh9rtw0If3MjTRJDJzB2ZshpuTVPZpK3AkMhbgu+28PeFZPDS1p
         OmK7sIiVVRBfoZEMTiIGj4C/QVS994wl+o953xRleOZyf7H1V3OTvB3bRpJhkCFmYl+3
         acQ34yy6o60yaACGgTJ/Waqu8sKGhFOpUxx59g5tSWzNkfVZIRnuP2yDi/nspexmJKfb
         xqGYWIzqz6WxzfzUaDlflI7e0K9aoAZEKmclDpo9vc4tvLCY8r7TyLBUzAB3xDpBNtU0
         cqzw==
X-Gm-Message-State: AOJu0YyRlVbH6kga26peAlrkOEj6icMn2wXuvRdmu3mEHS9J13XM6V3W
	hhJwy2S7L7kIA7l1U2S9IHEngOLSqBFdspzo75nCUg==
X-Google-Smtp-Source: AGHT+IEGIEukSzC3dUf6GY+JO2LJBt8oizHze9XO16zr/6OVkXFjJmhbBw+U03CVdRQb/N+B7li+P+NywFDBWln4hw8=
X-Received: by 2002:a17:906:74c2:b0:9a1:c2fe:41d9 with SMTP id
 z2-20020a17090674c200b009a1c2fe41d9mr6137778ejl.47.1694720787656; Thu, 14 Sep
 2023 12:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>
 <CVIKA1ZXOTK9.3G84PRD9KH12R@suppilovahvero>
In-Reply-To: <CVIKA1ZXOTK9.3G84PRD9KH12R@suppilovahvero>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 15:46:16 -0400
Message-ID: <CALNs47skBi=8Otut+r+Y4QA8d-oK2rO21BhuFmyHZZLzoSptpw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 6:17=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> [ ... ]
> > Adding `From`/`Into` `phy_state` may ease use in the future.
>
> Just observing but usually in kernel patch reviews anything that
> may have use in future should be left out.
>
> BR, Jarkko

Of course - I didn't make it clear but we are already doing that
conversion in `pub fn state(&mut self)` (at least one way), I just
meant to refactor it out to something reusable.
