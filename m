Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE1847F
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 11:43:02 +0000 (UTC)
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407B5BA
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 04:43:00 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-94a34a0b75eso370752466b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 04:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695123778; x=1695728578; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VORsIBA6ERRbmXg4ay2hLf4pQdtqXphfyyZQk55vs4k=;
        b=rfDfqe4PSe/mOmjg4Caf2BppgxFb/tZMc/w1J1lqV/8s3H+cA9asu8YydNCKJ4Zdw6
         gmLKcVqrJ9h96JopiIV15u8I/HmS5KCD0GMIzrZXkDiCInrN7B39IjIKOrTEkmX9D5os
         YwliKF3vbohJrRU4JnytcL6UAuqqXCtbg29Dw2XOXxOmydWDjg8vT8b/grF1/R8cir70
         j0biUsZt4pgQs9Q9lnwsJN5GXFwD9e5YZgg/huMp9fTJ8Nsqm9vfigeEeywDCdtiOfUx
         pf4ZIFaEUYerMtjHh/8mURxFUUiCBlsAmX7ZC7/+Dyhru5mEIiq7V3g4OmcYuezRF4/p
         6LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695123778; x=1695728578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VORsIBA6ERRbmXg4ay2hLf4pQdtqXphfyyZQk55vs4k=;
        b=ippDoF+rZsosvfqakdIwnKuO5F0LNfO1eNpa9znuL2q7FXu+Wq1Xv/VDqqJUMjBTrg
         0wVVB5kwuS6VFBqMWnnuGuMNF4/O1UWtAmbncRGSkEp0b8H6verwWcESFPpDlM1A6+rY
         QyqCq4ELWJVskzMVPmathpFPS/Mu3W8KyGNRDP6DJ5Ko00BLuHl30GlKPXvuOpaeb5WM
         lKh6hoTw/uVmBs9qEsO9vMkkBl6VVH5wII+uNhPTHiIZJ7Q35XKcdrMcxiPos5PQzmwl
         4A1y/acgGf4ABvpOkIv4vderP4l9r7F9Zb2qJJYyay3u3B8BazDn/U7vAtFIFi1C/whh
         LEDA==
X-Gm-Message-State: AOJu0Yx254/FH1Ecj1N7mbs64dx1xOus6e1e/7TTruZKA2vCOoa2vZhl
	eoBlBfsqbVt0pdF5sBMHNlbJjTq/LyijBAY=
X-Google-Smtp-Source: AGHT+IEm+YxUcPeYB6Kt0dFMWqeKuHXC1RLS5dyaoZp1XOTdcVigyiCFLfUEyWumENUYPxJA5D9W21fVdaOc8/c=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:1595:b0:9a6:6c56:c3df with SMTP
 id cf21-20020a170907159500b009a66c56c3dfmr77664ejc.6.1695123778692; Tue, 19
 Sep 2023 04:42:58 -0700 (PDT)
Date: Tue, 19 Sep 2023 11:42:56 +0000
In-Reply-To: <20230906204857.85619-1-manmshuk@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230906204857.85619-1-manmshuk@gmail.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919114256.333055-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: error: Markdown style nit
From: Alice Ryhl <aliceryhl@google.com>
To: manmshuk@gmail.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> This patch fixes a trivial markdown style nit in the `SAFETY` comment.
> 
> Signed-off-by: Manmohan Shukla <manmshuk@gmail.com>
> ---
>  rust/kernel/error.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 05fcab6abfe6..6233021daa8a 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -133,7 +133,7 @@ pub fn to_errno(self) -> core::ffi::c_int {
>      /// Returns the error encoded as a pointer.
>      #[allow(dead_code)]
>      pub(crate) fn to_ptr<T>(self) -> *mut T {
> -        // SAFETY: self.0 is a valid error due to its invariant.
> +        // SAFETY: `self.0` is a valid error due to its invariant.
>          unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
>      }
>  
> -- 
> 2.34.1
 
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

