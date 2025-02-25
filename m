Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3D267B09
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483576; cv=none; b=CD3YRRsQdu24w9Xox53auuivyC99SanlJSEmJXO1ETNaqViM36dJEDrzNINdcu7IITPDCUnClvxOSBXrCFgr+g0WX3zRki6TYt9JrGrRbMMZbVwauxSkDhyt4dnz7lLZChoWOW8meCJRsizOAoOzRkCziJyJbFTzSEDqo4RIac8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483576; c=relaxed/simple;
	bh=t3CqzkdHnut+AcOWMLBrzxQFVM0JQ4DtqoSr9BGiXcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHvBnR5ohhiC3Xcc9hwIAjtjAxMOdksw23Z3jbiZ2zxcIFtHEPzPHsXCxH367dFR5KojhawmUEOe3/1zRJkjBnZSTQnWITLq+Mtc8AOH2LnLhHJvKsEf9UEEeaUBqyHnRpswqEXwUhEiYOCHZ7iKMtu0+50uVsJ2ncmw59Bpx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=syEoWgxy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="syEoWgxy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso4058826f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740483572; x=1741088372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3CqzkdHnut+AcOWMLBrzxQFVM0JQ4DtqoSr9BGiXcY=;
        b=syEoWgxyrUEQbf2zftArtuw1lmWIpEgCLvmgMNQEl2J1wRLaJYWOUki7LeIf4JO8Ta
         CrxMkyc9e3l2mqplx5mWeAJ3ealLwC+VU27zX8Z44fNdKuwzxQSOnQZTQTR4rUpO+FeW
         54J+dOJV6P2zYJi6SYj3/VwjmdF2bKm1I4EhK382f4WF2wwT4cLz43XpsYAtHrWLvVMs
         zU56VfjoU7IWbQj68UFszLIXCNQv4Y8kv2qxYS8vqoMVKQf/Bc+jgxLNnRECugnTNEqc
         xBw5yrcDV1tPxofpKeThlvRI340Gs+N+Yv/dduesOJ0/deb4uorQHM6sTEjnxT85GBJ8
         KKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483572; x=1741088372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3CqzkdHnut+AcOWMLBrzxQFVM0JQ4DtqoSr9BGiXcY=;
        b=XnLxTqKotT2khAvaL8pB5B2iQbcovgniUKtvWH8obSSTLa1QW2xRutCt7kyU50UgAe
         QziwmqLDlScCOjaekc08T6bfBu3gpQsLIzZYErto3mHV0A4R+KS8q5mqQ0GL9VlneurH
         wEiKrcQ0a4p7Jj5GA5U8qJMtSxWnKn811v+nHKOzaJsbrSlhVIJZ3JMwiXHvFqI88wFr
         XievmExkdd2PCSswcBq+gzL6VBL/SVjwDVW0vLVNTVw7hDKed4hpoSbph3GcxFDZSl5e
         nHwDdDjZue3KcsRpO9TYtuNFvTxJ6/05Zr4+lxdwJKI0JTLK7FuVcR95Piq+jzIpJ5Q/
         Lh2w==
X-Forwarded-Encrypted: i=1; AJvYcCV/dmRWCwqfdGfIuwKKJg6gqOLFzkhccCBIEwhCM4inHDqe9E15aT1y0yjamW4fm+SvaQz1ZlgPfFJIi95gWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiBLyILdbQpWJOzh7nDzwIop51CLyPluVZPtbklcNqgqc8v90
	McuTDZ4SmWoTAJnL5MP657zMkr3z4L1gi2kiWXguqO0t2LgYruvibiIzZrKcL05a/ZLf5TLfLTa
	uWtgK/2F7vVOx/50p9jlIZNAgdIz3cOkcq4f0
X-Gm-Gg: ASbGnctTY0WEJIH/MRxvYxDvA1QKn19qEbSwg0usNOgHGscIZ2n8yDaKhazZ4UyCtTe
	xkoy64HRqcAtEt0eyOifxhe1MoVRy7AiTs6sYayPGOUvA1MsRUYncF3KMxGuKTLzWNJaOZZH2P3
	gPaXa9hgIRBWPFD9lACr34/1eXxVDcLpervK341w==
X-Google-Smtp-Source: AGHT+IE6Jf5uEQbdDoyduPeETuIxbOiU+I7jiNghAe4VRJFYQVTUjCbcEPTzMOlIpJV+X6jvntuOk2+/yAD6xYYIwCM=
X-Received: by 2002:a5d:6d01:0:b0:38d:b12f:60d1 with SMTP id
 ffacd0b85a97d-38f6f51da39mr14004109f8f.26.1740483572550; Tue, 25 Feb 2025
 03:39:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740475625.git.viresh.kumar@linaro.org> <68ac0f0ee3c0ebd3d3cc078a6270752778a1b732.1740475625.git.viresh.kumar@linaro.org>
 <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com>
 <20250225105425.ooqvefiae5bmr723@vireshk-i7> <CAH5fLgjbW0yGm0TQcQEG9cc+i3WxbF8JKaqBUFD7=pJ-JkJ9zg@mail.gmail.com>
 <20250225113642.5fek3cy3jvmusunz@vireshk-i7>
In-Reply-To: <20250225113642.5fek3cy3jvmusunz@vireshk-i7>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 12:39:19 +0100
X-Gm-Features: AQ5f1JpyhRXUj6SpImh60VBaSqHXJn1lxTjc-AZw088K9Q8iddxPYbe9odSJppI
Message-ID: <CAH5fLggYMHxuoc1m385UL7sNB1ojAg=pwZ-_xfgHiFSV1-xpfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 12:36=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> On 25-02-25, 12:34, Alice Ryhl wrote:
> > Hmm, ok. I would have expected it to format on one line:
> > unsafe { drop(KBox::from_raw(self.ptr)) };
>
> I did try this earlier and rustfmt suggested to format it the way I
> have done it currently :)
>
> > That is what normally happens when the semi-colon is outside the
> > block. Not sure why it did not happen in this case.

Very weird. I'd guess that the #[cfg] is at fault.

Alice
