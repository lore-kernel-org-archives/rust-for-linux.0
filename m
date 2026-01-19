Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4C6FC3
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 23:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864148; cv=none; b=JbkOSSLauFSNO/jIlw7tfiMHsDBkn7JYtCByF/vob1hqyqG+GOgDV37hgbLU9tJ3/cIMzG4b1cF6p58Sp4XwzNRcHspuXNG1sjnpzQtea19EoOEEyNkCl5GsZRCS9qr38GA9QKQegshpe8HLzeyH5CWjG5dZEVEBpWhOljjMLvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864148; c=relaxed/simple;
	bh=Ds0eyopJknwjCTNEAv+5AACYG2lkeMjB32EHjk4UMxw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sVJUZeds1Eb6LRH2YJ7y6h0j5OiG4veEkptMyXs5W9a8nxDU5CTDsN3XY8O9FaD7aK/AD0BjpL9v0ScaOMtESaIjVPnbXZ36HAsYSPwmoTak5SWVs6gtCIWKKlABoWZ1DkUdRDSLTB7OSRVuuu+mLfDf12KmoK4KERGD7DEnQ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMyygtI5; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMyygtI5"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34b75fba315so2327093a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768864146; x=1769468946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ran39KAtD5+cQNPovPVe+0b09NCsOdmKxCsIXItHC24=;
        b=nMyygtI5yQoDkRUpy7SjCd0dVGyUESQ9lElz6HlJ+5BJ+tbaH6RzB+iekXWwNjRMH1
         Ep9YQl98Ajm/B6vV6G5njSRKIP+x7n5NmXGV3rvnll5g4fKFxLAhJHFj8UXylaNu6flR
         GPghuZIqNYIcPUYarjQMlScE3PNOzkQZsnlwkYixnEfowDpWdw6Z+NQWV0VLi8pSjW1S
         pE0X7xsEQwRg0uX2ZdagqpZ7nF8oFdOXZ5aoCxg/acZSK/nt8sSbEoomujSs3yPysri0
         xBTXpEjG4BRRvl3fDz+ok1YSLGlocCZ7CbWnel8khWZ+YEtMBbL9cFLeb2SXQd9nXauD
         XYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768864146; x=1769468946;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ran39KAtD5+cQNPovPVe+0b09NCsOdmKxCsIXItHC24=;
        b=Wu+wgeoGVEN1JyO8BRamwzFTfLNP6VebFQIP4S4g+ukJv5JupXhieZTXt/9mFEx6l/
         jHFyJPpHJXjf3KryU2//Wzx05OTtpcCh3xVq1RoZay4PcrqGdwOZWcHC2X1RbjUnqatx
         rWqta+BCuMiUNh8+nVieKFLwm81YZx0hSfdQ/1IcZSzstkorjaQCv9A80AsgNPdRNEvB
         FVx0kJ1NssPWTtsKbqm+6xMymR/iMURkR+AiZbmdVLH5ABFg/kKE95E+Dqe78/NbophO
         CWiNuLwc7gOxS119AOtvqJOXUjZoSWFOCl7sQUp/vQ3MHEVNNg+FLyN96Fm+OameZQIk
         wzRg==
X-Forwarded-Encrypted: i=1; AJvYcCVdxy5EmPYyvbpMP5aezdWBowmDRjtt+vNE9WK73imR0c2zpAFCIZAKa5mCXMjUk1ombR+xUXt7IO6qBtAfBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WgVBsspSql2r7fzDAMhgkTKH0R7g9IKf0nlIgNKgnDfsa3mz
	WIhCp01aFiYpZb42Vy8u+jDtQ/01ss6xr26KaOi4WjOM4idWJAS5LY3s
X-Gm-Gg: AZuq6aIfRZ3q1sVARBevWQKi4e5P9ozcFR8gRDqWwBaFHwL6UpmpQYs4d0GdkVeJZQK
	OQW5kzJfYOqkqn7PPN9N50Ri8oTG81vajFt3G6maEn49cLtXNxBW/8wII+Zbj1SXmdwpSdjQNhR
	tMatv1GQ7hsecFCHxaCcRKpEe8FlsVxlhZMskYLQ62dJcuscvzgTzibjGTIgMLGpYmwyd0YM8tl
	95gJ1DbHJrA2GJEnp/zsYaTg0yX3VyrgMH+rZOX4iv77MwhDYK39vZD2XzY59nprS5FICtrZNi7
	5ietTJ2jrMHpvTbqeu5XouiMzXx5KD8DX8OB5kiGnMYGIUPw2/Davhs68wzymffsNfZniJNao6l
	yyrTuWCwjNIbK/Sz443Ye8Odnlwkj/OvLIYY1ttPpdK1RADLyZu2h9/5O8TEoaHz/ELU/6Qbdn9
	jHFAbV9bRNrGKaCTmolnvoVuF6qh4Ongudfs7L3WGvJEupMq8+4vLsed5NhNdaFpKVbK0=
X-Received: by 2002:a17:90b:574b:b0:341:c964:126c with SMTP id 98e67ed59e1d1-35272fcaf90mr9925270a91.34.1768864146239;
        Mon, 19 Jan 2026 15:09:06 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678c69fasm12623829a91.14.2026.01.19.15.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 15:09:05 -0800 (PST)
Date: Tue, 20 Jan 2026 08:08:51 +0900 (JST)
Message-Id: <20260120.080851.1721614339637284826.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/2] rust: sync: atomic: Add
 performance-optimal-integer-backed Flag for atomic booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260119.121025.255021656975699898.fujita.tomonori@gmail.com>
References: <20260115021230.3297420-2-fujita.tomonori@gmail.com>
	<aW2HQvo2h46WecQ3@tardis-2.local>
	<20260119.121025.255021656975699898.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 19 Jan 2026 12:10:25 +0900 (JST)
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> On Mon, 19 Jan 2026 09:22:10 +0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
>> On Thu, Jan 15, 2026 at 11:12:29AM +0900, FUJITA Tomonori wrote:
>>> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
>>> users can use Atomic<Flag> for boolean flags.
>>> 
>>> The backing integer type is an implementation detail; it may vary by
>>> architecture and change in the future.
>>> 
>>> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
>>> particular, when RMW operations such as xchg()/cmpxchg() may be used
>>> and minimizing memory usage is not the top priority. On some
>>> architectures without byte-sized RMW instructions, Atomic<bool> can be
>>> slower for RMW operations.
>>> 
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 71 insertions(+)
>>> 
>>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>>> index ca9cab77abf0..58f57903460f 100644
>>> --- a/rust/kernel/sync/atomic.rs
>>> +++ b/rust/kernel/sync/atomic.rs
>> 
>> I prefer we can move `Flag` into atomic/predefine.rs, I queued in
>> rust-sync with the following version, please let me know whether it
>> works, thank you all!
> 
> Works for me, thanks!

If we like to keep the intra-doc-links, a workaround like the
followings seems to be necessary.

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index f6c7538cb47b..92e312c06595 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -156,6 +156,13 @@ fn rhs_into_delta(rhs: usize) -> isize_atomic_repr {
 /// flag.store(Flag::Set, Relaxed);
 /// assert_eq!(Flag::Set, flag.load(Relaxed));
 /// ```
+///
+/// [`Atomic<Flag>`]: kernel::sync::atomic::Atomic
+/// [`Atomic<bool>`]: kernel::sync::atomic::Atomic
+/// [`Atomic::xchg()`]: kernel::sync::atomic::Atomic::xchg
+/// [`Atomic::cmpxchg()`]: kernel::sync::atomic::Atomic::cmpxchg
+/// [`Atomic::load()`]: kernel::sync::atomic::Atomic::load
+/// [`Atomic::store()`]: kernel::sync::atomic::Atomic::store
 #[derive(Clone, Copy, PartialEq, Eq)]
 #[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
 #[cfg_attr(

