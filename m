Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C41C20C012
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238152; cv=none; b=W0HlCXBBEDuBajd+xfJ84z0WqPzbDeCG2NNZYnGx3hkCyV7J2OXrXVTUu74ykWmein48JpHo71x4D60/XaomAJs4Gfru/avWwMuHkmdminskfoPfAVpEbVAp23ZQXEZ0sfRaVq5s/Ap9qiQZLq3+NEjCsUsIi+9euyyjQ7Qard8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238152; c=relaxed/simple;
	bh=cYY+UcoPJtcwpUYE/xB9l0lk416abMLoNHFFwBOD08Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FLx5LzHeOLhBXchc79Ye23D+oR8Cpc/QNcma1myKL0f0frjfwl2oaSzuWOWDvhjCHkDDNr4ZjZ+v/Nbfen8PadnVYgOOyOV9KOK0ifkdqDzyX4goHSvKAdWZAl/oOAwVDtjNJfQBLP/aUcrUwuhMKSQDhu6QpHicoj1cvC1yuhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h6VB56f0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6VB56f0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837f288194so17965345e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771238149; x=1771842949; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=il3up+c5fnRwBnfs7hyIeXZdI4lnvbRcc9BTTBqVr7Y=;
        b=h6VB56f023WtqKxt24T/kauiN+Db/QeJe435Y64u3HQirdlzYr7W22t1vKg0Z54+Pn
         MnXv8dGm+BwrxWnN8GfIBl7JRjgKOq2+da5FVqvsFcQc3B7oKCTP82dPwY5OXbZ7i+ds
         PeUKi58ZqlEIYp36mO1jQQVcnsApXuLU24V76hnesIm9jw93UPjn4MQgD7fd/Jl+bTiK
         cTPBf5WEie9t0hMaoNocmppSVNLXjrVUpvGWowL1HFqq9FbER4nRLBQ7MfL1pPGDU/yk
         2GN00ulIt3gikZvsVdvNulj5+kM4j2HAqWHBtKL5M0NGpTPCqnk6ujCgrr5IManWBVz9
         iZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771238149; x=1771842949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=il3up+c5fnRwBnfs7hyIeXZdI4lnvbRcc9BTTBqVr7Y=;
        b=cvPFuWNA8GkJeckBDKCeKvh851g2w9lOC3gyLwr9Y2077MCtsJVvB0Xp1AnKvxHFAM
         VWSQrIq7j3L5TSaZ3mb7d/PxKE1mTrxbC/nkLU7OCUK52JSLT6/xsTXQ1XV5+M0ondS9
         2Ob5jQu9UpTnciV1+oSEmx3kAQ5MX+tJdjkX0AIF66gHTt0lUXScReyUGLgy++CKtcCG
         yj6np08xnsSXwxw8mWRvOJ0aHZlCjZEAyVdSgKd7KYNZTJptqFgmHl3i0DBy7TTi9MS9
         aFMrthkXbeppOdHqLd4lHSP/eoFHwdbZm2KMbhYUuQ0mvTqPPu8PWTm6Rd75zpED81TA
         0+eA==
X-Forwarded-Encrypted: i=1; AJvYcCX33QV3ccNbTnkYeUm14Ev956pAH4F/VBLQ9ByK/PWhZLynSGsMpz3B8ItzD7MeC8tsSiP9fZW7cW0NVgLuyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWgCP1l5ORhf8YfbwdDemSoGBNJ0l8SeCsVvPqZonUIBP7Xlb
	dyiMuVaus4s0Gk0qkAIAZVzk8rMZfO7p0pN8/xdTM9CH6+RI6/6np8k/FmJLsOHREWN1Amz4PpB
	CDPr8a5loVMp5c+soLw==
X-Received: from wmhi21.prod.google.com ([2002:a05:600c:14d5:b0:483:6e28:c182])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0ca:b0:483:78c5:d743 with SMTP id 5b1f17b1804b1-48378c5d9fcmr106715565e9.28.1771238149251;
 Mon, 16 Feb 2026 02:35:49 -0800 (PST)
Date: Mon, 16 Feb 2026 10:35:48 +0000
In-Reply-To: <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com> <aZLc0YMHd8C0bVD2@google.com>
 <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com>
Message-ID: <aZLzBP_v6JlTR9WB@google.com>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 06:36:29PM +0900, Alexandre Courbot wrote:
> On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
> > On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
> >> I/O accesses are defined by the following properties:
> >> 
> >> - For reads, a start address, a width, and a type to interpret the read
> >>   value as,
> >> - For writes, the same as above, and a value to write.
> >> 
> >> Introduce the `IoRef` trait, which allows implementing types to specify
> >> the address a type expects to be accessed at, as well as the width of
> >> the access, and the user-facing type used to perform the access.
> >> 
> >> This allows read operations to be made generic with the `read` method
> >> over an `IoRef` argument.
> >> 
> >> Write operations need a value to write on top of the `IoRef`: fulfill
> >> that purpose with the `IoWrite`, which is the combination of an `IoRef`
> >> and a value of the type it expects. This allows write operations to be
> >> made generic with the `write` method over a single `IoWrite` argument.
> >> 
> >> The main purpose of these new entities is to allow register types to be
> >> written using these generic `read` and `write` methods of `Io`.
> >> 
> >> Co-developed-by: Gary Guo <gary@garyguo.net>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >>  rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 243 insertions(+)
> >> 
> >> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> >> index b150743ffa4f..6da8593f7858 100644
> >> --- a/rust/kernel/io.rs
> >> +++ b/rust/kernel/io.rs
> >> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
> >>      unsafe fn io_write(&self, value: T, address: usize);
> >>  }
> >>  
> >> +/// Reference to an I/O location, describing the offset, width, and return type of an access.
> >
> > In the next patch you implement this for usize, but here you say it's a
> > reference to an I/O location. I'm pretty sure usize is not a reference
> > to an I/O location.
> 
> Methods like `read_u8` use a `usize` to reference the location we want
> to read, so aren't they in that context?

Oh .. I wouldn't use the word "reference" like that. How about "index"
instead?

Alice
