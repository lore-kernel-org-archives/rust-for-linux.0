Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925017;
	b=idXItF6MDEc+NszkKAMJRHdDng2An1CYaq3M6Azc2D73SG192Anu+dcNdjB53IA6o2qg
	 FBGBpbdtVC78uqGufeOt677h90oO80HOBrEON2jaykOL0CDnjSFvsOOOdsSDtO51YtVmh
	 HXtk07HQwYE0iTs94sOsPz8Czz4qLPuGIhqR7xZAS241oTkFTR77UYT5/gLV/N2oTsnOh
	 0n0m6W5aswOJng8UBm+dURFRMg+XjJssuN55kstGQ3aEPn7A+Tg47g4kOqSTuPHOldyPx
	 csJfVcDWCLS37/EOLAj4vvMMXt93tZgxj3q29pCU+V/V9xe5Uv/azXqSgkCZ6WRkMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nIl3+ZTBmWuTNVlAHNadUfeBQic6MCWYrW6NjuO/0k0=;
	b=Szz4eutOLr4xWTLkY0UwCxn7dvMlhMbHdCg5AhYAjOup9pLKo0QuCK+FUonzkwnDCky/
	 wjFmfOF6dR94M6B6UWfwdhaePeNhv5exFwFjdCc/1PZQzziKKKbNULkYjA0s24VJwXa6H
	 iW3ewGopJUYJpNa7NIDL1TK8uP03zkj2+b81fdcwqDslSW5n7ykdEPbVFBufOBOX8XbBC
	 DpKcxgB8SmMORc0gFkKJ+pCxvgARkaSHJTVf7wMPTq19xcZwULeDs+wF+sy1sAO/rhfOF
	 7cfquV6rTCjmnIlIYCX7wnftgGv+GBA8sCwuKxgpi3z4slBcYXzNf9CJGIiwDuFhexQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="QeX/dnxq";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1F606A8B5
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 14:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF1F606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QeX/dnxq
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso3898585f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925016; x=1795529816; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIl3+ZTBmWuTNVlAHNadUfeBQic6MCWYrW6NjuO/0k0=;
        b=QeX/dnxqEc6d43KFqTdsCS1WhoLlgezZSBEfKcG2LIQsVC68cUqt2AHn+gKi25tHvq
         mOhVO1IrX/jefeUYw2/kFd66WyaT/G3vltXAxnI+LQhvVoudPj7LZi4Fh/M0C/uvZv8v
         X23lcpxNncAR4NOsHHBF/C6aPdma1ynpuItVNU4ArcHXGI0QDxggiM+wxlauKNgtJDi+
         V0PXTJBdqGMjHAqlEPDF6TTXRy8RvKzJM3Wew9OYeH15hjtg/ry1vMbj/EyGVDVZhO3g
         LEkMt0gBF7nyEvP4+oEyuG3N85lASqpCdMWA7gIRWx2MifesyErezf1n4jbr5Ze3V0zT
         5pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925016; x=1795529816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIl3+ZTBmWuTNVlAHNadUfeBQic6MCWYrW6NjuO/0k0=;
        b=1cNPI3tLGwIItBJA/88AQCj+kRRCfaZO7nkTe+zPmY+Z0EzrSdQ7+jNE88DI7EChD/
         wG0KbmoIBEsMjXRGdYIS95gfKNkh0d/fnGQwKKns41Sl6+1fNyhat0kZfbjhJJWnK0UT
         OT87FjgJ/EjG6gt2xg1ka1NXE/fw1SSlil/DQTeNmXscQMR5uaPiKBbKX+fK/4Xr7igh
         FEJ8L+0XRrUjXfjJ5sJbVEFDmth/dvciG1AvhXftTW3Gd+kc6aju8k74YRNqSql9W7g4
         aUFiz2vjIdZREn7oSdcYBNPOb8xxhQgW60vgtSK4xcOHvf3x2/SBrVg7mME71jE3bVkd
         2uMA==
X-Forwarded-Encrypted: i=1; AL+hErEYfzZai6CcyvBla9j6HJvniUUvIctDe52v4EMeP6gY+zIFpCkzNr9SzIJoduIcMBITCfKfMUa9KP7GdrYVrw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ID6jaf7JOUDg4UTBj6Qc67ITZ//vN8crcIHiT81D6FDSUBnbT
	naToxQumJMqv4tzqYzcpFQWB/Vr0k8NnDqu2jdsdq02qWL1umlGGTrav+Uvo4f0xAnjR7FJW8zd
	lpxy8LlmbKaYp83+tQg==
X-Received: from wrub10.prod.google.com ([2002:a5d:4d8a:0:b0:493:d140:f479])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1445:b0:48e:60ed:b012 with SMTP id ffacd0b85a97d-49c72306b93mr33480234f8f.57.1794925015465;
 Tue, 17 Nov 2026 06:16:55 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:54 +0000
In-Reply-To: <20261117001507.1611984-6-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-6-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141654.2992573-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 5/5] rust: sync: condvar: add non-exclusive freezable waiting
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, boqun@kernel.org, gary@garyguo.net, 
	lyude@redhat.com, daniel.almeida@collabora.com, work@onurozkan.dev, 
	ojeda@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 01:14:46AM +0100, Danilo Krummrich wrote:
> CondVar currently registers all sleeping tasks as exclusive waiters.
> Add wait_interruptible_freezable_nonexclusive() for callers that need
> non-exclusive waits, using WaitQueue::wait_once().
> 
> Document that notify_one() and notify_sync() also wake all non-exclusive
> waiters.
> 
> This provides non-exclusive waiting support for a subsequent Binder
> conversion.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
