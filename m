Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989194;
	b=AiRqOqB870qhUIXFpgkL9vqlAO1VLWKvu9mq/2ALllQaP5BQqdklVqr6hZAZbb66I4U0
	 TMQU4Kt2+o9wQVKKIQ2CNI1Tof7Xq6dcCqyq3GKUQH5phjCWiAtgDki5rh3hLI3sve/Vm
	 wMGCZ7/H/Lt65z4+yhGp1Z6bD4uer6HMQOFMy8q4k13mmyIsh7bUM9AbcoTYHmXgrT+nn
	 z6iOnBRDiDlvm70PtOrCeFPRagsZYnJoboG3fmIyfrJuYiJyLCo47J7jJzcwcgd2gcegz
	 kvd65/e7MMRfYcjpKI4JVuLCLRAIxfoJ02LZbdlusVXfjxUExctxYbXwZ1DgIqcU2Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wTwgFeI7gQ6N9RjdGtOM+dkxnAdtOrsW2Q+npaN7whU=;
	b=tcxOB5n1kFRBwaVGCByV1vDaawFoHwIWjLbBbt2DRFbzWRj/qqEEYyHOQ5rDN6EgLfTI
	 qFA+AeIX3O6XVsMNufKSSQulBChrI80hpp7K4EZOhbJyta56lDuxrexBoeExs6YHEzO3r
	 gb40ACKNtKe6ELbtyV4A1rkp36ckL3BCG2ebrn7PeMe+m5zz0eAZpDBksiSi2KLRMcGt7
	 sjdlvQqbilwYkBbT5bbD5zpbsc1Bp2LCsQs/dnLKCnV6X1QfiqnCcXlCSsrkLMpQQT15f
	 nLmQsaLVm7fGbrAaabdEZhf25y3MG3L9VjZIofmxPfriohBjMvmIh0PV5phjH/IgnVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JVsrIND0;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36530606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 08:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36530606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JVsrIND0
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so5236115e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794989192; x=1795593992; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTwgFeI7gQ6N9RjdGtOM+dkxnAdtOrsW2Q+npaN7whU=;
        b=JVsrIND080oRpPZXlP5D1BFddSwOo5gdJSabFFzvRCGyT//1U3vzHDzAAHuvogCrib
         KdsQ6cVBbZkLUbfCA8bGSiCK3T/NYs4/ab2xVB3Xbwf90Ngqj1DtIvkpz4b9c0ne4FTK
         bp9GEkBAKMAXlKgnQWPzlodnAiId7JQkVYH0vTtQQZz1hYVVvb5zPl/VgybJ0NlAG7Y4
         f+hJGwed7Ry3ASvSpr2lxjaz2/ygb8GgzsyEqQi9yt5/SGo8raxKdh3GanrrDDRPGuRh
         gCMWqoNuR5xhC6nxH7ya2gxy2P8Mi6g8QQ2bquZGv1QlnUcoS+8WQusgbNFOtBFVfjC8
         50pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989192; x=1795593992;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTwgFeI7gQ6N9RjdGtOM+dkxnAdtOrsW2Q+npaN7whU=;
        b=GsjSNmvQkguR/S4w5L7boZfbPoO1asHu44JNU3OIaLZdLMeilZFdsXrsrI8KfCmyS8
         71smCLCzZs39RrnQV86XK7O6hAnw/juxVrs2YcyppI1+xksa6k/jZ+GzCU4cfYvUmA9Y
         TGgFwMQdZBE2Ne+8yaPQnUP4M+aHJxmeCUrYP+AglE6qHOJFSH45frnjyYys8WfWkvFb
         ux7kDyCkShFwwDKp0n9w1XrLVhLtR9hDiYnaeleWdsYBMS8ZC7D1VmbqqVP6fdbSG25Q
         ETBodQUq8486TuJvuqa6b7s2UcPGQARAFENQx3e4muEv9mdYBlesxJ0/4aEdZMqyITFO
         Xesw==
X-Forwarded-Encrypted: i=1; AL+hErERoELV19P6mnC7f5LvKgKmot40E0Y0sFpzbDVChMrVoRW03Scxkx4or+JGyK5mvcoNaTYFXZsbIwIiE5vZmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VlKImqW6m/56lIftwITR3aFXpuHnj256IQU7fwN3ki9FBrl2t
	TPQGxOD+hNc82tj3ga3z1v12akz3jJBG3WyvO2R6vOkh4CRBMsj/u/93x3xC9C8n/b0UDkJnyH5
	HGe5hPwtERDKvXQV7Zg==
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4bb:52ec:7054])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr32108295e9.19.1794989192307;
 Wed, 18 Nov 2026 00:06:32 -0800 (PST)
Date: Wed, 18 Nov 2026 08:06:31 +0000
In-Reply-To: <20261117233901.2212899-1-cmllamas@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117233901.2212899-1-cmllamas@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118080631.4094963-1-aliceryhl@google.com>
Subject: Re: [PATCH] MAINTAINERS: add rust-for-linux list to binder
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:39:00PM +0000, Carlos Llamas wrote:
> Now that the legacy C binder driver has been dropped in commit
> fd2bc059ed46 ("binder: rm -f binder.c"), drivers/android/ consists
> of only the rust binder so add rust-for-linux@vger.kernel.org to the
> ANDROID DRIVERS entry.
> 
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Acked-by: Alice Ryhl <aliceryhl@google.com>
