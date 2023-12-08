Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="PfQDyPrK"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02532171C
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 21:31:38 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d34f8f211fso16355287b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 21:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1702013497; x=1702618297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWR3jCEqpewIoVzO0h9SiNH8U6LMKeoDQx7O6MfUUFE=;
        b=PfQDyPrKo7vWfOYZRdcLMneUhINr8NsS3FwGFjaHeE8vFbqL4CNk9xOFoZtNMa0Agy
         n/v8cMV5TkpAtfD8uyKhDE0C+MV4KG1xxSDoAhyzbCr/Ner1hJ/4pEreNoMBOsiwEKhL
         ictXlLroUUAiuixE3R83k7UXdo3IiMhdip3WgKJ4hwXwPI/mJ0gsD5JTqQXs72watQda
         AhliuSOIQ7uIsdX4YxA9VszNF7BNE6ZHoLN5yD7gBYxNgehCHWE/NPHKTlEODlydd8JZ
         n5DToNijilwVdf1T7coZbBY1u3DucD9o2zVRltp0FCycbXwRXG6emJQ3cGbdyeLZc8d0
         JLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702013497; x=1702618297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWR3jCEqpewIoVzO0h9SiNH8U6LMKeoDQx7O6MfUUFE=;
        b=gbA9V0fPpE3eRlxofWide5ZW30NQ+tyqndbBk1p2Q4fJff/HnYbzpBjws/rAF3ht6x
         Hlv1m+OL+9FaVzdCVXeBk8YbE4vv1YLj+qWalhEHfnl8hjtLZiR3rSRtBcZgQbnVPCEE
         MiQuhDZ3vKYD5Oir016BYU1NfOVKD4YT240hfTVXqXSgPV+uU7T6dV0JzK5o290l3Cfn
         CCRsqdnRyvXqco6WYs8Cx1EwD202eBlD6nuQsakV6KPQrgHV/sySMhYQlGyC0/lMhsHB
         ZU5i8LIQK1Pkw1MMDUmRYXP/5BGnEfmqgOqo9MNiYmm/aFcOOlVZKk6dXDXY9xpFnmB9
         nL3g==
X-Gm-Message-State: AOJu0Yz7G6fnwS4gVRDa04sn2ysDM0eiNkNQ+6zDLDui9UlFLPHe7IFv
	Zj5zBi0fy8QHJ4iXou/yc9heUYqLo+isAtRU/ZWZWQ==
X-Google-Smtp-Source: AGHT+IEbjH5A/1kcO+YJYPeTpzhVqCKtDsU2Iwz3JgSH/4v9p+1mEHT2YqNblpbIWFlid+a55lUBJ3zFCLzSjhHNTZc=
X-Received: by 2002:a25:b90e:0:b0:db5:3dd6:2d4a with SMTP id
 x14-20020a25b90e000000b00db53dd62d4amr3095911ybj.64.1702013497188; Thu, 07
 Dec 2023 21:31:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206125736.2040066-1-dirk.behme@de.bosch.com>
In-Reply-To: <20231206125736.2040066-1-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 8 Dec 2023 00:31:25 -0500
Message-ID: <CALNs47vKrFdg3k6sAYpX58n4BC4PHzbXk8fCBYbcnZuzPhancg@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Add rusttest info
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 7:58=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:

> +-------
> +
> +Running the Rust tests the Make target is::
> +
> +       make LLVM=3D1 rusttest
> +
> +This requires the kernel .config and downloads external repos.
> +
> --

It may be worth pointing out that you can run via kunit too. Quoting
Boqun in [1]:

> FWIW, I usually run as unit tests by:
>
> ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86_64 =
--kconfig_add CONFIG_RUST=3Dy

Thanks for posting this!

- Trevor

[1]: https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/topic/=
Running.20doctests
