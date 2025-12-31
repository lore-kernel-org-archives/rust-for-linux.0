Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAB83101B0
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767183718; cv=none; b=IabcHlVt1re4bvN18QTCQbzsooIpKkzvaNubU84Sfl2DLO8NT7ixNIAyPG/6K4y9u1qowm4B6fLkm5CVch8zEuwyFSCKzPpNGqNP7F2pLTiS5Rbakz/DjpaajhG3fBy1d21M2J3Wj6zBigQraj4e/y2cbf2v/Ys7WsO5Ygl0rcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767183718; c=relaxed/simple;
	bh=vDYEFC/1ZVknYn2H4nn49xNZKvkbj0AVhwkeRtZjduE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Oj9EjCccMWX8g9vpMesXJydUOZ579Ayna79INc6R1GZ3A5UpezsXkutECBc7DjBfwkuoZyTUcZe7VAwUImPllU5FhStb0/9acxncM2+obfJubcqShkSCyr/mNR781Jplaj6DiUFvsSuwfgLy0k1R/CRkfugPdjp50RvLyEkV1NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaqYAudL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaqYAudL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so12226028b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 04:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767183716; x=1767788516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiPh9iNHDcZdxkSlmhXO/2HAlh7ZmUw+8qvd0QJAg2I=;
        b=NaqYAudLUQ2i1WChcDHg/9jIshtGewVU+rraXREV/nvJLlF7W0rhbO4BYq9/IJKQK+
         fbuRFFLGRKJcWKVlc6zxPyOtcDySIxhHay+4ztaHqR1Gtffok2uhvP1iCjhV+fTgsQtC
         woeloAIcC6RVwr6kJLXN7R4o65u+KUYDg/CXZaHkAIQr8+9F4+Yy21R+BtF+1joZZksp
         yg3Q1nkqMAx/fpfb9/QR7vcwlSpSZZMLLdTANt4KTEYzrjSjSyIGsDks+bkG46/7dnC1
         u86d6zhSRzrA0evDSuqvqGSIARR1+LkNONlwpFg4ZVb3lSZ0LTtMTZUFtqGRMKkYx6RT
         /QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183716; x=1767788516;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiPh9iNHDcZdxkSlmhXO/2HAlh7ZmUw+8qvd0QJAg2I=;
        b=xRyMZrlD2OycgnM7AmVHsiS/Sa+wyvgoJtwQG7KTYHjBjgVijQild1X6gDCRk8DVRU
         b7N7+qRhtVRG9rolgJ3jI1iCQ45Q7Np2FKxiDJAGKyZrWYgK7gkNGzJg5aLoRVriIjFP
         Ji4ecK5paDq9PYSzEp/btbouoAB1D4ASREfgKltuFWm0hwumGHAFfBSm4FHbn6kKE2pp
         X3c5TLHaukWBSGdEP/Ue9x0WpOoIEfslTSW5TD22DiC0ghkFSU1XnzZ+29uSBerZ0al2
         gwe3yFKQGPPSD2v52NOpQn/GLaS/EaHRw3qnNcXbYi3tjkvq3ON3QVfXksnl8Uqoxy6+
         h3PA==
X-Forwarded-Encrypted: i=1; AJvYcCWSziDHRPRTPeIR5unBSh0HMdG/hL876mb1CH9d9j6aPJxNeGWTpRb7P0EQCjO1le9bSe1DqW4rO8dlAURKjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYx3fCWHKiYAjHl9pJQI5Y8zGmO8Uh9mG/2JW88GLviBAh5oZR
	vZKzaO2MHO3tVB48489SoLbMwjrB/l8gJXBaevRsjVvhzPw2V6OpUTRi
X-Gm-Gg: AY/fxX5I7MVzyaQBXJOFDnos8kStpWvNj9Bnkd1YX8fwQklt062EHAye9TCBxly6m3L
	UtptxKxHKCzysjSHs5yWNWXomrCmWn0So6nKT6Ws6EbBexokgdxNQTZESgPoE+cVpdvtIM6Q4s5
	0DtRrXNR+sxPfQKVV4u2KWZMe8SefhTTnvxlsxGRRAv5PC3ZAdl//z9QnaUOE4EeMJkzuRMi4ez
	FPni8CchJ9GVI+Car21OazEI5xIwq3yNpEDD+8sbqGcGLuLmvaj329k162ySTsVB9e6JBcAjgpQ
	s71kroYIOuf7RHxuWwfZGNIiUIeRmnpqet6GGgXPyVKcJkRT7E0aSZDFLAliBL6WjZsOpVHMsSo
	W7kKvknk4NapzIOtqw7BF7xZtgmXkumYy0I77vUvFBXkOGT+nagr0wczNbzywuLn9Hb34kJcR3l
	S9j+NbMbmvq+D6FtScQj25g+7q3+wEA65mjLWPKhuGzCGCWr41eZ0CgtZ5sxVqR0fLhdY=
X-Google-Smtp-Source: AGHT+IECgioPTsy7O8h4IMn7prBqsQJ/6jdGSCsU2tlyHIbj0RAMCS1DIWe+8/Sx5YpAoA1u+jIUjQ==
X-Received: by 2002:a05:6a00:140f:b0:807:c2b9:38ec with SMTP id d2e1a72fcca58-807c2b93f63mr16449954b3a.15.1767183715580;
        Wed, 31 Dec 2025 04:21:55 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961c130sm30128093a12.3.2025.12.31.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:21:55 -0800 (PST)
Date: Wed, 31 Dec 2025 21:21:51 +0900 (JST)
Message-Id: <20251231.212151.889123388469793161.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add atomic bool support via
 i8 representation
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVRWDgb29OkHAGnY@tardis-2.local>
References: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
	<20251230045028.1773445-2-fujita.tomonori@gmail.com>
	<aVRWDgb29OkHAGnY@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 06:45:34 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Tue, Dec 30, 2025 at 01:50:27PM +0900, FUJITA Tomonori wrote:
>> Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
>> representation.
>> 
>> Rust specifies that `bool` has size 1 and alignment 1 [1], so it
>> matches `i8` on layout; keep `static_assert!()` checks to enforce this
>> assumption at build time.
>> 
>> Implement `AtomicImpl` for `bool` under
>> `CONFIG_ARCH_SUPPORTS_ATOMIC_RMW`, consistent with the existing
>> `i8/i16` gating.
>> 
>> Document the additional safety requirement for
>> `Atomic::<bool>::from_ptr`: only bit patterns 0 (false) and 1 (true)
>> are valid.
>> 
>> Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic.rs           |  1 +
>>  rust/kernel/sync/atomic/internal.rs  |  8 ++++++++
>>  rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
>>  3 files changed, 20 insertions(+)
>> 
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index 4aebeacb961a..2c998cbd300e 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -158,6 +158,7 @@ pub const fn new(v: T) -> Self {
>>      ///
>>      /// - `ptr` is aligned to `align_of::<T>()`.
>>      /// - `ptr` is valid for reads and writes for `'a`.
>> +    /// - If `T` is `bool`, only the bit patterns 0 (`false`) and 1 (`true`) are valid.
> 
> This line is unnecessary, since "`ptr` is valid for ..." means `*ptr`
> has to have the valid binary representive of `T`.

Understood, I will drop this in v2.


>>      /// - For the duration of `'a`, other accesses to `*ptr` must not cause data races (defined
>>      ///   by [`LKMM`]) against atomic operations on the returned reference. Note that if all other
>>      ///   accesses are atomic, then this safety requirement is trivially fulfilled.
>> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
>> index 0dac58bca2b3..0e12955082e5 100644
>> --- a/rust/kernel/sync/atomic/internal.rs
>> +++ b/rust/kernel/sync/atomic/internal.rs
>> @@ -16,6 +16,7 @@ pub trait Sealed {}
>>  // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
>>  // while the Rust side also layers provides atomic support for `i8` and `i16`
>>  // on top of lower-level C primitives.
>> +impl private::Sealed for bool {}
>>  impl private::Sealed for i8 {}
>>  impl private::Sealed for i16 {}
>>  impl private::Sealed for i32 {}
>> @@ -37,6 +38,13 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
>>      type Delta;
>>  }
>>  
>> +// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
>> +// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
>> +#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
>> +impl AtomicImpl for bool {
>> +    type Delta = Self;
>> +}
> 
> I don't think you need this impl block.

You are right. Only the backing atomic types need to implement this. I
will drop in v2.


Thanks!

