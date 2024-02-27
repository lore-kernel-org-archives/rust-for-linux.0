Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67EB13AA29
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709045482; cv=none; b=CyVx9uvXC0ksp11d3HWkaNlVHI+7oDq2q2gEa/QTp2cczs9WqJUAf+3NZN5HiFy5Knm+jduHdyEusMhMY7u4Yq/GPXM0lfgxgxBogLbTMzsn30/nmvGP3ZhMWWoghZQGbcYsLVVcuowNyEOr0Sypq5GXhtlji7sCOLwDMB/fDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709045482; c=relaxed/simple;
	bh=i5VYPShLQ7DBuALAeVASEPVNFC0Vv1VA6Jm1u/KqDTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3babUsCnlnTavq/PLNxRhHuzpEiqtLWFAouH51IzMYvK0VrzAdov+JqR5yiwkv7dhJCsKf1WHSenPU8pIs/LqbkJ94PhbZtzQ678TW7wm4H6alMw8g8BGD9O+DwLDuFdkY4HyGtWH8rjCeMJ+31vQLUc+pr2tk2/3SbckCf8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y2k7kKs4; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y2k7kKs4"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4706feb17ccso524561137.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Feb 2024 06:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709045480; x=1709650280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5VYPShLQ7DBuALAeVASEPVNFC0Vv1VA6Jm1u/KqDTQ=;
        b=y2k7kKs4CAC1bWyDOTpQJWRaqLpKenKzG3ksauTO5G8NZTPyJo8mW1smdwJpVAlrVt
         lA6bwVYGcT3eafKR5ZMVepClWHy4BhaxD0fxEg2BZ9vQ+ll60T8XcbOAJviAag4htDCl
         p38U9j/dat60pTt86znjokUZZQU8A39yY/adXdB6gQkcrytMDPTEy9sme35gjCcUz2kE
         lWoPcotXDZjnjIcPR0/yzYy7FF5KOCqR8xIIfDFwk6Wg/f7eMHq7D4gHiXGEdQQ1vXrr
         go3EUIfuex3JnzsMtHqlfiLJCmWHR9P750wMwAZ2K0ZqDY0HBx4WePwLvKtatYjolmbL
         ty4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709045480; x=1709650280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5VYPShLQ7DBuALAeVASEPVNFC0Vv1VA6Jm1u/KqDTQ=;
        b=kGj2UZb3f9p8AuUxBdOHi272uWlxo6uYHNTevElLj+DKhQq1me+mU6SKEbBTt9d++v
         5u+Uz9R1UB7s8uOHVc00YfLiE53GjBaUul51Ys5eCaoQ/sJcIq6bFO3S1cm96b6127sX
         36ns21xNHS4m3iBUfGCy+C03nCaCNjDl+1URnzTkzo/KlvT3q+50sRG6Va0CaEcG60Cw
         2OQSmln7CpivxfQFLN4D4BrXZaYei5X7MQE6cKyoR1ciqBtBvZPJEqbuy+IxJ0TNkQb0
         LB2Hv5W1EFKEQ1qYaga6LKgF1d1Rn8clCm2dRDLGU8KHC8yf+Pp/YUqYuXb5KnNt00ly
         jwKg==
X-Forwarded-Encrypted: i=1; AJvYcCV2mF5RHKDdvcQFe0usFRGq8En79sLYD8hBP4HLI5TtGwh4QwPeh5Ka3baIfuW//OREBeGHNxXlU1EpXugcAiCdawgNZXy0mKtrSSELRvg=
X-Gm-Message-State: AOJu0Yz8vBL2EZf73TEk0ZCX1aXtnxFbgjMaCMJzyF5JqE9D/xOMG5RQ
	nK0pO0ocZQbwMowGhgS9D6B8oYbbUythxUkFEmtKAmYM/BehxuqD6K5rQJElSBmMe0pZf0AfbjB
	Ep2Jlev36zG5FI/bW8R4/Q2TPKI0W8qrTde9b
X-Google-Smtp-Source: AGHT+IFvGbDtFFtQoiJDa82ZB6Ep2q+oir3b0d7n9XuaQnvAWBrEWqFnAV3+O1JKEJsWZzQFG6T93La1ffVlTZUbJNs=
X-Received: by 2002:a05:6102:55a4:b0:470:3ade:af52 with SMTP id
 dc36-20020a05610255a400b004703adeaf52mr8740310vsb.6.1709045479638; Tue, 27
 Feb 2024 06:51:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-rust-locks-get-mut-v4-1-24abf57707a8@gmail.com>
In-Reply-To: <20240226-rust-locks-get-mut-v4-1-24abf57707a8@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 Feb 2024 15:51:08 +0100
Message-ID: <CAH5fLggS6H+y6dBUkyecUyKHU5e_ueEmGEXh=DA00doqiVDEvA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: locks: Add `get_mut` method to `Lock`
To: mathys35.gasnier@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 2:55=E2=80=AFPM Mathys-Gasnier via B4 Relay
<devnull+mathys35.gasnier.gmail.com@kernel.org> wrote:
>
> From: Mathys-Gasnier <mathys35.gasnier@gmail.com>
>
> Having a mutable reference guarantees that no other threads have
> access to the lock, so we can take advantage of that to grant callers
> access to the protected data without the the cost of acquiring and
> releasing the locks. Since the lifetime of the data is tied to the
> mutable reference, the borrow checker guarantees that the usage is safe.
>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Mathys-Gasnier <mathys35.gasnier@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
