Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942F1A23A0
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 00:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762908316; cv=none; b=WuNW756siwFn1R9o3ci8GhYbEd8FwuMRHyohti9x3aFKnRFCFzYe4LlzTGlkoXku9kWM7YPZZQRBfg+LzURG3EK07znomIIEerIrvP68KWQULO0Se7CEFiBzThCft+s4xYansHvdLf0fyh+WBzfhvdsMee+g53w+aVN1wE8SKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762908316; c=relaxed/simple;
	bh=J2wYUVIHMjS6Je47/bSE+sjcVEjP0HSI//2xcCsLOcI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eYZJPEr4RfRpOK4Woqtz89mKZOAhH5DJUsOQ9UYiaUfbEM4vDJSZFr9kMjDPR2niJACl3FJ0s8O8uQlNDPxeEWR1TiczemU5n/PsDup8Sasxu9AgkhtRQRZtb2DFxw2+MbzXh270w4WBaZqm9CYpvgWEQG63v+ylXeKrnb1eAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwEkmWxa; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwEkmWxa"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so205879a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 16:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762908314; x=1763513114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FINyTmmyV03Eh4lH3IvvVPw93s1H1ZfmY37sw7aBwgw=;
        b=PwEkmWxasAqZ8sthtdICm9JlYXrNdpPAsMlDJjUNwAa7AQwwWaFSh0oXFDgTQ2qpQ1
         E1O+DRhrcR8VQiWB5bXK2/4yR1IOPTyPdF7e6Le9f+03zmYFScgf3Ohd5ECRA6XE9d1G
         lpwkvFcKsAqRPp6m1rwFD4bycBUgmdnuFWU2qUL9EQnVqjCAgsJM6YL0rBlxgPk8XVMY
         ggNMPfgBmEp+AV6XNawCU6R0YrmWmnM2SW+/elMt9YZbaSuo0jGy/ili58uRq4s+RuJw
         z7AYr8V+t4URCOWSxKr5K3/JGbCYdRSNDjgHN++R/R3wKM5h/Kk4m7eV4LKb93rpG4lK
         uQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762908314; x=1763513114;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FINyTmmyV03Eh4lH3IvvVPw93s1H1ZfmY37sw7aBwgw=;
        b=g5JETdmVLVBkOr4LqHyZDWVQN85u9bJZOMIAINDVUJkdGtDCfkWLxyjx9AN4faXLTF
         FUVL/ynJMsQgY0SCtTg94/p4CC84yNDI/zgS1u1gpp+cNY8tfsXTJZCMWkjvR1NEI35t
         EgqJjfhrywFtT1r9gzOQyx5bSRmq5ZNPgA9ON7PhNji++TctM1AiqSizu+JIapiIs6lM
         IzWdotEMyp88tFTZ0yNx9nPuI1pY2pUiaN7agqyIirkhCzaW/8FdsDe8KO+yXVYZwzhP
         v/HQfwLHAZOVUWYKo5XcvzsUcV6VTM03kwpGcAmccrEKS98zV79xGGJZ+YbM0Yn3UZUd
         Uz1w==
X-Forwarded-Encrypted: i=1; AJvYcCVPjVsdKcbF4lORLaAV/D6SCasWYkZIakRmYptX1DWHW19rqcABPYtKYkxl3+3m9FQlIaXtVbcWIIyjgSe4gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBR/h/SzpjjB2zUPrINrG3uotnSuzYK6OrNdeg0AQqUHt5BDW
	31KMU0WpQCt8jTK3HDQUOJxt69sdjHC1YAsmKZOLKKyHt1dNzFI/6inZ
X-Gm-Gg: ASbGncuvs+4sGIh5yG+/dFI2w/a2w1XjarlbiNacplGvScUIyCtGAAy9A+tKICoT/Gt
	lsq+3TzETneBYKVjFt3Kk7BZu9CB8o65//OkL/YLEs7sXwJ9yi2yTVean0kg8mp+CQdssjnfUpB
	PC7ca5JnkyN2KrQXcDVL3y0p1saf7Io4Ll2syGDjZeCGN74qad20sNUaAj5z+L4vT2hmwzenSfE
	149iUF+XVOt85aQ49bWf3ZH6FsBexRcRu7AruUezctGwGOfA+z/VKv9goOf2eSq0y3lYtZDin/P
	62SjbT2gC++1qyQXe6heo8tKCoUATlHWO08KP8B68RSAX+fEP2orn+Fx2oxl/DTR5eGzHo5bOUJ
	W0COUT89QOVqGbY/aQgrRfQbvxjRty1jwSSX3EZK0i/apnLLRy1eH2aiCHJFJUW6gWaaJSjBuOA
	8YPidvWr8Ga5wOW5GeoVEQZ0m7oorjbIuKHBgs3tCIy5xuILyTkuEaPw==
X-Google-Smtp-Source: AGHT+IHxihT/hPGwWBOV99qOUZR6lslO2NiNVGKJ+Nk/IyMuLF/msgPLT9zPIiyPCWLnSZS+FO5hmw==
X-Received: by 2002:a17:90a:d403:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-343ddea7785mr1168931a91.27.1762908314440;
        Tue, 11 Nov 2025 16:45:14 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c062b6sm16420436b3a.18.2025.11.11.16.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 16:45:14 -0800 (PST)
Date: Wed, 12 Nov 2025 09:45:08 +0900 (JST)
Message-Id: <20251112.094508.554651669948369724.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87jyzx6ix5.fsf@t14s.mail-host-address-is-not-set>
References: <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
	<aRIN4U8L4-wQjyHj@tardis.local>
	<87jyzx6ix5.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 10:02:46 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Boqun Feng <boqun.feng@gmail.com> writes:
> 
>> On Mon, Nov 10, 2025 at 01:16:44PM +0100, Andreas Hindborg wrote:
>>> Boqun Feng <boqun.feng@gmail.com> writes:
>>> 
>>> > On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
>>> >> On Wed, 05 Nov 2025 21:59:06 +0100
>>> >> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>> >> 
>>> >> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>> >> > 
>>> >> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>>> >> >> pr_*_once macros.
>>> >> >>
>>> >> >> A proposal for this feature was made in the past [1], but it didn't
>>> >> >> reach consensus on the implementation and wasn't merged. After reading
>>> >> >> the previous discussions, I implemented it using a different approach.
>>> >> >>
>>> >> >> In the previous proposal, a structure equivalent to std::sync::Once
>>> >> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>>> >> >> to provide Once-like semantics by using two atomic values. As pointed
>>> >> >> out in the previous review comments, I think this approach tries to
>>> >> >> provide more functionality than needed, making it unnecessarily
>>> >> >> complex. Also, because data structures in the .data..once section can
>>> >> >> be cleared at any time (via debugfs clear_warn_once), an
>>> >> >> implementation using two atomics wouldn't work correctly.
>>> >> >>
>>> >> >> Therefore, I decided to drop the idea of emulating Once and took a
>>> >> >> minimal approach to implement DO_ONCE_LITE with only one atomic
>>> >> >> variable. While it would be possible to implement the feature entirely
>>> >> >> as a Rust macro, the functionality that can be implemented as regular
>>> >> >> functions has been extracted and implemented as the OnceLite struct
>>> >> >> for better code readability.
>>> >> >>
>>> >> >> Of course, unlike the previous proposal, this uses LKMM atomics.
>>> >> > 
>>> >> > Please consider if it makes sense to base this on `SetOnce`. It is in
>>> >> > linux-next now, but was on list here [1].
>>> >> 
>>> >> Data placed in the .data..once section can be zero-cleared when a user
>>> >> writes to debugfs clear_warn_once. In that case, would such data still
>>> >> be considered a valid SetOnce value?
>>> >> 
>>> >
>>> > It's still a valid value I believe. In term of data races, Rust and C
>>> > have no difference, so if writing to debugfs could cause issues in Rust,
>>> > it would cause issues in C as well.
>>> 
>>> @Tomo you are right, `SetOnce` would not work with someone (debugfs)
>>> asynchronously modifying the state atomic variable. It requires
>>> exclusive access while writing the contained value.
>>> 
>>
>> I mean if we were to use `SetOnce` in pr_*_once(), we should just use
>> `SetOnce<()>`, and the problem you mentioned doesn't exist in this case.
> 
> At the very least it would break the type invariants and assumptions of
> the `SetOnce` type. There a race condition between `SetOnce::as_ref` and
> `SetOnce::populate`. I don't think we are allowed to race like this,
> even if the type is `()`?
> 
> At any rate if we do this, we should update the safety invariant of
> `SetOnce` to state that it is valid to revert the type back to the
> initial state for zero sized types that do not have a `Drop`
> implementation.

I agree. I think that even if the type is (), a race condition would
still occur if the init member were reset to zero using non-atomic
operations. For instance, the as_ref() method effectively checks
whether a value has been set, so for the () type, it would return
either Ok(()) or None.

Although SetOnce is designed to atomically set a value, allowing the
data to be modified by non-atomic operations at arbitrary times would,
as I mentioned in another thread, unnecessarily complicate its
implementation for a feature that would not be useful in other use
cases.

Could the root cause of the issue be that OnceLite, which isn't
updated atomically, is implemented using atomic operations?

It might be better to implement it with non-atomic operations, as in
the C version, as that would make the update behavior clearer.

What do you think?

