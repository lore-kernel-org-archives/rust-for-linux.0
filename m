Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256773;
	b=KpntlFE0yM9HOBYS01XRqAWulCRXvTDWtkR2koChAZkt6n8lZQ4+pMQ3xuYCANfOUx1g
	 uTpocCR0V84pex8ACH7VwXuqJ8qz2L0kBEYiDYLkccXSXGeqgSNg1q4JcxxesyC+K2UIJ
	 0CAI3iTEbe+6w3wulYUrmKd5MtaPKOrDRtwHcSJ8GxYnzD3CiiSeMmRVQdiyRFewFh14O
	 Jzg4a53VDEzMcFXAbbpKdcLIYjP9R/BUszek5aG+1kPY5OqiBEm1yLrF7tR6/TdcJ813l
	 6DT3MDi/FMEgiNGNRkl3OVlORLvNyKg0Whw+Ms6wKQn/tq9HwllMRgLAHLsiRdwpjnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KuRvvkTR2R4DVquqy1RATu/MBL+QfBo9KPmiMXo7Ohw=;
	b=fD3jeMtJkG/k7HY9lLzc2DMpg67bx9QE3CI/d2h0QpnsylsKIL47VUySHgfvLnd+Q8WU
	 qnIq1bM6Pja58ul+56T5yqifzAiJtFTCwFsG32oVFzny2UwfRtaYulCRlEO0uv7+x+/cn
	 JmL5oFRlYsRuqYMWnPs0hidv2Me+Y9yq5xcfpuIrWru1kyosdhgg92rLGzL09pdSCSPVG
	 uTk6sx+2gVtPXHUOCGj+afbazOAx8dQYeUmWYTb2p0q7DgaL9Q2dQ8HL13t6T2O9SThPR
	 +qnyimOomZ6EyaUD8N/Fd2rN2k1k0zkSOFyJCV1LgdrnTJ96az5lwl/MoE5L+gpxFpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I15LjJy9;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC46606A321
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 20:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC46606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I15LjJy9
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso1830739eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 12:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794256772; x=1794861572; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuRvvkTR2R4DVquqy1RATu/MBL+QfBo9KPmiMXo7Ohw=;
        b=I15LjJy9mP9tULEb+W4bsL6Q5Eu9Q26SiAOKrUnwNo8slVan6k9OpIQsKkdexDAmsp
         ip6P6f2Gxqsm0rHX5ia/eH5Si1w/fG7fXzuJMVfqGDfnNx8m6W+8GB/vF0nV4MuBiz0y
         dVqr+EO6d3fe1carWLOL8NK6adH6qachw0ZdnRlz7e5k1ZNzV/iuQfnDIDdINqunUvtH
         2lEQhtMEl5QHFjohSm9aFg8o0vwOozS+TXd9IgNPU4kR/t3kwlMBUQAcytdTWDBkao3W
         0pseqssl9BlIJS8tSIKus2sCFmsRseI9rqkkCJz7ax5EmAA50+2jYGTKKgPAGgAFFMGT
         pL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256772; x=1794861572;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuRvvkTR2R4DVquqy1RATu/MBL+QfBo9KPmiMXo7Ohw=;
        b=vc0GNy5sTRSGciBO7d40KfMmUzOk+7m+JWeDDWp3kVw88oUMXie16Kth/ikWptlqmq
         wMU5bp9QL8/qHKarvHajCkHab1k1CGk9S9a79FFljokGCXA4fsNfC6zkt5z/OdT+uTxd
         LNDxOtaztGiLoq9W9DdmpqY9SQN7LvurRi1EhwWbKntSvtGSQZt/flBF6dytOwassTVn
         ooMgDvNzh8HrSrXgFG+MqmJIg21nrXWINvr/sOYaJRCqcWYU8IkgkEHFWGJyFb9OeJ61
         noJeaRMipNHTwT62JzofabwBUrQYt2/2YhnduX39SUl3bewe614g+aIUiNUqfLTZesn9
         02og==
X-Forwarded-Encrypted: i=1; AL+hErHttZ2a7JRraDw9qjNWeNSWNbQFZr7XY8tEYq49k5WzMMXjssAvpOIvIN3pKVy0lA1bXDY//HJa1zakYwnnDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RMlTESgVF2blFUJQgpgDSiS53vPqE2GqH0QpGSrdeH3xEz41B
	WKUAnRZ9Vz2z0XASIltCUDnNo1q0dphgNmyNiT5/8oyIdH5FbVfkIsXR2Z4iR0OqBDv19WmOWD1
	eAfL8AT38E66Pt3P/m42IVJaZ/E0Cag==
X-Received: from dycog13.prod.google.com ([2002:a05:7301:9a8d:b0:36e:8352:e26a])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:4146:10b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-37520219af5mr543711eec.40.1794256771693;
 Mon, 09 Nov 2026 12:39:31 -0800 (PST)
Date: Mon, 09 Nov 2026 20:39:30 GMT
In-Reply-To: <avIb1n3zk7KKdFfj@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
 <avIb1n3zk7KKdFfj@google.com>
Message-ID: <18e67b07084c1b9e.3137322e32332e3235332e313736.b064c.0000sendgmr@google.com>
Subject: Re: [PATCH 1/2] rust_binder: reject sync transaction with pending
 sync work
From: Chris Wiseman <chriswiseman@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 09, 2026 at 07:15:34PM +0000, Carlos Llamas wrote:
> If the issue happens when there is already a pending transaction, would
> it be better to relocate the new check to top_of_transaction_stack(),
> before we execute Transaction::new()? If possible, we can skip all the
> unwinding associated with this. If not....
> Reviewed-by: Carlos Llamas <cmllamas@google.com>

Good catch - moving the check into top_of_transaction_stack() is much
cleaner.

Since the thread is not in process.ready_threads during the write phase
and is at the tip of its own transaction chain, no new incoming
synchronous transaction can be queued onto inner.work_list while
self.inner.lock() is dropped across Transaction::new().  Checking
inner.work_list inside top_of_transaction_stack() (where
self.inner.lock() is already held) lets us fail fast before
Transaction::new() allocates the target buffer or translates binder
objects.

I will move the check into top_of_transaction_stack() in v2 with your
Reviewed-by.

Thanks,
Chris
