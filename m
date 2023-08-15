Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF6CA5B
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 12:44:17 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30254172A
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 05:44:15 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C09603F128
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692103453;
	bh=aKXkgUDnJHg2N5PCGlfRG9EGkT+Cy8Mp+msAUINj40A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=B+S7i8DYXGwb6+iW/46a1mzPMQWhwfXjd+y9MfDphNdOkbM3UWXRVVWO9NVVh7nsE
	 Cs2h4w1lFR1UxwoE3N9yC8tcKGWVGFL8qyXpDJO/TuxWa3cERLgOFRxJz4ZXITbPa0
	 rQahQ/hiJXOci+X1IkJP08ySoPmtP6fXy2w0Bsx87GCSReFFfe558nVBTcpUtFT8v6
	 kkDML26CcjdhPc6UdjR+utVAke2dKg8Zlb39p4H6EYALN/6ZI1bPhfVA72ZXGcs6Q9
	 RbratRxPYsa63wBEMFdvBn0/GXHis1MHxoC85EHx8ZWK+B+wRFx0Mea8iMSS9M+WzP
	 dM8Yg7SRyDodA==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5218b9647a8so3244415a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 05:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692103453; x=1692708253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKXkgUDnJHg2N5PCGlfRG9EGkT+Cy8Mp+msAUINj40A=;
        b=Mr5eDX4Rt3MiQylMYxG/LVnHppJt7Giqiu95xYStQcqigEDOcThxMvy5zrQY4PglUE
         MepaYH0vPjbSLPAAQbbI4ZruxArShANyVkH78o7fH1IEDB8mYRvcJ6zD0bkuz98JfS18
         ZDHUD6Om4Z38LmmISfgxVxC5cZce4t8AEM592pi8RR0XEtJfxf5KBDFxPt7NmICIuMvR
         wARiDhGFGt8uyA2d4VjnvFBbHAL9y40drOJVdkCB2v/vkVjS94LeszDmf4sRhYnW0uyP
         rlPpNjXFlLgvkggfO7njxcZnBxMcmCLf0LXJXClAQjioQO6RyQgkgdfxYDXspNsE+ha6
         AoEQ==
X-Gm-Message-State: AOJu0YxIjzonX8NaO0voWjqNERyXVA5lLmMidSWoMJc/ec/p+5wX4sA/
	lgA72VHJFzBcUmot6/FJHIMojqAUg+dSA/Vy1vGPvNMMLhOtYTJUAqFyzNaZbGvULt7MWskUorS
	SiKpSuU2BNDxunOSLEmTik27Y+My5lBR1CsUy45qnbxln
X-Received: by 2002:aa7:c417:0:b0:523:37ff:1170 with SMTP id j23-20020aa7c417000000b0052337ff1170mr9409102edq.16.1692103453509;
        Tue, 15 Aug 2023 05:44:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs/E8V2NDX2XcJZXAbneao9RjH0N0K37FNbOeFzjvaaz6pGskl/cJoC5Rjc2K/AfZKmz/mkw==
X-Received: by 2002:aa7:c417:0:b0:523:37ff:1170 with SMTP id j23-20020aa7c417000000b0052337ff1170mr9409084edq.16.1692103453179;
        Tue, 15 Aug 2023 05:44:13 -0700 (PDT)
Received: from localhost (host-79-33-195-131.retail.telecomitalia.it. [79.33.195.131])
        by smtp.gmail.com with ESMTPSA id z11-20020aa7d40b000000b00525683f9b2fsm2320484edq.5.2023.08.15.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 05:44:12 -0700 (PDT)
Date: Tue, 15 Aug 2023 14:44:11 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] rust: fix bindgen build error with fstrict-flex-arrays
Message-ID: <ZNtzG3Yy1US+dpP4@righiandr-XPS-13-7390>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
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

Oh yes, indeed! I'm using clang/libclang-14 with gcc-13, if I switch to
clang-15 everything seems fine, so I can simply move to this version.

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

The combo gcc-13 + libclang-15 seems to work in my case, instead with
libclang-16 I get this:

  BINDGEN rust/bindings/bindings_generated.rs
  thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at__/_/include/linux/compiler_types_h_146_2)" is not a valid Ident', /build/rust-bindgen-0.56-DgAMvF/rust-bindgen-0.56-0.56.0/debian/vendor/proc-macro2-1.0.24/src/fallback.rs:693:9

Thanks,
-Andrea
