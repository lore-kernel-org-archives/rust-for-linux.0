Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FB3D535
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 06:47:57 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DCAFB
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 23:47:55 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d848694462aso8629340276.3
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 23:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695624475; x=1696229275; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbg+E0NYXEcXRGtxVstOSVNUqSFbGBD8y2V9G/GxBg8=;
        b=HYMYgOxfI72LA1Mh/YO58/8J7ykFd1kPeaS6pP2tljbsX673ZhUpfpTVxq86VNkywB
         ELHoWpnXTPdQ71Su9rjI4fsemm3IiFXQjnP6K9zxJo/hjJyWHNT/tXwbKskIMG349PRc
         eumGmkfBt9pEOO5nrHbgSeJY3gdXxkA30rKKEjmobP0b6zPZoxOWXYJEGjwsDXZtD/Bf
         9vhzWPum1SxOdCcpDO9ELYUDQ7IpNS8yGgk8ksmM87b9X5jS1t3hcPOxZAfjq4UMiVhY
         UydjtXaJ1PSV66esUguDfOmjlZ72gNdgko649fnWyylnJbDq6dAPnBiFCh2XRyu+7UTQ
         DQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695624475; x=1696229275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbg+E0NYXEcXRGtxVstOSVNUqSFbGBD8y2V9G/GxBg8=;
        b=nxASRJfVYI76IN+FlUAr0UeCnKfXrwXVEk29O/aONVHVsl/uBxTkVJR2AkhAvVbsrm
         e4aGE7Es/5QGkZcczfc+1k6EWa5dQELie3BXFiQ4ttESCtAoJYAKJeRnRD1+ErZm7dfE
         2wAcJ1ZEu5JZMaR1Wk6atRJ31K+HtUZBP9Lv2vtvk+SMj+/WvW9BHlxYiUgnRpUe6Va2
         SqLbHClGpig0YKkFHA8GRS5i9vgszR0KGpCrIA5SWi0NYpjRjBfqn6/buIoWAbxurcxg
         AwrWIAx21KeeHQ+5RtisJN+zh0mHS5qeQT3k48JAlyZEWkyP2B/zlldaKIHaZUdc7MPD
         oHBw==
X-Gm-Message-State: AOJu0YzdnlwvVgjF5u/lEQ53uySqcXV5XRCzoNw6fH5vnGJUWVcP5YBE
	XsG2APWLclmytOhGQW9MaAIrtKwKAhNPatM=
X-Google-Smtp-Source: AGHT+IEmdFVEw+xdPVFzpL4eSJ2Gv2xxiAPXBLawHQKj0iF8n9o2qxDNvZ5JiipH/NYC0TpWSThRMu+kQqIEy8I=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1603:b0:d81:582b:4661 with SMTP
 id bw3-20020a056902160300b00d81582b4661mr54875ybb.8.1695624474945; Sun, 24
 Sep 2023 23:47:54 -0700 (PDT)
Date: Mon, 25 Sep 2023 06:47:51 +0000
In-Reply-To: <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230925064752.1867093-1-aliceryhl@google.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
From: Alice Ryhl <aliceryhl@google.com>
To: wedsonaf@gmail.com
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Wedson Almeida Filho <wedsonaf@gmail.com> writes:
>> +/// Wraps the kernel's `struct phy_device`.
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::phy_device>);
>> +
>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> +    /// may read or write to the `phy_device` object.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> 
> Does this function need to be public? Can it be `pub(crate)`?

I would generally prefer that we keep these methods as "pub". Otherwise,
drivers may need to make a bunch of changes of the form `pub(crate)` to
`pub`, which I think causes unnecessary noise.

Alice
