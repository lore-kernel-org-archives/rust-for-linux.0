Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8035720551C
	for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427583; cv=none; b=lIwnQU74EeNOU0oL0j39DQEB1xC6BOyQX+kGpR5IK1vSGwsid5XVBaDku3WnWWaNdSzNIgg1sOwYyw2206ah1+ppqz2/xSENoYPHrOuf7VFRAH3PtNdzq8qufvOulUCh196cP9KOpwhk4nEO/0bGmOvdkmhZY5CUZ0SIwaKrUtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427583; c=relaxed/simple;
	bh=VI5XMEtYymvXEZUkdE+CqGy2x1qc/eA9MLFr5yEawCQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JYvU2Rpp5n1wdIADfAAbWG96vFvA4QsrdEIWqPGdFxsrBSoIW9+ugXqbNcNcDaB78LsHJ24hQlRXN7MfS/PtaaoPQDmTRM3hkfnGxUJ6dPUH05IazvOy64B9Thij2V7USBMD7hlNDOvcQjuprZEEs5VLf7WvBZQWAqolA/zeV2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijYDzEZp; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijYDzEZp"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4c8a4963fso2682954f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748427580; x=1749032380; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=35ch6qViYkOrTqxvbtV1QWyz6ls9oFvjHKTve0SAxuA=;
        b=ijYDzEZpLM/ljFL27Zw4J5Z7ow4fX6iH2DOmxAhc8rtlmukRy1oryn6DfiJKBVOS+C
         rtUiDdiem9ZxmIjJA/sNJokTA3zcF3FZgTzM74bldF6wbdU7JButYczPljqc/aMI7Ium
         0nHfQEJA/YNBbqU9bzSVEDHNwZDpfk1GZnEC6MNeZNx23I9ydOk/eS6h0j0RANCUydLs
         Tcowauwk8U23WzAhr1fb+CKriGFxhPOISlKs/VjS2fYTinHiyRkNnYlsaNelSM3qYG76
         +DWldDSNS9XUiIYh6U0VytYy2FWrTlYoxAqJYV0ye49eKEbOtHLGn5nkcQHRB+H64J6Q
         yt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427580; x=1749032380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35ch6qViYkOrTqxvbtV1QWyz6ls9oFvjHKTve0SAxuA=;
        b=d1Rb19WPu9koJmSVYCcMBNRctKx5/gKMQjiDjM8vSTXDMSRY7h+WPl+432WN389LMb
         0Lft7CMQioNWFQOjWmA+J4ik4357wK+iicu9It6Eh44IS+5gwxkte+LjMWjQaWeW5OYS
         wx6dOgImAbo1qfjwlI5BqsMGFg1Ejps5PhF6FHGl21HEkuZHze45ZKcMuy0YO/omIxAt
         uFA0WXYJMi0Mp8PB5gEPwyZvh9isyus7ukE2WmQi004FPJtc/tPzwdj9pCJgGOu35u3/
         ey1xWVsX/Ybt9CnpZ2tU3q2WXRc4d2+B5sZISoD2Fj/nYA/NeqKvEoq7B+P5xh4Qj7oB
         rclA==
X-Forwarded-Encrypted: i=1; AJvYcCVs98Ua4+aH6ApA9lE/oAHj6Qcb0CbwXXgFtp26/j5sp19OIVXol9ZN+uha/KY8tgNFEZRgH8/SE2g9j+k76g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzUjTBKyfmZdA5k6/sgJm7Lkq/VGXl/fOlbpG0XlH4Ka6bNTz2
	aWn4kT4Y/n94XUFRxapLpOkaxBmvURY4QSBmD8vb4kHKYP/ejDVqrNi5MfnweUH+TEH8yPrN8j4
	EVVs/C8eoLlFa0anvPw==
X-Google-Smtp-Source: AGHT+IEi18Sdr/w5PdnXm7hoCErFl0eH4ZUw2NhMf6AyANXqE0wnRIFEZpzrukKxGggH9pmtR5JC9r1qkIR6+VE=
X-Received: from wrd12.prod.google.com ([2002:a05:6000:4a0c:b0:3a3:6d37:3db2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40dd:b0:3a4:e1d2:9a7a with SMTP id ffacd0b85a97d-3a4e1d29b1cmr5537906f8f.46.1748427579900;
 Wed, 28 May 2025 03:19:39 -0700 (PDT)
Date: Wed, 28 May 2025 10:19:38 +0000
In-Reply-To: <20250527204636.12573-1-pekkarr@protonmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527204636.12573-1-pekkarr@protonmail.com>
Message-ID: <aDbjOpMZlhD6irj-@google.com>
Subject: Re: [PATCH 1/2] rust: file: mark `LocalFile` as `repr(transparent)`
From: Alice Ryhl <aliceryhl@google.com>
To: Pekka Ristola <pekkarr@protonmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Jan Kara <jack@suse.cz>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 27, 2025 at 08:48:55PM +0000, Pekka Ristola wrote:
> Unsafe code in `LocalFile`'s methods assumes that the type has the same
> layout as the inner `bindings::file`. This is not guaranteed by the default
> struct representation in Rust, but requires specifying the `transparent`
> representation.
> 
> The `File` struct (which also wraps `bindings::file`) is already marked as
> `repr(transparent)`, so this change makes their layouts equivalent.
> 
> Fixes: 851849824bb5 ("rust: file: add Rust abstraction for `struct file`")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1165
> Signed-off-by: Pekka Ristola <pekkarr@protonmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
