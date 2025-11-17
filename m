Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060381E4AB
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 01:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763343572; cv=none; b=PZQydwg/pDTmRRAAt5JmQUhHq7NX7eR/NANqfeFk6dBBL2+3OX8ePouyHCa2qLH2v9ApVKBWEqAwoRY6O90Zw+BEZlR/2MN6JYAJokba90EM0qTzDmDZsi2kL8xACoWCj4e5y4OX2eJ+IaewFct3HkTGpzScPYsJRu5fyEk2MlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763343572; c=relaxed/simple;
	bh=OaxL50NPC7BJGD8UMqIQY5Q/lm1YqVvd/rSmqvDNoeY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mzSZqb65VEDIfBy2tID8L8x9qQGtGxxmnTfMJRGE8ub98kJfZ4lBBUga7EzWI4sUSKbOhGh8UZFJgutfNb3lYGRasAr+2xnafpmYZqVZqMzax/APwxkRquIecMYtwuFiYhPmO+aYQVlE2izvbwRiigU7CcxDE+OQYb7K1WGJiwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md7A3xUc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md7A3xUc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297dc3e299bso36885715ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 17:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763343569; x=1763948369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UW+/2wcAnqhKi+ibesqMvW+WqqECxOVOQvVYyhRN8ms=;
        b=md7A3xUc2pJd1PULKmuDkss2GdBsV+hwUOARyc7K0Bje4R8vTsQ3hL8NC9ellBG+S4
         OPAgWhWh9aPVEXYKIlei5uI+Ys/psP+yF4pM/yfZjYp+AsPfMdL/d89849WkzlZgxcUq
         Dht9uNH12TDK6E0KDju3iTrX+QTtICGO0i6U6yhgvqRir+7uEMOwkcS/WlfG28/0fy6k
         2LndQui/9PSK8cPM5jGHLTLUZzp0ULOG3gAZbgQIqV/SksudRViR6sd/TPHwhFs5RgOS
         7zJjVSn4RQ8EXG5vrI+p+4foyyztzYSw+k1mXa2yYLlbG6zmqHp4UC/d55USHQtuFXBu
         P/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763343569; x=1763948369;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UW+/2wcAnqhKi+ibesqMvW+WqqECxOVOQvVYyhRN8ms=;
        b=Ac29aV8cl1s4go7MxTGk7nlsUCdncgyMyri3HaMmkL/mUn07RsxoUBTyCQQwHh266c
         JxVaIo/KjCrH34oIVZebjv31/Wm2r14TzD0wtxlWXc3fdXvPbAR6bf77qjg0dAbRVAJH
         UhHkF+h7+0QX/ul5qTLi/gogl/2jQZ7Zef/P6BpKPRLcfToCxVt7Vdh0YL+CqoOqk4S/
         z+GdpiTYuV8P+IHJlX1cN83puBMMpoJv9Xne0g3Ku9zurp06YZxfsU42e4ucCOfM4swt
         J7GA3WNiDENmJb5Cix/mUxx6GOJQAQpxmYjDWhxp80GExPfL4wuQ//sQZXPQE1veCv9V
         5PRA==
X-Gm-Message-State: AOJu0YwL2AjF8tFThgyY7s6xIViLpeNA3srBlo60eRvUUsMrkicM7VD7
	tArBJwGqc3AcMRjotGxWVT/DdUGOAhv6OpYcfXLO6tuRnGNhs+i0J+Wc
X-Gm-Gg: ASbGncsxZQ3DFY5o7QQTUjQe8HqW7CT0gN8ZU5NACnMtLAtlXWi6qw21ZZPzzRUkIKx
	7X3FNXtzi6LhFjxca1bFbdqC/8VTVZ1xoKzpqxkzackMV3+wKgbpeO6N8NUzEA1OGqvhK8hW+yH
	2+P1HSfsGHawB6WCGoIWF4/TF0XQPx6cg3c/bKGhAKZxvrjX7AO9pJN/AniMzEmBugYUQdjNrII
	4GMmp5MHeZqNyb/fVK3xHo36XoUOMOKLRINwORLEE/D8IBUeV2VMFQwTt4mAxPy+eYOb46Oq7yy
	aFIw3yPjFx+wtc+sDtNPSnSF/CseqQGIvo81vFUYwEJf+SUqb+y+MxWj+2XOzJzwRYDBQl/aVej
	OGRe6O15IgiDa8VQ4uA16wkgN8iZ1uly7LPYA94FDqh5bVMNBH14Xe6Z4LFy8ASRJ8PbE1fwRz/
	cN+SitQQ//tzdqdw077pMMQ+QPiZlL6S2GQGNpaiMKfqiWrVUrqQha/g==
X-Google-Smtp-Source: AGHT+IFxJx7Tr7Nl1GwBqeS7QV5YCULud0mMl+mf7pZjk3fJYdmzErHQmp+ietgbvSXcX9T2c7N1Wg==
X-Received: by 2002:a17:903:28e:b0:297:e231:f410 with SMTP id d9443c01a7336-2986a6ca082mr120678335ad.13.1763343569066;
        Sun, 16 Nov 2025 17:39:29 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e46sm117965755ad.25.2025.11.16.17.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 17:39:28 -0800 (PST)
Date: Mon, 17 Nov 2025 10:39:23 +0900 (JST)
Message-Id: <20251117.103923.1643210589533849785.fujita.tomonori@gmail.com>
To: lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 a.hindborg@kernel.org, boqun.feng@gmail.com, fujita.tomonori@gmail.com,
 frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251114184207.459335-1-lyude@redhat.com>
References: <20251114184207.459335-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Nov 2025 13:42:06 -0500
Lyude Paul <lyude@redhat.com> wrote:

> Since rvkms is going to need to create its own Delta instances, and we
> already have functions for creating Delta with every other unit of time.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6ea98dfcd0278..2b096e5a61cda 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -363,6 +363,12 @@ impl Delta {
>      /// A span of time equal to zero.
>      pub const ZERO: Self = Self { nanos: 0 };
>  
> +    /// Create a new [`Delta`] from a number of nanoseconds.
> +    #[inline]
> +    pub const fn from_nanos(nanos: i64) -> Self {
> +        Self { nanos }
> +    }
> +
>      /// Create a new [`Delta`] from a number of microseconds.
>      ///
>      /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.

For consistency with the other methods, perhaps we should also mention
the valid nanos range in the comment?

