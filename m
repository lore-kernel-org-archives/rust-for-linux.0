Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B981F8EEC
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814503; cv=none; b=iQWcHBwx4a4lnbTJ8HCbCpMiyPGqXZMhpPvMIem0kiewPlOwfp0RhMqaCNjHtEUfcMdiesy2lL2mh9bzAQmbAkCuvRs1lbtrGmLrdhTrIiwtsHvlHif7z8uKDPr4P05D7W+N5MSjL1ZoepVJGVvLBukCBVEQyTqAbkE0fnKQtnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814503; c=relaxed/simple;
	bh=4QYDL9xfMBmOQpdxuX8CGnFiYsghUpqSI7LGvIVLSL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsBGqTpUWOsIRjBJBleKmLckQmxjUwK0D5WNjewTyOZb3sdIrt6uxQftxEFkkyVb8KTvemhMuY2AKwVeVFjXlX/IqSlP2NzresHj6ScCLEmM3hzEOMMpruewnVlWIzXZGcAyu2ueW6tTeGB8vjidYYOSkoU6wZn+Mo0C6rrNO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dd1O9jZ0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dd1O9jZ0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so72044445e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 07:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744814500; x=1745419300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN7v5/uBLr+Js/XFkWZKDPsFXP5MMjxJCm+7eNhTQMY=;
        b=dd1O9jZ0SnJIKSUcQ+HCJpds9wAIYJvbnRHpEJdYpnqfnMVkWVpFSXQpsN2sCoCQ+8
         rhXGYga3imgWM9LMU48jbvatfHJKULTo3XoDOlQIsUPLzjSDYp2VEzvlr3qmqJBgeJPy
         O3ujCaDtzYjAcCcVt5HOvP66EESLL4U818+816Il9Z7yJ5umMKcrv91cBKi+IvU43Lg9
         zr7u0fxccIUEmLFzFsBchYJxdi7O/hI6DZWbzBtGeNjdFvfLNcebw5Yd0rSaAVVECSsV
         mRbR5tAnMdzkev/O4aH0U3JnsLQxzXAiv/be/kyNZQs0QZw51seOgT0kOePVq6Mn4czh
         QLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814500; x=1745419300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN7v5/uBLr+Js/XFkWZKDPsFXP5MMjxJCm+7eNhTQMY=;
        b=P4O7m/mLXWfNwdUTlfKoB+v2WJLTCHvJKOze/KnavrtQXsWWFuvoxLZdtTmwywioRs
         n/xNyDyigHaOrTtPs8BnhIhkwpV/Mgkr+TnVH9G7ySiWfzGWv8abCWB+ourvnZukYDA4
         keLRBmNlCe+ZMqajqPEmlPNG2ge5VavSCTqe1DjwWkglRVCi8rdjNsttNOccMC3TLMcp
         m/eh0aGLpK5JKq0mdBZMx5RwcV477M7XjIqPzpaY9HJBhSXevpmQFhm76mmbx30a3Fy0
         whiZTK6t9SaHRfbuf34ZdkcVmV802yaa2aATVDjwliVvi3D7fN1MMsnkGgFKiX+m3jaO
         AhPg==
X-Forwarded-Encrypted: i=1; AJvYcCU2gd24l6JZxX5g/N0vbHK59G8tmHEnC1UnK6PbxxVQQt4O/qP4zl/baND62yIOpJQkUR19axm3S9WskCkp+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+7MJY1Gz4AqPhVUaDwEVPWtCM+g4qP0AYU3X+XQ5VAdwnPG9o
	cEq+d8xAtp++TcFmJrCUcH9ZkAMaKdebRWS+7+onv1hyIVlTtz3RAiY4rVZ/1ZtMlAx3bC/dUVK
	dug9Fkw67KMjgbbPjvKD9fFuhSfIlD5tI9ARD
X-Gm-Gg: ASbGncv3L+le2439lBGL0Awro0I4ZqvWhixouFyGAKvZZVlJEmq4v+fI3GVqub45plD
	vTBgeIMnyKHa/rI5wx9bLWRIX2AH2oSMYn41N525zxzN0klTU7PT0bkKBZiM5rTwr34uiuvSjbX
	ETVRg1Ti8mcD8663coxQCVjJANMOZf0jacu8pMPTAmNRl8IyNNMS2z
X-Google-Smtp-Source: AGHT+IGqy9s+5msaWV7J1RSneHoh/Q7L7Ii+m6yF/iUGCqVVsrBU+wtD8z+qX0gHYQqgJnpm381xQpHCtYmayQZkkSo=
X-Received: by 2002:a05:600c:1c07:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-4405d616ab4mr30290255e9.10.1744814500057; Wed, 16 Apr 2025
 07:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com> <20250407-vec-set-len-v3-1-c5da0d03216e@gmail.com>
In-Reply-To: <20250407-vec-set-len-v3-1-c5da0d03216e@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Apr 2025 16:41:28 +0200
X-Gm-Features: ATxdqUHSDa5DBRQrTyBGCx-ij5-eCwkdt2kaVekKiCRPorgAqcFf26t7lBAb2Tk
Message-ID: <CAH5fLgh+DsT0=6mxbX+=bx2rb7y35a2cSeg=0FqaO-FgTJ4tEw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: alloc: add Vec::len() <= Vec::capacity invariant
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 4:52=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Document the invariant that the vector's length is always less than or
> equal to its capacity. This is already implied by these other
> invariants:
>
> - `self.len` always represents the exact number of elements stored in
>   the vector.
> - `self.layout` represents the absolute number of elements that can be
>   stored within the vector without re-allocation.
>
> but it doesn't hurt to spell it out. Note that the language references
> `self.capacity` rather than `self.layout.len` as the latter is zero for
> a vector of ZSTs.
>
> Update a safety comment touched by this patch to correctly reference
> `realloc` rather than `alloc` and replace "leaves" with "leave" to
> improve grammar.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

This change has a conflict with the spare_capacity_mut patch in alloc-next.

Alice
