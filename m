Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4123D281
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645256; cv=none; b=RWSZ29/SnWUJJgSTtmtJZIUKIbIGce5/iB4YLtAwLLICe5Uw62I+e9B40rAOqybPpPx362y7q0y5PxpcqeFcWv0+nFkMeIBZuYbQ5cJ2g/v/0rH4ZSLkt2YzM1xqRYZ1ZGruxpeyLrcJkQtqqQrGZEjqYX/G6pFKetqZAPCwe/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645256; c=relaxed/simple;
	bh=Auxpjx5FMc2hhVQlgNfI5ygzOw21gO5dmGldCK9mvCY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IIUuEAutN7KLaRx3jw//eKo/XyT/RmBT4lpzpSURhcQAZ+Vxk+tMGBHNQEexxpaFCfnanurQ0xG1nsMt2SmBk43ObRfujK6qZWdNO3u/UjfsyZ5ZBPJz9ODFRJ0GMxxbjecFqHCyWO0ibPqlDwjqOTJ4pmBpBemEog38lxB//HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFwBlE5S; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFwBlE5S"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43768e2aa4dso1037403f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 05:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770645255; x=1771250055; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCBcj3Yd7ziwWPdB67tTlI6vTXFxVIocC5zGKA0hdqg=;
        b=SFwBlE5SLng5TjV5AmM/EniIiOxGzTMJNY6DX0TZ7BotupyrnmC6zXcGQMl6CCrQYV
         IJHCeDnAw5XMszLQpztwPFzLVtE9FcRGtkkdleUB6i7b2QevQ/8f6ARJIb90HdOA3qA0
         /qQ2vxNoy/BsrddTTBKwhhRv+/yafpYli/SaNQhRkato7SOcM85R4vwbDRtX0sWB2TuQ
         R6+uxfDQW9K0yLzvnpvud3Kj1dixqN97yMDZBZ9eUDP9yFmrW6HWifp65UPY1FGa26TL
         sZ0VF/L6Dkwl3zubd5ovncEU1jsO5xqWVB7P4DKjBFsPyaAU89iysayY5haP3ipFWzpi
         KOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645255; x=1771250055;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCBcj3Yd7ziwWPdB67tTlI6vTXFxVIocC5zGKA0hdqg=;
        b=rA9eO60jJaKJbuqoU57JtbQjB91+FS83rLQ3DpJHtwId2QviTr0USSnC0P8Ko4hJit
         e/JwgBxxEjc8Wg6V689nGMmccbHohs/Bc9oIAUgtDtP40Jp7h9EHR+Wk+ob3PcFsFrXY
         KfdQINY8ezL7i1BuFu+kOfWqo15uhSt8L6lMmwAmtXzLJQG41ZP2o+31gp0PzqGUe9Xc
         ea2l9oCiMKqvb9ebIQmU6qpaakn76JW0vxsQcS4dytJO2/7+gWVpiNhuD5U9lBCGXbtB
         MRmf1gnZG7NX1qPBs7Fy+awY7q89kiU9JfwHp/2kykOrh+85gQ04fcTzNU/7O/AJnbmD
         iaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvtSYc7GWMenY6viTG4xMz4gLLKZzRcnq5DXjAfInukzuG/rtcCBctsQ0kLBRZx0bbQncPSzPIt9gzGMC/qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxESfuyW6yOdKFh2id2texC1uHQFlIowGPYY7dt/48NUULRNr5u
	uBI95GNfhVHSy0qqO8HAQ2u0eApQ6yYFvi2h0sylyThIQV6wAQ6eXutJzwOLmiV2hJCcR5+NNxO
	3MkfCm18GdM28ziIaSg==
X-Received: from wre13.prod.google.com ([2002:a05:6000:4b0d:b0:437:73a2:2d43])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2285:b0:427:526:16aa with SMTP id ffacd0b85a97d-436293b6ae1mr16429455f8f.58.1770645254841;
 Mon, 09 Feb 2026 05:54:14 -0800 (PST)
Date: Mon, 9 Feb 2026 13:54:13 +0000
In-Reply-To: <20260207-binder-shrink-vec-v3-v3-4-8ff388563427@cock.li>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li> <20260207-binder-shrink-vec-v3-v3-4-8ff388563427@cock.li>
Message-ID: <aYnnBffE9zCe20Ny@google.com>
Subject: Re: [PATCH v3 4/4] rust: binder: shrink all_procs when deregistering processes
From: Alice Ryhl <aliceryhl@google.com>
To: shivamklr@cock.li
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Feb 07, 2026 at 05:02:50PM +0530, Shivam Kalra via B4 Relay wrote:
> [PATCH v3 4/4] rust: binder: shrink all_procs when deregistering

The usual prefix for Rust Binder changes is rust_binder:, not
rust: binder:.

> From: Shivam Kalra <shivamklr@cock.li>
> 
> When a process is deregistered from the binder context, the all_procs
> vector may have significant unused capacity. Add logic to shrink the
> vector when capacity exceeds 128 and usage drops below 50%, reducing
> memory overhead for long-running systems.
> 
> The shrink operation uses GFP_KERNEL and is allowed to fail gracefully
> since it is purely an optimization. The vector remains valid and
> functional even if shrinking fails.
> 
> Signed-off-by: Shivam Kalra <shivamklr@cock.li>
> ---
>  drivers/android/binder/context.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
> index 9cf437c025a20..f2505fbf17403 100644
> --- a/drivers/android/binder/context.rs
> +++ b/drivers/android/binder/context.rs
> @@ -94,6 +94,16 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
>          }
>          let mut manager = self.manager.lock();
>          manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
> +
> +        // Shrink the vector if it has significant unused capacity.
> +        // Only shrink if capacity > 128 to avoid repeated reallocations for small vectors.
> +        let len = manager.all_procs.len();
> +        let cap = manager.all_procs.capacity();
> +        if cap > 128 && len < cap / 2 {
> +            // Shrink to current length. Ignore allocation failures since this is just an
> +            // optimization; the vector remains valid even if shrinking fails.
> +            let _ = manager.all_procs.shrink_to(len, GFP_KERNEL);

Hmm. This way we need to reallocate immediately if one more process is
added. How about:

if len < cap / 4 {
    shrink_to(cap / 2);
}

Alice
