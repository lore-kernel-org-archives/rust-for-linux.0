Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A7182A0
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:37:12 +0000 (UTC)
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936031722
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:36:57 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-99388334de6so61960966b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689860216; x=1690465016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k51stBq+o7kJZEIZv26DdcdZg2cE4vmKfb3tLcw/wzI=;
        b=rUfzV8DPsULpg24zPK4bm/8wgeUZeqKsAQOXtOekbhkM/Avo2hMCPPWKQgMn9f2kn+
         dQvx+NCUmFgXxwX/DcEH9KAd9S1dfhWXGjG70KY6G4FiSvWZyb6JmVyvKtzYBaKRoXS8
         14ta0oKVSj0Kjl/yLorQo13gp+UzBhXZg07sGqTLfqiYUJP6r7XPVVPFQJq2UFkChaXj
         nKuaXFzJiGRfL9ooexMpnU+xLPbZPuz7ZwaVsaJ0leM6H4He9CxHq8oxwviu1Bkzt/mn
         Hz3aEdN5peyRQK4eAY6nE3+BOpgw6YpAtTEMn1q5B30mGkadVhsCIhCN1gG4fmICrNyV
         r+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860216; x=1690465016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k51stBq+o7kJZEIZv26DdcdZg2cE4vmKfb3tLcw/wzI=;
        b=TzGs2Y+tPAJrMmarN/92R2RxYKXKSrJ9mSa6Q6DmAILDt2Gwl4P90u+kzEIus2W485
         RQUN7PrxPq33OKeQmPahEU1hpX7jwmkGX15bHW5/gyYqw8K8tfw9/Fmb3SCRGfPYPtur
         RH9RgcnvXAxT6oJsRLVqIvF4wyTg5ShxP+8ZL1/D7Pv4sAnWs6cAHJo329P80NiY0xyS
         4Av5oxbn0/cURjsqqbdptQVU6zUEoyH5VoQHY7yBeNd1e7g7HiCipTQDzdLQYRspRRDc
         2Owzpk+H5+xwDcYogv1Lv3PjuYLj0/5Hqer7YiCTrLqth1DFOT6D8Y4ZW14UCbryeH8y
         zSeQ==
X-Gm-Message-State: ABy/qLa+1nWfXmD7MsxPq7XFEkbjo2/GEeYMM18On6UothOhXPeiicSu
	xyi/l1DU0OG7FdK2NWp/AhwfeQH+Cs1illQ=
X-Google-Smtp-Source: APBJJlEIlF83hNdPRGQUAWmVuaBGP0GbMcXQpvAovU38izZLFx8rAM5TcC62AGMMghFYwxeTSynPtWtOY3uZt74=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:5a73:b0:997:e6a3:9168 with SMTP
 id my51-20020a1709065a7300b00997e6a39168mr13287ejc.1.1689860216063; Thu, 20
 Jul 2023 06:36:56 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:36:50 +0000
In-Reply-To: <20230719141918.543938-11-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-11-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720133650.3546587-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 10/12] rust: init: make `PinInit<T, E>` a supertrait of
 `Init<T, E>`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	nmi@metaspace.dk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Remove the blanket implementation of `PinInit<T, E> for I where I:
> Init<T, E>`. This blanket implementation prevented custom types that
> implement `PinInit`.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
