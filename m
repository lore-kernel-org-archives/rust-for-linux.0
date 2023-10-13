Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2C1D54C
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HJu4weAc"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C28DA9
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 12:27:28 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso7507321fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 12:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1697225246; x=1697830046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMlHIs+RXRwcCam9b7W7YcpdMJXw0XO1+U1rinkBh7Y=;
        b=HJu4weAci0EdD7kJ/nj91nfphjw6vaFvRJ7cum5gMnbN84Ti6FT3DM4wkvc3vPJF8L
         sZ2U29flnM/Q4Qungpkf3fQSrTjCf7MNngmJxgqN0ISUbg07M9F0+4VonoKHl36Q5Ap/
         YsK8drohAk2KhXfnNdripp+vrqJg4wbQhWho8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697225246; x=1697830046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMlHIs+RXRwcCam9b7W7YcpdMJXw0XO1+U1rinkBh7Y=;
        b=B587AadGHI2n09U1tVPcm53LiWyo3B9KMGahvbOH+XalVa9aA+udYywBltpnWF7X4C
         uofW9f7pmCYWcG+ylpa42v93fhh82ZnYr5h/mtOTxJa/QC/3/3FURoeid6vZ4UBqXOxo
         hayBK21OY5hcNOun1EOlnK5BZAqxCDu8YAm/XnD/01g8gBed3ABoNKCW275hHpzbddrx
         nxqlEjq0ec4a6abLvug8eK1FaCxKz7NhT9mu9CfiLE7fM3oqW0TH1ex5S8Dyr94QFuzM
         B4v+N9t72SGHGoAP8N0EsevdABHjE2cMXnbpkUA/Mhulx6eL+V1DU7a53gquk4m8XfO/
         SBvg==
X-Gm-Message-State: AOJu0YxRQW1GinjGxXiKiu6SvZ6sU2Qwsiea+gOkCPnj71CSQfeKR7GN
	I2LnMHqUG1GdPFmachXx1+BGwX6GuM6zPtCaucHb4ASF
X-Google-Smtp-Source: AGHT+IGzyYA81OoFyaGgC3NvjbEdtN3CQuuwv84lqe9M/9kzU62ZZ+2L3BeFUcLMgnPt8el6bSxBGA==
X-Received: by 2002:a2e:2e0f:0:b0:2bc:b70d:9cb5 with SMTP id u15-20020a2e2e0f000000b002bcb70d9cb5mr21850616lju.33.1697225246565;
        Fri, 13 Oct 2023 12:27:26 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id l16-20020a2ea310000000b002b6ce8b0dd6sm4352385lje.75.2023.10.13.12.27.26
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 12:27:26 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so17381371fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Oct 2023 12:27:26 -0700 (PDT)
X-Received: by 2002:a17:907:7790:b0:9b9:facb:d950 with SMTP id
 ky16-20020a170907779000b009b9facbd950mr17575861ejc.72.1697224939431; Fri, 13
 Oct 2023 12:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220927131518.30000-1-ojeda@kernel.org> <20220927131518.30000-26-ojeda@kernel.org>
 <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net> <CABCJKuenkHXtbWOLZ0_isGewxd19qkM7OcLeE2NzM6dSkXS4mQ@mail.gmail.com>
 <CANiq72k6s4=0E_AHv7FPsCQhkyxf7c-b+wUtzfjf+Spehe9Fmg@mail.gmail.com>
 <CABCJKuca0fOAs=E6LeHJiT2LOXEoPvLVKztA=u+ARcw=tbT=tw@mail.gmail.com>
 <20231012104741.GN6307@noisy.programming.kicks-ass.net> <CABCJKufEagwJ=TQnmVSK07RDjsPUt=3JGtwnK9ASmFqb7Vx8JQ@mail.gmail.com>
 <202310121130.256F581823@keescook> <CAOcBZOTed1a1yOimdUN9yuuysZ1h6VXa57+5fLAE99SZxCwBMQ@mail.gmail.com>
 <20231013075005.GB12118@noisy.programming.kicks-ass.net> <CAOcBZOTP_vQuFaqREqy-hkG69aBvJ+xrhEQi_EFKvtsNjne1dw@mail.gmail.com>
 <CAHk-=wjLUit_gae7anFNz4sV0o2Uc=TD_9P8sYeqMSeW_UG2Rg@mail.gmail.com> <5D8CA5EF-F5B0-4911-85B8-A363D9344FA7@zytor.com>
In-Reply-To: <5D8CA5EF-F5B0-4911-85B8-A363D9344FA7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Oct 2023 12:22:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiiBpw-0MKBbPkvo54=Cvyi0b3_1bDtqbgiD4ixd+OPow@mail.gmail.com>
Message-ID: <CAHk-=wiiBpw-0MKBbPkvo54=Cvyi0b3_1bDtqbgiD4ixd+OPow@mail.gmail.com>
Subject: Re: [PATCH v10 25/27] x86: enable initial Rust support
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ramon de C Valle <rcvalle@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	patches@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	David Gow <davidgow@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 13 Oct 2023 at 12:01, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Transparent unions have been standard C since C99.

Ahh, I didn't realize they made it into the standard.

In gcc, they've been usable for a lot longer (ie --std=gnu89 certainly
is happy with them), but the kernel never really picked up on them.

I think they've mainly been used by glibc for a couple of functions
that can take a couple of different types without complaining.

           Linus
