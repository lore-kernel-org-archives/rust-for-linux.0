Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487121;
	b=nhjOZJFpY407f0p0mkCcefzGQauSnZS5NAlylY/Er6J2YSUvWHQSWNK6xem9uUAltHKY
	 Q05q2MkNMR2Bq04HOtN7A5uqAzamfHH77OBBaRKK+fS8tbHaWEQ3wNPMLlE5nd2q/40eE
	 9ftLWoAw8lwS9OqzuvQaUPp/Raj+WdFOmEbJ7EJPrRrFsxpqVoRb79FY6vGSyG09yx23p
	 MurZlsOeqzQbUwHVphLcSDNKceP4+LOIyqAbSkZjHHr6tZK43580crBLmj8HUadPPga9r
	 dCn6D/5/f8E9KiKhJ0bqGK9A20LwyFnXYNUFQ5zUcABWZUcd4IWtSmR5apWLA89Qy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6UK6/KKi1vmJaH5c+RsMG+pBls/fTxRgXLxWMTuXdtA=;
	b=U+DlKFqwCaVH1ZKdQqBMSAh9w6OKphImKg4lXqrqJK8Mw5yqxNvL/dcMgNSurmiIzY62
	 GoizzM08fM44u7RbEYBy0l8TFX2k+IGr2h75QNcs+EPQvz4ybK8x5d6I5BPETXK8uNj4y
	 mzYPZpI45I25I4ym6FuWxYk3aa4ntwPibBUhzb+vCwyv6FtIE26O3qTeK5hCBBMsJ6AXj
	 i9EYQu1g4FrwmSnisvXfMkE82DiwjXC/rf5TG56lOc2YABuQvmDXpg9wZwfL98ZXr0g4+
	 JqZmXgev7NMfFFrcoUbc6zXW43mLdA6xEZLHOU291X1+Ms9i/rHzKTD7yh1YIfTjRQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="K/XrF1+5";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA14606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 12:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA14606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K/XrF1+5
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so4150548eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Nov 2026 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794487120; x=1795091920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UK6/KKi1vmJaH5c+RsMG+pBls/fTxRgXLxWMTuXdtA=;
        b=K/XrF1+5uQeap9pI44P2RPX4tS2GuaNG9a3B4XiYyNz2g5kYkyS1mb6fEnQnNet0/r
         8Hdb1SoLF9wDC9aBHqNWb+evQNYbf9k/eOZmSo6tZ8evUUZnWi2e0Xn6l0CqYgFyierW
         dTkswGclAbjt/UzUwT5OUOLwjJhg2O2Pg7K+GOdO6pciJPqXixIPbzVOPaFNVYBNUt2p
         /8aJJ8i7jPVea41VNU2UVSyiVszV/UHnVXNVHfT0bMbgJHME8xFBCytunzLSl+XGW/uT
         qENQCu3U9Dz151E2bpyakraQOj21EMCH/RLVb85kJ1EQsNIU9yrhxvBwSlJVvUrIfyr/
         t+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487120; x=1795091920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UK6/KKi1vmJaH5c+RsMG+pBls/fTxRgXLxWMTuXdtA=;
        b=dLqKMGPBQoP8dQv3Lool5bjSXLpVXrnGGK5OJThLfad7UkuYTG6X7qVCIqQfGkWesf
         VP2Vb0FM/cwNMxWLbbonktNYlC37YmWpE0f+W2FdysBej7/kc9eN+M9M3vdQOXMccFf+
         Ab0AAdfqXi/2aIIq9rNGtE4s1nv1Jxp42SrIwvsC4f20cRBXPcLYban7qvu/cp4SK2PO
         ripDZc8/itaG0E+43HRDRs7sWm4xxt8TtAnTtoVJ6AzVblkfJpb12Fba4ULdSkmnN40o
         uC5HiwTBOkmRaEAKHpfcMIHuy8/IK6dcVyqSvkxncEif8T7jaVV7QjrQFXcZxO17N1L2
         yy1Q==
X-Forwarded-Encrypted: i=1; AL+hErEqWW/dYDwT4WyJ6+9njlx3FapDk5Ye8kHFpmgF+ojF5Jgoes8danOyKJp/pFRbInSrLdGkEHnquL6PGsCP3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z95voufJjiFiuuOyf+IYlBIGqPIVAGFl2JoqTgbgMl2cQv3J8Zk
	HzYHapjMNvtBpay45RVL2EQSEDT1fiXZXjubmMKe1D+hs4In6S/3RmxHd9F3KuRdsvld4Kt4XcV
	44uIDV1DopGMm95XuPzdmFXzN1Bz7Lg==
X-Received: from dybcr35.prod.google.com ([2002:a05:7300:aca3:b0:36e:b3e6:ebe2])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:65cd:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37686176002mr6158828eec.20.1794487119392;
 Thu, 12 Nov 2026 04:38:39 -0800 (PST)
Date: Thu, 12 Nov 2026 12:38:38 GMT
In-Reply-To: <2026111212-unearned-strike-a7a3@gregkh>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>
 <18e70d7cbc2831c0.3137322e32332e3235332e313736.1920de.0000sendgmr@google.com> <2026111212-unearned-strike-a7a3@gregkh>
Message-ID: <18e74c87090a4d29.3137322e32332e3235332e313736.1e2278.0000sendgmr@google.com>
Subject: Re: [PATCH v3 2/2] rust_binder: account for deferred work size in Thread::read()
From: Chris Wiseman <chriswiseman@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 07:26:30AM -0500, Greg Kroah-Hartman wrote:
> These patches are not "threaded", what went wrong?

My wrapper script around our internal sendgmr mailer failed to capture
the Message-ID of patch 1/2 and stamped an empty In-Reply-To: <> header
into patch 2/2.  I fixed the script so it fails closed on missing
Message-IDs going forward.

Patch 1/2 is here on Lore:
https://lore.kernel.org/r/18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com

Let me know if you would like me to resend the pair properly threaded
as v4.

thanks,
chris
