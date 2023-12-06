Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdBWe4uG"
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFA010D9;
	Wed,  6 Dec 2023 08:30:11 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-423a9cb7e80so6388221cf.3;
        Wed, 06 Dec 2023 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701880211; x=1702485011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfrENQZMpwmFIEWGgMUijz+SvZACHv6cKia/JgD/FyM=;
        b=PdBWe4uGqYJDFPPWGzTsbex9z73JsarQvA0hWVayhIyXmyJYNUec6/bRsU2yL5uUsF
         Z4tPClxgK3k3EV/8tXf3UWiUJggn0ByS3+0A6i5msgNKowkqHqiZyRTPCRrfxdnIiCJJ
         o9ACwSlQ0ToOlwbn+Glg4lqvl7fGBgYV+LczDeTK2td8D+fhM9ggh5L3ZfwUwsRJjL2c
         SJS+0QLcYBQYX+N9WpdGGLDyH9cT1E6nlgd/wIGxEvUIJ70Zyq3HZ8UgnMApDIRC2E7Z
         Ey4zHtVbHPA9yYigwBDqaQwExNn5eLkBC7sgk00LutK8cvKr+igs1ZLL30LjH1bofGHq
         Is8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701880211; x=1702485011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfrENQZMpwmFIEWGgMUijz+SvZACHv6cKia/JgD/FyM=;
        b=Mf/cYDREhsivOv2xdZ6NweoW4P8k1nMwYhV+DQvBUZY0KAC5NOshy/d1vX4S8tF7Pn
         R/l99Sf89X/KfWVcKUWSGTdzD3h8EHF+1+pIoJorSfG5W4djdP4lfqTIu33Wq0v5M8XO
         0p1sIG2pOqnLE+p0RkTdXgXF2ZRLTY4sRU1sYFiLpPTZn/dJA/Sk8/Qx7HkJdSJKHjkU
         g6tU9KitN1Wg720tnCdaJ8Obd6EzmgjHXMvVB9GHPMnzLs4gnweUmnPxkwB9h4YILuLX
         1Kb4/qNgYWmd11CkhFCZ406zcuDf1l9UFyVUsGAO9OBwNoaB8rNfWUtR27DsdpYf1tzQ
         mpxQ==
X-Gm-Message-State: AOJu0YxGQDrGLtxSyNLTbLMK/SSpnu2Mxda+HAWvWgY+oD1MOcbfAQCl
	0WhGFGwGzzOBvevhXs2lg9of/Gdy41o=
X-Google-Smtp-Source: AGHT+IG9akcGZ+NRYuBK7tCRhwZnVAduTeen+wKUSfU3T1gqeaJ3NtdTsRjLVKBy6GLeBflGbEnHxw==
X-Received: by 2002:ac8:7d41:0:b0:425:4043:41da with SMTP id h1-20020ac87d41000000b00425404341damr1511637qtb.134.1701880210955;
        Wed, 06 Dec 2023 08:30:10 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id f23-20020ac84997000000b00423e8909bfesm73439qtq.6.2023.12.06.08.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:30:10 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0422C27C005B;
	Wed,  6 Dec 2023 11:30:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 06 Dec 2023 11:30:10 -0500
X-ME-Sender: <xms:kKFwZUvuPe7UQE7z6sImT1H5mPofHiohr3t8AE3yfGHQH7xNguU8Yg>
    <xme:kKFwZRf0jxOCbvj0W1HxA8APxJ7yhMSXRyNMwq8jvxbcHFLXnSEJuRswl_JlGCVuz
    Ws2fUq_WD-kbN-FDw>
X-ME-Received: <xmr:kKFwZfzvK5h1PW9L7m27J1yqweG-LJ7Qky5Y18l2DehjoqWjQONPmC6zcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudektddgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:kKFwZXMChU3QZTD_aq9QMETqHeksojHy43k2Lxl6N9krG1OSX_ch7Q>
    <xmx:kKFwZU8hHbohK0mc9icfw1PnycnAfi4wVAPafpaf86V9TlG3d6JFfg>
    <xmx:kKFwZfXEDiIZkf4UYbTvQqdZ2vAKtn4fgC72LMGbUEwUcv2cV7Z0ag>
    <xmx:kqFwZecEalNgpi0bH0Vm3G5KX2LDx1QIan1mtAH4T8FdKxvISc9reg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Dec 2023 11:30:08 -0500 (EST)
Date: Wed, 6 Dec 2023 08:30:06 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
Message-ID: <ZXChjmoKPj3XnJgG@Boquns-Mac-mini.home>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com>
 <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com>

On Wed, Dec 06, 2023 at 10:09:24AM +0000, Alice Ryhl wrote:
[...]
> +
> +/// The return type of `wait_timeout`.
> +pub enum CondVarTimeoutResult {
> +    /// The timeout was reached.
> +    Timeout,
> +    /// Somebody woke us up.
> +    Woken {
> +        /// Remaining sleep duration.
> +        jiffies: u64,

I have a Jiffies definition in the my upcoming timer patchset:

/// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
pub type Jiffies = core::ffi::c_ulong;

Maybe you can add that (in a separate patch) in kernel::time?

Regards,
Boqun

> +    },
> +    /// A signal occurred.
> +    Signal {
> +        /// Remaining sleep duration.
> +        jiffies: u64,
> +    },
> +}
[...]
