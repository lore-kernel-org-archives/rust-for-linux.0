Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D9432C6C
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709115003; cv=none; b=k/o+o06BHbvDUc0GlPiFnODcFH2SdioiF9ZqMuVnJ8N7oPBWJI0HrBkrWosb+YoKXsa9s/L8/0udVYBHzxg8qptYSZZRbaJFndZdItb+BDswVnkj014PvZ8ta1n3cqg97Xz/OnerG9T7EP575ipgbz9m4YR/q1R2i4hTlnhAoB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709115003; c=relaxed/simple;
	bh=PTIhoZ7cZRDnibpTWA41AYPiGAUR7wb+Y1RYUNJTp5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmqeJ8lYlZIXTCmEV+QMkOeL4pWNM5d4FtSmAkoH43SNSfmwd5dj945pcI3tnbVLDLQiQg0rv15R9PsrBsel7vQt2iN9yR02fzoxGdn/SmTc/kahj9P/cz8ePFTCzJMzpYTicWmVVLQi3YbyRTCiTCaqlKxSv2IEAUHK32XG9uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FA99N09D; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FA99N09D"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4ccce61a0e8so836859e0c.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709115000; x=1709719800; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTIhoZ7cZRDnibpTWA41AYPiGAUR7wb+Y1RYUNJTp5M=;
        b=FA99N09DN4PYhxIhYiSRFy6hcOet697tvIiFFRwOJAdqbxj26iOVXe82tYJ4zRs6j2
         UbTmuiMZSlpHTnmukXw2BEK0EVgJtcTshE1SNmSFre9VciHpR3uIy/VTdKEXfP6owaFN
         fSAm3ZlGJ28PH2al1GMaEkQv5WIJUkquph1w/kRQbYxHR0ZIJvWj3eV3NWIYomGUgOPu
         YqFuiskOT7Yrh9O2VNOOFeIhBv23cKVAZ/GsRpXRl6RJdjylHtPr3KpHHCvrhuXr0vda
         3gcuX3OiYNEEDYmStEDwxygnhe+ZzWuW0WLBk+uvZILSCAPxDz446Fi3Zker2j9oI63E
         CzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709115000; x=1709719800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTIhoZ7cZRDnibpTWA41AYPiGAUR7wb+Y1RYUNJTp5M=;
        b=Kr96UlPkQdFJ5pwfGuOp5N00kfdIfUSSgweU9uewQCouXe27BeWnyGqZdeyKDEeLmg
         /gvjK6tTWMfqG79p7HVCzkN6+EPpHGQhuWFD3R/m8WemVQVLQFJoIMigG3SwoguVDRmT
         5J19qlwpfdzmd/uFKQw9zQXPxCjhMHtUZJPTUSRWjCWsDK2Ff5CAI+gflUTSF0vMSc2x
         T2p+1l1HfUekjl0n5REJIGbI1Ed04rItcjH2GL4HcICIGS/0POIntc3WhekddIpUenWA
         yrxC4eKpimwfOxaF2/T7wN9M2sjyIlP7oSeI60jWQtkzV0VA3BpJgU4JUcvCgAo4rpec
         nGpg==
X-Forwarded-Encrypted: i=1; AJvYcCX2ZUB4OsQY+6GVNiDNugknCWa+Q8gcxew8QA5Cc/gnBRN4cJ5DKbwoOnKk85DPYdtN7vmlQ2rzb/uHK5EU1E+g1lWChOrHu0szvKqPa6U=
X-Gm-Message-State: AOJu0YyQuaBgJezBv5i8EFhsLCwAiNK9svGG8QKe405yAnyeR//oTvcD
	fzdBeE4qX6pp2MQuKbExu5lfOA04Vu06s2syDPRTIszK9821+RlNWSY7A7+Xdc1dxMB3nsygw3g
	Z9+9ThzuVwlS1xeW6k+Zjhp8NyFrvEg4eHRbp
X-Google-Smtp-Source: AGHT+IE2lL9iJ1Cs1YkXmPLJIM3HLDT0RD+3kSslhg3igF3N8clsEXikxaZM9E/LYc1zd8wIlHEYxuBRKkPOZ01Pmac=
X-Received: by 2002:a1f:4b42:0:b0:4d3:345c:6a6b with SMTP id
 y63-20020a1f4b42000000b004d3345c6a6bmr2775383vka.16.1709115000333; Wed, 28
 Feb 2024 02:10:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209223201.2145570-2-mcanal@igalia.com> <20240209223201.2145570-3-mcanal@igalia.com>
In-Reply-To: <20240209223201.2145570-3-mcanal@igalia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 28 Feb 2024 11:09:49 +0100
Message-ID: <CAH5fLggCtnge7oEpzsd86Hdn15gck1U7Upq3Kf21B5WOmsr2-A@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] rust: types: add FOREIGN_ALIGN to ForeignOwnable
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 11:32=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> There are cases where we need to check the alignment of the pointers
> returned by `into_foreign`. Currently, this is not possible to be done
> at build time. Therefore, add a property to the trait ForeignOwnable,
> which specifies the alignment of the pointers returned by
> `into_foreign`.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
