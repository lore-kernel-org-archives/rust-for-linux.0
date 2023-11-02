Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271813AC8
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Nov 2023 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FOkZBx+C"
Received: from mail-lf1-x149.google.com (mail-lf1-x149.google.com [IPv6:2a00:1450:4864:20::149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262D7185
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Nov 2023 03:28:02 -0700 (PDT)
Received: by mail-lf1-x149.google.com with SMTP id 2adb3069b0e04-507a3ae32b2so616957e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Nov 2023 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698920879; x=1699525679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXavQptMw6imFSgFZcFRvrc2OMV1znfpMMkkj7fkIKk=;
        b=FOkZBx+C2qi/t0GD/KP7bWExSKxshg/5oHG0cDINFGQLPBUlixLIkXQLpbXkZph5ai
         KS1/BdPhNp6JP7WrhBwGFb1WMN0X3I/uOBYkdPdfY7o9rLORBNbRd3NvkdkTWLD5MT7+
         w7X13pp36nsUF9IV90WB2imEdtJBFxxyLq5/OalSQoooCz34uvnOIU4drWe5GnzoBa/P
         XTMKBHBUsjB36Fz3Bc9WOZjURtShLaquqTMn/MYmPCrtbDSLJwcHKXYGBW1nnPOSUbGB
         4vH8kZFZaIHJSJme0S8ahzl8rL8gEZX3EHI6t95L3ulhP4bHGw+sTbFTAEOuZTewXz5R
         /c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698920879; x=1699525679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXavQptMw6imFSgFZcFRvrc2OMV1znfpMMkkj7fkIKk=;
        b=evEDCqbNrR7cHxxg6sUfKm5gzO6Kc9hlqzbYWzRtG8KBnlSvqjFgDH4ETHcSidyVqA
         t/PY60Us81VwzvJbm7mjFKsAhrU7M5NlCli/R5TfkJ07cm3/YVXrIjcsO7SKW9ZdnF5I
         OPqPMwZBkvMc7uBEWltsmtXmXVAOAJ93AvORsRDlwX5+HfG58hx6NYxw5y38pTXFCqkY
         zl+7pd0JK8mkaJimmxX6ljdvqHX49ekguk/16HhagFfUzJOTVluYk3tmDmZzgQ9FuGpt
         BVkeV/d1tGxcO+HCHFb5oanMAfk8rps6gj9rA/m7rSjTLwHp8z3pu/PNFxOfluNa8i8c
         YAeA==
X-Gm-Message-State: AOJu0Yw++MgHWf86fMHrp81VLZFcrdcztcL/pS04fjlorCXTf1CYnQzv
	lTWywC2O44sMM1uQueiomYe4Tjb2KHgO0/s=
X-Google-Smtp-Source: AGHT+IFiCgId1VdigJnT4JYPj0yD3/qeTRKlBVdkklmQdqscFfveqmw6VO4OE5YmlaoSadV0PxM7U6CTTytWEYA=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:368f:b0:509:4956:515f with SMTP
 id d15-20020a056512368f00b005094956515fmr10148lfs.8.1698920879312; Thu, 02
 Nov 2023 03:27:59 -0700 (PDT)
Date: Thu,  2 Nov 2023 10:27:56 +0000
In-Reply-To: <ZUKYKw8QlPguQEBM@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZUKYKw8QlPguQEBM@boqun-archlinux>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231102102756.909978-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 01/20] rust_binder: define a Rust binder driver
From: Alice Ryhl <aliceryhl@google.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, jeffv@google.com, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, mattgilbride@google.com, 
	mmaurer@google.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tkjos@android.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Boqun Feng <boqun.feng@gmail.com> writes:
>> +#include <uapi/linux/android/binder.h>
>
> I wonder whether we could (and should) move this into
> rust/uapi/uapi_helpers.h

Sure. That was introduced after I wrote this part, but I'm happy to move
it if you think it would make sense.

Alice

