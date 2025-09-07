Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66BB18A6DB
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Sep 2025 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757242772; cv=none; b=mvRdEv2uo5pYCFiVnlj0/I0t8W7Oesg2M4c+YiIpHBYVhPz6JZcl73z2D7AemQ7xWGC3J59P3hBEHjyQAKJLpPyOMnaDnekaPVKmTTuA2ZoX2TJB4o06glpa4c9g/L6VWlZYi5D3G+v0sva8UTSQbrymdT6IVGJ5hAxaEPVReyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757242772; c=relaxed/simple;
	bh=Jn7DhhG1HyOHVMii19EXt6HoYd+tNXEZNiR41qcbG+g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pbP881Gx9J3t8US9MSgA3BYFOFUlPTxMfNnXzKvn0n0m89KQz1pPqxELWpxATQ7JYT2/GG3tubhwABYdSXW6Oz0wiU2+p9kOOxxOvOiPhXKxofbvDcm84lQA9RONoJ3H5tjNPUPezzWy6E7tXHwCasWryJNUpS0mEKCrzka1FHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pDmUSJnv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pDmUSJnv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45de14da365so6421465e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Sep 2025 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757242769; x=1757847569; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nru7/1De12iNy/Lo6mL6Fz1GV9z9SyaW/89+3KISNuI=;
        b=pDmUSJnvG+eqIZzkROd5SsqxZf4KSfar48FBtw5V1hzOHP4R5fLLIJjDb2WZaF3Q+I
         WYheXdCNqwO4ycg901s1oXN86qnJx3dEeF3LzomXKKWKzwP+LA8gpTkUBq+ndZiqh2GI
         12JSc4sQF6Vcnr2jnPAM+Crc96qLrwkGXXssfx+LgOO/Hm99k8yDjVReatZfJGwxyN/8
         gBThJpski5Xw/vm9DfZw7I8qxa1YAK/r0cvAuHmLSsdXLdH4iAOKEVhipuHi0n+7bRTP
         MtLkTRa8FlAlRLfq4UWO0eTEEq079BRqIeZxRZNyujSsJzxIMLWpLoqWJXvgEbTtr26h
         QPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757242769; x=1757847569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nru7/1De12iNy/Lo6mL6Fz1GV9z9SyaW/89+3KISNuI=;
        b=ShX3j8xRa46NeAIuggaeGzsoGPJpmBaowdzxMSGlVWl4Ln7esYHNIyHjxqp9X1cNku
         C8t9b6j0KWx73IroajOO4noboWxayHQ/LOFfDdNp6GBEFUmeTm4juxzLuy7n2SgvkshK
         W8oKa3kn8jCyDKC7F7s4EEBScQCQkdZ8EW6jtkAK1kxWqsjmQTak5T60J6RjxJ9BF89v
         Oxxiyg1DkzbsaT1r5X8+21ljPiR63hA6B29NMDqhwd/w0NIhfRF/OaR5YWffMQwz5Z3I
         ce8FKvdavEwa1m5sDN3UMoG12zrSBVU1su3JxOrKZoeH9KPdQxYCfGuQ7o4mYj4lXTEq
         pLqg==
X-Forwarded-Encrypted: i=1; AJvYcCUgE9HpWGeKAS+ldXqZrruLaUTmWv84YhRM5GQH5uvOaVP2Y6AFvm8Kv9APEuNi+dZGm4NTXVWOSICiaT+tqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5HpGSIKbGoSCQl1l2yZEOwj1K4aJ4l+bIwnUdD7qmOYaqyHK
	KT+tUhrvGWny36xcVeL6kxx8fCqBxlWvhorgxvhzQbXHY/aD+3bGbtTlmpsXXw+nAKytLf4WhL6
	i/+t89klhUky5yDqo1g==
X-Google-Smtp-Source: AGHT+IEO00SwMUdgmBkfcCYJ1fsDPI1xYuY1er0rIaxUxSTDTvFSh41jkR7cSeu8y5v+3Z4Xh0/HPN7Z/+Ekzas=
X-Received: from wmbet15.prod.google.com ([2002:a05:600c:818f:b0:45b:7580:5aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed0:b0:45d:d0d6:223f with SMTP id 5b1f17b1804b1-45de5ff494cmr5479955e9.0.1757242769289;
 Sun, 07 Sep 2025 03:59:29 -0700 (PDT)
Date: Sun, 7 Sep 2025 10:59:28 +0000
In-Reply-To: <CAAofZF4a6ARXOS0rmK5zY1Kd3xdODqdkj_keZmEYx8Z-JRvhng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905090819.107694-1-marco.crivellari@suse.com>
 <CAH5fLgiZnCbNLpuphv4Kgsu48kRkhf6wJiSLrrgsqyEDvU3X3Q@mail.gmail.com> <CAAofZF4a6ARXOS0rmK5zY1Kd3xdODqdkj_keZmEYx8Z-JRvhng@mail.gmail.com>
Message-ID: <aL1lkN5WcWkwiq3S@google.com>
Subject: Re: [PATCH 0/2] rust: replace wq users and add WQ_PERCPU to
 alloc_workqueue() users
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Sep 05, 2025 at 06:05:50PM +0200, Marco Crivellari wrote:
> Hello Alice,
> 
> Thanks for your reply!
> 
> I'm not entirely sure I understood your doubt.
> 
> system_dfl_wq and system_percpu_wq are wq(s) also present in the C code.
> They are part of the prerequisite already merged in:
> 
> 128ea9f6ccfb6960293ae4212f4f97165e42222d
> ("workqueue: Add system_percpu_wq and system_dfl_wq")
> 
> Let me know if I haven't understood correctly what you meant.
> 
> Thanks!

I mean that instead of:

+/// Returns the system unbound work queue (`system_dfl_wq`).
 ///
 /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
 /// are executed immediately as long as `max_active` limit is not reached and resources are
 /// available.
 pub fn system_unbound() -> &'static Queue {
-    // SAFETY: `system_unbound_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
 }

you add a new function:

	pub fn system_dfl() -> &'static Queue {
	    // SAFETY: `system_dfl_wq` is a C global, always available.
	    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
	}

and do *not* modify system_unbound().

Alice
