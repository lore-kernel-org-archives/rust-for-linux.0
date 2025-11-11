Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005CF32D7E6
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762824534; cv=none; b=uT6O85ikRbgNxSpfhArlGsuiyBfYGWkSUeSvQeCG2J3klljQ7nYNkzf4/gjTEi59hhtFV9l1uxNcl7jbR0IrfWG5MqHOst3nalxsOh1iZW6YdoACKIwr3bAnbGOSlxUy78smKgCiOxgPFihs0cugwTfOxeXPBY5vH5j0E7U2L3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762824534; c=relaxed/simple;
	bh=3JTjAmYrKYuoEZpZiB/EJ+PUEXFQpWDxZYZwlR1UhMU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Y1AJlvp9pqWX5Q8m36AftOcrQm99k3rXQUF/qgpugH0pLwPxb375BGzvGtqCXZURUdNBDQtALwWmFmIQ2RxLmqSfeZelg6UK3cPlgl3Uced2e55dFTP5+n4jCxXxkDPbj/0uANWfjDSHoZwkomX9P0LILRQJG9p+BhF/RiBI+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixkn2PRu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixkn2PRu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29808a9a96aso18301915ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 17:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762824532; x=1763429332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfemNUB/wsobZSaB1U74YqOJGIp2nYqKUERaJYbSrhk=;
        b=Ixkn2PRuyB4EHGmTTlLQ/2G9BCHFYmb6Ae8vDOwfFOIwuCVSapU0UbMP2GnTPISEiC
         43BL7QDenzJ/5QJ0sb4DVlBXKvCsfwBH8bF8gakfsp9nhuD9b+lBnTaa4WXQ1brh9lg4
         SAlj1rdaxyjRrm2c/kdgBFTnbaG5f+YV5fGRme12FChtIZ+4jPrWNcpizI83MleMTgfv
         75LaF2bGVtjrk5Y6qxI9VkUgpFYDsFI/6NI9tH3sMQyBD21FygG51EAcSsHU3vErIjq1
         LIEMEvAvjizAO0MyBxMwKjEivI4sgKw+y48NAMhhbh66a15sqJE06zTzoqAPuUIlpDwi
         8ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762824532; x=1763429332;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfemNUB/wsobZSaB1U74YqOJGIp2nYqKUERaJYbSrhk=;
        b=q9Fg27JH4xn+R8MpmfgdjcTFJKSeTjs+d4gVTWt1oI74vEDj030Y4eqMOVnxciwfB8
         DMFzopHXEA5evQPLTIJf82K2cpMbb6fPnjqXeIAT3QvmGDZuZOPmsEucF3M3Lbg1UQPm
         UCB/xO3KN8OyCYpcMSdFIF5ZiDOjhyvZZG54yKphI9t/FhyOZX+fEAsFlw2kfl8kSjDe
         XW/HGZbBIA44peImjT5X14yNa55qC7o5x5dpDbukuOOTsVCkRqT9QSzIqk4G8C7Y2lXe
         MRKUv4pfUl+qI6LL+hrDAWWebd+TjrrwiwqZ47+u4pxZE6zSSnSyzPyVHqS3IR15O7Bw
         UrYg==
X-Forwarded-Encrypted: i=1; AJvYcCVN+1jleD/p1DQL3aD5oZjMI6/4E6D7MXuJ9HeliG36wHlYKK6mp3LPMBdhKBzRMNcwvoomHaja8iv+cyLIZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19EoxaLQk0o3aRh+zT3YUpgYFfJ7A4gc1LTtFy25c14IL8CLr
	jLWSx3bdvBExoUHuinh6SUlkQ2LxzoHprCLvQFRGh/XfbMfaZbi1R0Ox
X-Gm-Gg: ASbGncsLFz65+owy5q91iDJ223D0YmOUL5aaC2jSHeljnI0idrfPDCv1hptzahUjLYT
	6s25Ov0R3WYHehoCRpgnjzC8L2GvP9vj+O5qPWP/iI75Z/a7A/Rf21MleJkBhI247KL/7okuJyd
	RnMWFcj9OE+UYxcVw005uRkCSNGOp3zE008W3i7deO6xOesMGqa/yRuN3I6vxr8QfZQz1ZareF7
	eU2E4dgBtB9NMGfIEJYzsHS9IklNBE/oVEz/7MB9GrKS7/2yhEdv4cun/L38nR2Cq9+WbMS+DzF
	uNlQ/IDeQiTOQf+Vkny4xLfXAuoR5Nky5mJsXqeZzcv3Fuve7k8XFhPsgFnnqemlWVgqDfcqySM
	sVOlW96DHiqCS6biQNWer8kbmUdFyBScfD7UAfr/Hx6WitREwPGGSB732gs0ysKVDRU+FGaOUhw
	7bD/ASkoPBTwHOC+U7ZGCbFY/zxq3gvXZn5k6yinXOnO9H2DgIb2m/mrleO51zDrUc
X-Google-Smtp-Source: AGHT+IHJHeOcgUE9/NZI7fph/IbZCgbQPrMFNorIyBIlcjorf7RMirCmOzXDsfC5rZG5xkPx/uWxbA==
X-Received: by 2002:a17:903:244a:b0:295:9383:543 with SMTP id d9443c01a7336-297e565bc41mr132957815ad.27.1762824532115;
        Mon, 10 Nov 2025 17:28:52 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296509680e5sm164848095ad.1.2025.11.10.17.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:28:51 -0800 (PST)
Date: Tue, 11 Nov 2025 10:28:38 +0900 (JST)
Message-Id: <20251111.102838.2252490388846433495.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
References: <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>
	<aQyxW_cskrK0Zyxr@tardis.local>
	<87ms4u6q1f.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 13:16:44 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> Boqun Feng <boqun.feng@gmail.com> writes:
> 
>> On Thu, Nov 06, 2025 at 08:12:31AM +0900, FUJITA Tomonori wrote:
>>> On Wed, 05 Nov 2025 21:59:06 +0100
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>> 
>>> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>> > 
>>> >> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>>> >> pr_*_once macros.
>>> >>
>>> >> A proposal for this feature was made in the past [1], but it didn't
>>> >> reach consensus on the implementation and wasn't merged. After reading
>>> >> the previous discussions, I implemented it using a different approach.
>>> >>
>>> >> In the previous proposal, a structure equivalent to std::sync::Once
>>> >> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>>> >> to provide Once-like semantics by using two atomic values. As pointed
>>> >> out in the previous review comments, I think this approach tries to
>>> >> provide more functionality than needed, making it unnecessarily
>>> >> complex. Also, because data structures in the .data..once section can
>>> >> be cleared at any time (via debugfs clear_warn_once), an
>>> >> implementation using two atomics wouldn't work correctly.
>>> >>
>>> >> Therefore, I decided to drop the idea of emulating Once and took a
>>> >> minimal approach to implement DO_ONCE_LITE with only one atomic
>>> >> variable. While it would be possible to implement the feature entirely
>>> >> as a Rust macro, the functionality that can be implemented as regular
>>> >> functions has been extracted and implemented as the OnceLite struct
>>> >> for better code readability.
>>> >>
>>> >> Of course, unlike the previous proposal, this uses LKMM atomics.
>>> > 
>>> > Please consider if it makes sense to base this on `SetOnce`. It is in
>>> > linux-next now, but was on list here [1].
>>> 
>>> Data placed in the .data..once section can be zero-cleared when a user
>>> writes to debugfs clear_warn_once. In that case, would such data still
>>> be considered a valid SetOnce value?
>>> 
>>
>> It's still a valid value I believe. In term of data races, Rust and C
>> have no difference, so if writing to debugfs could cause issues in Rust,
>> it would cause issues in C as well.
> 
> @Tomo you are right, `SetOnce` would not work with someone (debugfs)
> asynchronously modifying the state atomic variable. It requires
> exclusive access while writing the contained value.

Yeah, I believe that SetOnce assumes that both init and value fields
are modified only through its methods, and it's not intended to handle
external modifications such those done with memset.

For this use-case, SetOnce would still work even if used that way,
though it's not the intended or recommended usage, I think.

