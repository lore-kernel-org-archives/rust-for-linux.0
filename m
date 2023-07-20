Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865318AE4
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 14:53:05 +0000 (UTC)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90928E60;
	Thu, 20 Jul 2023 07:53:03 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-579ed2829a8so10627287b3.1;
        Thu, 20 Jul 2023 07:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689864783; x=1690469583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvMr3T1p15XlXcu1FTpChfqGLr/+qVrwbwtZIWp+fI0=;
        b=kO9WQz7rK0/+lGVQ/yK7d94iSfvTSIIQLoqAX4O+kisIiIZMV60Ouel/kc4srVmbqF
         76rOjM3GrcgFOEroazpxRfB2lJ/JIupbg3qnvOM5+7WhZ0Y7MRlB5xQ3cYinYN7miYE9
         iXq7/NZ3gYGKmB7Ftd7LT8oRPQP4wlgS5PD6aOcjvVp3Kx0KGh82dH87Y8hpkf1opaNr
         ymmkdCQp8tVU9WBqir+RsXB+GRWBhpbGN7Nknx97c4gQdNxs/HoI77nwAJzPJCsOY7kV
         gsgxKEoCt5fq6NnDpY7+nA0KGQ9TvzaIEvj/klJJcc4fdap60SZRd1X865x/Me+PhNOS
         9e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864783; x=1690469583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvMr3T1p15XlXcu1FTpChfqGLr/+qVrwbwtZIWp+fI0=;
        b=dlENfrS0oL870RGAWdlqS0gQXioUZGnsFKv9auS7+vxEaRLPvLLRm6E/slA1AkS4Ic
         tIlfgixVl6tw7fhVI58FncILoWYDU6B6eBtfDB6mC5ZgMT2zqy0Jquqgo4hBs3QBJXDn
         /vFCwt2aSikjzNuYvLm9twcOgHss8z3iBz36T8GXYS5xSddl04PzfgIBbRDP6YfseN3b
         mlLM0nINleME7quCYyMA6pswTJn/rMPMRD+LKtIDc7Pujj2yRtosqIofz9YqA1WsIa+S
         GhXmM6rs8+wJo6RkFyORmBn/r8WqE76OKa7JI3Ut8eZG59A6i9tVMUzWy3Eut3laH2BR
         Kl1Q==
X-Gm-Message-State: ABy/qLa374eDUUDNBTwqDQtHqBAG+PEcOtMQAhBj9BKxBp1dfZkEUiyA
	IllKU9vFd6xiQ+LP1rc3S4S+czEz8dmAUX90IaY=
X-Google-Smtp-Source: APBJJlEiujDeAVJNH/1GLw2NmF8gP6rL7sbKwZBUpbAW83QGPF1do6ceqgk/eUhEkCIZRtIvJQHpIx3rCQauF60rxw8=
X-Received: by 2002:a81:488b:0:b0:577:60ba:440a with SMTP id
 v133-20020a81488b000000b0057760ba440amr19093706ywa.50.1689864782754; Thu, 20
 Jul 2023 07:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230718054416.861412-1-tmgross@umich.edu> <20230718054416.861412-2-tmgross@umich.edu>
In-Reply-To: <20230718054416.861412-2-tmgross@umich.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Jul 2023 16:52:51 +0200
Message-ID: <CANiq72=L+_1OctE_fgeXfmzL2PCZmmMLW9i0GJZyCcf=B_=pRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: rust: update instructions for obtaining 'core' source
To: Trevor Gross <tmgross@umich.edu>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, corbet@lwn.net, linux-doc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Jul 18, 2023 at 7:50=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> The source for Rust's 'core' library is needed to build the kernel with
> Rust support. This must be obtained manually when using a non-rustup
> install, such as when using 'rustc' from a package manager or from a

What does "manually" mean here? I guess "setting it up by hand", but a
distribution may provide a package for that (e.g. `rust-1.62-src` in
Ubuntu), so it is essentially the same as with `rustup` in that case
(i.e. when the distribution provides the means via the package
manager).

> standalone installer. Currently, the documentation suggests cloning the
> 'rust' repository to obtain these sources, but this is quite slow (on
> the order of a few minutes).
>
> This patch changes this documentation to suggest using the source
> tarball instead, which includes only needed information (<5M) and is
> significantly faster to download. This is more in line with what
> 'rustup' does.

If I recall correctly, the idea with the clone was to easily change
the tag when migrating to another version (assuming the base path does
not need to change across versions). But the tarball approach is
likely better anyway, especially for the majority of users.

> Signed-off-by: Trevor Gross <tmgross@umich.edu>

It may be nice to add `Link:
https://github.com/Rust-for-Linux/linux/pull/1024`, but I can do that
on my side.

In addition, commit messages should describe the changes in imperative
mood. Many commits do not follow that convention, but it is what the
kernel docs say, so we should try to adhere to it if possible.

> -Otherwise, if a standalone installer is used, the Rust repository may be=
 cloned
> -into the installation folder of the toolchain::
> +Otherwise, if a standalone installer is used, the Rust source tree may b=
e
> +downloaded into the toolchain's installation folder::

Is the rewording (i.e. the Saxon genitive change) expected? Not a big
deal, of course -- I am mentioning it since, in general, all changes
should be mentioned so that that they are expected, e.g. with a quick
"and improve the wording while at it".

Cheers,
Miguel
