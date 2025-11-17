Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45602D6E5C
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 11:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379541; cv=none; b=pex/y6RSEE34hiEKqmM/ImtecU2snhd2oGd3NzCp4F5e10SuEILsLkDneft3wgqAIhcKITUwwQdvsYvYZ0W+NE1TzV5gdP90BVkEZn82iD0kkE5Hy4Pv7dMVRJPEeJh5Vq3hIAEB13PpBjL1aqJKzokHClOnf3hbcULCQjRsXJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379541; c=relaxed/simple;
	bh=Gi+Co37ZBXKoC9Q5hJDOgaMO8wjVZgjjsBWYt5GJRac=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Un6PwS0YwdT/lForrLr3ewhOi1YczuZvxErsjpguRpRegM3PjBwvc6nUjpgX8vRuozYMMyO4OUUfu9iBCn7N4bCqUW9ihmOjBn8nAZyT596CtQXit3btShvXpQofQ50UD1mijPwUGjf07/K5Buwta5fOVwzUylLA0fgqCQvTNBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyiIDfp6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyiIDfp6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2956d816c10so44048695ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 03:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763379539; x=1763984339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbEJISvLJ7arYJOR2kTm12I1SIq0MSaV75WU86oZiyI=;
        b=SyiIDfp6wyjb8YI/yhaWUCeV1YnyuRWmLX8uOtheAR21xU4x43IvuUo7CrbDN22qNM
         ni7eWkazxVPMeK2LwtlJu68hUFNLB+xiO4IMnOCmx91n9e1VXMdwDBXqmjQemOl2tD7P
         HkrZwXz48Ejah08NZipla83ePQcBhalX7mvZDh2qDK4th2x0r6GEQHq/82nlfpzt+f5C
         4Pv0lSSXuTCt8ZrJmg4Rb6cmAOTWhzsP0t8CeO15ha27ZLuZMZ8L0YdWz5gSly+47BQm
         NXXe85VTd2tyJH3mRUZ7RYbzotZ58+IwI9XiQaAUXoojWQQToXhUi4SEzGuo//ojxWCI
         rWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379539; x=1763984339;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbEJISvLJ7arYJOR2kTm12I1SIq0MSaV75WU86oZiyI=;
        b=Mg3hQumUTd4p0Ld3IOPQLNZHVEHfRVMPd3jC4FRuVN7z4LOLWwEBfI0hzGWlwkci9A
         I8RlwKXbDQLBeJGeMLji37yFNUlrnHTJlVvRIYm6Qm0K286Kxe7P8O34u3C2JQ1+DJJx
         IszhpIxJQTJGgkgQIZlc1Rj1MtfpZR5daELLr5i3e8g5l2OgvjgOhtT0FAo23kCjhShq
         Dfhf7CaL9aNHKyJk5kPMWLDsU7tOF6Y7mLcQwwXPg2V422lP+JfyN1uhFMI1K6kDU7oE
         aOLxrzF29OCwNRNMJrIgeHrA/cHdO1dt5SqtP3EjJASj56WeMeIr2zs/H1JAEHyGxrMx
         eIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVzLPH/EEwFiI22v0cnOzbi2IBIxvJJMc/I/A3OnwfMJgq8sdPX+JOdt1sCH0rv6oQ6AM3CfiYAbqP8wr1UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSsqCOneR98rAskeo+rbII3k3pse0mGM0KDqRrdQjuIOIVJgIp
	4asM4DKUTz4fc5VMzla0ZNnaJYIHrbsiyPd25HFKsiryhKzfYjaWlXNx
X-Gm-Gg: ASbGnct7AzwQIytwJwykJnQHeeKdGN26nvyQPvwQoiDxvrKIlznh/9AIN6n6+Pd4OiQ
	GsyztTUc3ktLn1fgCP94n0j+RN2OQE0xTdTtw7RnGsgkpa5cyfvGavu6G6gCGjVoNh1oXzZRBDr
	Prsna5EbenaBABnVuZQU9QVwhq2e3Tg4iFYFJFKw+ZSf7tPjv4/3QhfufBAGGOD3UPTyuv3rD2V
	5YQ+j0H8nClSNWiutgbwPDqggIiiOG2WTdza1+76nQ6fdUmwqzY9qQnLtSj7TCnE7UwGfTAPGFI
	vmGxdYuH8a1bjwgJhiTtD/mgwGfENeR2RVOMbLHf0AXcao0ZSh81wEeZa0VhfkbCk7/wUFS+XTq
	hYLr2k6k7JxZDvhbmZDjlbdRMYNlIj5WkF5Sk1rgETaD9h/EM8ye5jRq2Nem5KsIQWT2xoNPsAZ
	cM9r235c30BqHVYqjw7IhMEPA8dL0FmR2Z1KN/E43KwmU20OBk+UVaQvq2o2n/jtQK
X-Google-Smtp-Source: AGHT+IGAxAvZe5Lr1Ol+bxtyl90bWW6TtRUu5S18ubO8CjeaCKldvmz7kwFsvhS58e2o8acKcOPFHg==
X-Received: by 2002:a17:902:cf08:b0:265:47:a7bd with SMTP id d9443c01a7336-2986a6bcff3mr137259405ad.4.1763379539069;
        Mon, 17 Nov 2025 03:38:59 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bed2esm137159695ad.81.2025.11.17.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 03:38:58 -0800 (PST)
Date: Mon, 17 Nov 2025 20:38:43 +0900 (JST)
Message-Id: <20251117.203843.1397954301918831869.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 boqun.feng@gmail.com, frederic@kernel.org, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87h5us3o5y.fsf@t14s.mail-host-address-is-not-set>
References: <s3el1v7RYQ-WQ5Kp3rzmGOYYtb6no2PNpOwP5VaxXPRWxotPbXLlRNW4qPIf1eKTuq9WmhhwGhnE5Mjf3OLa9Q==@protonmail.internalid>
	<20251117.103923.1643210589533849785.fujita.tomonori@gmail.com>
	<87h5us3o5y.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 17 Nov 2025 12:15:53 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>> index 6ea98dfcd0278..2b096e5a61cda 100644
>>> --- a/rust/kernel/time.rs
>>> +++ b/rust/kernel/time.rs
>>> @@ -363,6 +363,12 @@ impl Delta {
>>>      /// A span of time equal to zero.
>>>      pub const ZERO: Self = Self { nanos: 0 };
>>>
>>> +    /// Create a new [`Delta`] from a number of nanoseconds.
>>> +    #[inline]
>>> +    pub const fn from_nanos(nanos: i64) -> Self {
>>> +        Self { nanos }
>>> +    }
>>> +
>>>      /// Create a new [`Delta`] from a number of microseconds.
>>>      ///
>>>      /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
>>
>> For consistency with the other methods, perhaps we should also mention
>> the valid nanos range in the comment?
> 
> But, please make it a constant instead of an integer literal.

Do you mean making the comment of Delta's from_* methods like the
following?

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6ea98dfcd027..822746e552fb 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -363,9 +363,14 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// The minimum number of microseconds that can be represented by a [`Delta`].
+    pub const MIN_MICROS: i64 = -9_223_372_036_854_775;
+    /// The maximum number of microseconds that can be represented by a [`Delta`].
+    pub const MAX_MICROS: i64 = 9_223_372_036_854_775;
+
     /// Create a new [`Delta`] from a number of microseconds.
     ///
-    /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
+    /// The `micros` can range from [`Delta::MIN_MICROS`] to [`Delta::MAX_MICROS`].
     /// If `micros` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
     #[inline]

