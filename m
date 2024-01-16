Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9501B1CF80
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 18:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705429481; cv=none; b=UApCTZo0mrxLrWfiYgfi3m5C1a79Qz7reRMJYRqDL1d0Qy+AlITI1+78HKn62sFYLutCp4idiEGEF1IVoG2U6IIdb4zj1AdgiO7+ZaPd/SrftQQTRSUvElMV9NSLxq3rgs+jxAN0DU6w68gfAaPwOH9zzIPNNwGQp94JFqLPBKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705429481; c=relaxed/simple;
	bh=AE76M6TTTkrpoX3oayYNVacGV4PWsQkWFChIK0KMDPM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:Received:X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:
	 X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=C+xbl5HYeU14Hj9fR3ghgjQ2T1J5AayuZVxbrHPAh5RpPDTv/dIhd3O6fW8BxxixZ+AJaNHE4w/l9pqoLeMDv+DQ7kHi6gVUeRoBex+1DmkMJjpL5nX4DRTbWCsNBNulB2CIUA8wsraOXur3hCahj0IiZY0jQsjyZOQ03WH8rzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqkKXFZm; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqkKXFZm"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4b72c944019so2730866e0c.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705429478; x=1706034278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h11ZDY+AI3g5VV9K5fJywznn6G4n5dIg28SbckwxgMg=;
        b=KqkKXFZmmmzqdXCpfeCQOPHGNZLTRXQY8bP/6p6UoWX9o9/jAYJ28lSNsr+gT146ac
         y/4j+Hde8iwqvBQkZKHNkyVXBJeKl41xs3no7QOouuDicmDLTkXZV0KJw8cK0nQH946g
         lT5elIrg1/0AXXZqoIi1Zp/QsEoLZqp5/NQipd7faM/lSqrqhcUJ/URpPCvR7/MiwSqJ
         bZVBrmOmZrqFYDb5VKlnMRn5Fx8b75kiJ5neDCL7yhW/L7dViPXBOo6MLJQULFXz4QK3
         jP5FuplhWp8niqKNH75EoOtvYIpwmL2UJzNvWq3WQIWuqZsfER3pO34+pmnlxOn802VL
         Kh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705429478; x=1706034278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h11ZDY+AI3g5VV9K5fJywznn6G4n5dIg28SbckwxgMg=;
        b=dMUg/m2cOSJMXf4DTBAOzVsqB3uAnB1Vq9FIij/vi3lMdpidrrp/NeTpiacxFVvaiK
         bRULUL2VaTI8eJH8/gWylQ+HtdhsYA1nsPgwMmMgzoNhZ5lUi343zQP4rj0JF7dE80qi
         1A3XStaH562SFvFlbjhz1KpPTkCVkM9XpeaFU2dYmJSHkHY+izHW25jUSPDrULnoNQp7
         mXJcL6dQx0KF3JUaVLMk5lNiuzxZz5jIfPLJnqGQtGaDWMuf7ACED+umHdkmVVJZJ8TX
         u3GCIPJwHcvIWmej7ltSeDWDhUxEybxx9hw28od8AiL1KAAV+o1oclp5lw01FIlzd+40
         xjzw==
X-Gm-Message-State: AOJu0Yy46ysL51gG59KeAiStQMvyAE8Yb/yXBdosYdHgDzX6rTcLeBn8
	i6Nkf2U1NmjZ9ik7X2WUkYM=
X-Google-Smtp-Source: AGHT+IEFqaEDsbr30nIO9YQXIvnD9MulOStb4ZsAe2syB/p2moYJFIFh8epiGyJvLV7MMCQbbtRhng==
X-Received: by 2002:a05:6122:29c3:b0:4b6:c9fb:b185 with SMTP id fo3-20020a05612229c300b004b6c9fbb185mr3985708vkb.23.1705429478333;
        Tue, 16 Jan 2024 10:24:38 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id a3-20020a0cefc3000000b0067f77ca8d18sm4376968qvt.96.2024.01.16.10.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 10:24:38 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id A6CED27C0066;
	Tue, 16 Jan 2024 13:24:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 16 Jan 2024 13:24:37 -0500
X-ME-Sender: <xms:5cmmZZFGdwJ5y5YwLOXNV91lhjBiw5hYQFmLOImo6HnQDQTR1jcAXA>
    <xme:5cmmZeVt0Unn7D-gYAWH5pi7oayGZpLoOd82K-f6dgBLVC096RiIU50uPnVAyoKbn
    JBF8zJry9VdOrr7pA>
X-ME-Received: <xmr:5cmmZbLgY3PVKSJxbjOhZaqgNUrq_x4qq1RcInGMLwM8MXUGGKpdSawQAJcI8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejfedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepjeelueegvedvteeviedtgfelkeelgfelkeehjeduhfefgfevleevuddu
    uefgheegnecuffhomhgrihhnpehgvghtrdhgrhhouhhppdgrshgprhgrfidrghhrohhuph
    dpghgvthdrphhiugdprghspghrrgifrdhpihgupdhruhhsthdqlhgrnhhgrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunh
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeej
    keehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnh
    grmhgv
X-ME-Proxy: <xmx:5cmmZfEDYqICHYiPDgAJ0vDldMqMDm4_1ERmHj-kDE4ID_c9VVhOGw>
    <xmx:5cmmZfX3tQ9qAd_0vI9vhYPYdTi2txOQN7syy52BEUHIIW7TtCb4QQ>
    <xmx:5cmmZaNNA7pRvYPXJDzgAnA_aMtZOJweXu7HIdxjEct-o3GrMgmshw>
    <xmx:5cmmZfQCNEWH6gKv8ZzWyTMnsxfetbrtOS_Gpdn8YUIKJZpPdOwVWg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jan 2024 13:24:37 -0500 (EST)
Date: Tue, 16 Jan 2024 10:24:18 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Antonio Hickey <antoniohickey99@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: task: add `as_raw()` to `Task`
Message-ID: <ZabJ0lCKDahbCHGh@boqun-archlinux>
References: <20240116022823.64058-1-antoniohickey99@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116022823.64058-1-antoniohickey99@gmail.com>

On Mon, Jan 15, 2024 at 09:28:22PM -0500, Antonio Hickey wrote:
> Added new function `Task::as_raw()` which returns the raw pointer
> for the underlying task struct. I also refactored `Task` to instead
> use the newly created function instead of `self.0.get()` as I feel
> like `self.as_raw()` is more intuitive.
> 
> Signed-off-by: Antonio Hickey <antoniohickey99@gmail.com>
> ---
>  rust/kernel/task.rs | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index d2f2615fe4a1..72737f5d86ab 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -124,11 +124,16 @@ fn deref(&self) -> &Self::Target {
>          }
>      }
>  
> +    /// Returns a raw pointer to the underlying C task struct.
> +    pub fn as_raw(&self) -> *mut bindings::task_struct {
> +        self.0.get()
> +    }
> +
>      /// Returns the group leader of the given task.
>      pub fn group_leader(&self) -> &Task {
> -        // SAFETY: By the type invariant, we know that `self.0` is a valid task. Valid tasks always
> +        // SAFETY: By the type invariant, we know that `self.as_raw()` is a valid task. Valid tasks always

You will need to update the type invariant on `as_raw()` then, if you
want to use it here ;-)

>          // have a valid group_leader.
> -        let ptr = unsafe { *ptr::addr_of!((*self.0.get()).group_leader) };
> +        let ptr = unsafe { *ptr::addr_of!((*self.as_raw()).group_leader) };
>  
>          // SAFETY: The lifetime of the returned task reference is tied to the lifetime of `self`,
>          // and given that a task has a reference to its group leader, we know it must be valid for
> @@ -138,43 +143,43 @@ pub fn group_leader(&self) -> &Task {
>  
>      /// Returns the PID of the given task.
>      pub fn pid(&self) -> Pid {
> -        // SAFETY: By the type invariant, we know that `self.0` is a valid task. Valid tasks always
> +        // SAFETY: By the type invariant, we know that `self.as_raw()` is a valid task. Valid tasks always
>          // have a valid pid.
> -        unsafe { *ptr::addr_of!((*self.0.get()).pid) }
> +        unsafe { *ptr::addr_of!((*self.as_raw()).pid) }
[...]
>      /// Wakes up the task.
>      pub fn wake_up(&self) {
> -        // SAFETY: By the type invariant, we know that `self.0.get()` is non-null and valid.
> +        // SAFETY: By the type invariant, we know that `self.raw()` is non-null and valid.

While we are at it, maybe we can clarify the terminology a bit,
according to:

	https://doc.rust-lang.org/core/ptr/index.html#safety

"valid" implies "non-null", so here we can just say:

	we know that `self.raw()` is a valid task pointer.

Of course, this only applies when we are talking about the validity of
a pointer in Rust. In other words, it's OK to say "null is the valid
input for this C function".

Regards,
Boqun

>          // And `wake_up_process` is safe to be called for any valid task, even if the task is
>          // running.
> -        unsafe { bindings::wake_up_process(self.0.get()) };
> +        unsafe { bindings::wake_up_process(self.as_raw()) };
>      }
>  }
>  
> -- 
> 2.43.0
> 
