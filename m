Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5822154F
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245549; cv=none; b=VbXtbhI4ae4uV8Sbv/IDot9z39Xv0E+G1cldTdQHpXajG4Kr1jUcHRg8SDY2ZTIQA5kOdNJbgNekX1OmW9iprDdSN2PC3IHJpw1fdkg0bLZsHuDw6ixNlOB3Pifn7AhbdKJ6Krd32GOVwNFch/5t/A6MdBebwz+uxTH630mfKhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245549; c=relaxed/simple;
	bh=t3IUp+ARaNaB8wz2LKnZxVPm5xytJ0pZwMX+fyMtQ0U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JIr61kbmvg/cwObVgQjeL0jHdZPzrrV1fRLGpgGg1BkQlXDES9oIm0ZL1lzBRatLLESf2w/mBZJi4gbFPcELHnRUigrX0iowpJH7dvDKHhlsncu4aRpM283mMEU4bp712to+xnGU7Ir9zdzD4T7fjMyDGOAF6UD/dvF8J+TfSIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijSniAux; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijSniAux"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47717c2737bso21322355e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 00:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762245545; x=1762850345; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WSx4j5h/K35W2b1U5cMePqydBqgF/bke1+7wCGvmmg=;
        b=ijSniAuxKDJPa4ZM2zvcejUKc5nMw6zIDhWVwoTLQ1FtbnQOnGWgEjslH96U4vHTVs
         LsSPJ/nbCiGpK9HU9U81zUq2js5wDH15U9GuVkUJdR+JR8G+YXrmEZNfUt6QZ1BE/rfK
         gb8MGr4tujpX/goxMK8KXOhRkT5Cw6aXgsljJLQrAGZ/Y7X0UIW4rrR9b0WxPIjzo7f/
         nVnwkaLRIiI8fW+3c+2ijNff93rdC7jNobF1bDfEZwPvSJ7h2kU840OgPjy8Wnf8TjkX
         /WA0+HuGN0Qw4B4ExtAIcLLJRiMH6dC46OL5OLibEEEokx7D9RVnc9ryHOcctA9dsmct
         YmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245545; x=1762850345;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WSx4j5h/K35W2b1U5cMePqydBqgF/bke1+7wCGvmmg=;
        b=EofUxFKEfoBn9zZYt67S2vA6lpaF8Nu1XZ32Mxv1W/9pQIUZJK1LWg20JjrI4+zULn
         GS7+BMHfpoQaGkfXLqEvhOALR2dqZbJo/OWPAX+8E+A5G1TbL9QBCvuWYV1C4T1ZY8kY
         AguIIfwJGOzNls4+CHPOUGyYa2thDpu9Xb+H3TkIgc5X5c5DFtoIxrSamdSvQxqE/LPZ
         nJrkmSP1z9wOqcNrybqeo3cUfh1lF5HEy5oI36Kc3Ps6wbDOWyph6a/BYQbLzwCA8EO/
         3F0pmTVPzG86DcPoAUVDweYgmJ6ziOjE0/q7a/nE96BLB1uK46CJzkEcZLEGsWe8O4WN
         U+ag==
X-Forwarded-Encrypted: i=1; AJvYcCWqEI+k10boAaeuxbr6tjCPrlPfZ406Pm7M1KVoFH3gdaNiRMG0nUH03i47lNLyKhX8wQZ6UtTWR5FGUGZksw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyybvZnuGRmlgnzf/UBZ3+8no/leg6LufM/ZygsgEYBAgOf4dh9
	W7fWvzT1yTetcTuS2f0T8tg0dIuVmuf7YbYEJcKowYBhWjlJefF/yvYLD8QNlOSLtg+qhvs6PRT
	SZJbnY8yR9ZPv17i3vw==
X-Google-Smtp-Source: AGHT+IEsoqg3j0WNIpG5vxJRX/Ibh5LrVrCjTx9dh/pWH7qA/STRnKJkdScMyqeumJblHqnk9Ea0X4NaSd6gQqo=
X-Received: from wmbb2.prod.google.com ([2002:a05:600c:5882:b0:46e:2eb4:38d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1553:b0:471:16e5:6d7a with SMTP id 5b1f17b1804b1-477307ba7d2mr133828385e9.13.1762245545262;
 Tue, 04 Nov 2025 00:39:05 -0800 (PST)
Date: Tue, 4 Nov 2025 08:39:04 +0000
In-Reply-To: <20251103190655.2326191-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103190655.2326191-1-dakr@kernel.org>
Message-ID: <aQm7qLybSn6bOlCy@google.com>
Subject: Re: [PATCH 1/2] rust: dma: make use of start_ptr() and start_ptr_mut()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 03, 2025 at 08:06:49PM +0100, Danilo Krummrich wrote:
> Using start_ptr() and start_ptr_mut() has the advantage that we inherit
> the requirements the a mutable or immutable reference from those
> methods.
> 
> Hence, use them instead of self.cpu_addr.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

>          // and we've just checked that the range and index is within bounds.
>          // - `offset` can't overflow since it is smaller than `self.count` and we've checked
>          // that `self.count` won't overflow early in the constructor.
> -        Ok(unsafe { self.cpu_addr.add(offset) })
> +        Ok(unsafe { self.start_ptr().cast_mut().add(offset) })

I guess this shows that the mutable/immutable requirements we inherit
aren't actually what we need?

Alice
