Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A300E3D3D1A
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220003; cv=none; b=gQKWahjokW5wEBBuV/UQFRaBCoHBZmY9PNuJfunD4Nwq75S359vbrJemA/vK/ZAVQSrN8rksZIHOKOHdw0uKIpq3ycIfK7rzHDNiKWRYOpT/aBrWaZ7WiO0nsktF3Z+0QNPuCmIlfb4mKdTfAMw9gwL0wyo9n3xYQa/e1g9UyEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220003; c=relaxed/simple;
	bh=L8FJABVHFHSCFveVLUCxW+JYK5AyBjBR4VFqAhgVR9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iNR47lObuPP/VoCM26o/RpLE9dkFhPcEzrBKkcirvfHXTjJHBhnu+7LGDMOR3xQMisHdIuq+297X0wjEe7PnXNQnBFTxggeEDRYXUanNrYZQFNZSxeSo5VupWYEQl+DDi4BHSlCGrYFBehWJHKvCrL/Dkc85R0g+s3BoTEJ3pTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cl7d0obZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cl7d0obZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806b12ad3fso20418715e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 11:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772219998; x=1772824798; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBgwzx0zzY1/PqSKldnWCeFUNyWLZOQM8NUJjdzdoSI=;
        b=Cl7d0obZjC+dnlEIxVUSlNuNlspjAbPahotYuolNpPMY6pDbh7/lWFcprc0eWp/r8u
         /Dkosoiz9/Mfk6qX6nhW+1wJITTpY1zTu1phiCH5XIs8An+Q4aM13jpBYr8/kj6HS6pa
         xZz1hF3Q1eEtF+7I4hmPG6f0TZ5XGVxdCUck5OCkDS03yTNJCzXQG3dtf20ATm6Kaqkz
         +zXuWHe5i701/RF8BU2ANKTPw9SnfjiLDClHu7KiPGOmV7hz9AR71H7fLdBUqcvMmHT7
         n37mNe9BD+b2kadx5onopL+R6lFlEsKhWYMRCm9o1M7tt+/XIlQ8+dK3OjHorzxSaBIJ
         UGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219998; x=1772824798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBgwzx0zzY1/PqSKldnWCeFUNyWLZOQM8NUJjdzdoSI=;
        b=u/7QzkFU1TSQX+pv4EvBaFJlwDBPY6OAGqcE7cy4uJ+zMTJcp+Wbk5vMWECpTTiTrd
         vvbDpYuKQXpWkg+v/0bmrSEyaEmoEfVwxOgjpQ/HZQrWT1UHYQKhMnvTJtj3UnBLuKbO
         HzDrphtXKGAS3BEwRjifUbbjNiXSarVxvyP+rZTpND0gYZVEuMUGzdcWJBhoBKlsmUV9
         OZH5uMf0/7nnV3jpanIhCoS+CKMt/rwTMu85ySd0tuWLJBHOxVvO0oT2ZhEsJ81KuOM7
         GbNPYU0rnlZTqTMTx0MK9h4gbOcZYH0cleUpAjRdQycwfKjCVuf4l5fPxR2BEPlP8IsE
         zOrw==
X-Forwarded-Encrypted: i=1; AJvYcCXdbcCPidzD8jQ0ZsHAY8CYhui++0bG1LX69K3cPQg/Smha6l7uJI4v2EfyysEnDzsEqT5kwylE88GyMxC/xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+nTzEFvU2wSKNHJ6XKMie25qhZUsP2Nw4JT7tjpYdIXEUIKTt
	6UmSVMeEJrQJFP2Uucq7zmjbINIlrfcc4K+qKxtZoKAeJREQpruRihpPAL8ms6s5J+5E1pdfdeH
	PQ/BhMHSGcJNBRihVVA==
X-Received: from wmqd21.prod.google.com ([2002:a05:600c:34d5:b0:480:4a03:7b64])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0e:b0:480:3bba:1cac with SMTP id 5b1f17b1804b1-483c9bc55c0mr59327825e9.6.1772219997631;
 Fri, 27 Feb 2026 11:19:57 -0800 (PST)
Date: Fri, 27 Feb 2026 19:19:56 +0000
In-Reply-To: <aaHrxzWIFFUjzWhu@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-1-87de133f7849@google.com> <aaHPs-nULPEt_wJB@slm.duckdns.org>
 <aaHp_pGBxA4pNiXJ@google.com> <aaHrxzWIFFUjzWhu@slm.duckdns.org>
Message-ID: <aaHuXEO64ONKMW4O@google.com>
Subject: Re: [PATCH v3 1/2] rust: workqueue: restrict delayed work to global wqs
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 27, 2026 at 09:08:55AM -1000, Tejun Heo wrote:
> On Fri, Feb 27, 2026 at 07:01:18PM +0000, Alice Ryhl wrote:
> > On Fri, Feb 27, 2026 at 07:09:07AM -1000, Tejun Heo wrote:
> > > On Fri, Feb 27, 2026 at 02:53:20PM +0000, Alice Ryhl wrote:
> > > > When a workqueue is shut down, delayed work that is pending but not
> > > > scheduled does not get properly cleaned up, so it's not safe to use
> > > > `enqueue_delayed` on a workqueue that might be destroyed. To fix this,
> > > > restricted `enqueue_delayed` to static queues.
> > > 
> > > C being C, we've been just chalking this up as "user error", but please feel
> > > free to add per-workqueue percpu ref for pending delayed work items if
> > > that'd help. That shouldn't be noticeably expensive and should help
> > > straighten this out for rust hopefully.
> > 
> > I had been thinking I would pick up this patch again:
> > https://lore.kernel.org/all/20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com/
> > 
> > but it sounds like you're suggesting a different solution?
> 
> I'm not remembering much context at this point, but if it *could* work,
> percpu refcnt counting the number of delayed work items would be cheaper.
> Again, I could easily be forgetting why we didn't do that in the first
> place.

I guess the question is, what does destroy_workqueue() do?

- Does it wait for the timers to finish?
- Does it immediately run the delayed works?
- Does it exit without waiting for timers?

It sounds like the refcount approach is the last solution, where
destroy_workqueue() just exits without waiting for timers, but then
keeping the workqueue alive until the timers elapse.

The main concern I can see is that this means that delayed work can run
after destroy_workqueue() is called. That may be a problem if
destroy_workqueue() is used to guard module unload (or device unbind).

Alice
