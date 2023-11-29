Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0qtm/rwq"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180BAB6
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Nov 2023 08:42:55 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5c941936f7fso8745877b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Nov 2023 08:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701276174; x=1701880974; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6FX0CURCIc5lUI0TKDm4VLrqOeB/l4oPqjqbRob5JI=;
        b=0qtm/rwqKLTmg0uBNQ9djLMO6ApmdUrjMGiRlrpLewmfrf3TZZUqhWrJ63TpMrYpLv
         8jk82dh0sU0R+h2DBJMDlKkm/SM+DpZh89w37LUl5HhqyE3BvBG/ycaq+yrRgpTqL6P9
         bdHrJd6+VWH5ykdRlJLW97xm5zDsRLPzhC5rC5Asz+KL8Yk79mVTC/cQ9wbw0tcBvUxP
         vqoINIY2SxecDWX5l2I/aV/TSmRcQidN2Ytvi9gWIKZntlFUvsKTP54kZXUjzNgZK8DB
         gXhKlJj0cSD7y3Z43c9DAesajp2xZkc9lX1I2qoqy42jOSE0Wg2JjKgiOyaw4hQLZdzx
         a8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701276174; x=1701880974;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6FX0CURCIc5lUI0TKDm4VLrqOeB/l4oPqjqbRob5JI=;
        b=clhqLdKnQaWUWRzsVwrRNQndOTSyqJpG/4A0IMVXzTrEFlQYV03erDLwx0jC6sPx8j
         8HoUFjNhyRMc0fmrVl6+UcjYkpLIkzw3Ry4elrP3mMXnD3AfUDWaNxVfVtKeSNikh8Zt
         VXLAYwm0LORBgs/dv48hqQwxZPp11ypditXvZySQFqfCY1TOXfS98cvjQF2jvjEyDnPk
         8CQXtO2nlzNs18xt7F+Pnb7+D3BDZ9XXacn2Y4Z2RKcjXYqAzVw/cL5lJW4E9fX4aylM
         jAJatS1+PY4IRa8/haNU/RPMqSgP12s1YlnfGLZ+yU8dIKXAPiIGmxGIh5ngkctpq4Ab
         EmJg==
X-Gm-Message-State: AOJu0Yy5pxWwEhQmi1VBO3E+JNMTQUeDM5pdSaDNajtihenwuRfbzpHY
	aHInM74m3vD+et1OsK1HC6kHFN3v9X9zH5g=
X-Google-Smtp-Source: AGHT+IG9EmNIc3OuwDA74YbdStAfXrBUfbJ95Q586QG4aQVL4yTAR1zwO9YqpQL6NoY8TPSZ1RUBLbuCg1uwCvE=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:2b82:b0:5cb:ed68:a256 with SMTP
 id en2-20020a05690c2b8200b005cbed68a256mr609870ywb.4.1701276174047; Wed, 29
 Nov 2023 08:42:54 -0800 (PST)
Date: Wed, 29 Nov 2023 16:42:51 +0000
In-Reply-To: <ZWdVEk4QjbpTfnbn@casper.infradead.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZWdVEk4QjbpTfnbn@casper.infradead.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231129164251.3475162-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/7] rust: file: add Rust abstraction for `struct file`
From: Alice Ryhl <aliceryhl@google.com>
To: willy@infradead.org
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, cmllamas@google.com, 
	dan.j.williams@intel.com, dxu@dxuuu.xyz, gary@garyguo.net, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, keescook@chromium.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, maco@android.com, 
	ojeda@kernel.org, peterz@infradead.org, rust-for-linux@vger.kernel.org, 
	surenb@google.com, tglx@linutronix.de, tkjos@android.com, 
	viro@zeniv.linux.org.uk, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Matthew Wilcox <willy@infradead.org>
> I haven't looked at how Rust-for-Linux handles errors yet, but it's
> disappointing to see that it doesn't do something like the PTR_ERR /
> ERR_PTR / IS_ERR C thing under the hood.

It would be cool to do that, but we haven't written the infrastructure
to do that yet. (Note that in this particular case, the C function also
returns the error as a null pointer.)

>> @@ -157,6 +158,12 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
>>  }
>>  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
>>  
>> +struct file *rust_helper_get_file(struct file *f)
>> +{
>> +	return get_file(f);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_get_file);
> 
> This is ridiculous.  A function call instead of doing the
> atomic_long_inc() in Rust?

I think there are two factors to consider here:

First, doing the atomic increment from Rust currently runs into the
memory model split between the C++ and LKMM memory models. It would be
like using the C11 atomic_fetch_add instead of the one that the Kernel
defines for LKMM using inline assembly. When I discussed this with Paul
McKenney, we were advised that its best to avoid mixing the memory
models.

Avoiding this would require that we replicate the inline assembly that C
uses to define its atomic operations on the Rust side. This is something
that I think should be done, but it hasn't been done yet.


Second, there's potentially an increased maintenance burden when C
methods are reimplemented in Rust. Any change to the implementation on
the C side would have to be reflected on the Rust side.

Alice
