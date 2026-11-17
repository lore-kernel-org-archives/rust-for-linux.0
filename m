Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925013;
	b=hjiDEciNZ+MohWvIHfBqLG1YTn7N9DPkT1+r4GhznKWLwyrIcFiTatVZcYQz4I+DXjz6
	 NJ0TOW0vf1QO2FSXikjVL1rUkOWuuLcHR6Q2Ns4wh70mTUVdNCYosNfpwvaRaRk8J6ttz
	 ad+m0YdY0OZNYunVRZpSKfK6IYAp98GTOQqoT0K8tCnFdj5Gz6OWCAQrRug0d78wk8Wy+
	 YJ/fJ9iIQjsLkN/DbMrO/VDX9uhXSvVmdAqdH4sZANn0GxG9eEpYiv6PLHBylWM0ZhHxL
	 tMGk4UbjeNxz0+uzbmp5FM8SAPAXJF34Qp3GN4v8vITsDh45SLb4P9OAzBziX+WBRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SoUaO57cW+qqkOEye/VOIeEzhg9zr3S8sinSgtnZuIA=;
	b=NjmW9uP6VAcLcMMrELD5DzbGA+naYs1f3K/fS+XM+SJZNZ+sLeAlpVOilfignCKO0UeF
	 iLEPAQqndjJ5z6RQ/jRta8PXu5ExewppQ6eofLuuT1MW09UrC/7pguDSCXwKjppbTN25h
	 7dKERUCqWpbIHMHv/xDkhqYw/57XtVWukRpvsv2S8YK9QcQ0ht2iXDISrpGB0bKpIMpeQ
	 SwnmjSJdDGmHdDPU45bYLjiS8dHu1d9Rn7hetTrBJS5TC1z7vQB6hNaezrH/uK1BIofQN
	 07iLUNdBJxkq49fFrsV+TquHbBjdt16RBGBNhEktbTe09fnv//eTUwEk6918fQxzKaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wb0t6x2z;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC6606A894
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 14:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96BC6606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wb0t6x2z
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so36517135e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925012; x=1795529812; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoUaO57cW+qqkOEye/VOIeEzhg9zr3S8sinSgtnZuIA=;
        b=Wb0t6x2z0bJUOeWrNkngiljOJZt4w2VXLN+M4uSRv1VdR88KzK8RwNj2dgBroLNDNs
         wRdKE9QBHfdk1CDuiuOVengp2OblJVPYmJ0rvO3IquYPE+w2ikGta03f8IbNg7vYJUM+
         iE1IfLcV0V9itpOfTA9MSb8yVbUSAqzSOkUbAlxwBNzNkCivTsVbjRMW24ul5mqZEmQH
         LSfn/Tpaq1v+r0R4UWhcD+NEGaXB4Hd4XrFjnT58UbRr95j83FNWCAJSCfLsqaUzrCF0
         7pnDwM2f5GGJCNbc1W2o/5xZlIV3zgMbc+N7lf9dvQpR93/+USvioFVPcMklolqu6l0g
         wL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925012; x=1795529812;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SoUaO57cW+qqkOEye/VOIeEzhg9zr3S8sinSgtnZuIA=;
        b=RPRnwxptBK++wlO8zkKoOrCQyBfABY9x9svrGy6H+s5TFBm1tGG0wVnp9ZNIfRoS5P
         vVVdj0k0PUUIF2AlbrpuuvthFH++zvSbqjlXyaY4SVsTbqfpTq2kXhvwgVGqL2GemUU/
         bQwlJO4wu0u6QIEiSs1rc162NVCrQaPA+QsDQJpmy7nEamFu4uHZVRPnxie3hgBWQN7f
         2iaX+eP+35HF8XLfjvE2RB6ceaORZa85qXs06ndqhtet6GegiYoavSoWtVE7gqEANJvC
         lwA06WaLxj7tTQlByO9dEdYdHpnLLpZroyJXwMB89ivAnWirJmlrTJN73BsO8dzdRWA7
         KL/g==
X-Forwarded-Encrypted: i=1; AL+hErHZ0bM5kVfVVafcc/oteQ9Z9TDI8/niDtOUqho7bkeGZRepQJ3ECg87B6+IkLcOLw2/khEbT+8T678ocmCNdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kFRBmrboLuSOCDv7BzRsFOLplU5g4kFhOsPBXeA2N0GCurntk
	Bfc9JMXwHaxavNLEYYXLEJV1kxWzb71rnqXglRmIs64u+IXHvyMCuObCkNs4v9buyHleCBJ67qO
	sRE8I4G7k0Oep5xl28Q==
X-Received: from wmbjj17.prod.google.com ([2002:a05:600c:6a11:b0:4a3:5d5b:9ad9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:670b:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb7987fdc3mr38878595e9.1.1794925011619;
 Tue, 17 Nov 2026 06:16:51 -0800 (PST)
Date: Tue, 17 Nov 2026 14:16:50 +0000
In-Reply-To: <20261117001507.1611984-4-dakr@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117001507.1611984-1-dakr@kernel.org> <20261117001507.1611984-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117141650.2992151-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 3/5] rust: sync: convert CondVar and PollCondVar to use WaitQueue
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

On Tue, Nov 17, 2026 at 01:14:44AM +0100, Danilo Krummrich wrote:
> CondVar currently wraps a raw wait_queue_head directly. Now that
> WaitQueue provides the same primitive, convert CondVar to use it
> instead. This removes duplicate init, pinning, Send/Sync, and wake-up
> code from CondVar.
> 
> Keep the wait logic in CondVar since it needs to release and reacquire a
> lock guard around the sleep, which WaitQueue's condition-based
> wait_event() methods do not handle. Use wait_once_exclusive() to perform
> a single prepare_to_wait_exclusive / finish_wait cycle with a
> caller-provided schedule function to implement the lock-aware sleep.
> 
> Adapt PollCondVar accordingly.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
