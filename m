Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35D182A0
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:35:10 +0000 (UTC)
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76192706
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:34:45 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-51d8823eb01so521386a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689860077; x=1690464877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSQWIpe35h2vfmTYalpALxQAf+9bTQmlNidC6prPYv4=;
        b=ecYXq1Tb+6biFfM0X8wXZc7u6Ve8Qice5xiTqlI8UCyM8km12i39ggps/ecdrYw4Kj
         /0OcOBtD4WzfMlhshUn+mekiUcH1pcPPbvDEpnmZZjCMhUjjlzZPPlU0/vbmqeQfHwBC
         Sun+WFQgeMsW75Lv7cY1VSSwi51UYJUYUgeKuDpp+Xl+5xrnQJK45fBHx44jD0hmH3ou
         X1ascve+GeDF638HU3IXFFqv2DJYyzQYyhnXunOXN5yggqQm9uqcm+ko+CtIl3XVUvRQ
         7iwP3+yQ8zvo3n1xkBYhkjRX4471vQUJcF13I7PpTHEQ9FYap1gvDYP5uFQzKrMQTNP6
         3A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860077; x=1690464877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSQWIpe35h2vfmTYalpALxQAf+9bTQmlNidC6prPYv4=;
        b=dt7I5JYEQ/mKpU94YzrCwIJNkL2kTjTNvF3GGgfzBbxo01NyC4dFD+QffKOWf3GOEv
         4zk9JpxyOGVnpbOFLMP7iRzGy7PfShHlt9Vf0BHQFOz6nJBy8TXESVyycffwIj8KA47L
         BhXL2QhAYRMrw8zUEifRBW22kuAH7e48MXR3nhTLEX9ukbEhQOqH71V3+ZC7R806PKSw
         ckrii0AzJmi4Uf+qVWACxEQGL4GOZwAproJQdxf7//9hnz2cEZWt+YVQPHkVy5y4+f+D
         usv/YVOBJifExz0czhOPctPH7mMUQRaaX/iXLbHeO8EpnAHSUF+NV7xCNDOc1i+4mnJT
         1rpA==
X-Gm-Message-State: ABy/qLaPtw+0Kb7r4091kkPWDnnjNzFyP+cp8orXm1YkcfKySQJl6rn+
	t+bj+hYljw/EBWncLo5ZhLmIYQlAlzEDAhg=
X-Google-Smtp-Source: APBJJlFUl48NrzAvipHQJcZMoPNYcfU7nf8Mihu3/BC21F7A2qKXQZzkclyQDECI6ySlPYgpbbk70/kAG9TUGYc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:f684:0:b0:51b:de6b:b2cc with SMTP id
 d4-20020a50f684000000b0051bde6bb2ccmr26288edn.1.1689860077591; Thu, 20 Jul
 2023 06:34:37 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:34:34 +0000
In-Reply-To: <20230719141918.543938-10-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-10-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720133434.3546048-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 09/12] rust: init: implement Zeroable for Opaque<T>
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Since `Opaque<T>` contains a `MaybeUninit<T>`, all bytes zero is a valid
> bit pattern for that type.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  ///
>  /// This is meant to be used with FFI objects that are never interpreted by Rust code.
>  #[repr(transparent)]
> +#[derive(Zeroable)]
>  pub struct Opaque<T> {
>      value: UnsafeCell<MaybeUninit<T>>,
>      _pin: PhantomPinned,
>  }

Does this actually work? I don't think we implement Zeroable for
UnsafeCell.

I suggest you instead add Opaque to the `impl_zeroable!` macro in
`rust/kernel/init.rs`.

Alice

