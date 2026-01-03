Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656AC1FC8
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767477208; cv=none; b=K3iAEbjmyBHcqFGiLrYNWnFmgSDSDC5kA8rbine0rne0eKEuez6KbZSZzKvvSztC55BzVdPHtsnKX0iVt4V6BYONziCRjIyer2fkjp1gBLJf8LIoXIaX9OGhB6q2kfyz/7Pw09hTg3EpkhWCpJByrZqmXWj/Beq/BrxqyiFxg3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767477208; c=relaxed/simple;
	bh=+a0rZ61BlR4asBFS2IQXtu1dxzG09+n5xc1pwtVYw6g=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HMCwDJ9AhDKBv0FOpu+BSnxRoL4LqVu92RwBEXSMFnr/BuHNakD7vexRKUptSehNIKDOZg9qvZOvi8FiMNs878O53K6pipDZ9RzRRu4RdqBWUUZqrEaqqWUUKPpg99yMTk/wubBbu0leuqJWMBNuFN4F5bio0jaDccOfN14+DDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7MeLHpN; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7MeLHpN"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c708702dfso13804955a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767477207; x=1768082007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVEPKpy/6ii8Fxn8hb/Lg9OkHV0SZSbCKptj+BZGST0=;
        b=B7MeLHpNMok4+Dl1/iwvHRxFsvgpe5kTTl99sjk4z4Aha8jMm5TnlIxpEiqtaurq1L
         e5NzyY1AuN8+56ACDCudlfkMwFkdO3qj1+MtJfI0V3aCaBUyPbgE5baY5Qxh40a1Dxrm
         IO6LxeB65YAI1/PDm+DpSCs6nNU30BgKlVyH5Qt33lszw0oBfn2QmC/zmwFwNvEbXZkJ
         0qQ9yVYQi2s0t9LNmhEQswFi8esQ8c4XGmwBDaRF963X7FCPr/25WC54FWlIpy95B0IY
         DGqmWbKwZ73JQ4LaVyYdpsBaQKOioCPW/PBxtkfW8ZW+M1k5PAoQkp4BtAiilW4Cj+VY
         3DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767477207; x=1768082007;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVEPKpy/6ii8Fxn8hb/Lg9OkHV0SZSbCKptj+BZGST0=;
        b=XjjvCXdo53KAYDLVWWlS5JVsblXJFHEAD4zAzL9DOjvhcmnhFlKU0+r5qRz74I3rRA
         Z3gfZe9uLic1HLa0iaoDVYYVUekdypv8nQMS8uVT1aVblIeCPPlaCj8fwtjSibetsEL8
         wpACr8jSnYetg6w/6irq+1oMYKXqSwJgzPxrUagoc/icLOe3Pt+rv9uhMgIWU4EPVsyg
         IyOmCvH0LVy8D+qqbPcLBNs33UtzCp9yt31Tf6m9EYTBd11Kk4ZRJ8cS89wfYvwDwu9V
         T/GfzpBnVPhC4bsQlyxlckdZAYv8ToDlCGl1nTLAYINS/6g5/3C1IM8qXbIzLON5ZR54
         fxKw==
X-Forwarded-Encrypted: i=1; AJvYcCWK/ziziOXhmYWm1yteHFNtIYBp9XkuqlRPNzz7bjVCGWNo2JVRbPfnpjMmcd8Hr8ItBhWdugcaOAyVtcPazA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/OIJn8XNcBnvg/QaxbqXcGyYIr32gAeaj9oCogY1H7H+j5YI4
	Vl6G+WmGeJH5F+/CChzBNqtJhArlM/NeJGld995K3p3jSu3slsIPy9rTOnReSQ==
X-Gm-Gg: AY/fxX76bt+hCH/OS7QXUPD/9hhaJgun6pGqt3xJKVb4EBTUXLs9dQXMwtH44BDrjn7
	TwCmRtO7vcokSq1Nl50NUFMS/m1u5RPdy3q7SNVpGpaChoo7iTp7IZsLgjVamejAt1wNdYlq3OM
	3zw7cckGn7NScNNR3UnziOKCeCU9jsTqiD5nFV2wZNG3o6GMBwPoOdhvmLz0idd19GoBrtUyD1D
	lgv8+WxtzkyBGD8ejVon/p2uhyjIXukamJo7q33IgoxCbrw7uytwHAKSoC00/NT2S2uoYOv+Suf
	a4A3vq7s4w0SiN9VZVJve2VcN5FPNI+8OG86of2P+O1QcQBLRSOATOAJbn+1HiIux/4xGor4nmw
	f1ozh8v9sO4RivxP7IzrmdfE1OpqR2twrrJaLc2txX5vdOoDptljgw7is+9LzFd5AYaGnu5wgbv
	2Z4BUtQMFjXyp2ABn5m5Le9NFW91a6czthHhgsz/yBjt6xsxAZLb9VpK6VRNCa1nqm87mPtpe6N
	cI19g==
X-Google-Smtp-Source: AGHT+IGL/W8SoSD2fmGfa2gB+6LIj02HrBGjLwShgzdq0BkitG600i+3wzdiUmWQGf2CnNieEduBeA==
X-Received: by 2002:a17:90b:2585:b0:340:bb51:17eb with SMTP id 98e67ed59e1d1-34e92131db5mr39951859a91.15.1767477206570;
        Sat, 03 Jan 2026 13:53:26 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4751d783sm2468879a91.0.2026.01.03.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 13:53:26 -0800 (PST)
Date: Sun, 04 Jan 2026 06:53:11 +0900 (JST)
Message-Id: <20260104.065311.609258219418619592.fujita.tomonori@gmail.com>
To: gary@garyguo.net, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1] rust: sync: atomic: Add i32-backed Flag for atomic
 booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260103190511.2d267164.gary@garyguo.net>
References: <20260101210430.6b210dc6.gary@garyguo.net>
	<20260103.194448.560764475765900721.fujita.tomonori@gmail.com>
	<20260103190511.2d267164.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 3 Jan 2026 19:05:10 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Sat, 03 Jan 2026 19:44:48 +0900 (JST)
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> On Thu, 1 Jan 2026 21:04:30 +0000
>> Gary Guo <gary@garyguo.net> wrote:
>> 
>> > On Thu,  1 Jan 2026 19:27:18 +0900
>> > FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>> >   
>> >> Add a new Flag enum (Clear/Set) with #[repr(i32)] and implement
>> >> AtomicType for it, so users can use Atomic<Flag> for boolean flags.
>> >> 
>> >> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
>> >> particular, when RMW operations such as xchg()/cmpxchg() may be used
>> >> and minimizing memory usage is not the top priority. On some
>> >> architectures without byte-sized RMW instructions, Atomic<bool> can be
>> >> slower for RMW operations.
>> >> 
>> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >> ---
>> >>  rust/kernel/sync/atomic.rs | 35 +++++++++++++++++++++++++++++++++++
>> >>  1 file changed, 35 insertions(+)
>> >> 
>> >> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> >> index 4aebeacb961a..d98ab51ae4fc 100644
>> >> --- a/rust/kernel/sync/atomic.rs
>> >> +++ b/rust/kernel/sync/atomic.rs
>> >> @@ -560,3 +560,38 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>> >>          unsafe { from_repr(ret) }
>> >>      }
>> >>  }
>> >> +
>> >> +/// An atomic flag type backed by `i32`.  
>> > 
>> > I would recommend that we document that the backing type is the
>> > (perf-)optimal type on the target architecure, so arch can decide to use
>> > i8 as backing type if they prefer.  
>> 
>> I'm not sure I fully understand the intent yet.
>> 
>> Do you mean we should document Flag as being backed by the
>> (perf-)optimal integer type for the target architecture, so that the
>> backing type can remain an implementation detail and potentially be
>> selected per-arch (e.g. i8 on x86) via cfg?
> 
> Yes, I don't want anyone to rely on it being i32 (at least for now, before
> a concrete use case of doing so appears).

I see, the following comment works for you?

I thought Boqun had Revocable in mind as the intended use case.

/// An atomic flag type.
///
/// This type is a performance-oriented boolean for atomic operations.
/// The integer type used as the backing representation is an implementation detail, selected to
/// be (perf-)optimal for the target architecture.
///
/// Currently, [`Flag`] uses an `i32` representation. This is because, on some architectures that
/// do not support byte-sized atomic read-modify-write operations, RMW operations (e.g.
/// `xchg()`/`cmpxchg()`) on `Atomic<bool>` can be slower than those on `Atomic<Flag>`.
///
/// If you only use `load()`/`store()`, either `Atomic<bool>` or `Atomic<Flag>` is fine.

>> Yeah, that sounds like a good addition.
>> 
>> +
>> +impl From<Flag> for bool {
>> +    fn from(f: Flag) -> Self {
>> +        f == Flag::Set
>> +    }
>> +}
> 
> A `#[inline]` is warranted here. Also, it'll be good to have the
> conversion for the other direction too.

Of course.

+
+impl From<Flag> for bool {
+    #[inline(always)]
+    fn from(f: Flag) -> Self {
+        f == Flag::Set
+    }
+}
+
+impl From<bool> for Flag {
+    #[inline(always)]
+    fn from(b: bool) -> Self {
+        if b {
+            Flag::Set
+        } else {
+            Flag::Clear
+        }
+    }
+}

