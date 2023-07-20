Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A7199EC
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 13:25:47 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C95CE60
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:25:46 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d00a63fcdefso85271276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689859545; x=1690464345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LA27fVNYB1otp+ClEEEzqSk28q42Bg4PAc0mA5TaGlo=;
        b=52vDWbc5PpSlNPdhrV8abc74QuK4CTY94pbrnKg5SIK70W5MFiAlFBeC4hZny7JA1m
         HZnDo22ZBKAA3EgnTp/qprqTcC+PkUP+dHN22mZ/hlDh2EqLxflfRka32OAhOeA7B4BW
         gdfLNjfBFOY96pVwigY+G2FJWIx8KfWeZHtV4l6HrJGhPjYyLvOSZz0d8ehJEQp5HJIG
         WK4/sKKKTCOl/6Cn6eeqK/0aJtNwiCLm9QMtZOuTX2nZ9TSIomx3kC5JjPWFz6UQCNwa
         NkCJTurFAkMOrZtg+5+qeuAno2hwUzZpIMawITKCbhN+3/cHnBzmEG1NDGiAK00k3/oP
         MkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689859545; x=1690464345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LA27fVNYB1otp+ClEEEzqSk28q42Bg4PAc0mA5TaGlo=;
        b=V/7Qq71Wnh6mwGHioIvhW4b8P3uqCsDjn5ClznhQXZ43q5qf5t7ZQeS82AqJfsjRwr
         D8fg0s9RI/K87X40BIKizU1N6hhUuDjsEs23NN1PmzpJxTZED9G/VLmZRFDV5ueXSmLW
         raNEzSjFk7UFNqzB4bI6HeVemTt3BsqGOkIbKbW0xMZqM0PeSh19bACe6MFxEmN+5M+d
         +mXsg7zuz94B0SjdnQaNarc6kzxNhrrq8GlscZBPMfyIt7UuXOZEQ88X96sZKbPTT4fs
         KpNpKVerPuc0eHjngswdkfZ/czrqZLSgtULzWRSPWm1EWSYYuH3aC63r5I1BwdoXV+xY
         /wiw==
X-Gm-Message-State: ABy/qLYpECjpItUbmX3/od2GSeJd0dWAUcgWj5GZBqmtyGpWG2tGxHTl
	+151AwCvpmZ//4LGmeTu1YJO1iRT4Ui0u0w=
X-Google-Smtp-Source: APBJJlGbY3qEHV7ytj10aJNNjV4xWS/XBRDNCjDDMZcLJZfplc8pNfhTRMF5vbZbB+8NWCR+DjnlSnCM+yUs6X8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:e616:0:b0:c1c:df23:44ee with SMTP id
 d22-20020a25e616000000b00c1cdf2344eemr47997ybh.0.1689859545678; Thu, 20 Jul
 2023 06:25:45 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:25:40 +0000
In-Reply-To: <20230719141918.543938-7-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20230719141918.543938-7-benno.lossin@proton.me>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720132540.3543838-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 06/12] rust: init: add `..Zeroable::zeroed()` syntax
 for zeroing all missing fields
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, lina@asahilina.net, 
	linux-kernel@vger.kernel.org, nmi@metaspace.dk, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Benno Lossin <benno.lossin@proton.me> writes:
> Add the struct update syntax to the init macros, but only for
> `..Zeroable::zeroed()`. Adding this at the end of the struct initializer
> allows one to omit fields from the initializer, these fields will be
> initialized with 0x00 set to every byte. Only types that implement the
> `Zeroable` trait can utilize this.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    (make_initializer:
> +        @slot($slot:ident),
> +        @type_name($t:ident),
> +        @munch_fields(..Zeroable::zeroed() $(,)?),
> +        @acc($($acc:tt)*),
> +    ) => {
> +        // Endpoint, nothing more to munch, create the initializer. Since the users specified
> +        // `..Zeroable::zeroed()`, the slot will already have been zeroed and all field that have
> +        // not been overwritten are thus zero and initialized. We still check that all fields are
> +        // actually accessible by using the struct update syntax ourselves.
> +        // Since we are in the `if false` branch, this will never get executed. We abuse `slot` to
> +        // get the correct type inference here:

Didn't you just change it to a closure rather than an `if else`?

Regardless, I'm happy with this change.

Alice

