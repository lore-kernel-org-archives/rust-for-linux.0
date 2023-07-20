Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA417FE6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:44:38 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE6A19B3
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:44:36 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-cbcffb18afeso726403276.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689860676; x=1690465476;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RtUw718EqiyOItgwLRoWHschTDUolZNtcEeIulMXRuU=;
        b=Qe45Vgea9Eb6lR7WQMdTwnmQf8IRCSuAHhjorIGTWlHBqhWfzeyijpT5OgAiHcw5Hs
         PgcZM9ydmUS6rhORROj0FX3dxg7fHYAoo2UDvzSY9uSu4wja7RsRQA93RxTJ24pg9wpB
         LpnigSLz0auuL+KRAHJfFOjWkgH+AZKNeAcs6NMxAYiaR5D+Gq6nTdMwTvogm6bwNjbq
         OKXP2852kXFEg6DO51hM1sinDG8/mr5mYx94iv2TlC1Jl9bdaEzUiWN/+prDhRi4erZV
         HgakPHRBd+0MVwsC+HaBPJ838OSffS7i0ukpCHgu+aOvZV05NjwzI0GTpl6P/PbJ+PV6
         Fbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860676; x=1690465476;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtUw718EqiyOItgwLRoWHschTDUolZNtcEeIulMXRuU=;
        b=V9ufr3cFXucmLIHTtvqnM2KIGvU+NQd6Q60+kpiYsIpJ37KJOkx+O4POtMhB78qKkH
         ekyFq8iyleBgsopWABCidZ4xmUTaoLQA1//kZES/XI19tKKCYFOYIP9z7BwrEgvsj3ut
         v4Dgc3e5F2YJY2xj8UkJQOl4E82esLR9mwhtfw6KOzG4VrtUSFdiIM7ZC0Q/J2XfIiIS
         /hpZv6J79MPB+X0HDmaiU3ncYcuhskE4Oxp0xPEP8YdIENoDRfMXG3ehIatdYMEjV4Qu
         8iQt8vzY3b1q0nJaO2LDkzk32y/WVVr8geCqWW5MWChSW9jlcVEC5fuLB4qkx+hr4mft
         56dA==
X-Gm-Message-State: ABy/qLYBYQVuN0wH7iBhcaLjWvT2EAHox0Q+vFQXw6U3hofI4lFAK9AQ
	HZOQ+5iVKRCurChy8V5dTQ5BnTao8QKZ4Mc=
X-Google-Smtp-Source: APBJJlFtGDZZbmerF2xp0urcimT532Xxqp7VKULGWvIydvDQxihP8tafHJbfMTat9HbGQhQ6KJ2SC2jq2gjZKmg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1709:b0:cab:e42c:876b with SMTP
 id by9-20020a056902170900b00cabe42c876bmr44853ybb.3.1689860675977; Thu, 20
 Jul 2023 06:44:35 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:44:28 +0000
In-Reply-To: <20230718054416.861412-2-tmgross@umich.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230718054416.861412-2-tmgross@umich.edu>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720134428.3547917-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/2] docs: rust: update instructions for obtaining 'core' source
From: Alice Ryhl <aliceryhl@google.com>
To: tmgross@umich.edu
Cc: alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Trevor Gross <tmgross@umich.edu> writes:
> +	curl -L https://static.rust-lang.org/dist/rust-src-$(scripts/min-tool-version.sh rustc).tar.gz |
> +		tar -xzf - -C $(rustc --print sysroot)/lib \
> +		rust-src-$(scripts/min-tool-version.sh rustc)/rust-src/lib/ \
> +		--strip-components=3

I think this assumes that the sysroot path has no spaces. I would add
some quotes.

With that fixed, you may add
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

