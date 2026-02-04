Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7183E426EBC
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770221971; cv=none; b=op9wSwqR135M44QPNONp37GspxNw3wdHIj3/nNSUUX73ilEAOermoroXgUwMUKOPT9MBWhJiBf6lgLsRPo/UoiG/Qg6TpSpaz88EJlsDmAbPhzdxFxgjB2JyYiwad8B9PaTzP/GXQccssyfyHYCyP+h9q9YxwcvGzmWQhM6kATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770221971; c=relaxed/simple;
	bh=zONL2cQ43hab0qFcae0Nv0FiKk6gk2BynkXhkbEgmYU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m23BfZ74pQhKe2HPLsk/S8oew4KMLcxDCg9ZKH/iI6jqyluVitNTAotfxzFy3a5SxJc1YEaQIP7F2qNTe4jVrXPzAdm6XWTMH/6GVX/5qat2UwduHL5wJW4rKQdtj03i09+X5ZDD2ATyr+vGQuubxG0xP/vy+LLhitzlEMrhNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=opkhgau2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="opkhgau2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso6707205e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770221970; x=1770826770; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QMTkBSWNVOgLcxE25g5Lk+0FuNOsPJzOK2pb+pCCoE=;
        b=opkhgau2sd3UpCMv3roHl3FKGMdKL5WYPaDLyThE4l1vaX/YMtRqXnV91aIths5jwX
         PRN6pjU8/ZHSKUVxWUpBBiQ9aTCZlAP24Z0s2zar/Zp9o8p/F2jHLVLZMs75INtTPcdd
         BhZ2bxzHJvx4daPdDA11ORFGvBhChk6C7At2fSk8FMdVxwy31gaOrcHr+cCYrxKw0t7I
         vx9HXSKChu0SIBFdi4oQaJSd1geCjIt/a+XKGDoUm7wIuIGcHz0+wRDH07jLVq3Im66a
         TbepBgOTP4RiuM6x6lOmSGRErb4tjINeIaJz7Sa4S8TMzb2dDj5t5pUq+8EXYrSouWAA
         jBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770221970; x=1770826770;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6QMTkBSWNVOgLcxE25g5Lk+0FuNOsPJzOK2pb+pCCoE=;
        b=NulXe8X1yw2N9TFN262gkFCslmZQpGvcyXC0dtew0VfJXtojsYaLii+iY5jcihDyl+
         Qx4JX4c4+teauQUCfo0U95ikjGdbOTtOoH+rzAw+Q1GMl1iDIAbz+uccBvHrFyi0RsCw
         4AfPEp/BJJNYy69SgziBXmUopAG5qNLyAM3OcMWl0GgA99//JFkwdiFPKpSMtd8FEY6L
         qeC7aR77vt4Ay1FVvTlRXTvqIFMjlvnVfoeyO5tKvSrjy3w8KH5dM2q9N8bToLN9yDfE
         c4bRqydS/Iqx1CgSCNegXK5R7HKMYUXeNhrCkv1LzygydPDtED2ELSZI9/OhYnnvhvZE
         sk1A==
X-Forwarded-Encrypted: i=1; AJvYcCXtiO5shBn95cxfsqrv16oNdknRFGx2yPS/rV6gjU9n1m9rkddudWV+9QMJTrtz7oWyqgAz743cd7XhhZ0slg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz069Oym0kLtvjeUTTpUPomeUbAHX4E8j+Tge4slRY0ft748/Zn
	pfry2o3NsG7xk39LyyBKLex4eUrMRJ5R9rmMECOT5BFrJCxkQZHUFs9/6firL+iUBckKqxQVcDV
	qRFhUMnVNrPjEM6zNCg==
X-Received: from wrs7.prod.google.com ([2002:a05:6000:647:b0:435:95e8:26b6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:438a:b0:435:9bf7:c6b9 with SMTP id ffacd0b85a97d-43617e3c919mr5034769f8f.24.1770221969781;
 Wed, 04 Feb 2026 08:19:29 -0800 (PST)
Date: Wed, 4 Feb 2026 16:19:28 +0000
In-Reply-To: <20260204155037.325482-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204155037.325482-1-marco.crivellari@suse.com> <20260204155037.325482-2-marco.crivellari@suse.com>
Message-ID: <aYNxkG3gCspeeW9_@google.com>
Subject: Re: [PATCH v5 1/2] rust: add system_default() around the new system_dfl_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 04, 2026 at 04:50:36PM +0100, Marco Crivellari wrote:
> The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
> respectively the futures replacement for system_wq and system_unbound_wq.
> 
> This change introduce system_default(), that use the new system_dfl_wq.
> 
> system_unbound_wq will be replaced in a future release cycle and should
> not be used.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  rust/kernel/workqueue.rs | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 706e833e9702..adbecdb2b3a9 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -968,11 +968,25 @@ pub fn system_long() -> &'static Queue {
>  /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
>  /// are executed immediately as long as `max_active` limit is not reached and resources are
>  /// available.
> +///
> +/// Note: `system_unbound_wq` will be removed in a future release cycle. Use `system_dfl_wq` instead.
>  pub fn system_unbound() -> &'static Queue {
>      // SAFETY: `system_unbound_wq` is a C global, always available.
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }
>  
> +/// Returns the system unbound work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reached and resources are
> +/// available.
> +///
> +/// Note: `system_dfl_wq` will replace in a future release cycle `system_unbound_wq`.
> +pub fn system_default() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }

I don't think we should use different naming than C.

Alice
