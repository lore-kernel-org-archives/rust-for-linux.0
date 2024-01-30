Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384DD58229
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606981; cv=none; b=QrjSfoQDhVm/OgzO1hsD62MsYibCXy3kRThhL1oMdG3G1+R6SQ2deRPogCm5Ve9J5XCt2iDHnXIELTDeVfF1f1ZpYQbOVNYX7BS4TyONfA0Bth2qAPkyNNGmyIbf41Yg8/xsBm2U/ptrr3i9cVLoaQHSp6pVnCP2SkMQQFzA4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606981; c=relaxed/simple;
	bh=huiu7FiS6Ka98PX9AGRHOYZr8LDkTZM/ajgwBoH9zqA=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=P4BTzyz2RBZhlqlFAyPzFp2Gef2KVafCH5OXnldpt4DKPOHBFD2CkLrqVcEn8tu2QfsN6DE3/Js5yJcZVH16zG9oIgfqayCcwBICHHzcXv5gcIzbtYCMEhebDzsbIERd9RgycNE+Nm5QBbe3bjqhlFD/PGUnbLzSIrRv6JcesY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=xO1x1Kok; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="xO1x1Kok"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a90a0a1a1so3406198a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1706606977; x=1707211777; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=9tz7+Pj2sphUK5zlEcIBtuji5ko1j4GrxA9tCxYfuyg=;
        b=xO1x1KokQyiG7e4TC25rR+enVqZFtk4ZLafdQotlTlU/iZcZjwqX0BB1QTpjVPJ75N
         0KueI3E3HKsBmk8EcjSp7kfRkn0s2vfl5Vj1xdeQtIqTjBlxjImM86Hy2qOaA+vmAfaP
         4bAkmbXqG1Jd39+TFTC302o3fJrA3VxHnVk6wDDYk0oSpxrXPB8I9xxlfQ7tQKL81H+D
         uz6SMI9b+9SvR1uGtNu3uU78IDpVK4qeGB0Fi5B+7J5yyqViLUVaiCD3ZJqj7TX2hWd7
         B/ycUcfQtH6datBvdg6TMNatmYBcoXG3DDvmGoyUUPC7w/ONkUE1ZHyBL9Tmz64ouhYW
         QFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606977; x=1707211777;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tz7+Pj2sphUK5zlEcIBtuji5ko1j4GrxA9tCxYfuyg=;
        b=C7ZcdbjkWPBp94kU1bRdvNzHrNUcVEWl+ZCDV4GYdm7YzSS86+gp4eUlKPvUBqMW0W
         tGvhXDMMkUPmdS2Bmf0Cosr5/ZCSG0Bk7wYtcI83GQQCSR5cfxUNdJcyF8dd6oSCUdpw
         ByGJ3hMZkSe5vzbodGJM+2dOTx4e7DmtpDGHA8qsIY4LpNoTNFW3SEVBpEOi0IkPFrc7
         WaI/CH0S/9EZrUqyDR3qhHw9KWpP8cNR+BHtRguxNdGOn4xDZ6/HQiVwTf4KuBbzU+X9
         xfdRsBMnKAHgQg2G3cp3MywQlZZjfQjCyA0Tyq3Oa5lBZj6IPJFgwES3pg/AtrjuSJ40
         yRxw==
X-Gm-Message-State: AOJu0YzY3MqfuNluuFlZ0z+q1Sysx5iAwOnbldBaX/HyZR/jSDhXtQi9
	DPQjgpndNjiem5gz8FFS0JipicH5i29zO4M0GI+/3Ehg2BRIkaza9tsL6PN76gw=
X-Google-Smtp-Source: AGHT+IGxPhyxEY7oiLslsel5OsK965iXiA1cfRttHEQb5I5451oB7+uVOkgXsRheMgrVk0aWgZ2K6A==
X-Received: by 2002:aa7:da84:0:b0:55f:3cb:d02e with SMTP id q4-20020aa7da84000000b0055f03cbd02emr3451599eds.16.1706606976900;
        Tue, 30 Jan 2024 01:29:36 -0800 (PST)
Received: from localhost ([194.62.217.3])
        by smtp.gmail.com with ESMTPSA id n17-20020a05640205d100b0055f05342a41sm1802687edx.44.2024.01.30.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:29:36 -0800 (PST)
References: <20240124-alice-mm-v1-0-d1abcec83c44@google.com>
 <20240124-alice-mm-v1-3-d1abcec83c44@google.com>
 <ZbMA1yiM6Bqv9Sqg@boqun-archlinux>
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Kees Cook <keescook@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton
 <akpm@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=
 <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH 3/3] rust: add abstraction for `struct page`
Date: Tue, 30 Jan 2024 10:15:11 +0100
In-reply-to: <ZbMA1yiM6Bqv9Sqg@boqun-archlinux>
Message-ID: <87il3bgoee.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Boqun Feng <boqun.feng@gmail.com> writes:

> On Wed, Jan 24, 2024 at 11:20:23AM +0000, Alice Ryhl wrote:

>> +
>> +    /// Maps the page and writes into it from the given buffer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must ensure that `src` is valid for reading `len` bytes.
>> +    pub unsafe fn write(&self, src: *const u8, offset: usize, len: usize) -> Result {
>
> Use a slice like type as `src` maybe? Then the function can be safe:
>
> 	pub fn write<S: AsRef<[u8]>>(&self, src: S, offset: usize) -> Result
>
> Besides, since `Page` impl `Sync`, shouldn't this `write` and the
> `fill_zero` be a `&mut self` function? Or make them both `unsafe`
> because of potential race and add some safety requirement?

We can add a safe version that takes a slice later, as here [1]. Same
for the with_* that take a closure.

It would be nice to model ownership of pages that are only mapped in
kernel with `&mut`.

BR Andreas

[1] https://github.com/metaspace/linux/blob/702026e6645193fc89b7d55e00dac75fd492bfb8/rust/kernel/pages.rs#L178
