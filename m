Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE193214
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 01:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730684932; cv=none; b=r+6aH/DmABQ53YnbLrbY8Z1LcXLRpDTmpXxgfYrAIqEsjzWd5fag3yBCIxIemDAJLdm3k4oFenPgbUJVaktIeH9C/mh47Sl0sdbQQUg514eUGRdl0Wd/LTmmGoZs+74nxOO1RYxJ86OwxpAY0dBXJqqFRdWSH1J0g+4OZVBTwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730684932; c=relaxed/simple;
	bh=HAb002sf51r9CG5ApI4jswLhga+A+Osp2naLgaz4Wd0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kejXsiNiRpDJjuFrKOMXZQsAEKJWGe2H59bQJpAodnp1ReC68+RI+P9UGEjCxwPhKXNxXEQ75uvNlBmDRsMsmggmpR4ACJZznhboEefRdm7RhDA7W5mKzBlVCSKH4LcBZRPUt48rSGxWuePTa2YbFAVMjgDTkXGGtv7oGLTJDbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/bIrflo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/bIrflo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cf3e36a76so38213015ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Nov 2024 17:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730684930; x=1731289730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwgr3Sd3VmYavqZpV34OMx0NQ+EvIa1MYj/Bvdo8AuY=;
        b=Y/bIrfloacjLDujpCMHYXNQLulj/ZsvpSBFC9Bl9ya03/rknzxsNQHS2vEOtG7Z2bD
         agGVtKrLqCqboOm5wAF+TgOGZ2YeaRFYjVVVWORKtcYduBNcDDAJ2/1bwK+EVgOpfAvB
         kuzJbKXjkiYFDWEmlcqX4LWe4ZsXqWRK6lqbERUbj91wWeQvIGuAU3BBC4D15hhuDouq
         1ra1HP0FW0pjg03fJuR0PsAleH37CZMC7N7/oOOuoyMko7Thnyq5EZN29vSHY9m6xptZ
         C3btFdwM8vydNIscVdue1FJ6giYfvtSCb2hXjhHEokV75Er1V1A2xrwJCPb9s6cWUXL/
         iyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730684930; x=1731289730;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iwgr3Sd3VmYavqZpV34OMx0NQ+EvIa1MYj/Bvdo8AuY=;
        b=hGUsAKCZMpwLdee4nL4AGc1Beo6V1ap7TwbykCwFdv4WM2SvABTNzrfxzgfZ6H+QRK
         tdtZDsgHsYlRVFQXhah3Ewbz1TT8QINje5Hwgp5vta4bWTymnhFsGYmIDsCW8RLFIpNc
         ERl7UCDkaZDCzWInsDdX8vgVsBN6YQtxJhfJzwCSWcZoaPDCDRYHaKV3YpKozsHz3iGn
         G2AtCnKZRqzR9NUqBpNeFfvQUNuc+Q8D/7CMGpH86dDlzqhj54kLrfwg1BASI3Bt23AE
         ITsBSXVrzaYSZAfSFbtC53BR2MLEOF3OULntYXDsQe2cqNqC+g9JsffTm1SL+WEqo+lW
         wQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCURAG35jA/oGtZ810+Ha0G+YBMxn8CAgNHy/ezzuXKPTLsIndyOskINh7R3so1rLaEM/bfXezI54AAJ/ihYpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9vM+j7+T1+Tb2P8dxYnP7G5IRgBd2v+MPJbRf+7mNt80fjXmB
	6SunG/mdGzhC0xAFWlNMPeu8TAj/Q9qybTW54S4mBkr+hFISiykuOj1tPuuY
X-Google-Smtp-Source: AGHT+IFmeKLrkUxPfrGM+moHU6uwZhsNTOilYOpJl/omUprdR27tsxtbm4d6Hny33ONrylw2pxB6yw==
X-Received: by 2002:a17:902:ea10:b0:20c:bca5:12a8 with SMTP id d9443c01a7336-21103cabaa3mr183379225ad.60.1730684929768;
        Sun, 03 Nov 2024 17:48:49 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d5326sm50481705ad.278.2024.11.03.17.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 17:48:49 -0800 (PST)
Date: Mon, 04 Nov 2024 10:48:35 +0900 (JST)
Message-Id: <20241104.104835.2157336958968115832.fujita.tomonori@gmail.com>
To: dirk.behme@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <b9bcc656-7e58-4509-aa2b-6279a72fa9fe@gmail.com>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
	<b9bcc656-7e58-4509-aa2b-6279a72fa9fe@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sun, 3 Nov 2024 17:38:10 +0100
Dirk Behme <dirk.behme@gmail.com> wrote:

> On 03.11.24 04:05, FUJITA Tomonori wrote:
>> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
>> functions, which print a message only once.
> 
> Maybe it should be mentioned why this is added? Who will use this?

I'm thinking about using this for my timekeeping and timer patchset:

https://lore.kernel.org/lkml/87cyjj2vi1.ffs@tglx/

pr_warn_once() is mentioned in core-api/printk-index.rst and
process/coding-style.rst so it's kinda API that we had better to
support even without the users?

I think that WARN_ON_ONCE (or WARN_ONCE) are better for the patchset
but they need assembly code and it would take time to implement them.

>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/print.rs | 92 ++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>> 
>> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
>> index a28077a7cb30..57dbb45ba5c0 100644
>> --- a/rust/kernel/print.rs
>> +++ b/rust/kernel/print.rs
>> @@ -414,3 +414,95 @@ macro_rules! pr_cont (
>>          $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
>>      )
>>  );
>> +
>> +/// Executes code only once if the condition is true.
>> +///
>> +/// Public but hidden since it should only be used from public macros.
>> +#[doc(hidden)]
>> +#[macro_export]
>> +macro_rules! do_once_lite_if (
>> +    ($condition:expr, $e:expr) => (
>> +        {
>> +            #[link_section = ".data.once"]
>> +            static ALREADY_DONE: core::sync::atomic::AtomicBool =
>> +                core::sync::atomic::AtomicBool::new(false);
>> +            let mut ret = false;
>> +
>> +            if $condition && !ALREADY_DONE.swap(true, core::sync::atomic::Ordering::Relaxed) {
> 
> What is '$condition'  good for? It looks to me that it is set just to
> 'true' everywhere below? Could it be dropped?

$condition is supposed to be used by WARN_ONCE() in the future but I
could drop for now.

>> +                $e;
>> +                ret = true;
>> +            }
>> +            ret
>> +        }
>> +    )
>> +);
>> +
>> +/// Prints an emergency-level message (level 0) only once.
>> +///
>> +/// Equivalent to the kernel's [`pr_emerg_once`] macro.
> 
> Here and below:
> 
> Would it make sense to use a similar header style like with the
> existing pr_*()? And add '# Examples'?

You meant that having the similar comment like the following?

/// Prints an info-level message (level 6) only once.
///
/// Use this level for informational messages.
///
/// Equivalent to the kernel's [`pr_info_once`] macro.
///
/// Mimics the interface of [`std::print!`]. See [`core::fmt`] and
/// `alloc::format!` for information about the formatting syntax.
///
/// # Examples
///
/// ```
/// pr_info_once!("hello {}\n", "there");
/// ```

It's verbose to duplicate the comments in pr_*?
