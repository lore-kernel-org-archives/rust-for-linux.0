Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6B013AD5
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 10:45:40 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6041910C
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 03:45:39 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59f4f2b6de8so120841897b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695725138; x=1696329938; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI+eNbg0qpdq3vkkOFQPywNCLJtuGTIXCWjIkj4E0SQ=;
        b=QoVKALhyKW/p0vPNr9KgtrV33qk3V2inFxxclL0UsckIDxx8cL4wFaxhcVkjzDnL/T
         +lVTYKAVH7R+9qi+6PaL1USfB2VZDInwJQMuYNtV6smZFFGowkYa714ol+zyEe4zWOQn
         njo58A+VPuQXw3qhWO9aZRKdEiYf2ULJvOs9lvoNg7d5eSxdCA/sR8jdhZXJ4bgv7wcI
         egB8t+UXu3G/rSBOJtu4qNHtpON5P8xwWoLGOd5MPhW0R1Of2knip+Ek5vSWGig3Jr7q
         uuUlMvy1rWc5BjCEFGajgsEBEmUfOGYYzYphETo4mHNx/4Dx2/io0teMh3kAOJfiJ1d4
         lOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725138; x=1696329938;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI+eNbg0qpdq3vkkOFQPywNCLJtuGTIXCWjIkj4E0SQ=;
        b=n3zjCaQXy2L5r1hZgdpLReOMlU7OsdrI+zNqOQfn1guJdjs1xdKpfsSxhbCWPD8a+r
         OJ/mWa55EcKlYJzYTI1h6Y074zzFrreCs42x/Jb9ttT/twhWTTLoSe9kdigWEe5Loq9P
         zU47DdN9GRM/o79hf44bZGey2vVoHuENRyp6TqjqUjdyZp3afLRJas9ZgTEd+nNhnk+O
         SOET0LO4x2Ew8W0b41r6k1hCH2K5/15DvS6tdNTMq86jG0agOQg1VV9stTQkA4c7ovpN
         78XWePVTnNc/A/Tx7GdybxX0oT3NZDVAM8xPEvlQNudHYvVtxd7DPco5QFipjyL1B5Ol
         gdwg==
X-Gm-Message-State: AOJu0Yz9H3tLNzQaXiqyRDoIhorMlAy92bzwgnlsm6FBfcqd5Fbp+0we
	btIw+/xXOvP0tsiW+CkyUJBFmEcYdMUj9vo=
X-Google-Smtp-Source: AGHT+IGIcPd49DrH+Dfh7mAReV5rlgiSMBoqAdy5TxgYzI4sEGmEMbcZtmWkPKIs3cuVkncvuJ25WaosBw7tTpg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:eb12:0:b0:59f:3cde:b33a with SMTP id
 n18-20020a81eb12000000b0059f3cdeb33amr116549ywm.6.1695725138575; Tue, 26 Sep
 2023 03:45:38 -0700 (PDT)
Date: Tue, 26 Sep 2023 10:45:34 +0000
In-Reply-To: <20230918234412.363087-2-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230918234412.363087-2-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230926104534.2227995-1-aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: Respect HOSTCC when linking for host
From: Alice Ryhl <aliceryhl@google.com>
To: mmaurer@google.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Matthew Maurer <mmaurer@google.com> writes:
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
> 
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested-by: Alice Ryhl <aliceryhl@google.com>
