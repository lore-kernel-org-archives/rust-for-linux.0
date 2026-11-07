Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039387;
	b=4qKDYhWjPKjQ4PapwH3wNrwL0Z60xHODajmCZ63K+fYIDmUjpLiETOHoVAG0a733gLxl
	 FV27/afyrEAxFUSEiLKyp8N+f9iFoV46dlof8QfBlMc6uqyXtCV6rZQXsQ3tQlogD729e
	 4tkOWxS50MCL3smYKOyohrOxHe62zfPeNy3FIkDZk78/77kL2NFL4om/cAEHoYymd/1e+
	 vSjxlU3q7cIMvdoBuw75D1YFx0iZWyQff4n5+bPMBC5TrseePYkvNLLxgTeC9XEkkp4Vq
	 azF7aJiNDtrsWsCmIyXMMrwwrVG9E6X4nbI7NK0hbr6Jq/rMPmxzjtHmSmFGvDZZomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
	b=EIqB1shwKdH18MptV6VKY5JRlfvGHBU8xgKnhPQuaqIIrPXa4Wf3MZtIwbXkJdE7yvEd
	 2IcY2igJFcvzWGU16oEsQxn1OlpoGrS5HEc2xogmRhIt4k3LTeLWKvraES+wZT4pGZA/u
	 mq14L62pxuw+oaJO1KbpsxXDfkD+q79JPyrmybbrQFItKGKpQSuiQIvfIroIFbgVl86Kr
	 YLzCb8OOWKEtrOwsnQrWAtc6wXObAXC9LM8HgCJCR5kD+Krz4mbLTEyLQJpv5L4PH/utL
	 VdSpeP0UQMgJXpRdqSNP+jsIxX/NtWeysHKggbX7EKBsX1vHgZL7z8E+f/ocyDVh/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ew4KQ2CX;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C66E606A326
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 08:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C66E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ew4KQ2CX
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so1109091f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 00:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794039385; x=1794644185; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
        b=Ew4KQ2CXWb+U8Tbqm3xs8FATOML5PvhAbx9CqsClnU4Kd+987qUpy+nrGndsrP4uxz
         EKsx3fKYQqyCGBbXQ6Z/+yHxUnj4dkY6oxAwhHOpxggPsv5ry5ObKvDUwD91/HHt12cq
         mACJRCQVv21Sm9RuoBkcjCwXx+t1oDu72DtDxFydNyXZuBfScuVrqU0TTk+WMATxP2rD
         KQRn+U3aOTddYdU7bktFx9SYHspMfsBuQbaJqjBfta2ztMh5i3jU2Qv8Skrv3ZhwdnMl
         Aep0DLA7nI5iu43q8F2QQByiuQK/wy9YTR2qjgVGKTAE94ZG2HatMc967KG2MwGXr77m
         ly2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039385; x=1794644185;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRZSNFEWbftVAvpLk7hELzG7uAWoQX3JdWqOw5mrmdc=;
        b=Fccmp8xiA6QEFd9F0RRPe+75Ek2Rk4rmhscAMk5P5giCsdW6bi+VIxZEqEdmggw8oY
         qDwg/GkalIvh2+0CV3E5c/xbKAqcMzet+evq/hUkbydRlgqJbIQ0zGgt//tWOOCfiHDa
         xEzcmp3FVjVUAJIAikhnvmyMoFp0g/vdWQypC46tQCyHgLcd5eKCrkC5krgBXJbI6pw8
         xgGE+xhtyELlwcGPFALSLdLykZulfEmNipboJ4QuE8UwhgiriAAJli7BSdu/X03cW8kZ
         Fs28/73J5ylUhRkrIyI9g8naRi+UxVqurvK5PjdajiwuQ2YvF/n8sPzUMDisFwuveftt
         61ew==
X-Forwarded-Encrypted: i=1; AL+hErFSulKrpymdLCnqNn+h41Jpj0O8RY9+fYWyaF6gJVEVJi/eN645QNBya7o2RfOG5q3vF5MjvenaneWiARIkvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VyKPldCz4HDr5FkazfSsDeEA0DotLSeB630wz5qCe2xa7pPNR
	QgRlpTT0KMVZ80gfeZwu1snAgcUTbSf/VPnsMqvKu5PUbDBoxxvtnQ7FPng7pRH0qBukY+4M6ic
	YhMMDVaeFJ0dY1SbkRw==
X-Received: from wrtp5.prod.google.com ([2002:a5d:4e05:0:b0:48c:44a2:fe52])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25eb:b0:490:421f:1555 with SMTP id ffacd0b85a97d-49275b1bc23mr8281265f8f.22.1794039384637;
 Sat, 07 Nov 2026 00:16:24 -0800 (PST)
Date: Sat, 7 Nov 2026 08:16:23 +0000
In-Reply-To: <20261107021427.2105374-8-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107021427.2105374-1-dakr@kernel.org> <20261107021427.2105374-8-dakr@kernel.org>
Message-ID: <au7eV0D_44ipe3mw@google.com>
Subject: Re: [PATCH v2 7/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, lyude@redhat.com, 
	j@jananu.net, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 07, 2026 at 03:03:25AM +0100, Danilo Krummrich wrote:
> +        // Run driver destructors without `filelist_mutex`. Take each link before dropping its
> +        // allocation to avoid recursively dropping the entire chain.
> +        while let Some(mut data) = files {
> +            files = data.as_mut().project().next.take();
> +            drop(data);
> +            drm.open_count.fetch_sub(1, Release);
> +        }

Instead of transferring all the files to another linked list, how about
taking them off the file list one-by-one? If you release the mutex in
between dropping each file, then we still avoid deadlocks if the file
private data destructor takes the lock.

Alice
