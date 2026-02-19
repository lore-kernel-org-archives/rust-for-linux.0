Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54E033F8DC
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511666; cv=none; b=EJ0Y5zfnKMjfByOA5jiekHtakBqOfJpwqe5pRHKWwvlixVkRIXCP2u/Jp55PKjyhN6/LU5G941mLAcAAttI1z6aPDI57kzCWDv2ZzOojWT5ExUHzyL6BpF+KCmBtdJz/9WzIkeI4U8NdSWnrS8egI0yfU61bGPgNnOhWlb5aoBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511666; c=relaxed/simple;
	bh=TwBpYocc+CnzwY+5av4C0zbWylZqk7tUtrk7t6D667k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eFEYYhqvd3DgzuGZ9AmQMeq1prRCJCG4BZDLF92yLQ1kh16jooa5uCt8yEMDVxjrKDtgRBBz7hvV4y96OFHOpvvHfq8586yoB5I6lZE0g/BpDwptsTh3WUvN88lI2nWCvIHMqexv2NYSkiScGTpYFKH2w+rvUVI1spu+wAE+OxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qptehnaa; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qptehnaa"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-436267b01c4so990220f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771511663; x=1772116463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IOzT2wFH/GzUYi6lTDkDLSd1BG4gudq8s1ArkyhE1lk=;
        b=QptehnaaWTI1zjckCQi9P/V9b77T6Fms/Oqk9Bt0B7WKoB7qKkwJIyGlUB2tsPvCg6
         S0XYjVVmUi9mjoYrN0Vibpsoy9/hLXgAVoRFeaIMxHDwmvpMje9qOE2jc0+bQHdx+Zsi
         dNWUTqWeXndQM0dtwn8aZ5L+AxuhUtmctkgQO9J3t+XWYUTiXpyHwfGj8EQ7abDkK2dH
         kp62spKadpRaoxfnsS+fDPFVWbcLuAnansOcR0gylvmKUutGzltNZtFcrtNtMmQ+vuBu
         nyo0TxXRg9bDItAbw3oVY0s8JIk5eSHPNXMfwAk/xnbC0CzH+D1uMd3W09EXOcrlNY/U
         IfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771511663; x=1772116463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOzT2wFH/GzUYi6lTDkDLSd1BG4gudq8s1ArkyhE1lk=;
        b=emo97WdDa3bcvwHks1WTUdUn81DcXpU6pzicJlVJ+zBu+KfhPMWXRejRAf8ybl4M9A
         WRBZto5L09HW8VSSUogKvuM2qioTf6ZJ7tnH3YjkLZKxtJMDkAr5yJfhHvSKOw6ojVXW
         wEgrX3DQCkkRar732CKIwPk/IfVrWHb9a5lR73JB8Y3drK5EO1zAwmPHNGnV89y7pkdi
         19h88HQxojBLLZ3H/ccRjUw/gcZ6yWQByijCvAzyTLhus57OnN5ktj1UjUna02m8W2Le
         GtU7PW82pe99FJVVql5JO71lG491kDuCH7AQVGOJuYxzGk31f80mkB2L60p9PmkfQ7ye
         qQeg==
X-Forwarded-Encrypted: i=1; AJvYcCXj3FzVdy71em6JMnwlMT0So744YV98+OwryTKPxpEsKH+E53eS/DN4YnwS/HUpcrx02KRprlUKpbd+lN3h+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/q8Ts/6VjX6AKkQcLZlAPq2pCxohPZhN7ExSviNjQc6XycYt
	pFPBzCGbh6vGCQbGbritzY3xHXYHb+vEoPzXmIXXqOniY4FnfEqWGbaxveloW5Snk3lSLqNMSKj
	v7f1U3/e6HQ95U6MiVQ==
X-Received: from wrua7.prod.google.com ([2002:a5d:4d47:0:b0:437:6ebe:6e6a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400e:b0:436:14c7:32a6 with SMTP id ffacd0b85a97d-43958e4f838mr9356335f8f.43.1771511662753;
 Thu, 19 Feb 2026 06:34:22 -0800 (PST)
Date: Thu, 19 Feb 2026 14:34:21 +0000
In-Reply-To: <0655a26e89c960d73888dcfed70645ec@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
 <20260219-close-fd-check-current-v1-1-fcab8d8469f5@google.com> <0655a26e89c960d73888dcfed70645ec@garyguo.net>
Message-ID: <aZcfbRS6cZuKykkV@google.com>
Subject: Re: [PATCH 1/3] rust: sync: implement == operator for ARef
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 02:27:38PM +0000, Gary Guo wrote:
> On 2026-02-19 13:52, Alice Ryhl wrote:
> > Rust Binder wants to perform a comparison between ARef<Task> and &Task,
> > so define the == operator for ARef<_> when compared with another ARef<_>
> > or just a reference. The operator is implemented in terms of the same
> > operator applied to the inner type.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> I suppose `PartialEq<U>` cannot be implemented due to trait coherence issue?

That's right:

error[E0119]: conflicting implementations of trait `core::cmp::PartialEq<sync::aref::ARef<_>>` for type `sync::aref::ARef<_>`
   --> /usr/local/google/home/aliceryhl/devel/linux/rust/kernel/sync/aref.rs:185:1
    |
174 | / impl<T, U> PartialEq<ARef<U>> for ARef<T>
175 | | where
176 | |     T: AlwaysRefCounted + PartialEq<U>,
177 | |     U: AlwaysRefCounted,
    | |________________________- first implementation here
...
185 | / impl<T, U> PartialEq<U> for ARef<T>
186 | | where
187 | |     T: AlwaysRefCounted + PartialEq<U>,
    | |_______________________________________^ conflicting implementation for `sync::aref::ARef<_>`

I can mention this in commit msg if I send another version.

> Reviewed-by: Gary Guo <gary@garyguo.net>

Thanks!
