Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BD13211C
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728720962; cv=none; b=PTu9JcLQjpxPz3ArxiNX3iy+QbwrUtHvtLiB00ltGBqZNKp2HR2Na90hzAiTa7dl32AM0VHp8/qKL4zsPo316Lq1WfNqMbIxsnOo1TMSZYnilgvEYkq+RasKpYFxXQbLIlB7YGSaKQFpYRaWmlLXvuI2/FM/PfyIH1eAQKWhmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728720962; c=relaxed/simple;
	bh=SLU/HDxzKBnqwXV4cFLe6yV5nMBu1FXqJqw9QG0fS6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9r01Ehgq0WENFeMCrD09R2mfdBnOUBh0i2P7k7rsrALeNfzVQEiuWoOynP+h6v2zPhClpFRvwXo35QyyY5UftsdwhspdZPinw0Kx+I0oFrLtPxTBIHtFAbtFMbmuy3UgARlMUJKlU9u2glW8/xwwROpMhs7aEFQPrNu7MfIyqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cILN9tUg; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cILN9tUg"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-45f091bf433so22611701cf.3
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Oct 2024 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728720958; x=1729325758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CD1O/zz1uWVBP+ZQTrUBy8QquivE+r1EhuxGvtSDp3k=;
        b=cILN9tUgiiD5aUXUxBJ9XNRvKK8Twh4rdwdIlfWr8Nvbk3Fn7132wFqRfwySgnwYFR
         bmhZKmBB3yx6JkTNQV5+cyYkz82BP7mANmecnKo1ggoGPUyPADDRgSM2fqwXId6qY9du
         4SCY/ySfHtvNy3en/rqub/E/0WRW9XSnE9un7y4iKv6UVa9C6+LwkrgHKnUr3ZFE00Cu
         CIy24L9zQ0NBd53jIxJ7+W/sVqhx0qJMiCu0YD8Yam1qtc+E3kbnkuIBaIxzMWrj5v1x
         BTBSss4hT7WbfTBwUQJGsm+83D/DtXP//iBP9lpLErZZ4FXqfgKNVrI0ZY2dfODk95xB
         92wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728720958; x=1729325758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CD1O/zz1uWVBP+ZQTrUBy8QquivE+r1EhuxGvtSDp3k=;
        b=gWtol8JH64TnWH2AonoxBIQrgwGyD71cwlBzSKDJzFalsHP4WVRXHRpbbMB/DrCM5A
         ql7upbkwRiXbXIIyc19/SCtvRs27kyaC54euvUchVB39UWa8Jp1qvj7eWbmgGsbHFRGW
         v4p7hIpEdLpoyqV3FK6iJ3WG1BiPMWedVsj0bj6lypCOhhPLPS60YjkEV+mdSV3M+uzh
         y4RXEQZttvQZGR1EEHbda5/b75C3y34kNWvC7grAvYwe9xjIVTnXykCNiESMq9UpTAAm
         6zbhQagCuZRLc01seVIn8ZBz+VsgpT+ocZMVSq71sKJl4mNFeoNmQVt0X8a8rNCKDxzI
         mzkw==
X-Gm-Message-State: AOJu0YwB3xcqUTxguuwf85uk7/NEuoak2T6QKMFu6Gwj/3KM06yvbBYx
	7ZF5NT+BT5c2fGT8lRHy4SWeeMYyM+bKyZisS28gmAzCZR5Djhey
X-Google-Smtp-Source: AGHT+IH2gzMfIYPLfTdRpy+XPj9lXePeGx00ZlbJgEla2m6ekIitEub3KB9IIQ4kp0Tk1qd0iwcKFQ==
X-Received: by 2002:a05:622a:5506:b0:458:4a2a:402d with SMTP id d75a77b69052e-4604bbcadc1mr74252071cf.25.1728720958345;
        Sat, 12 Oct 2024 01:15:58 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427dafd0sm22968231cf.24.2024.10.12.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 01:15:57 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id A66611200072;
	Sat, 12 Oct 2024 04:15:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 12 Oct 2024 04:15:57 -0400
X-ME-Sender: <xms:PTAKZ9w1sjzQX6Ck09uwaLuby4G8GysB5xkfFCz6cPjqm7kxS0YzwQ>
    <xme:PTAKZ9SyCqu2OczQsgBxgdNNZ80Q4x4sXXBvRw1NS0jVhOnvi-UUA5h-QNGg0lRMo
    Rp5IhA8YAa-PRySOA>
X-ME-Received: <xmr:PTAKZ3X0CBsKPDT27xqwXye45DpNhWTVvunGAQ_Bs7wVwgCVP_U0lZ_sLOrZnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeguddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepgedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepughirhhkrdgsvghhmhgvsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:PTAKZ_ifMKX5pemYjHghwo0DZuta1IvzbsW5RTdPPhtpVTQY1oEgGA>
    <xmx:PTAKZ_CwUMqOMoGUK4sDiePibyuweH0CYILkAxxe1sh4NeeRzkVoAw>
    <xmx:PTAKZ4KSeWF9gh8cd3_1HDpCLXFp_Hv1GG-ZSa-M_0tYUmPMrUnn4g>
    <xmx:PTAKZ-C-2fj01PlI4qAtxgHE3xvDQNq6NBt29EpRDqo4xkmYHr7kkw>
    <xmx:PTAKZzxSZNWb9KOi2ypPKKZSK2vlfDoqnp8YjmBI48mG2cj2WOYDxnEj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 12 Oct 2024 04:15:57 -0400 (EDT)
Date: Sat, 12 Oct 2024 01:15:47 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH] rust: workqueue: Enable execution of doctests
Message-ID: <ZwowM_YKc8Ktzgzr@boqun-archlinux>
References: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fb9930e-7666-4520-91d0-7e79be56b8f7@gmail.com>

Hi Dirk,

On Sat, Oct 12, 2024 at 08:30:38AM +0200, Dirk Behme wrote:
> Having the Rust doctests enabled these workqueue tests are built but not
> executed as the final callers of the print_*() functions are missing.
> Add them.
> 

Thanks for doing this!

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
> Without this change the "The value ..." outputs are not there meaning that
> this

Unintended newline here?

> test code is not run.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
>  rust/kernel/workqueue.rs | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 10d2bc62e2cf..ba0f397f8b8b 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -69,6 +69,8 @@
>  //! fn print_later(val: Arc<MyStruct>) {
>  //!     let _ = workqueue::system().enqueue(val);
>  //! }
> +//!
> +//! # let _ = print_later(MyStruct::new(42).unwrap());

would the `let _` be necessary here? Could you just do:

 +//! # print_later(MyStruct::new(42).unwrap());

?

Otherwise this patch looks good to me.

Regards,
Boqun

>  //! ```
>  //!
>  //! The following example shows how multiple `work_struct` fields can be
> used:
> @@ -126,6 +128,9 @@
>  //! fn print_2_later(val: Arc<MyStruct>) {
>  //!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
>  //! }
> +//!
> +//! # let _ = print_1_later(MyStruct::new(24, 25).unwrap());
> +//! # let _ = print_2_later(MyStruct::new(41, 42).unwrap());
>  //! ```
>  //!
>  //! C header:
> [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
> -- 
> 2.34.1
> 
