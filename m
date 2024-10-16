Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA78205E23
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092534; cv=none; b=EsmxhIomiAwNK1G+t8dZSmvpveD6R/6yX6buS6KvtO+AnjGoQRuoTg+VtOvexX3J7JIZJokB1F9OmGg4Kq7FFHQujj3afLuPth08GSTYvX0fqGjQuUvZ5XoOq8FOYHYI7EtlQrS6No0W2HtcgZbojdr+A2Rtvi22C8ITKsZRsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092534; c=relaxed/simple;
	bh=T9cbP7TJN06jIfuno1N5yC6SPEmVut8xSpFIolYd+D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwU+sxZBgM7s3uzzgpMsi2aMdY4c93rp7xOavDcRrXRmOTTSJSu9p6RpkEw+ZxtVTPClOGxOuYGr2V5O4XE9jZNxmR99nKkBhPo/C0vNXa84Nt+CCwokxv4Z0WRYrkTzM48hfXw3aqGuA43haFO7pRzp5M+Bx/iHZhK9d+XiLlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgMHvkPl; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgMHvkPl"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b13b3fa372so114389385a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729092531; x=1729697331; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10AsxkhokhL5BMjOGp6Xm4xjuQpoTi7yk4RoFnrIIPk=;
        b=JgMHvkPl6BqV4Y3uUlajNtBGIytmgFV5neBWx07JB499HzZEFNHyiFIokF5D6FLwXE
         aXVn/s15Uynx/DzkugudVCqaBGyHeIjTHR1uaiee2u4OvBD30zoS1MBTqqSLyT2qaRYY
         2Kn2tYRckPCK3H+/aGwfg7i71sYFc9R414SgR/dvir2yCLJPFc99aAYUbxR2Ot920zbE
         E9Dhos8KSOnGOcnjQ+5L1W4tHSj0qQ4rpNco5G3ykjpapeWfVQO9rGvTWKUWrxl149yC
         H0QjFwUonCcS1gY9YHZS30gKRSm2nKoigrXcPtu0NAcnQ78u6zHqDpm8DZj+wvRdiWgt
         PBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729092531; x=1729697331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10AsxkhokhL5BMjOGp6Xm4xjuQpoTi7yk4RoFnrIIPk=;
        b=IifjiAhEYYGsCSWsRVhrvF2wZ0po2Jl0AV63zrRLzOxDB2q8IUbZKcziBsw6zjbOIp
         E0XNxv3AaT91+r9AU6pj81lt0lBek8nh1rdqgnG6OnfJU9JWmP5VoYUfMVFASz4k7rbi
         iOw2KOag01CX2FTvXjYqPy4iCVSImeLm16T3vTeoYGlGbf4YtfNSMb5st3oUJJ/nhrmD
         M1IMkdBYQTxPJ3TCFyBuZAiHpHLb9hYE9X+enpDXBG+mNei6RTAr+7ozJU6TUXfV9B1v
         sTrjAK+TBme+ThByP9T0HYcogd7rRFJZ94e71HZRMrs9EcnqJ8ZfYR2sOZBrAv3fskIS
         dmhA==
X-Gm-Message-State: AOJu0Yx12Y8z3A7QV5wg8MxiXWgn41Ax0jI/qBlU00ODNyipVMwK0bx7
	G4glUFWq4y49debPu/Muo0mnuE73bxt2vGpzWATmiKxBJDH4Pqqw
X-Google-Smtp-Source: AGHT+IFlPz0ZDcObiyL0sMDh8Y/FQPK4L0UZC0RIty/QsVNQ09GpobWaiuBote5PMhur7RaYCgfHYw==
X-Received: by 2002:a05:620a:2490:b0:7b1:12e0:39ef with SMTP id af79cd13be357-7b1417d8d19mr627511385a.21.1729092531179;
        Wed, 16 Oct 2024 08:28:51 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b13617097dsm198550085a.29.2024.10.16.08.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 08:28:50 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2F816120006C;
	Wed, 16 Oct 2024 11:28:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 16 Oct 2024 11:28:50 -0400
X-ME-Sender: <xms:stsPZ41SxiNROD-VWY7LAoNVrjtzJkRQhIWTs2Id7Q2Bw6bNyUdn8Q>
    <xme:stsPZzHwjRF0C07XIqLBw26u48tTJkTRJh4-01q85e09v9Lpjd-Ls0ScbGvuN2fFM
    c0MPfTbUaRSY3LBXg>
X-ME-Received: <xmr:stsPZw6jx-HedR6agPnkRWYZkm7w1QW54tgqbh69051sK0foYYApmr7CfyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepjedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepughirhhkrdgsvghhmhgvsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmghhrohhs
    shesuhhmihgthhdrvgguuhdprhgtphhtthhopehtjheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:stsPZx1tSjhzqyN0Nx_4ZUB6OoIYfgncXdVXNs4AxR3uCdwA4Gr1hg>
    <xmx:stsPZ7FHuM6niDJp9Y9LAPaAQAXBagn4T0tJbgnEqLmKKJqM_YVdmA>
    <xmx:stsPZ68o8qpX995p3gVyZZbwAM6yMpwoTuEoYQ9BovCMOawHzGgJew>
    <xmx:stsPZwkemg9ZjfQjCRxfnb2NrAJQZh7Qm4QEgk6mIRtyrws66hIbXg>
    <xmx:stsPZ7Gsl6IE39lyD7zjgmob34MonWV__eWGIj8IANvpAd2EKR9-dEwc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 11:28:49 -0400 (EDT)
Date: Wed, 16 Oct 2024 08:28:48 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v2] rust: workqueue: Enable execution of doctests
Message-ID: <Zw_bsGqO6MWF-fkL@Boquns-Mac-mini.local>
References: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb953202-0dbe-4127-8a8e-6a75258c2116@gmail.com>

On Wed, Oct 16, 2024 at 03:35:07PM +0200, Dirk Behme wrote:
> Having the Rust doctests enabled these workqueue tests are built but not
> executed as the final callers of the print_*() functions are missing.
> Add them.
> 
> The result is
> 
>     # rust_doctest_kernel_workqueue_rs_0.location:
> rust/kernel/workqueue.rs:35
> rust_doctests_kernel: The value is: 42
>     ok 94 rust_doctest_kernel_workqueue_rs_0
>     # rust_doctest_kernel_workqueue_rs_3.location:
> rust/kernel/workqueue.rs:78
> rust_doctests_kernel: The value is: 24
> rust_doctests_kernel: The second value is: 42
>     ok 97 rust_doctest_kernel_workqueue_rs_3
> 
> Without this change the "The value ..." outputs are not there meaning
> that this test code is not run.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Trevor Gross <tmgross@umich.edu>
> Cc: Tejun Heo <tj@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
> 
> Changes in v2:
>   - Drop 'let _ ='
>   - Drop empty line
>   - Add additional maintainers into Cc
>   - Drop newline in commit message
>   - Add Reviewed-by from v1
> 
>  rust/kernel/workqueue.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 10d2bc62e2cf..3755c8e5e9ea 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -69,6 +69,7 @@
>  //! fn print_later(val: Arc<MyStruct>) {
>  //!     let _ = workqueue::system().enqueue(val);
>  //! }
> +//! # print_later(MyStruct::new(42).unwrap());
>  //! ```
>  //!
>  //! The following example shows how multiple `work_struct` fields can
> be used:
> @@ -126,6 +127,8 @@
>  //! fn print_2_later(val: Arc<MyStruct>) {
>  //!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
>  //! }
> +//! # print_1_later(MyStruct::new(24, 25).unwrap());
> +//! # print_2_later(MyStruct::new(41, 42).unwrap());
>  //! ```
>  //!
>  //! C header:
> [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
> -- 
> 2.34.1
