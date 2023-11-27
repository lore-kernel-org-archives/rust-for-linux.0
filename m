Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFfnfveD"
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA63111
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 09:48:25 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-db4050e68f3so4189335276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 09:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701107304; x=1701712104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IS9bu0Mw/sgGzCSI4Pk7EVpk7Se2HXdg2VZjpWBvWUQ=;
        b=fFfnfveD/k4eqrKxaMsgz95uWkAYqiXsYE2Rf0MN3E6VRb0CIbai3joeWENK6Z5seK
         9pwl9auxU3Sdb/7WtdvRpkaB+RAhf/PUgSPeSAOPDuqgzc55pUQL7g6tBjReZiskBP4V
         jdiPCzVhsJPqZi8PfRjtaZf+xqJcoMVCIFKqD7ccSq9kyDTK9sIgSRhRCDuTCep400Vf
         VrLDNQWYI22taEBcpoc0EGB3uK1k17+wqsqnQOmqMm92z4dQCAcfRFbTUrR5aSiA1qhr
         3VLLskG80k7i1x7ShAPSRw3odj4EbGY4fy93AJyWz/Ze5dMLmTJi6MoP71OqZwrc0sUD
         WQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701107304; x=1701712104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS9bu0Mw/sgGzCSI4Pk7EVpk7Se2HXdg2VZjpWBvWUQ=;
        b=cN1rij1lBzYTIU48KzytM+jkAuXcz4jmi5OrV2aXoRUCszclvX0Tz8Lffrz1QgcwD7
         fE1e7st58eeUUgAxGq1ppZONpCasDbSPeB9vO634pOakmGj6ogh1yFPplJLtNlTC0VeU
         SZSY58J1IRWeZmqg+RR5A26h27NL/1+Al1IPJbo02OsMCbDqb5AOHxT26/kfib6OdtA6
         QTcGxt6aUsENWIiJLS17hzjkdXmCKDNXKmdwNLsHQI48Ljak2/OKDHlvoYHiOoB7N4ez
         41vaB/QL5LWNPGaueAr2Tj/tFvK//2eOi2fDBMiHXKXoTMa6SyOshNNnSzyPKBAwF+Hw
         bqOg==
X-Gm-Message-State: AOJu0YybX1xAtmAmvjgH0o0Ue6JgOnx6WhLPGL1bG0In/lZdssH/rdxI
	e9KykdT/PyLk2UJx5xfwRnU=
X-Google-Smtp-Source: AGHT+IHQdkfIE5rdVmU6KFvR76yppI5TbLqcMCtb0yI/p8Fw+H+jxsYQqYZRURmERB5Ot9w+rR51iA==
X-Received: by 2002:a25:cf53:0:b0:da0:4dfc:57d5 with SMTP id f80-20020a25cf53000000b00da04dfc57d5mr10847393ybg.9.1701107304433;
        Mon, 27 Nov 2023 09:48:24 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621421af00b0067a4452d459sm1234140qvc.116.2023.11.27.09.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:48:24 -0800 (PST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailauth.nyi.internal (Postfix) with ESMTP id D0B8E27C005B;
	Mon, 27 Nov 2023 12:48:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 27 Nov 2023 12:48:23 -0500
X-ME-Sender: <xms:ZtZkZfV20u_UvtSQxvA87ULE7v1WYyNJ1G65i4QZobaprWQCAv-J0g>
    <xme:ZtZkZXngTpt03wnyITp7JGaJeiBVR4CfMJNMGXaF2ENtFljmTWRkSxJLwTNPPyNJU
    0yLBXdvKQh95kZCQQ>
X-ME-Received: <xmr:ZtZkZbahLtOK_2WR4R_nzdkcfo4Zcaf38A75gc9rXpl3feTU5ZLjL65SJfk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepueho
    qhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtf
    frrghtthgvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeev
    ueffieehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeeh
    tdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmse
    hfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:ZtZkZaXKz_yoC9cn5Z_RTFJcGmGGmgrrDAfJBsaSg355h8q0s4eD8A>
    <xmx:ZtZkZZlK6XZmqL8bL4wopnjlctGY0emtB4lUst8F_TV9ZN34-C4LBQ>
    <xmx:ZtZkZXfVTC5t_dY7ZbyGZDGbkbMUvjll8hSK7RV2qOZOY7FMhhvAGw>
    <xmx:Z9ZkZc-NxywXMqh1NOfVGWdqqfbROtMqHIDyNTVe0ULtEt_SfKrDtw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 12:48:21 -0500 (EST)
Date: Mon, 27 Nov 2023 09:47:42 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4] rust: xarray: Add an abstraction for XArray
Message-ID: <ZWTWPgvPizjTH95C@boqun-archlinux>
References: <20231126131210.1384490-1-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231126131210.1384490-1-mcanal@igalia.com>

On Sun, Nov 26, 2023 at 10:01:40AM -0300, Maíra Canal wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> The XArray is an abstract data type which behaves like a very large
> array of pointers. Add a Rust abstraction for this data type.
> 
> The initial implementation uses explicit locking on get operations and
> returns a guard which blocks mutation, ensuring that the referenced
> object remains alive. To avoid excessive serialization, users are
> expected to use an inner type that can be efficiently cloned (such as
> Arc<T>), and eagerly clone and drop the guard to unblock other users
> after a lookup.
> 
> Future variants may support using RCU instead to avoid mutex locking.
> 
> This abstraction also introduces a reservation mechanism, which can be
> used by alloc-capable XArrays to reserve a free slot without immediately
> filling it, and then do so at a later time. If the reservation is
> dropped without being filled, the slot is freed again for other users,
> which eliminates the need for explicit cleanup code.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> 
> This abstraction is part of the set of dependencies I need to upstream
> rustgem, a virtual GEM provider driver in the DRM [1]. Also, this
> abstraction will be useful for the upstreaming process of the drm/asahi
> driver.
> 
> This patch was authored by Asahi Lina and I rebased on top of rust-next,
> fixing small conflicts. I'll try to take care of possible iterations
> that this patch might have and I'll try to address the feedback.
> 

Thank you! Among anything else, since we now have the ability to convert
a Rust code example in doc to actual tests, do you mind add a few
```rust ``` blocks in the comments of the functions to 1) demonstrate
the usage and 2) serve as unit tests. Below is the command I run for
testing:

	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y	

Regards,
Boqun

> Best Regards,
> - Maíra
> 
[...]
