Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04420F067
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768257011; cv=none; b=kt7K9xQFBK7mVM9Zj/GI2qcJN1nCKlwwTVVyFeihBKHhqy60HONSw0i+fPHrdB/qITJW8J4Nwx1MNJq3E75Fj48L5KADBBBnSwGzbTkDVoe3GKphyaDh0xhl4KTHO+8FriEKNFTkkqFGHdtAMpgMzIFmp4s+kXP9gZjoowr5MwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768257011; c=relaxed/simple;
	bh=DArgTZi1jmhpLjzLsQE2VPBvy72hzPAWz98d5ywM6Q0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=keAosKAhoEvtH7nFkrS4jzD1oXHR1dfFV4YKuaEeww5emCHoLy8LSX/v56j6YGmXlo3kCv1jX0VYqENStMiHHgGvHZH3cZenqn+NYLlockV1ugJfvkjvcasr/tZPSqEP4cKmBhTARBHpGhBvLHuWvg+GOVk1htWvjVWkbR08Fuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9FjxSCE; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9FjxSCE"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f3fba4a11so2078677b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 14:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768257008; x=1768861808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgX7i15rekCrY4A39LifEvRmDRmHE2YeIjxcaolDB8c=;
        b=M9FjxSCEYP2HQyIQPxPjgiMvTWy+sHBUrpVP0ly7DcX9tjvKOnXD7MUf4AsBvZFjJ3
         7Qaxf41pK43mz7VTdvOnEGT+dw8vi28ymVKlpNgXlWTbKMORXFzms60NM+0WWyZotIl8
         iRI6hs+rNljJDIUeX+AT+qGrbigPu5Jiw4Ptf+2zZ3EHvJTDs8y5hX+lW5kjLkLj8KuR
         npjVmFFReFGjdMdwwNBxo/G5QTcE/YD4q88gavgtXQjrJBzNGyxndmiCh2HWXEUZ6NE5
         OPT8MXOynSsrpMyZDcti3Ysjtai991gL7EUO0qFAV4KzwJiNLb5KqMO/Cnd1ADtNlYzn
         5hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768257008; x=1768861808;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgX7i15rekCrY4A39LifEvRmDRmHE2YeIjxcaolDB8c=;
        b=PmB+u5A8/B/S38W8VjxfBrlfpVzYCh/Kp29bEIU0qI3dJ+DWvquxSEG4Q4yJf7dlk4
         8qS/QizMrGg5jvVJgRG3hzRkYzXt7GELeXVPqzgNyHBt1eY2ERArS0AbPF2jUK/0tF2m
         b6Dwy4jHAC4lGB/fT00DxLCDastBfbsvHtl7j8SqPXYO2WeAJ7Cq8QEw0uaH0H16ntr1
         +IOrBrGXwe22MlM7iKX0Fm7J1CHVCNAFZahmhmK4GquyL2sIO0UfP6EcCUY6vzE8bmHN
         r+P3BbDT4W5ukOWta9f6eQncpdXm90m1LqM1Q7wV+0O9xveOPe3hbUXmHC+bO212waEU
         WSZw==
X-Forwarded-Encrypted: i=1; AJvYcCVPh9Ac0xA53XAF0+D86EB0UAZpohW+Jw0FsPaJB/FXjwBkhl5VVAcOGungoCEGrvcMp5qe3+NL7SnkRj+2jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf+k8pi1VdsPiUGbfAz7spnpNFmhnLINkDSRjOJy0cTu5jPVUt
	sJ1MICkHLE1dSjPXuBlIqAcv9cV3J5qXvj+BZBDw3o+dORArNEZ9lv8F
X-Gm-Gg: AY/fxX5PB/cLgMZAl7OcworD4Aexz+O7KIsF2EaHR+9hovEe2GpxGdGYe3ve8f6xAg6
	n4+jV8WlB/rGjf7zsqy7/0J1KYq6TG7LQzKHsyjjMrqGkkGekNfAOuinsOzjQakSH70LQG6hFd8
	B4LY+YKUHq7LoyoMRs21HT6ZNynQgpjAoWq02Qq+n+oevyLTCIAbEkOEe04Z/OPJ+v+lMCyZa/d
	y5X/LHT8Gg6+mEUx2PfJ5AvfIY5lwHbdPPpIfkhL1WJd5r30foteLLxLNkdURxGHwbg6/5RywNp
	eL9bb6m2cU+kUVZQmX27uevK7kO09ex9/UFxqpN5b2TBEttCwcSkpNh5qqIukAY+VXtvJ9IsTdz
	YU+1bLSpAfI4SYXpfd6kiXeH5zqpFvXQOPV/UlUdzQuufpiq9L4P1huDEIjgmqYMEWdcW+DP18W
	tNaz28p/H0p2kYe04X+Bvbj6dbOVaNTugvFEupsyqlOFFMyOVppBp22gG/ctnbO0NTCl0=
X-Google-Smtp-Source: AGHT+IHW5GN0k32eQJDAf5dYJTIZXLuJl/EyFnleXvUY816NlRz4+36KNvvokFGnV3CpRzHBIRf5/Q==
X-Received: by 2002:a05:6a00:8518:b0:81c:7fa2:7ff8 with SMTP id d2e1a72fcca58-81c7fa2815fmr10395752b3a.66.1768257008311;
        Mon, 12 Jan 2026 14:30:08 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81c50edfebfsm14145768b3a.39.2026.01.12.14.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:30:07 -0800 (PST)
Date: Tue, 13 Jan 2026 07:30:03 +0900 (JST)
Message-Id: <20260113.073003.1666900745205693004.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: sync: atomic: Add i32-backed Flag for
 atomic booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aWS8aPuBRTKIjTZu@google.com>
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
	<20260111050558.3147975-2-fujita.tomonori@gmail.com>
	<aWS8aPuBRTKIjTZu@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 09:18:32 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Sun, Jan 11, 2026 at 02:05:57PM +0900, FUJITA Tomonori wrote:
>> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
>> users can use Atomic<Flag> for boolean flags.
>> 
>> The backing integer type is an implementation detail; it is currently
>> i32 but may change in the future.
>> 
>> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
>> particular, when RMW operations such as xchg()/cmpxchg() may be used
>> and minimizing memory usage is not the top priority. On some
>> architectures without byte-sized RMW instructions, Atomic<bool> can be
>> slower for RMW operations.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic.rs | 56 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>> 
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index ca9cab77abf0..473d3c07e234 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -566,3 +566,59 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>>          unsafe { from_repr(ret) }
>>      }
>>  }
>> +
>> +/// An atomic flag type intended to be backed by a performance-optimal integer type.
>> +///
>> +/// The backing integer type is an implementation detail; it is currently [`i32`] but may change
>> +/// in the future.
> 
> How is it, could we make it u8 on some architectures without penalty,
> and have it be i32 on others? Or is i32 better always.

Does the following look reasonable?

#[derive(Clone, Copy, PartialEq, Eq)]
#[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
#[cfg_attr(
    not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
    repr(i32)
)]
pub enum Flag {
    /// The flag is clear.
    Clear = 0,
    /// The flag is set.
    Set = 1,
}

#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
type FlagRepr = i8;
#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
type FlagRepr = i32;

unsafe impl AtomicType for Flag {
    type Repr = FlagRepr;
}

