Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB7314B77
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762830603; cv=none; b=RJNp+/0Twe3+FArt9Yx/1iUrN/DU2K+s44MYp3T4oU1L1i5B4oKxSAR6gcqXd49VM2baLZNJm/B2zpdE0FbriwqnTIhk7SZalXHqLaJi3tjQBKyJSn/+6fsUFiyHeKTcQimEsHQJ8tqKKTQWpFbRxzwja644XY7RlVXfMRqGs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762830603; c=relaxed/simple;
	bh=KohE9ztlm+D4fcFJUZzSI9FIzkDWfEQ3hOW9DC+8Bqk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NpEgAc7PNkyjW6iW0DCrqzzGgzsFS5xaD6jLzDNPCePQijruhu3SHFiXnTdzMlM0Yd7DhVjpxmz0zb1YxL30AO4/ByUUKBSCRE2HDLibWAuHlqzfvS8jn+S39k5BZ5Cjz2H00L1FAmPH+9UeNZmflGRaNK9F8qqDBfToSwFCc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/cRes0N; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/cRes0N"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b0c3451272so4516044b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 19:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762830601; x=1763435401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZR4rKvrIwOBBAqRkAnYR0kcX0SN01qz5bYXlMjokjc=;
        b=O/cRes0NDfpvb/Hw5h7CvHDBtaZnQ2om7aA9EaHgLh44wFdjchljZahl9pRaWVujAX
         PJKNHbn5n7EPOBG9vWBw5hrWosEkY3ceRq0oX1r69tCs5i8kezOT7GCbz5VNvHeB2NYM
         M1AYC90xyb2Acl/iJ9+lirLCbzVSgjWeqlwNpnO1oeIGMlgwYW4pbYeasTMBhfEfK7ri
         yEa1jweGxXRnB1hWM0Q2YunCWKhsh6JUTRC9BxLa4lC/vuNGxgrMCikhVONfvUp5t4gV
         d2L7nBPZXzPO1rr7rPGGEUPFaqi4RrcN6nlLnlWKMYv8oN+nPxtBUzmXGHN869FlOfJ+
         p6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762830601; x=1763435401;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZR4rKvrIwOBBAqRkAnYR0kcX0SN01qz5bYXlMjokjc=;
        b=hafBMPJSaixG6zTTnhDQ6+qUwWgkGniZ9ErqRm48Vn8pXmgeDrlKh3e6DK2JKbHELV
         neZFzZZPAwQxcI27un7KTkxm5/J2tK94hNqQYbr5ITPj1bOCZ5szUtFadrmvtFEZe0wX
         zpMr4iUDV0v9nqf/+fotegkJQjSLlMfErQF/WBuZ2ghgmP/brInUSObHPFEQyNEUfUge
         G6g29onaJS8+WwzNtjO0c6KJOnn19hjtYyxE2QEclg5NtDJvqnihXt2mwyGb6cabccx5
         KB7yDvVUN7SOtcFKPfiY5TbgNJNqW2TWB2q3UiXevH6/XureAbs0Jkb5900rodkbobgY
         SYdA==
X-Forwarded-Encrypted: i=1; AJvYcCXvO8dV4OqlUj0+GnLVpyOGHKFYcLWiofmEBhFtw/DURlVYsnSdjsGIN9BwB8UWfWtvy5RaKFQ6vDy7MMLsUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTXD17dC/L+6w1YV6zVOYsy5mh/IpDY1yh2exfyKvs9EU5PoS
	UmW1r4nSBJWXSDUPXCZEjwHRvQHjFIZNXHQ1NM1+dt/xG3WmxzQ/Qq2q
X-Gm-Gg: ASbGnct5lqSrEfvsQDQAsB8+yqbo1d3dcU0JOSTguxWLlBALabrRDBbAj0Bs7Eokes7
	D8sauwNBUGoZdDu4tDGNiwJ2FtGBwA6pk4OPwHQgRQGZWIAnsgZHv08KFvuBnu5Cq3FPxfqDEU7
	iTwKloQ5Vq5q2Q5VgyID+Tya1x5OJLAF0S56PL3cb4yJIvg5yqLJ1Od3ZZtEKxJts587q+2Zme+
	/eMY/5qumylmvCV36yO1hjY6zH4EdYGsUPalBm2rofyU3+bW7fm273QxAhSJGXu9b729htj3Hg7
	gCm5dCGHtGwHywq7CoMrLK4tGJP863CUeLQJmNgicAkYfAKaTp0b+vEo3J9ULYs1SqKuC4IQw+v
	XVbWB+bt24bW/idV9ydpQVHMPfayjfxwDn1g95w8uFCgjf0G8VEiKnpPVBrG5vY0g6wDt5KcD1V
	VpcL/u1Q/qDti6e+0h8AlyWYKTFM90zROB+4mjwkLfsoQPSDWSlqoPA2CbvhzGZK8k
X-Google-Smtp-Source: AGHT+IGXtSbiH5M2g5aisy1+jkOHFvRuIrkXJMx2mE3a048wkLa0Kiq5MaHEKTZv3k9nL5wdLf/uHw==
X-Received: by 2002:a05:6a20:9145:b0:340:4bb7:8d11 with SMTP id adf61e73a8af0-353a3c6023emr14403141637.48.1762830600632;
        Mon, 10 Nov 2025 19:10:00 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffe33a75sm14759669a12.24.2025.11.10.19.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:10:00 -0800 (PST)
Date: Tue, 11 Nov 2025 12:09:49 +0900 (JST)
Message-Id: <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com, aliceryhl@google.com, a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRIPgOPvi4uhGQcM@tardis.local>
References: <aQ21xajAygTbi582@google.com>
	<20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
	<aRIPgOPvi4uhGQcM@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 08:14:56 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
>> On Fri, 7 Nov 2025 09:03:01 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>> 
>> >> That's my point (and probably also Andreas' point), we already has the
>> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
>> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
>> >> it as I explained above.
>> > 
>> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
>> > three different states, but OnceLite only needs two. I don't think we
>> > should be reusing SetOnce here.
> 
> I mean 3 states should cover 2 states, right? In this case we only need
> to support SetOnce<()>, so I think it's fine, see below:

Yeah, that would remove access to the value member, but I think that
init member could still be accessed in an unintended way.


>> Yes, SetOnce provides three different states and the feature to set a
>> value, which are not necessary for this case.
>> 
>> So there are two design options: 1) to add a new minimal
>> implementation that provides only the features required for this case,
> 
> Just to be clear 1) will still need to be in kernel::sync module, as per
> our previous discussion.

As I wrote before, I think that once_lite.rs could be put in
kernel::sync but I'm not sure it's a good idea because I'm not sure if
there are any other users who actually need this feature.

Any thoughts from others?


>> or 2) to use the exisiting, more complex implementation with richer
>> functionality.
>> 
> 
> or we can just add it into `SetOnce<()>`, for exammple:
> 
> impl SetOnce<()> {
>     pub fn call_once<F: FnOnce()>(&self, f: F) -> bool {
>         // ORDERING: Relaxed is fine because we don't expect
> 	// synchronization here.
>         let old = self.init.xchg(1, Relaxed);
> 
>         // We are the first one here.
> 	if old == 0 {
>             f();
> 	    return true;
> 	}
> 
> 	return false;
>     }
> }
> 
> Thoughts?

Why not using populate() method instead of accesing the init member
directly by xchg()?

Anyway, I tried and got a following compile error:

error[E0277]: `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
   --> /home/fujita/git/linux-rust/samples/rust/rust_configfs.rs:109:9
    |
109 |         kernel::pr_info_once!("print once\n");
    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely


We need Sync for SetOnce? I haven't been following the SetOnce
discussion, but I wonder if there are use cases that require Sync. If
all access goes through its methods, it seems safe to add Sync.


I personally prefer the OnceLite implementation of not using SetOnce,
however since it's not directly used by users and can be easily
changed later, so I'm fine with any implementation as long as we can
reach an agreement soon.

