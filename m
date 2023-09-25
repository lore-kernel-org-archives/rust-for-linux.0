Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B11C29C
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 15:04:30 +0000 (UTC)
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2E8101
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 08:04:29 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-9a681c3470fso520551866b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695654268; x=1696259068; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=STVyCq0Z9CufVRuINVHUuC/ypT8+q7NNtSadYInOtW4=;
        b=ctpBL/1MdXZGWRF2Kk2lWUh5PkmjgwLrz6aoBCJo/aQtWjR3+5nHZmhLZnh/bppn/w
         W3TXczLgW1ZUXih+uN+0DsMjmYMKNg0TkU1hgmEzlFepKoixlVo37tDcsb4B0aJqcO6V
         bZVJLkIEbbvfCk4tnx75ycaa8pyYtFcwRc0N0wPkUgA5Qa8Oj1QH8Fzd/AgwfU/I2alD
         lqAPQlkISJzKqeJ5iZUsEw+Yf7D+pAt2VQT4b4Y+mINZgTZuOHMLqcUn4wcMxfySawBN
         ijD2de6eU4LWTJNjrRA7VaKM75JW15aayjSzRREUxEpi/rCU4Mdz8PXAXiGrEwMH/L/5
         ts8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695654268; x=1696259068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STVyCq0Z9CufVRuINVHUuC/ypT8+q7NNtSadYInOtW4=;
        b=g3IN3cvQDTiG6C7AyybO1xdP1CnrcODbSvsA2OzcPPjsudlXiMiO3D+HFC9hie5nDN
         0jQiwpkofLHd6mjLr42inKlnLnmO7XkEYHhHIDOZ/wBPgeOv9iFgtClIx3QnspovyTxE
         QiyT8+s458Mn1qtJBNRZQVopUgKUNvHlCxUVf9ZlbiGCMTDWqz+RMTYaTub3l+B4pWMo
         YW2ZZVyYl7ifWCNWGD769FNrCWoPLO9J5Nxro7PLjQsi/RUrePHJeoxUkRFUS8EM4ZCW
         6FjwurLxpSHCMlIkJ5TFekqv0nSB74U8JPoV8ADkhw3S2htrtNmS6wo6ytLmFYMB0nfG
         /fHw==
X-Gm-Message-State: AOJu0Yy8hF9fw2t79i8TmrKVZ/1rqSC9+OsznEl9VwEibdObNJPD8ePR
	M1nLPG+pM+m3oVz2fu4MppU2cBK6zM3FD74=
X-Google-Smtp-Source: AGHT+IH7Na/bTQRJPh5OVjpPoU8+J4wtAuLH0qHTCMReqZ7k5fdQVXk3PGAPOoKxQk4F2zSDDAx/nTy11Ol/0YM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:3447:b0:9a9:dffb:4c6 with SMTP
 id ac7-20020a170907344700b009a9dffb04c6mr25326ejc.10.1695654268118; Mon, 25
 Sep 2023 08:04:28 -0700 (PDT)
Date: Mon, 25 Sep 2023 15:04:25 +0000
In-Reply-To: <969eab7f-ad40-0dfb-18b9-6002fc54e12b@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <969eab7f-ad40-0dfb-18b9-6002fc54e12b@proton.me>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230925150425.1963183-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 2/2] rust: arc: remove `ArcBorrow` in favour of `WithRef`
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, walmeida@microsoft.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

>> I'm concerned about this change, because an `&WithRef<T>` only has
>> immutable permissions for the allocation. No pointer derived from it
>> may be used to modify the value in the Arc, however, the drop
>> implementation of Arc will do exactly that. 
> 
> That is indeed a problem. We could put the value in an `UnsafeCell`, but
> that would lose us niche optimizations and probably also other optimizations.

This is an option. Niche optimizations don't matter for `WithRef` since
it's never directly wrapped with `Option`.

> > It also means that we
> > can't convert an Arc with refcount 1 into a UniqueArc.
> 
> I think you still can, since to do that you would consume the `Arc<T>` by
> value, thus guaranteeing that no references (and thus no `&WithRef<T>`) exist.
> So I think this would still be fine.

The problem is that if you have an `&WithRef<T>` and use that to create
an `Arc<T>`, then the raw pointer in the `Arc<T>` was created from an
immutable reference, so the same restrictions apply to that `Arc<T>`.
And if you convert it into an `UniqueArc<T>`, then the same restrictions
also apply to the `UniqueArc<T>` because it's raw pointer was derived
from the immutable reference.

Alice

