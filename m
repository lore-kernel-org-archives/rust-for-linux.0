Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A41345CCE
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218882; cv=none; b=S+pLVoT+txPZEzheWLq+8epcaOPl5NASDTgbZlPDE2KK4VGvGQwg//P79uMRhVPzSihfaTe7odiuMcvoEwuZl6yoEMIHrz7Ao21aoIU2pRF8JDgRGorqsdvnwZJhGUDhadjR9jqSLEuL05cAkcIoiu6R6MRAxIZ5FL0+QiGa/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218882; c=relaxed/simple;
	bh=FJ5/Y7lkvMiZD3996h5Kzz1gx0aNl94jykd5wUZUaSI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vFa1B4hx/wNVndgNpctLc/cwrlSN93hoNvgGuIRSw54E6vOuLB5wbOzoayltekxNjab1hrHbUQnsx+75ik3XqSnkYHGBQ9+o+dtPGJt+i4lnXNVCwJw/MttKNtcqUOf6wmd2QB2Ya0dtMV70MkxKLzNcQdqQNHBEOJcREX6YzyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FZCIOjRq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FZCIOjRq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836abfc742so15257145e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772218879; x=1772823679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z76+M/HerVegBYFMUlZFszGzoRv/Jzqi5XqbM2psUic=;
        b=FZCIOjRqXkQarF3Xp7l2RSjcateE9lJNmv5MZ21MTpHih9YPZisuzCdZE0NGXTw+ru
         ou/a6ZlhP1zQUuPlMok0SrjdkWtU//IHBjNPfVUwfJhKVHuw/0+LXecEQjSYtQmWZifQ
         jNF2swb2cOiW6nAzi6ET+e9kviJpX2/JPy48jNUDl+meNxHQvNEfN2PvbEoJRTolX3/i
         H/9fXJAuNSTCICBBqdd1W2lCLeIEg/w/p5/qnSghqdrrag8yfltIaN5pMBBqq8VTdmat
         8/zyw/NSnUoy7TT9Vsz/qcWvpdYk2s4B6yvp1r9dHONL5hN7LewPuBNvP+IfbHYHzlYy
         PVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218879; x=1772823679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z76+M/HerVegBYFMUlZFszGzoRv/Jzqi5XqbM2psUic=;
        b=CKGhdhKG/rTF0oiJq61BVwGqIGSwbovBDm/8JuTp3C6Hx9jaAYoXVcyv+34BXQuEeS
         SIgTNxL62QdRA4/6NUzezMO2qNVYKSYveXtqjNrEG1KZnVeDyFERiPYU/8k7y0ulLRGt
         TDIfHQC0BJrF0F6YOJTMfUL+2647urqvEzxcu/OGL/s9iG3VlTNHawhGJH44whGMHiyG
         a6y10TVshj2D5s52ChUrO8gGC43F+rqxGlSYn5GlhxeYGvXitp2ydr12AV1EbMyHRIBe
         NbVi2ewpOhQX+3/2FOrPMsLn/SRSt4k3w3Hl0G1tfrUA1HTWbplgD2eneO7svkh83ppd
         Xrfg==
X-Forwarded-Encrypted: i=1; AJvYcCWCAxpEeAXGDH+/ecB9I+Na02jmrE0RXXdIyugcjFu4CetBGVQt4qjaIE7SgBDUdwdwEmOYPTjqkk5beIzX5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUD9u2RLqukiCqMrrJu2NvjENPA/ebPY2OKgNbfs+KcsdCYtn
	VT1GvENPpxzD++HIyB4kHK236KJfKe4bkWYjJkaFXgbzbMgR8JIuCL4crWy5gaAuE9ocI20LtGm
	Yzq5Urf0R8WjCwj0zUw==
X-Received: from wrbeh6.prod.google.com ([2002:a05:6000:4106:b0:437:6c0a:770e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d12:b0:483:9cdc:8ac1 with SMTP id 5b1f17b1804b1-483c9b9eb7amr56134105e9.11.1772218879316;
 Fri, 27 Feb 2026 11:01:19 -0800 (PST)
Date: Fri, 27 Feb 2026 19:01:18 +0000
In-Reply-To: <aaHPs-nULPEt_wJB@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-1-87de133f7849@google.com> <aaHPs-nULPEt_wJB@slm.duckdns.org>
Message-ID: <aaHp_pGBxA4pNiXJ@google.com>
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

On Fri, Feb 27, 2026 at 07:09:07AM -1000, Tejun Heo wrote:
> On Fri, Feb 27, 2026 at 02:53:20PM +0000, Alice Ryhl wrote:
> > When a workqueue is shut down, delayed work that is pending but not
> > scheduled does not get properly cleaned up, so it's not safe to use
> > `enqueue_delayed` on a workqueue that might be destroyed. To fix this,
> > restricted `enqueue_delayed` to static queues.
> 
> C being C, we've been just chalking this up as "user error", but please feel
> free to add per-workqueue percpu ref for pending delayed work items if
> that'd help. That shouldn't be noticeably expensive and should help
> straighten this out for rust hopefully.

I had been thinking I would pick up this patch again:
https://lore.kernel.org/all/20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com/

but it sounds like you're suggesting a different solution?

Alice
