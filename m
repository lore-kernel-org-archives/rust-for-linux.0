Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2A6385D72
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527523; cv=none; b=LfNiuAujzFRzBvQ3xqEaqHr/fi61OsYQjzN3FjcrL89fMEMtgmkW4wm3/MYQVZ55XlTpkP6OEH/6YgI7lxAf7SXS60N/8FPDouiQNsjYnyRWL2kzyhgZX1BLbRPXgI7J5iATuzWZkrKvHw4gqhl9N52bqgl0SQCGACCrk0vuxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527523; c=relaxed/simple;
	bh=sqcKGjNAgEC9yrx/Uxqk7GVgaj0wVU8NpYvRoruUx+M=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oJNSZaS4A46zJIvsv7JRzXDDxch83XcA1S9qDs/3kpkZniliaQ44ZQQSQvwWvuokQqPfjO3tqa7SlsZqmupLI75T+S7QRcABLuBJTFBg7Qtn6SbWJKlw0m9/E6iotyKX1+rrRjFJv4HRl8B4Vo++jCdLFz/MjM8ZuiJKzAVj/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=E1ngb/yT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mNoVqs4f; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="E1ngb/yT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mNoVqs4f"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 89AAA13006A5;
	Mon, 20 Jul 2026 02:05:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 20 Jul 2026 02:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784527513;
	 x=1784531113; bh=o4Yiog+CZ2UINv9HsBgb8+LY6kyTkcl5En3SpN1nvMs=; b=
	E1ngb/yTHU4aepl+7BpW67PEqyNenR4pLHXgbpyxZeBcWBxD6t5ashRRTSmKnDZG
	OWADPgJOI8A3l2XXu+3IFrBrrJBumVPXLJn65SyV7uErf/LqZkKnRDA2m3yEsz6O
	0NIP9SVRXx/efqH2FV8rgv2wWhg3sPE5G1rrLydBoK4wuntw5bdX92LdnDLNup1+
	KtOp4hyHaeV60AGJdJGQSkkKplwcVPPC7XEj6Fsy6FfA4oGH1BMd12+JM5EuxZ3U
	Qcal/xJ23lRorAEzHtjf9XRy8uWfDg0nsJGATi7k5YCdnbheL1PCGieMdIqFTGK7
	NbvriSMkU/Pmkt0aPBM89Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784527513; x=
	1784531113; bh=o4Yiog+CZ2UINv9HsBgb8+LY6kyTkcl5En3SpN1nvMs=; b=m
	NoVqs4fXfg9MHhoj2JA/nO8kpSf/YhOgaWhYu8Gme3ijtzJWCCOtMJBIsjsYvCpd
	PavDtSVXSVFi2/1lJFxbTIFv2fa5mRYEoCoDMQPEYpNz7UjBjsIU6W/vEkGBWwro
	N0AhExf5LaRTmwWvtQoFu0TcxLn2ludm/0RCqAqMRnCob/4/yT4mz0ZEGkoDWTQJ
	Z3q+7C5NlNQ6N5h1Pm17btrGAsKfSzhwol6+y1mtDokX2a7otA/VHPZ5Lh+KHUco
	vWAuFWTcmg2Wn5nAdDILvRlMucYDe2iCuMjiky7H8h3fKa+WtQzwS937rlC0j+u8
	Guxay5GuSfe8kdykAV1XQ==
X-ME-Sender: <xms:mLpdavGhd8F3ZbK4lS2Df2b8fflMO6vWLadz16a7EtANduTWI4TFtg>
    <xme:mLpdaq23IAPvXu9H6t65jGaBYCyngon0y9wWDBJ0Dl_34NWUL5Pm-C0_A06Zx4yYW
    dmVxE49ANXFZxQN2TxDGYuWiF3R2RnRFEC7hEB27ZO6GoLflaQw2Ftp>
X-ME-Received: <xmr:mLpdan--a4mLVxx6lCYPyj_aujiUmsRGkKFTYiJEsqJCZloejUukN19Xwqq8BHC0terHoj9Zq7Z1ZuehhXUdKkC8>
X-ME-Proxy-Cause: dmFkZTFbKzFa/dJVGz4e7yHpXwZiHJOGVdHyGAzwxTNlLgf1CZ/iEUEfetB4o63zV44dRW
    Oj7nrsPG/z7nnCbdPHJ0ViXtuu8T5RQXalCbbrRc2qkgTPNcO0CTd9ZsWalkAqXmXbUfPw
    85V6y/Idylh5Yh8AJRYSZnXFX8n7bYVD+xUB9d2/9uzgXwmBAu5KSucf7MD4Cru4NLKngC
    m57TjXfAF/Y+LR+avQozbU6320kURT2GcPz0rXOVbmYtw0rHWimatfHcYUFj3M7j+lEamN
    J7b0kg/0z5jOLcHj/86l3+NWm5s4vQ7/YZ4Hywsc/6qgKoNUakPCWH2tTbF6soOhIi4gjR
    sYTLvut3MrXN6hMLWP6/26KnoBnAy5ELGW0y9E+fOiI6TJy6hzMafiLCZkjJxwTPqpXhYh
    TUIlOsUNbYpQZHukr4qUsA6OU6KufKtFWdayCgzSJ9ThMUO/9SJYwiOgIRUOHp2gZAdM/w
    fjCf9OjijH183zhd+nIuh6rtk4V7Z58/5oVWdv3WT0ouHvQLs8zuExcqcjPPnI9rsLQ98o
    OXjEBzy+GOAD4whFPeEvaZpJCIdwTqjzLRyk0dc1blpES85ZD6z7FwKEEOCgWezdSp4Ofr
    oPGIilIXRjdHHl7IaEAbX7sAVC9gJ9KnVhqCReZXOvdbpMv5Qy1WImKiDguA
X-ME-Proxy: <xmx:mbpdatGBgOCSLtNhCM17ZXhjLhSHVt_4YGRfB1Y8GSFuFEmTvYpQlA>
    <xmx:mbpdathJBMaaIr4ite_tFd8_4oQS3NFfE8LsJkoC-Wl_q-d1s3G0HA>
    <xmx:mbpdai__g8nboVm7Crd1Y1eOkOOdgwYM3s_t3WXMWYSbz2pN0_URHA>
    <xmx:mbpdatbmeES_G6ZMvIL8guruqboE8Ly1FlU07EXnSVffzhXNzZmW5w>
    <xmx:mbpdagPoNevbOz8nFWgH3TE_enKSUGENNNxSqzsEqBHXx8F_9Kl0gzdu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 02:05:09 -0400 (EDT)
Date: Mon, 20 Jul 2026 15:05:06 +0900 (JST)
Message-Id: <20260720.150506.1685955988366345792.tomo@flapping.org>
To: boqun@kernel.org
Cc: tomo@flapping.org, ojeda@kernel.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net,
 lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com, paulmck@kernel.org
Subject: Re: [PATCH v1] rust: bug: prevent dead_code warning from
 warn_on!'s flags constant
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <al24EJhLfbSoooSQ@MacBook-0RXW5>
References: <20260720035510.4048145-1-tomo@flapping.org>
	<al24EJhLfbSoooSQ@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sun, 19 Jul 2026 22:54:24 -0700
Boqun Feng <boqun@kernel.org> wrote:

> On Mon, Jul 20, 2026 at 12:55:10PM +0900, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> Fix the following dead_code warning on some configurations in an
>> atomic development branch:
>> 
>> warning: constant `WARN_ON_FLAGS` is never used
>>    --> /linux/rust/kernel/bug.rs:126:19
>>     |
>> 126 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
>>     |                     ^^^^^^^^^^^^^
>>     |
>>    ::: /linux/rust/kernel/sync/srcu.rs:106:12
>>     |
>> 106 |           if crate::warn_on!(
>>     |  ____________-
>> 107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
>> 108 | |             // and `srcu_readers_active()` only checks the active reader count.
>> 109 | |             unsafe { bindings::srcu_readers_active(ptr) }
>> 110 | |         ) {
>>     | |_________- in this macro invocation
>>     |
>>     = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
>>     = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)
>> 
>> The warn_on! macro always defines a WARN_ON_FLAGS constant and hands it
>> to warn_flags!. On configurations where warn_flags! does not reference
>> its flags argument (the LOONGARCH/ARM variant, which only calls
>> WARN_ON(), and the !CONFIG_BUG no-op variant), the constant is left
>> unused and triggers a dead_code warning.
>> 
>> The warning only surfaces for callers inside the kernel crate itself:
>> uses from other crates expand an external macro, so the lint is
>> suppressed there.
>> 
>> Rename the constant to _WARN_ON_FLAGS so the underscore marks it as
>> possibly-unused, matching the existing _COND_STR constant in the same
>> macro. The name is still referenceable, so configurations that do use
>> the flags are unaffected.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> [Cc Paul]
> 
> Do we need a "Fixes" tag here?

Right, we likely do.

Fixes: dff64b072708 ("rust: Add warn_on macro")


> FWIW:
> 
> Reviewed-by: Boqun Feng <boqun@kernel.org>

Thanks!
