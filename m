Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52222127E
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 00:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763081264; cv=none; b=tBHkQTbrlVspit05BQ1KhKVndEorEhlgHvwoGLhpEG451UoHrKRbEzrpFpi85dWmATXO4x2mdae91Q/9lu4O5Quy0mAMSmRHlMnDhr/Qb0tU6xMNJAGFseio8zjIGKuCPcJEJeryQ8asVPwmExnyRF09+cUE9cUjbOydCKR+1jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763081264; c=relaxed/simple;
	bh=5n+sa4aHRAK2T+kYOAdIPbZqgIbdoN2efYPGnm6CPA4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g3WJfQyaWIChBEuwSXyNZJrfIRK8FAc45p9zpKxGg5SeVseyGwyp4DBgo7TCNI7PjIYolf4Ufcaq1cVEzJ+Hso3uDT2zhz3vjcjG92AJ1qIqtFxLnFJXal6A6WGuf0WwoAA8Ah4VAg7sz8mbMBWSNhHuCrmjK/T8w1ZCs4s9KiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqDVJ+nS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqDVJ+nS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-343806688c5so1326938a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 16:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763081262; x=1763686062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dxwNvANcOwmWObBDDOdOqpZXG2Y8TyT7SlllF/njzM=;
        b=SqDVJ+nSzaG6rP+gdT2pJTbNI2kobR2pXiHoIdN0+9x4kh+1zQGRMLzyvaZgqH3zeJ
         K4T0lLp1Y4iLysxeWrsJNAVKMteA7ie7jvlSao2/mGNX3mRWCvDcm7vNagmy4O/Y5HSa
         lxHYt1B91LUeJ+TEhNZfKzyNgmMbADHfXq9XpdGiroinIiUPvJ8B4n/I1f0x89ozG0uK
         C6PECv9h19S27pNfgJeN2PibN2oDKMUnhw5EEaveNtqKjLS5eMsTHD2yaIFx4A9Bzpcj
         GtRh5XNGZOa8V1rVfRj8ZZkO/7ltdkZTRDrqQ9ur30Kq/oPO/YaQaxVXomh+e2tFmJ4/
         OF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081262; x=1763686062;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dxwNvANcOwmWObBDDOdOqpZXG2Y8TyT7SlllF/njzM=;
        b=la4Au450ExogqcchOZ+2JmCWIuPtNJss6GAhyTmfvwW8lOa1yXEOn3u8xrBNvRt5vk
         ZeBgkaPVw8mF4ah4miwzOCWHjeC9Zh8NYsT29weqIgtdHT+F9kUnKvHh8FR8nXEqoGIZ
         CHUUldjmMRyyMTUxzjS74kwoeiQi9JjbPHQc8qXseVnZaZMqtN2C26/5eX57O2Q6EELT
         EtmFbzUAANl+xRUT6Dvau9Z7WElX3wDRqaY9Bnki+EnunGQSF0kzPpbNIToxVgUSX1Xi
         h1sBHrwSM7i7rhlfVz9NQCxrGtEqQ+xCBH6fH4esCm6B8PR4MsL1l0C7pthemzrG4D2g
         5tVg==
X-Forwarded-Encrypted: i=1; AJvYcCV5AF3esoODTNsHVKHBszDQKwXPdd/C1hp5sReCBppdvpCji3z9TmQCBKL9UBq2+qNssLybMIkcjL4x52LIfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIjHKPbXonLc98i0vsWnkarpHP/NRYdFB1fCEI3p6F5qu1P+L
	WtodC8h9wUSaL/o0SRCxYE67mqQC/JjQMO4h76GhMXNuYTJ5pv3Pmapn
X-Gm-Gg: ASbGncvB35W2WmWDXHMPrdLdLCkfLnx8lYLDJpE39cC9kSNxzng1n0iAFe2KTxA6gSf
	a3j0Ek+2dELcOg4BSmEXJg1huFDSdTnShdI9QTm6TsImlY+l3EvkzS5PJV1+M0f+3CY0VsDb5EU
	4fqHjcmDvZb6Z0nMemeljyiEPSWhl1eV2fofHS8Qe7RQfAhUZSt6ETOkoBOlfb0doeJIHD474Fx
	sR++byKZxYOFnVTj6Vp+2nXXU8XAw49astl6LDW+crHDxYRk5ei8ghVcZU9KxKhz7lOW88Hns05
	96hmCaZ1Cq3KiJ+0w1Ie56kFb16dEImcqykE50tC6I1iEpssqU+XNgmaemvMdxyoEOog5FcrPz+
	6XIEpp5daCnBgCuMoDpX4cZkRhAK+XBTTnFGzikH1LCkuv8RdX0euq4XT1j5Cn+Ab8SoZKKTRyL
	ajVTTOBU/VppWSodgBWTdboyQVfYxql9W9jU2mhqnwNXLbJWrrMr0AEMm24CsQb5X8
X-Google-Smtp-Source: AGHT+IGdAssJjQzr9AlNvp/p57rWMKbYRCQlSI45eYFU1zLkpBc0nR6KKN6brPv33AfuDUzdiEFXWw==
X-Received: by 2002:a17:90b:4fc1:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-343f9e90730mr1295216a91.7.1763081261889;
        Thu, 13 Nov 2025 16:47:41 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ea6dec2csm2152954a91.1.2025.11.13.16.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:47:41 -0800 (PST)
Date: Fri, 14 Nov 2025 09:47:30 +0900 (JST)
Message-Id: <20251114.094730.791355531242483716.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRXJuUTR1fnWiBQF@google.com>
References: <aRWt6Ah8KuBXff8V@google.com>
	<20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>
	<aRXJuUTR1fnWiBQF@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 12:06:17 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Thu, Nov 13, 2025 at 08:18:44PM +0900, FUJITA Tomonori wrote:
>> On Thu, 13 Nov 2025 10:07:36 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>> 
>> > On Wed, Nov 05, 2025 at 02:47:29PM +0900, FUJITA Tomonori wrote:
>> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>> >> pr_*_once macros.
>> >> 
>> >> A proposal for this feature was made in the past [1], but it didn't
>> >> reach consensus on the implementation and wasn't merged. After reading
>> >> the previous discussions, I implemented it using a different approach.
>> >> 
>> >> In the previous proposal, a structure equivalent to std::sync::Once
>> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>> >> to provide Once-like semantics by using two atomic values. As pointed
>> >> out in the previous review comments, I think this approach tries to
>> >> provide more functionality than needed, making it unnecessarily
>> >> complex. Also, because data structures in the .data..once section can
>> >> be cleared at any time (via debugfs clear_warn_once), an
>> >> implementation using two atomics wouldn't work correctly.
>> >> 
>> >> Therefore, I decided to drop the idea of emulating Once and took a
>> >> minimal approach to implement DO_ONCE_LITE with only one atomic
>> >> variable. While it would be possible to implement the feature entirely
>> >> as a Rust macro, the functionality that can be implemented as regular
>> >> functions has been extracted and implemented as the OnceLite struct
>> >> for better code readability.
>> >> 
>> >> Of course, unlike the previous proposal, this uses LKMM atomics.
>> >> 
>> >> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/
>> > 
>> > There has been a fair bit of discussion below. Here is my take on the
>> > way forward:
>> > 
>> > 1. OnceLite should be it's own special type, and it should be in a
>> >    printing-related module, not kernel::sync. The reason for this is
>> >    that do_once_lite! is hooked up to a special section that allows you
>> >    to reset the once status, and if someone used it for anything not
>> >    related to printing, they would end up with being incorrectly reset
>> >    when someone resets pr_warn_once calls.
>> 
>> Do you mean that only the do_once_lite! macro, which places the data
>> in .data..once section, should live in a printing-related module? Or
>> should everything including OnceLite struct itself, also be moved
>> there?
> 
> I think both should live in the same place, and not in kernel::sync.
> Whether you call the module once_lite or print is not a big deal to me.

Understood. In that case, it seems to me that either adding everything
to print.rs or creating a print/once_lite.rs would work well.


>> > 2. I would suggest just using a relaxed load followed by store instead
>> >    of xchg. This is what the C-side does, and I think there is no strong
>> >    reason to deviate. It allows for a single byte of data instead of i32.
>> 
>> You meant best-effort try-once logic like C?
>> 
>> pub fn call_once<F>(&self, f: F) -> bool
>> where
>>     F: FnOnce(),
>> {
>>     if self.0.load(Relaxed) == State::Incomplete {
>>         self.0.store(State::Complete, Relaxed);
>>         f();
>>         return true;
>>     }
>>     false
>> }
> 
> Yes that is what I meant.

Sounds good to me. As I wrote in another mail, I think that it's fine
to use the C-side logic here.


>> Using u8 as atomic type instead of i32 would require a fair amount of
>> work, since at the moment only i32 and i64 are supported as atomic
>> types, right?
> 
> Supporting u8 atomics in general is tricky, but I think *specifically*
> load/store should not be a problem.

You meant using read_volatile/write_volatile? Since we only need
"Relaxed" order so something like the following?

#[repr(transparent)]
struct AtomicU8(UnsafeCell<u8>);

impl AtomicU8 {
    #[inline(always)]
    fn load(&self) -> u8 {
        unsafe { core::ptr::read_volatile(self.0.get()) }
    }

    #[inline(always)]
    fn store(&self, v: u8) {
        unsafe { core::ptr::write_volatile(self.0.get(), v) }
    }
}
