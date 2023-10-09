Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976E28DD9;
	Mon,  9 Oct 2023 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0o9Y1pk"
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449838E;
	Mon,  9 Oct 2023 07:13:14 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7ad24b3aaso3006867b3.2;
        Mon, 09 Oct 2023 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696860793; x=1697465593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAUN91El5mmubamlYAg8cRmEK9qeNPdvt6ElGhwQBGI=;
        b=O0o9Y1pkijEJ+lqpwRxI3qEnH/kKYg6ZBtIRvSvq/faDms1BXbN3MYEDDHznUpiEM+
         0JaBKmhhheSS9zjySOjDgUWQ3HwX24T+ne3Ak8uzxhEye6ghwzA+tJY+25AOEUsga9Le
         T/5AfP1J93qfddwTA8tD8wydA99Ft2qQnKjRl18H8p+SeewZvpplxprFup9Kz9td/B87
         2gNPV2X+nclSgNIK3iVsryvt2NQ0LdoimuQ2Qv5XTYZOwxWM3DS3MvROh+ayD8i87bH+
         jrxlDZs4l4spdM4/OR+Ya1BIMHxlUWMOPdMA6wzzraYUGu38tXExBWfNuQgtUm+k6Xv9
         KzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860793; x=1697465593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAUN91El5mmubamlYAg8cRmEK9qeNPdvt6ElGhwQBGI=;
        b=wVSwLMfu4IvNE0cLZyf84CGdctdBmuTjxD4MtLgn0znnOCXba7EmUuPzQXmK8cszfI
         8Js/spiQYWEZu324r3jTg1ZE4LS8wE46oE7kyprUKT+lNYx/H4SGYm0f+WnG222euTZs
         Us1hgBB9CIKV93yOmOpXlDHB9IoJX3RptLUgy2ezE9BcmzeDTeAT7Uz3EHjEsTTHXpMf
         jbugdmjZhXp6vb/PJjxx8Jfu8upl/+HHjAgvmIC8nxjT4t3dzKZ/hCX+Ytsl+y+aT7GX
         vYUug+GDyLIyyn3KyLcRJr6oXXmQmR71G6XhNfmrOvcSxls2Ol8Yj3hBvEZvctcElLjb
         UkWQ==
X-Gm-Message-State: AOJu0Yz041osKJQahgBPbwR9ZQIU+JQZxwAtcVotrogxz3ZgTdI47OwE
	+83rizk1xHHttWuslqHAhJH2Csprt6Eoi/WfYiMk2MEuC2w+qCrNPSU=
X-Google-Smtp-Source: AGHT+IHpziYbXhk6vpGx5eix6aoCNZYt8xbXrjWWAdIZ37q7gFv3hWTeC973SvjMZYRcfFGyZ/18b2nosiuviaMXg1c=
X-Received: by 2002:a0d:cec4:0:b0:594:e439:d429 with SMTP id
 q187-20020a0dcec4000000b00594e439d429mr16235279ywd.37.1696860793486; Mon, 09
 Oct 2023 07:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com>
 <5334dc69-1604-4408-9cce-3c89bc5d7688@lunn.ch> <CANiq72n6DMeXQrgOzS_+3VdgNYAmpcnneAHJnZERUQhMExg+0A@mail.gmail.com>
 <2023100916-crushing-sprawl-30a4@gregkh>
In-Reply-To: <2023100916-crushing-sprawl-30a4@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 16:13:02 +0200
Message-ID: <CANiq72nfN2e8oWtFDQ1ey0CJaTZ+W=g10k5YKukaWqckxH7Rmg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] Rust abstractions for network PHY drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Lunn <andrew@lunn.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	Andrea Righi <andrea.righi@canonical.com>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 9, 2023 at 3:46=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> That's not ok as you want that option enabled on systems that have those
> broken processors which need this option for proper security.  You would
> be forcing people to disable this to enable Rust support?

Yes, that is what would happen. But if we want to avoid the warnings
and be proper (even if there are no real users of Rust yet), until the
Rust compiler supports it and we wire it up, the only way is that, no?

I think PeterZ preferred that we restricted it, and at this point I
think it is a good idea to do so now in case somebody thinks this
works.

Cheers,
Miguel
