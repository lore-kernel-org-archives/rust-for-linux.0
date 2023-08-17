Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0084E638
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Aug 2023 03:45:15 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F09269F
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Aug 2023 20:45:14 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso5422704a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Aug 2023 20:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692243914; x=1692848714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1BgjUd4XeLDjePWLEkR6YV2AiwpHk7vLupAQf6XJLQ=;
        b=TvgxcjKypMfJeopGsUNlMXTiUHcfuLHQ/y2jvog9XzAJ3arUvziwgeymTbDVDXJFON
         0zVyTwy7OJQhGWjYkMs5oK6URxYhyfHYxv+HkNPWZiNeTZm59BxVAP0jhM/FrkTRO/gh
         g0uGDl27dEWbKesbWcwe80Fu9ixMwAbcyLO7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692243914; x=1692848714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1BgjUd4XeLDjePWLEkR6YV2AiwpHk7vLupAQf6XJLQ=;
        b=RABxrooPndeymlRlze/VI1YQvlMVUIhSbKh8mGRNlLa875Ydpmu5hCrz8P1f2+IwKo
         92ECjVdx2jaVByIyUYUy6wlmslERdzjiVcNKPgfcYsODyzfRpUsfO1fXDQDADKOK1U9i
         RFMkHG+lhV+qMvxQcPOyykNcGagEsbKBNZNIgbvnbJbxn6R5M6tDHrZr9rsoZudnsx0L
         jo4/5vDHyBJKafbKksc7zBWXzrMWic9EVoEcrVgVqnbpucTgTKbE/lPoveej3N0IuV1L
         G8VNGuk3WKGAKSltGshN6Md/PSXHRUMIv0znGj+Lw1R10DUyRQ12Es2B82nTD0yiwP6T
         F32w==
X-Gm-Message-State: AOJu0YwPoz2/go6rSz7rxJ0HiyBbz3UQfVSQMUZePm2DTNvFq8V2An6H
	kpNk180jMZ9WZyUwyoBPYT/D5A==
X-Google-Smtp-Source: AGHT+IH8lolk4W+WcKJ1Kxtt09L5YGzywK1Nuph+YXsBY0VuP/2D2X85rls5K/9b24WwiohRWWW+PQ==
X-Received: by 2002:a05:6a20:748b:b0:133:6219:15e2 with SMTP id p11-20020a056a20748b00b00133621915e2mr5072261pzd.21.1692243914250;
        Wed, 16 Aug 2023 20:45:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s22-20020aa78d56000000b006765cb32558sm4292519pfe.139.2023.08.16.20.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:45:13 -0700 (PDT)
Date: Wed, 16 Aug 2023 20:45:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrea Righi <andrea.righi@canonical.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] rust: fix bindgen build error with fstrict-flex-arrays
Message-ID: <202308162043.3D267E19D2@keescook>
References: <20230815065346.131387-1-andrea.righi@canonical.com>
 <CANiq72kv4DwGLSGTwXYh3-b9h08Erd2RH7wXvVAUAEx2x+q_BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kv4DwGLSGTwXYh3-b9h08Erd2RH7wXvVAUAEx2x+q_BA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Aug 15, 2023 at 02:06:36PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 15, 2023 at 8:54 AM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") enabled
> > '-fstrict-flex-arrays=3' globally, but bindgen does not recognized this
> 
> It may be more accurate to say libclang here (bindgen forwards the options).
> 
> Also, df8fc4e934c1 did it so only conditionally (if the C compiler
> supports it). This explains what you are seeing: if I am right, you
> are compiling with a modern enough GCC, which enables the option, but
> with an old enough Clang.
> 
> > compiler option, triggering the following build error:
> >
> >  error: unknown argument: '-fstrict-flex-arrays=3', err: true
> 
> This should only be true with libclang < 16, since Clang 16
> implemented the option, right?
> 
> In fact, Clang 15 seems to work too -- it seems the compiler does not
> error if the option is not within [0,3] (unlike GCC).
> 
> Kees: this should only affect `__builtin_object_size` and not `sizeof`, right?

That's correct. It would affect __builtin_object_size,
__builtin_dynamic_object_size, and -fsantize=bounds instrumentation.

-- 
Kees Cook
