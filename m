Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4914B32C323
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604176; cv=none; b=dxct4MuNIQNkbC9WWSFuJnxmAiJVSsaY31MRMLhqW7vC/Sp5jBUoeEc55ix9yivetAvQanQmnt/eVEDA7Kios0V+U51r2GSo5JTk6+QrRBI+GD2OmKhbdvlRrrTlRIjgmEN1cgwPCWbQWfB0v34GCyo3UKH3gQYAA4e2/k9FpYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604176; c=relaxed/simple;
	bh=V2HBTUwT2UjXJZ+Jc/D8Nf8N5YxD76WlWLUuewCPtU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SAzg1Hx3zWN0BDImggMtFnT5THNmFrMjMVtG24UAl26BEMT08TYUYa/UhnC1mLdLg+ooRnKUict9q/UH2F+IomEkD8o3WwzstiNY7JwuUsKkI51S1QnZbfyLwxV6ye8LaZRMLG95gsIuaVPg3/aql+wN9GtZ0mCeGHPX/A9vSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0SsE0TKq; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0SsE0TKq"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9d41bd50aso2593522f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755604173; x=1756208973; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XK2J3kNbpq49DxoNf1ZblzyEuer1frzljRPhSKFn16w=;
        b=0SsE0TKql9pw0B7j7KdWPP/GUWWNpHBt9sLdeH902YyW7w+Rivqb4Kp2QxDs9U7xdY
         wmTJjoOmSiXOQ8//fCaquypWuz1KdvNgor3aSoawXfI9/RnajaLVfgY2Djgzb2fRErf6
         4O7mb2SUiU3FzR2A0PmM6gbM4o5MZeB3d+COTKlsVfXO5VD8lxBUHCDGkOHvyNtElx4y
         1icjNNw8iCpe3P6Kf1NYEpGMPVvoUfkMFox0KMg4O/v2u8jmP0SUvHrops4fI1udZxA8
         DjL4r6BhV3+6NwIkLSJgHbHpDUxNVnDkMhM4jEIIBwx5mvxrtFpj5Zp6T9BVKneXWj91
         TlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604173; x=1756208973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XK2J3kNbpq49DxoNf1ZblzyEuer1frzljRPhSKFn16w=;
        b=W6sVIccUMGSEhgQY2OHUFCu67otc2BvgxVKZ1edHr1HwuofnbaplLA9356VV/vPQxi
         eitGCPaQhKCpL3xzcmKVXyj+GZ11DkxlioFdnJ61mm9ZWep+cnklOu9bbCVjdtttQpa6
         uRueA+uR+SQvHzT1SsYxw9ACOW+A4PSQHdwJVwCwhQ3sKEpon7cqlczLdRdnCVYi6eVD
         WEJ11PSUFskd6DdwH/z5bVobjDLoe4BPyrZp9FkpF8kNaSsGkx6rdEGxZV33Y7i8IkP8
         zJVoOp09MT4H5UEaQGvPSux9qdsfWH6eszTVBMOVP02RwLnd0R6tCt3TLCBlGerP05wC
         hobg==
X-Forwarded-Encrypted: i=1; AJvYcCVyOD0vUcLhEMniF96hWLFgQyump/vs7UnK0MDy/AwtUs7+mK2AZ1CNwCNqy4BliwyUFnxwYSjab6mgwjMCIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlp6lT68JPKHL1FlAxGEwfWb/x+v3hlxJg6HdyaoWOms2MfYx7
	gawYsEKS6RaZWnf6vDPeN3S2TRT76CxHH2AnnPKv7PPbMvR0chrZlaPk6rUaNjrrsKMEkNLuRu0
	TbtBZJzGG770vqdnA9Q==
X-Google-Smtp-Source: AGHT+IHq/ituVcnHI3b9qpb7mPgoRpABNk2hl4qJdQi9h5FZIFLnAu9CuefW7ZnmWdmvD8WeDNUsN2ONcNWw7EY=
X-Received: from wrbeh5.prod.google.com ([2002:a05:6000:4105:b0:3b8:def4:4fc9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4287:b0:3b7:9dde:2c2 with SMTP id ffacd0b85a97d-3c0ecc322a0mr1839983f8f.48.1755604173561;
 Tue, 19 Aug 2025 04:49:33 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:49:32 +0000
In-Reply-To: <20250814093427.19629-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250814093427.19629-1-dakr@kernel.org> <20250814093427.19629-5-dakr@kernel.org>
Message-ID: <aKRkzDJLbvM5TSqZ@google.com>
Subject: Re: [PATCH v4 4/7] rust: page: define trait AsPageIter
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 14, 2025 at 11:33:43AM +0200, Danilo Krummrich wrote:
> The AsPageIter trait provides a common interface for types that
> provide a page iterator, such as VmallocPageIter.
> 
> Subsequent patches will leverage this to let VBox and VVec provide a
> VmallocPageIter though this trait.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
