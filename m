Received: from mta0.migadu.com (out-89.mta0.migadu.com [91.218.175.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C63EFFD7
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652047; cv=none; b=gEPfD8fWumjsmVEvz1RACRstGhVuKLk/TlDUenGoTC8QMMp7+jCQ0eWH9c2MUVbLLncvmepTMnSd8Ra9jYBIGf037voIsNL/8MCLVbhr0l44Ms/cVccBEtslQwz2JqWA/e6c7Rgs3J8FMZWtDnuyU/0hJFJyczElClMY+iu5WLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652047; c=relaxed/simple;
	bh=4loeGeD8oZxgEu65FuYcXRcAjOZeKTAl01VdrV8ekwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8pOvhMYV+i9nQ4DXMb5bVuEukoh2jftJ26oS6RmB0RlbycEeuZPPDCRNeNGEPEAiYcGICtBZMetKXQeR2JfgNV8YdCbWZR6SjtNrCKiyArtnnsyeUwYAXxFuIAEoqQobXG/WyghVUbRer/TZuu7XgJWCgFNof2ulcHs7DCrNqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q79ySWjD; arc=none smtp.client-ip=91.218.175.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q79ySWjD"
X-Envelope-To: rust-for-linux@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4loeGeD8oZxgEu65FuYcXRcAjOZeKTAl01VdrV8ekwo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787652044; v=1; x=1788256844;
 b=Q79ySWjDrsqlaLHSMfysEtcheFoQ8nBweP94Tw4FlrkS9VizrncgBbFp98hmCSCq4nALowIy
 YMh/wg0D89Zi+v/JjTw/dOI/xo7gYOLwayzEqfc5rtdc0PPyXygKMIsSdVhYkD6DBcmuevIwx7e
 dxuTS84jZFdnJb3/Stp6wnjc=
X-Envelope-To: rust-for-linux@vger.kernel.org
Received: from [192.168.200.2] (2607:8700:2200:dfb7::2)
	by smtp.migadu.com with ESMTPS id a6f503ed8e2031b3;
	Tue, 25 Aug 2026 10:00:44 +0000
X-Mizu-Trace-ID: a6f503ed8e2031b3
X-Migadu-Flow: FLOW_OUT
Message-ID: <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>
Date: Tue, 25 Aug 2026 18:00:37 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: merge problems with char-misc-next and Linus's branch right now
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
 Gary Guo <gary@garyguo.net>
References: <2026082516-slapstick-nearly-8986@gregkh>
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <2026082516-slapstick-nearly-8986@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/26 17:05, Greg KH wrote:
> Hi,
>
> I'm trying to push out a pull request for char-misc-next right now, and
> am having merge issues that I need/want to fix up (or at least provide a
> hint as to fix up.)
>
> I'm currently stuck at the following build error:
>
>    RUSTC     drivers/android/binder/rust_binder_main.o
> error[E0425]: cannot find value `THIS_MODULE` in the crate root
>    --> drivers/android/binder/netlink.rs:16:13
>     |
> 16 |     &crate::THIS_MODULE,
>     |             ^^^^^^^^^^^
>     |
>    ::: rust/kernel/module.rs:52:1
>     |
> 52 | pub const fn this_module<M: ModuleMetadata>() -> &'static ThisModule {
>     | -------------------------------------------------------------------- similarly named function `this_module` defined here
>     |
> help: a function with a similar name exists
>     |
> 16 -     &crate::THIS_MODULE,
> 16 +     &crate::this_module,
>     |
>
> error: aborting due to 1 previous error
>
>
> I wasn't paying attention to the recent THIS_MODULE changes, and can't
> seem to figure out how to fix up the netlink.rs file to build with the
> recent changes.
>
> Any hints?

Hi Greg,

Gary has already posted a fix:
https://lore.kernel.org/rust-for-linux/20260813163951.1102583-1-gary@kernel.org/

Best regards,
Alvin

>
> thanks,
>
> greg k-h
>
