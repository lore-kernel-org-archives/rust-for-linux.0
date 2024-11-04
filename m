Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5726A6FC5
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712724; cv=none; b=TN8C+uaP5JDRk9LVgMna+crqg7EfG7scSeQb2iKgRtknJwaczobOoUjGep8udzz1vUzjkH662kg0qvS2GeVWGRkiP77zKAnXfLQVE0Lc+UH3C3lCLvcWjz6hz77503RFOO1zztc0Dt9DsnXBRaCrs34g3dfdtigPA3Ww5XvE0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712724; c=relaxed/simple;
	bh=Zd4qV11Jk9xXewqHJBWt6C2AQwLiXmL4QYVrO7l6gWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2R2AGnSA1ZG2FVv7I0coWN+ybZZF2oHaRtJSCtVcLcHVp/qps1iGhZEUAwa2BxqTthNwOzuJBmHGLc2lqjqfBFIHLWL76Drn8Rpsd2cI1xQZ21WnMd1yFuwdG32l41kwRW61VbRVYD24hwc7+JZOp+EdoxqmjcP7FkZoM8nyD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnIhb1zK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnIhb1zK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so2415036f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Nov 2024 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730712722; x=1731317522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zd4qV11Jk9xXewqHJBWt6C2AQwLiXmL4QYVrO7l6gWs=;
        b=TnIhb1zKp6bdaFo3DqOwqBgLkM55xA2r12xXVbzNnGu/8k8R5EQjODfyy6Q5w9CL4N
         DNwRxJQ+88HxxyfynmzHJKFsxcspTrIvVDLOHkg/MKXrw+qIDWbYOfDLZoaFmA4yjcSV
         b36AzaZJHfOoP78NcFP8D35OJFNyDBmrqSsuL0/q5yjw9DcvXncRyUbCqy2c7CYh7fcA
         xOjGmWk0SBrntEkq2ggWDLpE/UhUchBJ0WLIP0hg5mjQ4DYnPPR0dtYB0XJux6PjOpwG
         REhoSjaDsUH+WQAezJaociwVtlbNGes9ilXa+mqdR2KFUW55dfaFcCpyryfGwiqbHDMf
         8MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712722; x=1731317522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zd4qV11Jk9xXewqHJBWt6C2AQwLiXmL4QYVrO7l6gWs=;
        b=afIe9JuhS5l6itKS5Ya9Vdghriq6X8jOe8aH7RrSYc30bFkGqGYXAKdQdGMqwunioJ
         xHSP/z0sz9icutY3m1IWcgBJozvaDuEHj3q0PWczSYhYmJt8Xqxfspf1/VmHvsmz2bF7
         23aBrhIRHGVLeOA8jvQp0C4tM0sJyA6neM8RH5jvG5sWA2GeompDi0+etUH8N1urHLqc
         fwuwrw39EXrGltBxMAohEzsL8icDn37F0MSB1u00XJ+Vp5Wsd/ZViD9u+ps/QrKjR3pH
         /KIr7XbUdbM9gj+Qa+RIyK2JcAJZN8xCoyhtDI/FOAb5ylmV/uhBLJUndCcggmx/krl2
         W91w==
X-Gm-Message-State: AOJu0YyHL7mv4hfHm8oGApP9DVGoQE94jCa2MRzElMo0a647qbBwkWLW
	5d5Dqn/dR/v/HVAihhNElAsNxNwHYknVl8aJDw+Zcmc19MsvRYxERym2DxTU5YzdJ7FmhM71/0C
	rJhdh8bhUpkOCDndOFCwoJfU3rR8tuIsCWOcv
X-Google-Smtp-Source: AGHT+IGgxxwstMlD8rP6BtbqQAqXim42VUhtM2Svr5NTrUM6RIhgQvhkHKl6VRlqR1gRR7oPbOCGY14lUUmtslJl1S4=
X-Received: by 2002:a5d:614f:0:b0:37d:398f:44f9 with SMTP id
 ffacd0b85a97d-3806115ae92mr21368232f8f.32.1730712721670; Mon, 04 Nov 2024
 01:32:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104090711.3000818-1-abdiel.janulgue@gmail.com> <20241104090711.3000818-3-abdiel.janulgue@gmail.com>
In-Reply-To: <20241104090711.3000818-3-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Nov 2024 10:31:49 +0100
Message-ID: <CAH5fLgisLyW-d9rsHJ8Vp8HpWh7PZxtkXooVQyMTxs445Ah4GQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	a.hindborg@kernel.org, linux-kernel@vger.kernel.org, dakr@redhat.com, 
	airlied@redhat.com, miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, 
	Andreas Hindborg <a.hindborg@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:07=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
> +/// Abstraction of dma_alloc_coherent
> +///
> +/// # Invariants
> +///
> +/// For the lifetime of an instance of CoherentAllocation, the cpu addre=
ss is a valid pointer
> +/// to an allocated region of consistent memory and we hold a reference =
to the device.
> +pub struct CoherentAllocation<T: Add> {

Requiring `T: Add` is very unusual. Why?

I don't even see any additions anywhere.

Alice
