Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925012;
	b=o9jd/t3GSXGSBHdbV0iEzGWrE75AT5A3MZDNc2/0eAig0OIVVc12PN7cGrlWu6GkoI4U
	 DcoZgrNtebeT0xZ5y7sm9B6bSbIJxnbqP6LD7gPj/oCErW8d8YjcgrIlmYt+oXs45FDiQ
	 jHd2xyLzzm38Zd3vw0/WA6rAihdy4G+yavoSIZfOetTLTuBUTQlYZjvQzqo3H9xUBNr2/
	 cEwSBlQcyedgRFu6Q3TNc0rHoyUSs9/fMPpNuV67hspzoXjk8y/WUb3Ctw+3hylIHgJHr
	 XxEt0iKakALRg2Z2tUUsUD2Jz74doTpzzKGjyYEyiFZZ23xlWNVFjjhb1/CUMW7gCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8mDL3N+DirypXyizj73343YIMouI63Jigsdwggl20Xk=;
	b=MrIa3lDufkyl+6iV27+Nq0JQ/U/ZDv/Vo1hUf7HJwKM/QcIeD3vap4pBzY6sd7vvVTx+
	 b0sOPQp6KZ0Ni3wuSHV196Ne7QgkIPMS0vhhnuHJ3HRjB0hQ1JbNkqq5xkIjwDYPDppR1
	 KNuO8K5YbDppxGX1kzCzvgWORKH9wev3Qcf2ZsbLY0hoR+/HXu2BdbhcWl53VqWk9baKy
	 HBf7NRlZ9emvtyOR1MRDdlO0Md7FNfz4XfFjKVv0CYzCvav/XpvPs3uu4mebgIL0w1G3y
	 PuYvNeM/Av8wHMYW59tV15NoW64aobUYlBv3SGfX31WOSFgjAWifcMXd9EweYRz6CZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMY1JauI;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE58606A881
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 14:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABE58606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMY1JauI
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49953abe51fso30232405e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925010; x=1795529810; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mDL3N+DirypXyizj73343YIMouI63Jigsdwggl20Xk=;
        b=JMY1JauIRJg4BDtE7ceIsP/yqSL31cHZ23/Ik9MkGT4+n2Kw7Cpfte5uB0tyaRX37U
         qsp1cU58hQjKcCLZhOrqKaeF6Pd5DVjJVtz4leic2yneF/nwFopGakk1nE1235R2ZcyN
         6dbc/YX5XFEsQCzCWOt9fThFH6FuSo6wN5Q2p4XCIqobkIng92ewtzsxiUrLo3SVxQkn
         J5XGnM/Oh3R7HY1fs6DsX43BwVPwrwtizcTLumjZPaHLECqgAnZAlECD859fW7BvTFrd
         wFHyqjem/zC2xWWr1NAMISiD/sj8Iw/5r0ZkVdjMJg38L62DK/OHEfGiSGVlJf+TWy9f
         CX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925010; x=1795529810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mDL3N+DirypXyizj73343YIMouI63Jigsdwggl20Xk=;
        b=AMEMxnS8XAbr1wsgRbv0WoFPI0rA60DsOP0n9tNgQDMz9kNzZ2IrkzYaZeRPYAbMmd
         +wJ4AsgSbYluNTuKMncPByAS0hwh1DzjyeT05F59PmYOHc4Vz2Ntkzsh2H35hSn/JQZf
         LS0+3Yi1ZryKJLHXhVe8Uv8ScW5N19vnUmXrdcKiwuPAIAFhr1jaZaxIsMfS/1ba5t4G
         9PotDndcTz3GWyNhzFn8VT8YYK0i2f03rtZopl84qtprDOwgW5mCH50qWUga4iJIoWZE
         A7wSBRw916CuwPnnFibDJDreNitNBP42fNcl5itCtQnZPznzsyXR8Vpb6J3VHiWPa0K2
         qvqA==
X-Forwarded-Encrypted: i=1; AL+hErFAw+pGtDtFz8ol3mdBIlHY/20E4+BKUqOPQQh+oTD5OIIRg1HFmJt+Udf2a0Of2YnJkgJxO6U8S7Ondos1Gg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/o5cSFZdxO0H+wv1Kzc0D8VYvfvZgHHnIxtGvP8uH6OBmh1+Jl
	gglduBkV41s/VwtU1Wjfjc5DoEIJWlloSD7WXsvKVRYnSp85IDChTHc3O77oah5A2z+qNWOA4Pt
	Y6IfHOC2mk/USyX8XvA==
X-Received: from wmaj16.prod.google.com ([2002:a05:600c:6c10:b0:4a2:d3e:ee4a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a302:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb7347d930mr100746285e9.9.1794925009887;
 Tue, 17 Nov 2026 06:16:49 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:48 +0000
In-Reply-To: <20261117001507.1611984-3-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-3-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141649.2991892-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 2/5] rust: sync: add WaitQueue infrastructure
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

On Tue, Nov 17, 2026 at 01:14:43AM +0100, Danilo Krummrich wrote:
> Implement a wait queue wrapping the kernel's struct wait_queue_head,
> with wait_event()-style methods that take a condition closure directly.
> 
> The API mirrors the C wait_event() family:
> 
>   - wait_event()
>   - wait_event_interruptible()
>   - wait_event_timeout()
>   - wait_event_interruptible_timeout()
>   - wake_up() / wake_up_all() / wake_up_sync()
> 
> The interruptible variant returns Result<(), Interrupted>, the timeout
> variant Result<(), TimedOut>, and the combined variant Result<(),
> WaitError>. These errors map to ERESTARTSYS (signal) or ETIMEDOUT
> (timeout).
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks for addressing the feedback from v1!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
