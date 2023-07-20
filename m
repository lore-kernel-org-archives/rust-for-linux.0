Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306117FE6
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:45:25 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD751989
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:45:24 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-573d70da2dcso7607887b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689860723; x=1690465523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=knRbu80OJ8CLJhnQO5wWqGTxy3faZAYp+dQGDLVzoX4=;
        b=zxZpchrshqL9I6eRR0BSKpc4nlBOwFpJNgyzgAgyo8mdlxp4vOYkBJ4BXuZc9IRmq1
         axPzkYA2cII3XkAGh5UNoEuQtecPd46bK/AI5xTCpC6gyiYWR3HqJuyq0MB9qrMb8SzU
         9LA80ZPYiDXt/qzAOphsh0rEzLM1fVaqk0lHNc+8tjmcO2GNPKZ/sSFKzypfD6bmqmwD
         05qWWPNMy7fWLXeLSFKPsNDTLIj05DIcCYhgJDfslWBWgPBs1QXdafRPpoRimlViandm
         ul4P5w7SHX3ExnXrAXJv2pMqND95cC0LNFTU3u7Uog5PUKlg1PovZU6EKvs/Il6Ehkw0
         qTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860723; x=1690465523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knRbu80OJ8CLJhnQO5wWqGTxy3faZAYp+dQGDLVzoX4=;
        b=eGZwgJPgC3a8w7muHnfjFB0mJYxpC5lyzBA76pJOG1Fz48Ah31ft0i6oUuBeRPt4Av
         fRUnMXpJopTPfUGY216Ns4IXxb7ujmCPm1ak9zkQsi7YYBolNvTumJPilFz+anlphnJb
         l19w6I1C8mHCUO0DosYsZ87OEgZ13Bq9Snmf4pYywibiWgChiTXAitPv/dr0kl/VwH8T
         q14jty9EyVp6NM97v/dl9dwFbuEa7ku7RN4WWTaFSfq0phlVLHHCRMv/mV6xGX4DFIAs
         fJprQq5CJqvBbYYTCXdvMLqNQnhYsZtXIt0jxAMuCbw53KZ3UWzvTYyNq49DUzWo/9LG
         8Txg==
X-Gm-Message-State: ABy/qLZEDr/PZB7J0lC83kt+3frZq/MYdYkx9L5aLAwrhsqfphWoIs+l
	mqoBiXeBpVprfKUGB0dO2Fui1k2+/eUo43Y=
X-Google-Smtp-Source: APBJJlGplpoVryvURkn9ZSMo+zrTMcglju2HavshLybsiFTib7Swl5mhM9Plg6FME4ZvmaeT9vcCZhCdLZ5Du9Q=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:b70d:0:b0:581:7b58:5e70 with SMTP id
 v13-20020a81b70d000000b005817b585e70mr59909ywh.5.1689860723759; Thu, 20 Jul
 2023 06:45:23 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:45:19 +0000
In-Reply-To: <20230718054416.861412-3-tmgross@umich.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230718054416.861412-3-tmgross@umich.edu>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720134519.3548499-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/2] docs: rust: clarify what 'rustup override' does
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
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> The behavior of 'rustup override' is not very well known. This patch is
> a small edit that adds details about what it does, so users have a better
> understanding of how it affects their system toolchain (i.e., it does
> not affect system toolchain and only sets a directory-specific
> override).
> 
> Signed-off-by: Trevor Gross <tmgross@umich.edu>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
