Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79534F471
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760707388; cv=none; b=P30fqjfRHEq29BkasrFAqUpJwglDVaRSUgG/nsfTcSMJCGgjMHOZKsg0ChNc+T8Z9T70Y2cy/vW5CU4ej7v8fn6As/2hv/UAl607Qb4IHv2lbbd0JNUJZ2A86NjGaEMVJhyP31Xfk9mlFRpfEcMgTWrhm3u1mXYlHUNYxw/aP7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760707388; c=relaxed/simple;
	bh=FqUJZOxa6wftUR/btW/DFFPGj7yyzJyrFIh3F2Zge3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d7LDx3Sl+eKQyZp71eVFr5NgKfUAgCQDoDY6VtHdJRZX1RQMw0SWUOKKNTSXqyfmfHC1pOVwQIC0llvdiSvTGbU62bWLgul+yuQ5jAng+aGMM5el9txhpS6cdz4BP/b4Qj1vpVC2WdBM7TJ1iOllw1r5vNa6ULngQhFb8WIw7lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uRqb+eVM; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uRqb+eVM"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47106720618so18720965e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760707385; x=1761312185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Yn8qbQoqMlqz8J8ZWtSvsw3x4TMtEW0q43wUSvDUs=;
        b=uRqb+eVMv5CUd8vf5hIs4eCnSoZYmJ1Q3pb3+5vjLCppoRpspJGYR69zF2LGJqdI4N
         EZczzhi7irn8HorOR3DzVfNzLCuGrND+RU/XNru2LLgN2tMtdZXg7qiJInIpiPjioLpG
         IgtINKhXw0oZ5YEWIIEI+NwWbxBf9Qr4ilY0tVsZ6JyaO5qQOAj31yepaA8Nrlq/jcqc
         J1o+WoeGf4QYxQKESzR1O/A1DZPaqpaHEibhKnUX8ggh07dFl5RXSXWce8l6M8ZHFIzo
         k5tJuPECBg51cVc9YdxxvxfXn53l5PrR6zZQ3Dsl9X+mjDhBFZm6XwYt78K39x6Le1xb
         OlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707385; x=1761312185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Yn8qbQoqMlqz8J8ZWtSvsw3x4TMtEW0q43wUSvDUs=;
        b=mIRJ6Byx9ACeI9kqrWpKmhFbzL0pJ2sbLrwD/4TxTNr7z00+Y6KpTh2CcXyqLconrn
         8pjMd3gnFyIHqUpJcV9wPj5HCpQ1Z7T1wfOmhaF/a+htGzIRCheJQXr87UTsEhOfbkOM
         JcLuSBvnuQ3vI4KBoQKSjbBWlIKG6mkMfA6jH/cVy/pjlMoSpOdoZNlBXnHpiu/lJr84
         mrKYkgNq3GO0i9tXYkxDKp417u3vjiWrv+dHT73jC9UjfulD228DjhDwu1FN7VoavRDv
         /Xc+Thxm6kWba2KqH7pWKKpdTce+5xz+vSTz/KV2JHmX/V3r6PwgaZyiYCVOiI8KENTg
         eQVg==
X-Forwarded-Encrypted: i=1; AJvYcCVNsGafZ8Ki19whwyxgpVN0SRGTq/lsjM6yFJnZJQVxrnO6D/CuRCz/USjlGgsJ96NEwKClB1Y13+mktGsBow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbuN7efdQz4YrexKgUrqB1/hR7twlVBnlJhn+t1Mq5wrvAXN4S
	cQo5NgC5mufwaq4xQaHb4qVNJUt0/HGV1e8onkvglTpNvPMgerWnZJbYJjobN6y4waOucZwU3l/
	oOnmf8InJ4M0bw+7zDQ==
X-Google-Smtp-Source: AGHT+IEYb4fFMQvjDzvyv+R6CQU79EQ8AAQbZcI28Pmog6TT3PGCHiGdYfpHiQEQ7liXGiI1hW8U/8CHkswY9G4=
X-Received: from wmgb8.prod.google.com ([2002:a05:600c:1508:b0:46e:3190:9ce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:811b:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-4711787c803mr27313335e9.12.1760707385665;
 Fri, 17 Oct 2025 06:23:05 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:23:04 +0000
In-Reply-To: <20251016210955.2813186-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com> <20251016210955.2813186-4-lyude@redhat.com>
Message-ID: <aPJDOLvBldH_Km91@google.com>
Subject: Re: [PATCH v4 3/9] rust: helpers: Add bindings/wrappers for dma_resv_lock
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina@asahilina.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Viresh Kumar <viresh.kumar@linaro.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 05:08:16PM -0400, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
