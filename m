Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C7350A00
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858197; cv=none; b=le0DRLM6eOyZrwSwmXkwhgFF3pj6WRsKZZS7kWiVLW0ntnm1tgYiHuBVOF0z1RPdJNoXao9tqPVAE7avo/jzL9vvJEqtEDV1jOgx6I39X7IarQEN2C6o6poLzIDiGdrAF2RzAQfm4FYK49wPPBOTfhUP8P6EdUCFTcQee4omqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858197; c=relaxed/simple;
	bh=lbEYnHVMZCw+SBkRqnq7fDqkJ4Pny2l6c7uvDC0nPZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BrcGmhrKEWTyFecx5GyAHq4fVWQRXrfcFZnQTBFglVjgIsmXSV7z/ZOsuohlXc66SYksdKMy4qUL7mRUbkrMiB6MPkBEmL7o1LURiO1bgtvgDn1OWb1acZb+CwFu0DRKEyg5okGYqhvmxapHnIIetzDxSmDnrEr+KZN6VaBQv3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQh/ngsf; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQh/ngsf"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b7276057a5cso366438166b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 02:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762858194; x=1763462994; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ro5+zmjDiZVo/VYqG4VAJIAtKjMJ/x4QPaDxbqP0QE=;
        b=TQh/ngsf+taX9o5OT8Z/doz7EQg5+tIBSHi5T9e7IsCiN2U98SUzqDHQIG+9Q1vbZI
         73pp7vVIpATAtft7KOW2dI8VU9aE9MHZIQs/0t/qMlkAtp+R6OooDyaq4JdsKysoL7GT
         cIbh5HAR78rFCxgEH6210dkzNoPTSTtL5GROxtHFkNBMMo6mNNd7HSt0O1HgbGgBYqTQ
         mX/4EAl4CjSW7wp4ch8N4s3tUfhj9Pg+c5sAwxquPEMl+1wWnD5f8Ng1sjvn8r6PrDr6
         sjUG2p9mfli36hQjGqjrDqgINr9qOfVcR9ZI2P1xnRm8Pc9N1AzjG7T9ITCBRNI7SfSh
         bVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858194; x=1763462994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ro5+zmjDiZVo/VYqG4VAJIAtKjMJ/x4QPaDxbqP0QE=;
        b=MiK14xEPGG1N6ZkB/WHCfsfqaDYQVPAVLpzD9i/jiwq5lTmc6gYVasH1UgR0k+7QFQ
         DlI+XKw8qaoPBlGV+yaW+jsq8+cS6vG7C3/QgDydm/9nk6mxltz6gAVYfO7gP5sdHv5p
         xM+1QG5y61wfE+IjpAV/U/0fm+vYdHSdy4HRjiy1JuTJXr3kYWGnYMkI2Xb6zxZF8SFv
         MzpZcyU4ZQ2MwQFhBBYTIuzch44MY5o7CWSAFwM41NuTO6scL+jWiADdmcHBpjDSTsKq
         BABAWkf/X+prxOzmlZGnaEc3tJLbGHptyR82ihWbce5YHiQTmWOCeEE96OmuByUhUgSc
         1JLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdioJsct6IQlBtJN5OaUwG8cuk7+U7geJ67ltL9J0dpOlCuy2YFYP3rXoE/I6xDiKL+bzmfCHLnC5tlLC3HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvdwu9XWdNm/uYNbxB9rkETFC7gdutfHdRLqSbTmgol+btlcpC
	FmBL5xYknih+MMvax0khYHuAptuPR0E+2HEbNQ+896zl8+5iFdUPp9Pve3co1jhgByMBuxQx3Eh
	bEo3FAIEmgfhv0bg5Lw==
X-Google-Smtp-Source: AGHT+IH0FQAkAML5C/GGvtqqSlXCzyOxX+sOsx/CWfWlt2gwaz++PS3im2tHhF3rtUi2hyc/8XDI2KLRyk8Yt/A=
X-Received: from ejcsp10.prod.google.com ([2002:a17:907:394a:b0:b6d:5546:e475])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a28:b0:b50:a389:7aa4 with SMTP id a640c23a62f3a-b72e02730b3mr1230655866b.13.1762858193780;
 Tue, 11 Nov 2025 02:49:53 -0800 (PST)
Date: Tue, 11 Nov 2025 10:49:52 +0000
In-Reply-To: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251108-bounded_ints-v4-0-c9342ac7ebd1@nvidia.com>
Message-ID: <aRMU0K4xW_sYV5dn@google.com>
Subject: Re: [PATCH v4 0/4] rust: add Bounded integer type
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Nov 08, 2025 at 11:23:46AM +0900, Alexandre Courbot wrote:
> Minor revision adding the feedback received on v3.
> 
> Patch 3 adds a MAINTAINERS entry in case the Rust core team would like
> us to maintain this, but please ignore it if you prefer to take it under
> the core umbrella.
> 
> This series provides `Bounded`, a wrapper type for primitive integers
> that guarantees that only a given number of bits are used to represent
> values. This is particularly useful when working with bitfields, as the
> guarantee that a given value fits within the number of assigned bits can
> be enforced by the type system, saving cumbersome runtime checks, or
> (worse) stripping data when bits are silently dropped.
> 
> For a basic usage, please see the rustdoc of the `Bounded` type on the
> second patch.
> 
> The first use of this will be to represent bitfields in Nova register
> types to guarantee that no data is ever stripped when manipulating them.
> This should eventually allow the `bitfield` and `register` macros to
> move out of Nova and into the kernel crate.
> 
> The last patch is just here to illustrate the use of this module; it is
> not intended to be merged this cycle as it would likely result in big
> merge conflicts with the drm tree.
> 
> This series applies on top of drm-rust-next for the needs of the last
> patch, but the first 2 patches should apply cleanly on rust-next. A
> branch with this series and its dependencies is available here:
> 
> https://github.com/Gnurou/linux/tree/b4/bounded_ints
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
