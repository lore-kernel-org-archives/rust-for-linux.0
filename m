Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A623321CC44
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645408; cv=none; b=IG6AeBSdliRIUDzpZeCB3l1JnwgEVH3R1LR0EPuWWBBncRPAsKQslkvLvZDs++hO6qT3AaUHaypfCZx8I6QqTr1pz3jNSx0JJRTg/oQpWeHPim6b3JLE0VOa9DYcz49xTffjfmQoUG7z2g7fRB0EOdEbAUHr+7HswFW2+WIraGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645408; c=relaxed/simple;
	bh=hX3arM2xiiK4Q34ajAmL+1FBdzbIGGsIsV4SUogzEq4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g6B+wxBUenehhxHJehr7EI1g36qkXAyQ17tI23+ehitzEsvhqLIk+BRtc46Gdlw8dbNXBYjvn5Yhno/fPSsHKn6zDuqxfu6cuySdlLiMDogOSt8w1jHGhZQ+X+0gec0oe6qo38J5cnnfkpLrpJoUPj2FYWTEs4OqfBmXKiWRADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K65tqmKV; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K65tqmKV"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4298da9effcso3560498f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761645405; x=1762250205; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw+QQNhXDjAHwQlCRIGKYXkkl+Ihpl9g0b/qnFHKe40=;
        b=K65tqmKVS2/UTaw3AeZdd+g9Ceq6MrgkaERa009zODN08Zaf/6bvYG7HdNBRbffgOu
         vUowZqJWqmJ9ihq58r+9FTe9U5+GQB+piJZdpoDXMBQPeFCMcUMWmbgutTs+8aMBkB/q
         F0GJ8gOvPuVQyENYsZJIrxkyi8WIl3f/9zb0qCugAKDjnNpycsjXSfCnChRV0wYnPUgI
         XxG4LIgQKrddVZm5ZOXGFMUreQAzpO32VS8RBp2Ba69vfRzVPXvd9DKStrsJZ8wvW6UP
         e/6sPOF1oSVslOBYqKqzwHF878vw8zbPbfsE3EDk5uW/JXmv41zQl1K/gsMvRlA3uB1C
         zM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645405; x=1762250205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw+QQNhXDjAHwQlCRIGKYXkkl+Ihpl9g0b/qnFHKe40=;
        b=YxWif2zYDbQnqSEC8xTbhXVSXWx1lVwUn/GVwATcOALYREQ42AAmh1IJNb4c7MyiRM
         L3UCLZOen4LhtqlPqpyz/sy5kT4AcWCXwo10tjG9EwXFWFfXasaey9hbJoMEa5iRHMU2
         I0JMHxlKwoDehWkXb4+q9DPWGH0UFyxNm+XQJXkbsdfVyuJ1hqpG8Fv/VIOSS703H14p
         BKS2bhd+nY4Oduz33Id81LJ+rsuQOb8a0bT2ds3arr65tMdPtd1pYqKKSKJVJckoe9e0
         TaRG02p8m9CMNgT8CFJQyNEY9zZ1DlpHlw9g11A2owBqDCXcwGSnr9KZIPIjoixrqCO/
         BScg==
X-Forwarded-Encrypted: i=1; AJvYcCV4QTLFnr9CL3dAN+cvfOBwUYTNxp2LSY7Fkhn6bqN64gk9NMsRwlRHIqOjl8JWRD6sClIM4mWKENfHDXF2/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyt6OpMxc4aOqJLxblaun1dAmaCQ7un1lBSRdlRVcKEyUiDf62
	U63Ro0iHpA9rSVgbK7/iZrxbatT12zgBxIXmPHmBAUwyyn3YsMleR+sovYbjflkbtoY5folj35c
	7ILcyfdnF+EEjZV1zsQ==
X-Google-Smtp-Source: AGHT+IGKSheu/Xc5yKyOddxTaI38qkdiTdyZI2k46808hMqrj+mZdBsGHh2ZbiuVOKReAHQyOIZMyqCAx+5qwRQ=
X-Received: from wmsm26.prod.google.com ([2002:a05:600c:3b1a:b0:46e:3422:1fcc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:620a:b0:471:145b:dd0d with SMTP id 5b1f17b1804b1-47717e54b01mr17567085e9.24.1761645405225;
 Tue, 28 Oct 2025 02:56:45 -0700 (PDT)
Date: Tue, 28 Oct 2025 09:56:44 +0000
In-Reply-To: <20251026125458.2772103-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026125458.2772103-1-fujita.tomonori@gmail.com> <20251026125458.2772103-3-fujita.tomonori@gmail.com>
Message-ID: <aQCTXFcSyCxJ8KqD@google.com>
Subject: Re: [PATCH v3 2/2] rust: Add read_poll_timeout_atomic function
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org, 
	daniel.almeida@collabora.com, ojeda@kernel.org, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, frederic@kernel.org, 
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org, 
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Sun, Oct 26, 2025 at 09:54:58PM +0900, FUJITA Tomonori wrote:
> Add read_poll_timeout_atomic function which polls periodically until a
> condition is met, an error occurs, or the attempt limit is reached.
> 
> The C's read_poll_timeout_atomic() is used for the similar purpose.
> In atomic context the timekeeping infrastructure is unavailable, so
> reliable time-based timeouts cannot be implemented. So instead, the
> helper accepts a maximum number of attempts and busy-waits (udelay +
> cpu_relax) between tries.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
